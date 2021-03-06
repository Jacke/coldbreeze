package controllers
import utils.auth.DefaultEnv
import scala.util.{Try, Success, Failure}

import models.{AccountsDAO, User, Page}
import com.mohiva.play.silhouette.api.{ Environment, LogoutEvent, Silhouette }
import com.mohiva.play.silhouette.impl.authenticators.CookieAuthenticator
import com.mohiva.play.silhouette.impl.providers.SocialProviderRegistry
import forms._
import models.User2
import play.api.i18n.{ I18nSupport, MessagesApi }
import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits.global
import controllers.users._
import models.DAO.resources._
import models.DAO._
import decorators._
import play.api.mvc._
import play.api.Play.current
import scala.concurrent._
import scala.concurrent.duration._
import akka.actor._
import play.api.libs.json._
import play.api.mvc.WebSocket.FrameFormatter
import SumActor._
import SumActor.Sum._
import play.api.libs.mailer._
import scala.util.{Try, Success, Failure}
import play.api.libs.concurrent.Execution.Implicits._
import scala.concurrent._

import play.api.mvc._
import com.mohiva.play.silhouette.api.{ Environment, LogoutEvent, Silhouette }
import com.mohiva.play.silhouette.impl.authenticators.CookieAuthenticator
import com.mohiva.play.silhouette.impl.providers.SocialProviderRegistry
import forms._
import models.User2
import play.api.i18n.{ I18nSupport, MessagesApi }
import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits.global

object Subscribe
object StatusCheck

case class Subscriber(email: String)


import javax.inject.Inject

import com.mohiva.play.silhouette.api.{ Environment, LogoutEvent, Silhouette }
import com.mohiva.play.silhouette.impl.authenticators.CookieAuthenticator
import com.mohiva.play.silhouette.impl.providers.SocialProviderRegistry
import forms._
import models.User2
import play.api.i18n.{ I18nSupport, MessagesApi }
import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits.global

import play.api.mvc.{ Action, RequestHeader }

class SubscribtionController @Inject() (
  val messagesApi: MessagesApi,
  silhouette: Silhouette[DefaultEnv],
  socialProviderRegistry: SocialProviderRegistry)
  extends Controller with I18nSupport {
    implicit val sumFormat                    = Json.format[SumActor.Sum]
    implicit val sumFrameFormatter            = FrameFormatter.jsonFrame[SumActor.Sum]
    implicit val sumResultFormat              = Json.format[SumActor.SumResult]
    implicit val sumResultFrameFormatter      = FrameFormatter.jsonFrame[SumActor.SumResult]
    implicit val HistMessageFormat            = Json.format[HistMessage]
    implicit val HistMessageFrameFormatter    = FrameFormatter.jsonFrame[HistMessage]
    implicit val PopupRequestFormat           = Json.format[PopupRequest]
    implicit val PopupRequestFrameFormatter   = FrameFormatter.jsonFrame[PopupRequest]
  // val auth = UserService.find(authenticator.get.identityId)
  // auth.get.identityId.userId

  implicit val SubscriberReads = Json.reads[Subscriber]
  implicit val SubscriberWrites = Json.format[Subscriber]

def sendInvite(emails_hash: String, invite_link: String) = silhouette.SecuredAction { implicit request =>
  val emails = emails_hash.split(",").toList
  mailers.Mailer.sendInvite(subject = "Minority Platform Invite",
              emails = emails,
              invite_link)
  Ok("sended to" + emails_hash)
}

def fetchSubscribers() = Action { implicit request =>
  val emails: List[Subscriber] = mailers.Mailer.fetchMembers().map(Subscriber(_))
   Ok(Json.toJson(emails))
}

def newSubscribers() = Action { implicit request =>
   type Email = String
   val emails: List[String] = mailers.Mailer.fetchMembers()
   val filtered = List()//AccountsDAO.getAccounts(emails).map(_.userId)
   Ok(Json.toJson(emails.filter(e => !filtered.contains(e)).map(Subscriber(_))))
}
def sendToNew() = Action { implicit request =>
   type Email = String
   val emails: List[String] =  List() //AccountsDAO.getAccounts(mailers.Mailer.fetchMembers()).map(_.userId)
   emails.foreach { email =>
   val invite_link:String = "invite_link"
    mailers.Mailer.sendInvite(subject = "Minority Platform Invite",
              emails = List(email),
              invite_link)
   }
   Ok(Json.toJson("sended to"))
}

import play.api.libs.concurrent.Execution.Implicits._

}
