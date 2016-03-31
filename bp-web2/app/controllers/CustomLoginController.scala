package controllers

import play.api.mvc.{RequestHeader, AnyContent, Action}
import play.api.Logger
import play.api.data.Forms._
import play.api.data._
import play.api.i18n.Messages
import play.api.mvc.Action
import com.mohiva.play.silhouette.api.{ Environment, LogoutEvent, Silhouette }
import com.mohiva.play.silhouette.impl.authenticators.CookieAuthenticator
import com.mohiva.play.silhouette.impl.providers.SocialProviderRegistry
import forms._
import models.User2
import play.api.i18n.MessagesApi
import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits.global
import play.filters.csrf._
import models._
import scala.concurrent.{Await, ExecutionContext, Future}
import scala.concurrent.ExecutionContext.Implicits.global
import javax.inject.Inject
import forms._
import models.User2
import play.api.i18n.MessagesApi
import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits.global
import play.api.mvc.{ Action, RequestHeader }
import play.api.Play.current
import play.api.i18n.Messages.Implicits._
import _root_.java.util.UUID
import play.api.mvc.{RequestHeader, Result, Action, Controller}
import play.api.data._
import play.api.data.Forms._
import play.api.data.validation.Constraints._
import play.api.Play
import com.mohiva.play.silhouette.api.{ Environment, LogoutEvent, Silhouette }
import com.mohiva.play.silhouette.impl.authenticators.CookieAuthenticator
import com.mohiva.play.silhouette.impl.providers.SocialProviderRegistry
import forms._
import models.User2
import play.api.i18n.MessagesApi
import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits.global
import com.typesafe.plugin._
import Play.current
import org.joda.time.DateTime
import play.api.i18n.Messages
import scala.language.reflectiveCalls
import com.typesafe.plugin._
import controllers._
import play.api.i18n.Lang
import scala.concurrent._
import ExecutionContext.Implicits.global
import play.api.libs.mailer._

import play.api.libs.mailer._
import javax.inject.Inject



trait CustomRegistration {
  def handleStartSignUp(email: String, host: String):Unit
}

class CustomRegistrationImpl @Inject() (mailerClient: MailerClient) extends CustomRegistration {
  def handleStartSignUp(email: String, host: String):Unit = {

          // check if there is already an account for this email address
          AccountsDAO.findByEmailAndProvider(email, "userpass") match {
            case Some(user) => {
              // user signed up already, send an email offering to login/recover password

              val mail = Email(
              "Employee registration | Minority App",
              s"Minority App FROM <a@minorityapp.com>",
              Seq(s"Employee <${email}>"),
                  bodyHtml = Some(views.html.mailer.ActorAdd.render(email, host).body)
              )
              mailerClient.send(mail)
              // SEND WELCOME
              play.Logger.info(s"employment registration for email with token token")
              play.Logger.info(s".... INVITE LINK ...")
              play.Logger.info(s"/auth/signup/token")
              play.Logger.info(s".... INVITE LINK ...")
              Future {
                  mailers.Mailer.sendInvite(subject = "Invitation as employee",
                  emails = List(email),
                  invite_link = "token.uuid")
              }
            }
            case None => {
              val token = createToken(email, isSignUp = true)
              //original line
              // SEND WELCOME
              val mail = Email(
              "Employee registration | Minority App",
              s"Minority App FROM <a@minorityapp.com>",
              Seq(s"Employee <${email}>"),
                  bodyHtml = Some(views.html.mailer.ActorAdd.render("token._1", host).body)
              )
              mailerClient.send(mail)
              play.Logger.info(s"employment arleady defined registration for email !!!!!")
              play.Logger.info(s".... PLEASE STANBY ...")
              //play.Logger.info(s"/auth/signup/$token")
              play.Logger.info(s".... PLEASE STANBY ...")
              //Future {
              //    mailers.Mailer.sendInvite(subject = "Invitation as employee",
              //    emails = List(email),
              //    invite_link = token._2.uuid)
              //}
          }
        }
  }
  private def createToken(email: String, isSignUp: Boolean): (String) = {
    val uuid:String = UUID.randomUUID().toString
    val now = DateTime.now
    play.Logger.info(s".... TOKEN CREATED ...")
    //case class MailToken(uuid: String, email: String, creationTime: DateTime, expirationTime: DateTime, isSignUp: Boolean)
    //val token = MailToken(
    //  uuid, email,
    //  now,
    //  now.plusDays(60),
    //  isSignUp = isSignUp)
    //TokensDAO.saveToken(token)
    (uuid)
  }

}
