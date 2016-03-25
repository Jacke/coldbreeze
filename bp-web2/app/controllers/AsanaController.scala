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
import service.DemoUser
import securesocial.core._
import controllers.users._
import models.DAO.resources._
import scala.util.{Success, Failure}
import scala.concurrent._
import scala.concurrent.duration._
import scala.collection.mutable.ListBuffer
import play.api.libs.ws._
import play.api.libs.ws.ning.NingAsyncHttpClientConfigBuilder

case class AsanaUserCode(email: String, code: String, token: Option[AsanaTokenResult] = None)
case class AsanaTokenResult(access_token: String,
	expires_in: Int = 0,
	token_type: String = "",
	refresh_token: String = "",
	data: AsanaData
	)
case class AsanaData(id:Long,
name:String,
email:String)

case class AsanaUserResult(data: List[AsanaUserData])
case class AsanaWorkspace(id: Long)
	case class AsanaUserData(id:Long,
							name:String,
							email:String,
							photo: Option[String],
							workspaces: List[AsanaWorkspace]
							)

object AsanaCred {
	val CLIENT_ID = "74118254682980"
    val SECRET = "f1d25d15049648c526c13f7fea436f5b"
    var userCodes:ListBuffer[AsanaUserCode] = ListBuffer()
    var once = false
}


import javax.inject.Inject

import securesocial.core._
import service.{ MyEnvironment, MyEventListener, DemoUser }
import play.api.mvc.{ Action, RequestHeader }

class AsanaController @Inject() (override implicit val env: MyEnvironment) extends securesocial.core.SecureSocial {
  import play.api.Play.current
implicit val AsanaWorkspaceFormat = Json.format[AsanaWorkspace]
implicit val AsanaWorkspaceReaders = Json.reads[AsanaWorkspace]

implicit val AsanaUserDataFormat = Json.format[AsanaUserData]
implicit val AsanaUserDataReaders = Json.reads[AsanaUserData]
implicit val AsanaUserResultFormat = Json.format[AsanaUserResult]
implicit val AsanaUserResultReaders = Json.reads[AsanaUserResult]
  implicit val AsanaDataFormat = Json.format[AsanaData]
  implicit val AsanaDataReaders = Json.reads[AsanaData]
  implicit val TokenResultFormat = Json.format[AsanaTokenResult]
  implicit val TokenResultReaders = Json.reads[AsanaTokenResult]
  val applicationLogger = play.api.Logger("application")

  def auth(code: Option[String]) = SecuredAction { implicit request =>
    // https://slack.com/oauth/authorize?client_id=2175858941.8432520967&scope=users%3Aread+groups%3Aread&state=authed
    // client_id    - issued when you created your app (required)
    // scope        - permissions to request (see below) (required)
    // redirect_uri - URL to redirect back to (see below) (optional)

    if (code.isDefined) {
		val tokenReq = s"https://app.asana.com/-/oauth_token?client_id=${AsanaCred.CLIENT_ID}&grant_type=authorization_code&client_secret=${{AsanaCred.SECRET}}&redirect_uri=http://192.168.1.102/asana/auth&code=${code.get}"
        val tokenAction:Future[Option[AsanaTokenResult]] = WS.url(tokenReq).post(Map("key" -> Seq("value"))).map { response =>
          println(response.body)
          val res = response.json.as[AsanaTokenResult]
          Some(res)
        }.recover{ case c => {
	     	println(c)
	     	None
        }
	    }
        val tokenResult:Option[AsanaTokenResult] = Await.result(tokenAction, Duration(25000, MILLISECONDS))

        tokenResult match {
	      case Some(result) =>    val coded = AsanaUserCode(request.user.main.email.get, code.get, Some(result))
							    	AsanaCred.userCodes += coded
								    Redirect("http://192.168.1.102/asana/users")//Ok("auth by code "+coded.token.get.access_token)
		  case _ => Ok("not get")
	    }
	} else {
	  	AsanaCred.once = true
	    Redirect(s"https://app.asana.com/-/oauth_authorize?client_id=${AsanaCred.CLIENT_ID}&redirect_uri=http://192.168.1.102/asana/auth&response_type=code&state=authed")
	}
  }

  def getUsers() = SecuredAction.async { implicit request =>
  	val userEmail = request.user.main.email.get
  	val result = AsanaCred.userCodes.find(code => code.email == userEmail) match {
  		case Some(code) => {

        val userResult = WS.url(s"https://app.asana.com/api/1.0/users?opt_expand=id,name,email,photo,workspaces&opt_fields=workspaces,photo,email,name,id&workspace=14530444694425&limit=100")
        .withHeaders("Authorization" -> s"Bearer ${code.token.get.access_token}").get().map { response =>
          println(response.json)
          val res = response.json.as[AsanaUserResult]
          println(res)
          res.data.foreach(println(_))
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
