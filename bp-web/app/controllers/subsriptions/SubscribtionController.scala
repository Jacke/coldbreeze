package controllers
import scala.util.{Try, Success, Failure}

import models.{AccountsDAO, User, Page}
import service.DemoUser
import securesocial.core._
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
import play.modules.mailer._
import scala.util.{Try, Success, Failure}

import play.api.mvc._
import securesocial.core._

object Subscribe
object StatusCheck


class SubscribtionController(override implicit val env: RuntimeEnvironment[DemoUser]) extends Controller with securesocial.core.SecureSocial[DemoUser] {
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



def sendInvite(emails_hash: String, invite_link: String) = SecuredAction { implicit request =>
  val emails = emails_hash.split(",").toList
  mailers.Mailer.sendInvite(subject = "Minority Platform Invite",
             emails = emails, 
             invite_link)
  Ok("sended to" + emails_hash)
}

import play.api.libs.concurrent.Execution.Implicits._

}
