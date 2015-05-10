package controllers

import securesocial.controllers.BaseLoginPage
import play.api.mvc.{RequestHeader, AnyContent, Action}
import play.api.Logger
import securesocial.core.{RuntimeEnvironment, IdentityProvider}
import service.DemoUser
import securesocial.core.services.RoutesService

import play.api.data.Forms._
import play.api.data._
import play.api.i18n.Messages
import play.api.mvc.Action
import securesocial.core._
import securesocial.controllers._
import securesocial.core.authenticator.CookieAuthenticator
import securesocial.core.providers.UsernamePasswordProvider
import securesocial.core.providers.utils._
import securesocial.core.services.SaveMode
import models._
import scala.concurrent.{Await, ExecutionContext, Future}

class CustomLoginController(implicit override val env: RuntimeEnvironment[DemoUser]) extends BaseLoginPage[DemoUser] {
  override def login: Action[AnyContent] = {
    Logger.debug("using CustomLoginController")
    super.login
  }
  override def logout: Action[AnyContent] = {
    Logger.debug("using logout")
    super.logout
  }
}

object BaseRegistrationMsgs {
  val UserNameAlreadyTaken = "securesocial.signup.userNameAlreadyTaken"
  val ThankYouCheckEmail = "securesocial.signup.thankYouCheckEmail"
  val InvalidLink = "securesocial.signup.invalidLink"
  val SignUpDone = "securesocial.signup.signUpDone"
  val Password = "password"
  val Password1 = "password1"
  val Password2 = "password2"


  val PasswordsDoNotMatch = "securesocial.signup.passwordsDoNotMatch"
}


import _root_.java.util.UUID
import play.api.mvc.{RequestHeader, Result, Action, Controller}
import play.api.data._
import play.api.data.Forms._
import play.api.data.validation.Constraints._
import play.api.Play
import securesocial.core.providers.UsernamePasswordProvider
import securesocial.core._
import com.typesafe.plugin._
import Play.current
import securesocial.core.providers.utils._
import org.joda.time.DateTime
import play.api.i18n.Messages
import scala.Some
import securesocial.core.providers._

import scala.language.reflectiveCalls
import securesocial.controllers.Registration
import com.typesafe.plugin._
import controllers._
import play.api.i18n.Lang

object CustomRegistration {

  def handleObserver(email: String, host: String, hash_code: String, lang: Lang = Lang("en", "US")) = {
     val mail = use[MailerPlugin].email
              mail.setSubject("You added as observer | Minority App")
              mail.setCc(email)
              mail.setFrom("app@minorityapp.com")

              mail.sendHtml(views.html.mailer.ObserverAdd.render(email, host, hash_code).body)
  }

  def handleStartSignUp(email: String, host: String) = {

          // check if there is already an account for this email address
          AccountsDAO.findByEmailAndProvider(email, "userpass") match {
            case Some(user) => {
              // user signed up already, send an email offering to login/recover password

              val mail = use[MailerPlugin].email
              mail.setSubject("Employee registration | Minority App")
              mail.setCc(email)
              mail.setFrom("app@minorityapp.com")
              //views.html.mailBody.render(user).body();
              val token = securesocial.core.providers.MailToken("XXXX",email, DateTime.now, DateTime.now.plusMinutes(60),false)
              mail.sendHtml(views.html.mailer.ActorAdd.render(token.email, host).body)
              // SEND WELCOME
              //Mailer.sendAlreadyRegisteredEmail(user)
            }
            case None => {
              val token = createToken(email, isSignUp = true)
              //original line
              // SEND WELCOME
              val mail = use[MailerPlugin].email
              mail.setSubject("Employee registration | Minority App")
              mail.setCc(email)
              mail.setFrom("app@minorityapp.com")
              //views.html.mailBody.render(user).body();
              mail.sendHtml(views.html.mailer.ActorAdd.render(token._1, host).body)


              //Mailer.sendAlreadyRegisteredEmail(user)
          }


  }
  }
  private def createToken(email: String, isSignUp: Boolean): (String, MailToken) = {
    val uuid:String = UUID.randomUUID().toString
    val now = DateTime.now

//case class MailToken(uuid: String, email: String, creationTime: DateTime, expirationTime: DateTime, isSignUp: Boolean)
    val token = MailToken(
      uuid, email,
      now,
      now.plusMinutes(60),
      isSignUp = isSignUp)
    TokensDAO.saveToken(token)
    (uuid, token)
  }

}

