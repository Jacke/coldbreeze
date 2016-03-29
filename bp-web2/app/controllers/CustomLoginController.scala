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

//import controllers.Actions.Implicits._
import play.api.Play.current
import play.api.i18n.Messages.Implicits._

/*
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
*/



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


object CustomRegistration {

  def handleObserver(email: String, host: String, hash_code: String, lang: Lang = Lang("en", "US")) = {
    // val mail = use[MailerPlugin].email
    //          mail.setSubject("You added as observer | Minority App")
    //          mail.setCc(email)
    //          mail.setFrom("app@minorityapp.com")
    //          mail.sendHtml(views.html.mailer.ObserverAdd.render(email, host, hash_code).body)
  }

  def handleStartSignUp(email: String, host: String) = {

          // check if there is already an account for this email address
          AccountsDAO.findByEmailAndProvider(email, "userpass") match {
            case Some(user) => {
              // user signed up already, send an email offering to login/recover password

              //////  val mail = use[MailerPlugin].email
              //////  mail.setSubject("Employee registration | Minority App")
              //////  mail.setCc(email)
              //////  mail.setFrom("app@minorityapp.com")
              //views.html.mailBody.render(user).body();
              //////val token = securesocial.core.providers.MailToken("XXXX",email, DateTime.now, DateTime.now.plusMinutes(60),false)
              //mail.sendHtml(views.html.mailer.ActorAdd.render(token.email, host).body)
              // SEND WELCOME
              //Mailer.sendAlreadyRegisteredEmail(user)
              play.Logger.info(s"employment registration for email with token token")
              play.Logger.info(s".... INVITE LINK ...")
              play.Logger.info(s"/auth/signup/token")
              play.Logger.info(s".... INVITE LINK ...")
              Future {
              //////    mailers.Mailer.sendInvite(subject = "Invitation as employee",
              //////    emails = List(email),
              //////    invite_link = token.uuid)
              }
            }
            case None => {
              val token = createToken(email, isSignUp = true)
              //original line
              // SEND WELCOME
              //////  val mail = use[MailerPlugin].email
              //////  mail.setSubject("Employee registration | Minority App")
              //////  mail.setCc(email)
              //////  mail.setFrom("app@minorityapp.com")
              //views.html.mailBody.render(user).body();
              //mail.sendHtml(views.html.mailer.ActorAdd.render(token._1, host).body)
              play.Logger.info(s"employment arleady defined registration for email !!!!!")
              play.Logger.info(s".... PLEASE STANBY ...")
              //play.Logger.info(s"/auth/signup/$token")
              play.Logger.info(s".... PLEASE STANBY ...")
              //Future {
              //    mailers.Mailer.sendInvite(subject = "Invitation as employee",
              //    emails = List(email),
              //    invite_link = token._2.uuid)
              //}
              //Mailer.sendAlreadyRegisteredEmail(user)
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







/*

class CustomProviderController @Inject() (implicit override val env: RuntimeEnvironment) extends securesocial.controllers.BaseProviderController {
  import BaseRegistrationMsgs._
  import play.api.Play
  import play.api.Play.current
  import play.api.i18n.Messages
  import play.api.mvc._
  import com.mohiva.play.silhouette.api.{ Environment, LogoutEvent, Silhouette }
import com.mohiva.play.silhouette.impl.authenticators.CookieAuthenticator
import com.mohiva.play.silhouette.impl.providers.SocialProviderRegistry
import forms._
import models.User2
import play.api.i18n.MessagesApi
import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits.global
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
    // AccountLoggerDAO.pull_object(AccountLogger(None, ip, agent, email))
  }
  private def handleAuth(provider: String, redirectTo: Option[String]) = UserAwareAction.async { implicit request =>
    import scala.concurrent.ExecutionContext.Implicits.global
    println("handle auth")
    val authenticationFlow = request.identity.isEmpty
    val modifiedSession = overrideOriginalUrl(request.session, redirectTo)
         logAuth(request.remoteAddress, request.headers.get("User-Agent").getOrElse(""), None)
    if (!authenticationFlow) {
         logAuth(request.remoteAddress, request.headers.get("User-Agent").getOrElse(""), Some(request.identity.get.toString) ) // .main.email)
    }

    env.providers.get(provider).map {
      _.authenticate().flatMap {
        case denied: AuthenticationResult.AccessDenied => {
          logger.error("access denied")
          Future.successful(Redirect(env.routes.loginPageUrl).flashing("error" -> Messages("securesocial.login.accessDenied")))
        }
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
            request.identity match {
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
          logger.error("Unable to log user in. Please try again later. Now we solving this error. ", e)
          Redirect(env.routes.loginPageUrl).flashing("error" -> Messages("securesocial.login.errorLoggingIn"))
      }
    } getOrElse {
      Future.successful(NotFound)
    }
  }


}

class CustomRegistrationController @Inject() (implicit override val env: RuntimeEnvironment) extends BaseRegistration {
  import BaseRegistrationMsgs._
  import play.filters.csrf._

    override def handleStartSignUp = CSRFCheck {
    Action.async {
      implicit request =>
        startForm.bindFromRequest.fold(
          errors => {
            Future.successful(BadRequest(env.viewTemplates.getStartSignUpPage(errors)))
          },
          e => {
            val email = e.toLowerCase
            // check if there is already an account for this email address
            env.userService.findByEmailAndProvider(email, UsernamePasswordProvider.UsernamePassword).map {
              maybeUser =>
                maybeUser match {
                  case Some(user) =>
                    // user signed up already, send an email offering to login/recover password
                    env.mailer.sendAlreadyRegisteredEmail(user)
                  case None => {
                    TokensDAO.findTokenByEmail(email) match {

                      case Some(token) => ///// mailers.Mailer.sendInvite(subject = "Minority Platform Invite",emails = List(email), token.uuid)
                                          play.api.Logger.debug("Token sended")
                                          play.api.Logger.debug(token.uuid)
                      case None => {
                        createToken(email, isSignUp = true).flatMap { token =>
                          //// mailers.Mailer.sendInvite(subject = "Minority Platform Invite", emails = List(email), token.uuid)
                          play.api.Logger.debug("Token created")
                          play.api.Logger.debug(token.uuid)
                        env.userService.saveToken(token)
                        }
                      }

                    }
                  }
                }
                handleStartResult().flashing(Success -> Messages(ThankYouCheckEmail), Email -> email)
            }
          }
        )
    }
  }

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
                AccountInfosDAOF.await(AccountInfosDAOF.updateCurrentWorkbenchForHead(uid = toSave.email.get))
                if (UsernamePasswordProvider.sendWelcomeEmail)
                  play.api.Logger.debug("sendWelcomeEmail to")
                  play.api.Logger.debug(newUser.userId)
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

*/
