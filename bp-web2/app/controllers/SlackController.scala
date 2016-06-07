package controllers
import sys.process._

import play.api._
import play.api.mvc._
import play.twirl.api.Html
//{Action, Controller}
import play.api.http.MimeTypes
import play.api.libs.json._
import play.api.cache._
import play.api.libs.json._
import play.api.libs.functional.syntax._
import play.api.Logger

import views._
import models.{AccountsDAO, User}

import com.mohiva.play.silhouette.api.{ Environment, LogoutEvent, Silhouette }
import com.mohiva.play.silhouette.impl.authenticators.CookieAuthenticator
import com.mohiva.play.silhouette.impl.providers.SocialProviderRegistry
import forms._
import models.User2
import play.api.i18n.MessagesApi
import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits.global
import controllers.users._
import models.DAO.resources._
import scala.util.{Success, Failure}
import scala.concurrent._
import scala.concurrent.duration._
import scala.collection.mutable.ListBuffer
import play.api.libs.ws._
import play.api.libs.ws.ning.NingAsyncHttpClientConfigBuilder

case class UserCode(email: String, code: String, token: Option[TokenResult] = None)
case class TokenResult(access_token: String, scope: String)
object SlackCred {
	val CLIENT_ID = "2175858941.8432520967"
    val SECRET = "ed4314bdfb3ceb56c407dc95fd66b289"
    var userCodes:ListBuffer[UserCode] = ListBuffer()
}

import javax.inject.Inject

import com.mohiva.play.silhouette.api.{ Environment, LogoutEvent, Silhouette }
import com.mohiva.play.silhouette.impl.authenticators.CookieAuthenticator
import com.mohiva.play.silhouette.impl.providers.SocialProviderRegistry
import forms._
import models.User2
import play.api.i18n.MessagesApi
import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits.global

import play.api.mvc.{ Action, RequestHeader }
class SlackController @Inject() (
  val messagesApi: MessagesApi,
  val env: Environment[User2, CookieAuthenticator],
  socialProviderRegistry: SocialProviderRegistry)
  extends Silhouette[User2, CookieAuthenticator] { // with Secured  {
  import play.api.Play.current
  implicit val TokenResultFormat = Json.format[TokenResult]
  implicit val TokenResultReaders = Json.reads[TokenResult]
  val applicationLogger = play.api.Logger("application")

  def auth(code: Option[String]) = SecuredAction { implicit request =>
    // https://slack.com/oauth/authorize?client_id=2175858941.8432520967&scope=users%3Aread+groups%3Aread&state=authed
    // client_id    - issued when you created your app (required)
    // scope        - permissions to request (see below) (required)
    // redirect_uri - URL to redirect back to (see below) (optional)
    if (code.isDefined) {
		val tokenReq = s"https://slack.com/api/oauth.access?client_id=2175858941.8432520967&client_secret=ed4314bdfb3ceb56c407dc95fd66b289&code=${code.get}"
        val tokenAction:Future[Option[TokenResult]] = WS.url(tokenReq).get().map { response =>
          val res = response.json.as[TokenResult]
          println(response.json)
          Some(res)
        }.recover{ case c => {
	     	println(c)
	     	None
        }
	    }
        val tokenResult:Option[TokenResult] = Await.result(tokenAction, Duration(25000, MILLISECONDS))

        val coded = UserCode(request.identity.emailFilled, code.get, tokenResult)
    	SlackCred.userCodes += coded
	    Ok("auth by code "+coded.token.get.access_token)
	} else {
	    Redirect("https://slack.com/oauth/authorize?client_id=2175858941.8432520967&redirect_uri=http://192.168.1.102/slack/auth&scope=users%3Aread+groups%3Aread&state=authed")
	}
  }

  def getUsers() = SecuredAction.async { implicit request =>
  	val userEmail = request.identity.emailFilled
  	val result = SlackCred.userCodes.find(code => code.email == userEmail) match {
  		case Some(code) => {

        val userResult = WS.url(s"https://slack.com/api/users.list?token=${code.token.get.access_token}").get().map { response =>
          println(response.json)
          response
            Ok(response.json.toString)
        }.recover{ case c => {
	     	println(c)
	     	Ok(Json.toJson(""))
        }
	    }
	    userResult
  		}

  		case _ => Future(Ok(Json.toJson("bad")))
  	}
  	result//Future(Ok(Json.toJson("bad")))
  }

}