class CustomProviderController(implicit override val env: RuntimeEnvironment[DemoUser]) extends securesocial.controllers.BaseProviderController[DemoUser] {
  import BaseRegistrationMsgs._
  import play.api.Play
  import play.api.Play.current
  import play.api.i18n.Messages
  import play.api.mvc._
  import securesocial.core._
  import securesocial.core.authenticator.CookieAuthenticator
  import securesocial.core.services.SaveMode
  import securesocial.core.utils._
  import securesocial.controllers.ProviderControllerHelper._
  import models.DAO.{AccountLogger, AccountLoggerDAO}
  import scala.concurrent.Future

  override def authenticate(provider: String, redirectTo: Option[String] = None) =  { 
    println("x authenticate")
    handleAuth(provider, redirectTo)
  }
  override def authenticateByPost(provider: String, redirectTo: Option[String] = None) = {
    println("x authenticateByPost")
    handleAuth(provider, redirectTo)
  }
  private def overrideOriginalUrl(session: Session, redirectTo: Option[String]) = redirectTo match {
    case Some(url) =>
      session + (SecureSocial.OriginalUrlKey -> url)
    case _ =>
      session
  }
  private def builder() = {
    //todo: this should be configurable maybe
    env.authenticatorService.find(CookieAuthenticator.Id).getOrElse {
      logger.error(s"[securesocial] missing CookieAuthenticatorBuilder")
      throw new AuthenticationException()
    }
  }
  private def logAuth(ip: String, agent: String, email: Option[String]) = {
    AccountLoggerDAO.pull_object(AccountLogger(None, ip, agent, email))
  }
  private def handleAuth(provider: String, redirectTo: Option[String]) = UserAwareAction.async { implicit request =>
    import scala.concurrent.ExecutionContext.Implicits.global
    val authenticationFlow = request.user.isEmpty
    val modifiedSession = overrideOriginalUrl(request.session, redirectTo)

      logAuth(request.remoteAddress, request.headers.get("User-Agent").getOrElse(""), None)
    if (!authenticationFlow) {
      logAuth(request.remoteAddress, request.headers.get("User-Agent").getOrElse(""), request.user.get.main.email)
    }

    env.providers.get(provider).map {
      _.authenticate().flatMap {
        case denied: AuthenticationResult.AccessDenied =>
          Future.successful(Redirect(env.routes.loginPageUrl).flashing("error" -> Messages("securesocial.login.accessDenied")))
        case failed: AuthenticationResult.Failed =>
          logger.error(s"[securesocial] authentication failed, reason: ${failed.error}")
          throw new AuthenticationException()
        case flow: AuthenticationResult.NavigationFlow => Future.successful {
          redirectTo.map { url =>
            flow.result.addToSession(SecureSocial.OriginalUrlKey -> url)
          } getOrElse flow.result
        }
        case authenticated: AuthenticationResult.Authenticated =>
          if (authenticationFlow) {
            val profile = authenticated.profile
            logAuth(request.remoteAddress, request.headers.get("User-Agent").getOrElse(""), profile.email)

            env.userService.find(profile.providerId, profile.userId).flatMap { maybeExisting =>
              val mode = if (maybeExisting.isDefined) SaveMode.LoggedIn else SaveMode.SignUp
              env.userService.save(authenticated.profile, mode).flatMap { userForAction =>
                logger.debug(s"[securesocial] user completed authentication: provider = ${profile.providerId}, userId: ${profile.userId}, mode = $mode")
                val evt = if (mode == SaveMode.LoggedIn) new LoginEvent(userForAction) else new SignUpEvent(userForAction)
                val sessionAfterEvents = Events.fire(evt).getOrElse(request.session)
                import scala.concurrent.ExecutionContext.Implicits.global
                builder().fromUser(userForAction).flatMap { authenticator =>
                  Redirect(toUrl(sessionAfterEvents)).withSession(sessionAfterEvents -
                    SecureSocial.OriginalUrlKey -
                    IdentityProvider.SessionId -
                    OAuth1Provider.CacheKey).startingAuthenticator(authenticator)
                }
              }
            }
          } else {
            request.user match {
              case Some(currentUser) =>
                for (
                  linked <- env.userService.link(currentUser, authenticated.profile);
                  updatedAuthenticator <- request.authenticator.get.updateUser(linked);
                  result <- Redirect(toUrl(modifiedSession)).withSession(modifiedSession -
                    SecureSocial.OriginalUrlKey -
                    IdentityProvider.SessionId -
                    OAuth1Provider.CacheKey).touchingAuthenticator(updatedAuthenticator)
                ) yield {
                  logger.debug(s"[securesocial] linked $currentUser to: providerId = ${authenticated.profile.providerId}")
                  result
                }
              case _ =>
                Future.successful(Unauthorized)
            }
          }
      } recover {
        case e =>
          logger.error("Unable to log user in. An exception was thrown", e)
          Redirect(env.routes.loginPageUrl).flashing("error" -> Messages("securesocial.login.errorLoggingIn"))
      }
    } getOrElse {
      Future.successful(NotFound)
    }
  }


}

