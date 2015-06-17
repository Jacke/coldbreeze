package controllers

import models.User
import play.api.libs.json.Json
import play.api.mvc.Controller
import play.api.mvc._
import play.twirl.api.Html
import play.api.http.MimeTypes
import play.api.libs.json._
import views._
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
import service.DemoUser
import securesocial.core._

/*
object APIController extends Controller with Secured  {
  def readToken() = SecureAction { user => _ =>
    Ok(User.findByEmail(user).get.token)
  }
  def readByToken(token: String) = Action {


    Ok(User.findByToken(token).get.email)
  }
  def getToken() = SecureAction { user => _ =>
    User.createToken(user) match {
      case Right(token) => Ok(Json.toJson(Map("token" -> token.token)))
      case Left(error) => Ok(error)
    }
  }
}
*/
case class ApiSpec(spec_url: String)

class APIController(override implicit val env: RuntimeEnvironment[DemoUser]) extends Controller with securesocial.core.SecureSocial[DemoUser] { // with Secured  {
  import play.api.Play.current
  implicit val ApiSpecReads = Json.reads[ApiSpec]
  implicit val ApiSpecWrites = Json.format[ApiSpec]

  val applicationLogger = play.api.Logger("application")

  def v1 = SecuredAction { implicit request =>
    Ok(Json.toJson(ApiSpec("To be anounced")))
  }

}