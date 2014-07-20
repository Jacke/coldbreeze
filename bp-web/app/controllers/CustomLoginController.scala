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

import scala.concurrent.{Await, ExecutionContext, Future}

class CustomLoginController(implicit override val env: RuntimeEnvironment[DemoUser]) extends BaseLoginPage[DemoUser] {
  override def login: Action[AnyContent] = {
    Logger.debug("using CustomLoginController")
    super.login
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