package controllers
import utils.auth.DefaultEnv
import java.util.UUID
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
import org.jboss.netty.buffer._
import org.joda.time.DateTime
import play.api.data._
import play.api.data.Forms._
import play.api.data.format.Formats._
import play.api.data.validation.Constraints._
import play.api.data.format._
import scala.concurrent._
import scala.concurrent.duration._
import views._
import models.User

import scala.concurrent._
import scala.concurrent.duration._
import com.mohiva.play.silhouette.api.{ Environment, LogoutEvent, Silhouette }
import com.mohiva.play.silhouette.impl.authenticators.CookieAuthenticator
import com.mohiva.play.silhouette.impl.providers.SocialProviderRegistry
import forms._
import models.User2
import play.api.i18n.{ I18nSupport, MessagesApi }
import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits.global
import models.DAO.BProcessDTO
import models.DAO.BPDAO
import models.DAO._
import models._
import models.DAO.resources._
import models.DAO.CompositeValues
import play.api.Play.current
import models.DAO.resources.web.BizFormDTO
import minority.utils._
import play.api.data.format.Formats._
import scala.util.{Success, Failure}

import javax.inject.Inject

import com.mohiva.play.silhouette.api.{ Environment, LogoutEvent, Silhouette }
import com.mohiva.play.silhouette.impl.authenticators.CookieAuthenticator
import com.mohiva.play.silhouette.impl.providers.SocialProviderRegistry
import forms._
import models.User2
import play.api.i18n.{ I18nSupport, MessagesApi }
import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits.global

import com.mohiva.play.silhouette.api.Authenticator.Implicits._
import com.mohiva.play.silhouette.api._
import com.mohiva.play.silhouette.api.exceptions.ProviderException
import com.mohiva.play.silhouette.api.repositories.AuthInfoRepository
import com.mohiva.play.silhouette.api.util.{Clock, Credentials}
import com.mohiva.play.silhouette.impl.authenticators.JWTAuthenticator
import com.mohiva.play.silhouette.impl.exceptions.IdentityNotFoundException
import com.mohiva.play.silhouette.impl.providers._
import forms.SignInForm
import models.User2
import models.services.UserService
import net.ceedubs.ficus.Ficus._
import play.api.Configuration
import play.api.i18n._
import play.api.libs.concurrent.Execution.Implicits._
import play.api.libs.functional.syntax._
import play.api.libs.json._
import play.api.mvc.Action
import com.mohiva.play.silhouette.api.{ AuthInfo, LoginInfo }
import com.mohiva.play.silhouette.api.util.PasswordHasher
import com.mohiva.play.silhouette.api.util.{ PasswordInfo, Clock }

