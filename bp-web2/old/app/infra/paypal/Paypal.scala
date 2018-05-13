package infra.paypal

import _root_.infra.paypal.objects.ErrorObject
import com.fasterxml.jackson.databind.JsonMappingException
import play.api.Play
import play.api.Play.current
import play.api.cache.Cache
import play.api.libs.json._
import play.api.libs.ws.{WSResponse, WS, WSAuthScheme}

import scala.concurrent.duration.Duration
import scala.concurrent.{ExecutionContext, Future}


object Paypal {
  private lazy val token = Play.configuration.getString("paypal.token").get
  private lazy val secret = Play.configuration.getString("paypal.secret").get
  private lazy val endPoint = Play.configuration.getString("paypal.endPoint").get

  val TokenCacheKey = "paypal.token"

  def requestToken(implicit ec: ExecutionContext): Future[AccessToken] =
    Cache.getAs[AccessToken](TokenCacheKey) match {
      case Some(a) => Future(a)
      case None => WS.url(s"https://$endPoint/v1/oauth2/token")
        .withAuth(token, secret, scheme = WSAuthScheme.BASIC)
        .withHeaders(
          "Accept" -> "application/json",
          "Content-Type" -> "application/x-www-form-urlencoded",
          "Accept-Language" -> "en_US")
        .post("grant_type=client_credentials").map {
        resp =>
          val r = readResponse(resp, AccessToken.format)
          Cache.set(TokenCacheKey, r, Duration(r.expires_in, "second"))
          r
      }
    }

  def post[R] = new {
    def apply[C](token: AccessToken, resource: String, content: C)(implicit reads: Reads[R], writes: Writes[C], ec: ExecutionContext): Future[R] = {
      //println(content)
      getRequestPost(token, resource,writes.writes(content)).map(readResponse(_, reads))
      //getRequest(token, resource).post(writes.writes(content)).map(readResponse(_, reads))
    }  

    def apply[C](resource: String, content: C)
                (implicit reads: Reads[R], writes: Writes[C], ec: ExecutionContext): Future[R] =
      requestToken.flatMap {
        apply(_, resource, content)
      }
  }

  def get[R](token: AccessToken, resource: String)(implicit reads: Reads[R], ec: ExecutionContext): Future[R] =
    getRequest(token, resource).get().map(readResponse(_, reads))

  def get[R](resource: String)(implicit reads: Reads[R], ec: ExecutionContext): Future[R] = requestToken.flatMap {
    get(_, resource)
  }

  /**
   * Reads response, parses it into either ApiError, JsonError, or given R type
   *
   * @param resp Webservice call response
   * @param reads Json reader into R
   * @tparam R Type of successful response
   * @return
   */
  private def readResponse[R](resp: WSResponse, reads: Reads[R]): R = resp.status match {
    case i: Int if i >= 200 && i < 300 =>
      reads.reads(resp.json) match {
        case JsSuccess(v, _) => v
        case e: JsError => throw JsonError(resp.status, resp.statusText, e, Some(resp.body))
      }
    case _ =>
      try {
        ErrorObject.format.reads(resp.json) match {
          case JsSuccess(v, _) =>
            throw ApiError(resp.status, resp.statusText, v)
          case e: JsError => throw JsonError(resp.status, resp.statusText, e, Some(resp.body))
        }
      } catch {
        case e: JsonMappingException =>
          throw FatalError(resp.status, resp.statusText, e)
      }
  }

  private def getRequest(token: AccessToken, resource: String)(implicit ec: ExecutionContext) = WS.url(s"https://$endPoint/v1/$resource")
    .withHeaders(
      "Content-Type" -> "application/json",
      "Authorization" -> s"Bearer ${token.access_token}")
  private def getRequestPost(token: AccessToken, resource: String, content: play.api.libs.json.JsValue)(implicit ec: ExecutionContext) = { 
    println(content.toString)
    WS.url(s"https://$endPoint/v1/$resource")
    .withHeaders(
      "Content-Type" -> "application/json",
      "Authorization" -> s"Bearer ${token.access_token}").post(content)    

  }

}