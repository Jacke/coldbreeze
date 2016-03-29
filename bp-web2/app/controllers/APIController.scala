package controllers

import models.User2
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
import com.mohiva.play.silhouette.api.{ Environment, LogoutEvent, Silhouette }
import com.mohiva.play.silhouette.impl.authenticators.CookieAuthenticator
import com.mohiva.play.silhouette.impl.providers.SocialProviderRegistry
import forms._
import models.User2
import play.api.i18n.MessagesApi
import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits.global

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

class APIController @Inject() (
  val messagesApi: MessagesApi,
  val env: Environment[User2, CookieAuthenticator],
  socialProviderRegistry: SocialProviderRegistry)
  extends Silhouette[User2, CookieAuthenticator] {
  import play.api.Play.current
  implicit val ApiSpecReads = Json.reads[ApiSpec]
  implicit val ApiSpecWrites = Json.format[ApiSpec]

  val applicationLogger = play.api.Logger("application")

  def v1 = SecuredAction { implicit request =>
    Ok(Json.toJson(ApiSpec("To be anounced")))
  }

}