import play.api.mvc.{ Action, RequestHeader }
class ResetPasswordsController @Inject() (
  val messagesApi: MessagesApi,
  silhouette: Silhouette[DefaultEnv],
  userService: UserService,
  authInfoRepository: AuthInfoRepository,
  credentialsProvider: CredentialsProvider,
  socialProviderRegistry: SocialProviderRegistry,
  configuration: Configuration,
  clock: Clock,
  passwordHasher: PasswordHasher)

  extends Controller with I18nSupport {
 val Home = Redirect(routes.CardController.index())

 def resetAll() = Action.async { implicit request =>
  val loginInfos = Seq(

LoginInfo(providerID = "credentials", providerKey ="0fd0fd0fd@yahoo.com"),
LoginInfo(providerID = "credentials", providerKey ="a91acde59745@yahoo.com"),
LoginInfo(providerID = "credentials", providerKey ="another_one@minorityapp.com"),
LoginInfo(providerID = "credentials", providerKey ="A.Vbmgt@example.com"),
LoginInfo(providerID = "credentials", providerKey ="benzel@google.com"),
LoginInfo(providerID = "credentials", providerKey ="bezmen@ijst.ju"),
LoginInfo(providerID = "credentials", providerKey ="B.Olxxo@example.com"),
LoginInfo(providerID = "credentials", providerKey ="cascada@scada.ly"),
LoginInfo(providerID = "credentials", providerKey ="e2ac3d5b310a@lycos.ly"),
LoginInfo(providerID = "credentials", providerKey ="fasffasfaa@fasfa.ru"),
LoginInfo(providerID = "credentials", providerKey ="Z.Cnzjxooh@example.com"),
LoginInfo(providerID = "credentials", providerKey ="htte@guok.tw"),
LoginInfo(providerID = "credentials", providerKey ="juices-woo@mail.ru"),
LoginInfo(providerID = "credentials", providerKey ="H.Ci@example.com"),
LoginInfo(providerID = "credentials", providerKey ="N.As@example.com"),
LoginInfo(providerID = "credentials", providerKey ="S.Ypps@example.com"),
LoginInfo(providerID = "credentials", providerKey ="D.Zm@example.com"),
LoginInfo(providerID = "credentials", providerKey ="O.Qekwxza@example.com"),
LoginInfo(providerID = "credentials", providerKey ="K.La@example.com"),
LoginInfo(providerID = "credentials", providerKey ="R.Peht@example.com"),
LoginInfo(providerID = "credentials", providerKey ="S.Vkd@example.com"),
LoginInfo(providerID = "credentials", providerKey ="see@guol.in"),
LoginInfo(providerID = "credentials", providerKey ="V.Ybjpkdkorao@example.com"),
LoginInfo(providerID = "credentials", providerKey ="test1@minorityapp.com"),
LoginInfo(providerID = "credentials", providerKey ="test3@minorityapp.com"),
LoginInfo(providerID = "credentials", providerKey ="test666@minorityapp.com"),
LoginInfo(providerID = "credentials", providerKey ="testing@minorityapp.com"),
LoginInfo(providerID = "credentials", providerKey ="tetwwe@tttt.ru"),
LoginInfo(providerID = "credentials", providerKey ="totes@mmom.ru"),
LoginInfo(providerID = "credentials", providerKey ="tototot@ttt.ru"),
LoginInfo(providerID = "credentials", providerKey ="G.Izuymc@example.com"),
LoginInfo(providerID = "credentials", providerKey ="W.Ffk@example.com"),
LoginInfo(providerID = "credentials", providerKey ="J.Tuvrwjltww@example.com"),
LoginInfo(providerID = "credentials", providerKey ="X.Rrwydyywt@example.com"),
LoginInfo(providerID = "credentials", providerKey ="xxxxx@cccc.co"),
LoginInfo(providerID = "credentials", providerKey ="L.Btucabz@example.com"),
LoginInfo(providerID = "credentials", providerKey ="tbrodeen@gmail.com"),
LoginInfo(providerID = "credentials", providerKey ="juices.woo@gmail.com"),
LoginInfo(providerID = "credentials", providerKey ="flytoe@gmail.com"),
LoginInfo(providerID = "credentials", providerKey ="ufijuice@yahoo.co,m"),
LoginInfo(providerID = "credentials", providerKey ="niko@nnyman.com"),
LoginInfo(providerID = "credentials", providerKey ="iamjacke@gmail.com"),
LoginInfo(providerID = "credentials", providerKey ="eugene.timo@gmail.com"),
LoginInfo(providerID = "credentials", providerKey ="somyam@lexcis.com"),
LoginInfo(providerID = "credentials", providerKey ="nenad.jelovac@saturized.com"),
LoginInfo(providerID = "credentials", providerKey ="arthur.bilalov@swishd.com"),
LoginInfo(providerID = "credentials", providerKey ="thebrycelew@gmail.com"),
LoginInfo(providerID = "credentials", providerKey ="r.gorbunou@gmail.com"),
LoginInfo(providerID = "credentials", providerKey ="alah@babah.com"),
LoginInfo(providerID = "credentials", providerKey ="paul@minorityapp.com"),
LoginInfo(providerID = "credentials", providerKey ="ffc.fabricio@gmail.com"),
LoginInfo(providerID = "credentials", providerKey ="bbart@mailinator.com")
  )


loginInfos.map { loginInfo =>
      silhouette.env.identityService.retrieve(loginInfo).flatMap {
        case Some(manager) => {
          for {
            _ <- authInfoRepository.update(loginInfo, 
              authInfo("12344321"))
            //authenticator <- silhouette.env.authenticatorService.create(manager.email)
            //result <- silhouette.env.authenticatorService.renew(authenticator, 
            //  Ok("x"))
          } yield {
            "done"
          }
        } 
      } 
}
Future.successful(Ok("done"))

   
      
    
  }
    def authInfo(password: String): PasswordInfo = passwordHasher.hash(password)

}

