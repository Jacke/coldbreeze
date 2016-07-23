package controllers
import scala.util.{Try, Success, Failure}

import models.{AccountsDAO, User, Page}
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
//import play.modules.mailer._
import scala.util.{Try, Success, Failure}

import play.api.mvc._
import com.mohiva.play.silhouette.api.{ Environment, LogoutEvent, Silhouette }
import com.mohiva.play.silhouette.impl.authenticators.CookieAuthenticator
import com.mohiva.play.silhouette.impl.providers.SocialProviderRegistry
import forms._
import models.User2
import play.api.i18n.MessagesApi
import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits.global

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
import models.DAO.resources.{BusinessDAO, BusinessDTO}
import models.DAO._
import play.api._
import play.api.mvc._
import play.twirl.api.Html
import play.api.http.MimeTypes
import play.api.libs.json._
import play.api.cache._
import play.api.data._
import play.api.data.Forms._
import play.api.data.format.Formats
import play.api.data.format.Formatter
import play.api.data.FormError
import play.api.Logger
import views._
import models.User

import com.mohiva.play.silhouette.api.{ Environment, LogoutEvent, Silhouette }
import com.mohiva.play.silhouette.impl.authenticators.CookieAuthenticator
import com.mohiva.play.silhouette.impl.providers.SocialProviderRegistry
import forms._
import models.User2
import play.api.i18n.MessagesApi
import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits.global
import models.DAO.BProcessDTO
import models.DAO.BPDAO
import models.DAO._
import models.DAO.resources._
import models.DAO.CompositeValues
import play.api.Play.current
import main.scala.bprocesses._
import main.scala.simple_parts.process._
import models.DAO.reflect._
import models.DAO.conversion._
import cloner.util._
import scala.concurrent.ExecutionContext.Implicits.global
import scala.concurrent.duration.Duration
import scala.concurrent.{ExecutionContext, Awaitable, Await, Future}
import scala.util.Try
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
import models.DAO.reflect._
import modules._
import com.mohiva.play.silhouette.api.{ Identity, LoginInfo }

import java.io.File
import javax.inject.Inject

import akka.actor.{Actor, ActorRef, PoisonPill, Props}
import play.api.Play.current
import play.api._
import play.api.libs.concurrent.Promise
import play.api.libs.iteratee.{Concurrent, Enumerator, Iteratee}
import play.api.libs.ws._
import play.api.mvc._

import us.ority.min.actions._
import main.scala.simple_parts.process._

class MotivationController @Inject() (
  val messagesApi: MessagesApi,
  val motivationEl: MotivationElement,
  val env: Environment[User2, CookieAuthenticator],
  socialProviderRegistry: SocialProviderRegistry)(implicit val mat: akka.stream.Materializer) 
  extends Silhouette[User2, CookieAuthenticator] {
  import Formatters._

  	val anonymous = User2(userID = java.util.UUID.randomUUID,
						  loginInfo =  LoginInfo(providerID = "", providerKey = ""),
						  firstName = Some(""),
						  lastName = Some(""),
						  fullName = Some("Guest"),
						  email = Some("Guest"),
						  avatarURL = Some(""))

implicit val MsgFormat            = Json.format[Msg]

  def socket1 = WebSocket.using[String] {
    request =>
      Logger.info(s"wsPingPong, client connected.")

      var switch: Boolean = true
      val outEnumerator = Enumerator.repeatM[String](Promise.timeout({
        switch = !switch
        if (switch) Json.toJson(Msg("msg")).toString else Json.toJson(Msg("ping")).toString
      }, 10000))

      (Iteratee.ignore[String], outEnumerator)
}

	def socket = WebSocket.acceptWithActor[JsValue, JsValue] { request => out =>
	  MyWebSocketActor.props(out)
	}




def socketTest = WebSocket.acceptWithActor[String, String]{
    request => out => EchoWebScoketActor.props(out)
}





  	def index() = Action.async { request =>
  		println("host: "+request.host)
  		Future.successful(Ok(views.html.motivationPage(anonymous)) )
  	}






}


import akka.actor._

object MyWebSocketActor {
  def props(out: ActorRef) = Props(new MyWebSocketActor(out))
}
case class Msg(msg: String)

object Formatters {
    implicit val MsgFormat = Json.format[Msg]
    implicit val MsgFrameFormatter = FrameFormatter.jsonFrame[Msg]

}
class MyWebSocketActor(out: ActorRef) extends Actor {
  import Formatters._

  def receive = {
    case Msg(msg) => {
      out ! MsgResult(msg)
    }
    case msg: String =>
      out ! ("I received your message: " + msg)
    case _ =>
      out ! ("I received your message: ")      
  }
}
object EchoWebScoketActor {
  def props(out: ActorRef) = Props(new EchoWebScoketActor(out))

}
class EchoWebScoketActor(out: ActorRef) extends Actor {
    def receive = {
      case msg: String => { 
      out ! msg
      out ! MessagePreparer.prepare(msg)
  		//out ! msg+"11111"
      }
    }
}



object MessagePreparer {
  import sys.process._
    implicit val MsgFormat = Json.format[Msg]
    implicit val MsgFrameFormatter = FrameFormatter.jsonFrame[Msg]

  def prepare(msg: String):String = {
    val json = Json.parse(msg).asOpt[Msg]
    val s = json match {
      case Some(j) => {
        j.msg match {
          case "uptime" => "uptime" !!
          case "ls" => "ls -al" !!
          case _ => "Эй епта только uptime и ls доступны"

        }        
      }
      case _ => "Эй епта только uptime и ls доступны"
    }

    (Json.toJson(Msg(s))).toString
  }
}