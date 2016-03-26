package controllers

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
import models.User2
import play.api.i18n.MessagesApi
import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits.global

/**
 * The basic application controller.
 *
 * @param messagesApi The Play messages API.
 * @param env The Silhouette environment.
 * @param socialProviderRegistry The social provider registry.
 */
class ApplicationController2 @Inject() (
  val messagesApi: MessagesApi,
  val env: Environment[User2, CookieAuthenticator],
  socialProviderRegistry: SocialProviderRegistry)
  extends Silhouette[User2, CookieAuthenticator] {








/**
 * Handles the Sign In action.
 *
 * @return The result to display.
 */
def signIn = UserAwareAction.async { implicit request =>
  request.identity match {
    case Some(user) => Future.successful(Redirect(routes.ProfileController.dashboard()))
    case None => Future.successful(Ok(views.html.auth.signIn(SignInForm.form, socialProviderRegistry)))
  }
}

/**
 * Handles the Sign Up action.
 *
 * @return The result to display.
 */
def signUp = UserAwareAction.async { implicit request =>
  request.identity match {
    case Some(user) => Future.successful(Redirect(routes.ProfileController.dashboard()))
    case None => Future.successful(Ok(views.html.auth.signUp(SignUpForm.form)))
  }
}

/**
 * Handles the Sign Out action.
 *
 * @return The result to display.
 */
def signOut = SecuredAction.async { implicit request =>
  val result = Redirect(routes.ProfileController.dashboard())
  env.eventBus.publish(LogoutEvent(request.identity, request, request2Messages))
  env.authenticatorService.discard(request.authenticator, result)
}
}
