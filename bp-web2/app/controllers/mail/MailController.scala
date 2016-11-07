package controllers
import utils.auth.DefaultEnv

import play.api.Play.current
import play.api.libs.mailer._

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


import javax.inject.Inject

import com.mohiva.play.silhouette.api.{ Environment, LogoutEvent, Silhouette }
import com.mohiva.play.silhouette.impl.authenticators.CookieAuthenticator
import com.mohiva.play.silhouette.impl.providers.SocialProviderRegistry
import forms._
import models.User
import play.api.i18n.{ I18nSupport, MessagesApi }
import models._
import models.daos._





import java.io.File
import org.apache.commons.mail.EmailAttachment





import java.util.UUID
import javax.inject.Inject

import com.mohiva.play.silhouette.api._
import com.mohiva.play.silhouette.api.repositories.AuthInfoRepository
import com.mohiva.play.silhouette.api.services.AvatarService
import com.mohiva.play.silhouette.api.util.PasswordHasher
import com.mohiva.play.silhouette.impl.authenticators.CookieAuthenticator
import com.mohiva.play.silhouette.impl.providers._
import forms.SignUpForm
import models.User
import models.services.UserService
import play.api.i18n.{ MessagesApi, Messages }
import play.api.libs.concurrent.Execution.Implicits._
import play.api.mvc.Action
import scala.concurrent.Future

class MailController @Inject() (
  mailerClient: MailerClient,
  val messagesApi: MessagesApi,
  silhouette: Silhouette[DefaultEnv],
  socialProviderRegistry: SocialProviderRegistry)
  extends Controller with I18nSupport {

import scala.concurrent.ExecutionContext.Implicits.global
import scala.concurrent.duration.Duration
import scala.concurrent.{ExecutionContext, Awaitable, Await, Future}
import scala.util.Try
import sys.process._


  def await[T](a: Awaitable[T])(implicit ec: ExecutionContext) = Await.result(a, Duration.Inf)
  def awaitAndPrint[T](a: Awaitable[T])(implicit ec: ExecutionContext) = println(await(a))




def testMail() = silhouette.SecuredAction.async { implicit request =>
//	Mailer.sendEmail(mailerClient)

val token = Seq(s"python", "gmail_oauth2.py", "--refresh_token=1/EPAe0BTWz87_N4or6fZhoHbJMZb5DsTufprSnokVrfo",
"--user=iamjacke@gmail.com",
"--client_id=629371862094-egfiim60lfulkrvb9e3iqpl5a2nk5c69.apps.googleusercontent.com",
"--client_secret=cvXTplfC_Zc8Wsa63zyxqCJV"
).!!

com.google.code.samples.oauth2.OAuth2Authenticator.main(Array("iamjacke@gmail.com", token))
	  Future.successful(Ok("sended"))

}

}

object Mailer {
  def sendEmail(to: String, msg: String, mailerClient: MailerClient) {
    val cid = "1234"
    val email = Email(
      "Minority Workflow managment Platform | Invitation",
      "MinorityApp FROM <a@minorityapp.com>",
      Seq(s"Stan TO <${to}>"),
      // adds attachment
      attachments = Seq(),
      // sends text, HTML or both...
      bodyText = Some("Invitation"),
      bodyHtml = Some(msg)
    )
    mailerClient.send(email)
  }
}