class CustomRegistrationController(implicit override val env: RuntimeEnvironment[DemoUser]) extends BaseRegistration[DemoUser] {
  import BaseRegistrationMsgs._

  override def handleSignUp(token: String) = Action.async {
    implicit request =>
      import scala.concurrent.ExecutionContext.Implicits.global
      executeForToken(token, true, {
        t =>
          form.bindFromRequest.fold(
            errors => {
              //logger.debug("[securesocial] errors " + errors)
              Future.successful(BadRequest(env.viewTemplates.getSignUpPage(errors, t.uuid)))
            },
            info => {
              val id = if (UsernamePasswordProvider.withUserNameSupport) info.userName.get else t.email
              val newUser = BasicProfile(
                providerId,
                id,
                Some(info.firstName),
                Some(info.lastName),
                Some("%s %s".format(info.firstName, info.lastName)),
                Some(t.email),
                None,
                AuthenticationMethod.UserPassword,
                passwordInfo = Some(env.currentHasher.hash(info.password))
              )

              val withAvatar = env.avatarService.map {
                _.urlFor(t.email).map { url =>
                  if ( url != newUser.avatarUrl) newUser.copy(avatarUrl = url) else newUser
                }
              }.getOrElse(Future.successful(newUser))

              import securesocial.core.utils._
              val result = for (
                toSave <- withAvatar;
                saved <- env.userService.save(toSave, SaveMode.SignUp) ;
                deleted <- env.userService.deleteToken(t.uuid)
              ) yield {
                // Set language that user set in his browser
                AccountsDAO.updateLang(toSave.email.get, request.acceptLanguages.head.language)

                if (UsernamePasswordProvider.sendWelcomeEmail)
                  env.mailer.sendWelcomeEmail(newUser)
                val eventSession = Events.fire(new SignUpEvent(saved)).getOrElse(request.session)
                if (UsernamePasswordProvider.signupSkipLogin) {
                  env.authenticatorService.find(CookieAuthenticator.Id).map {
                    _.fromUser(saved).flatMap { authenticator =>
                        confirmationResult().flashing(Success -> Messages(SignUpDone)).startingAuthenticator(authenticator)
                    }
                  } getOrElse {
                    //logger.error(s"[securesocial] There isn't CookieAuthenticator registered in the RuntimeEnvironment")
                    Future.successful(confirmationResult().flashing(Error -> Messages("There was an error signing you up")))
                  }
                } else {
                  Future.successful(confirmationResult().flashing(Success -> Messages(SignUpDone)).withSession(eventSession))
                }
              }
              result.flatMap(f => f)
            })
      })
  }
}

class CustomRoutesService extends RoutesService.Default {
  override def loginPageUrl(implicit req: RequestHeader): String = controllers.routes.CustomLoginController.login().absoluteURL(IdentityProvider.sslEnabled)
}
