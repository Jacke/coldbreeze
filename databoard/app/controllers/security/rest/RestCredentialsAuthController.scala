package controllers.security.rest

import utils.responses.rest._
import models.services._
import play.api.mvc._
import play.api.libs.json._
import play.api.libs.concurrent.Execution.Implicits._
import com.mohiva.play.silhouette.api._
import com.mohiva.play.silhouette.api.exceptions.ConfigurationException
import com.mohiva.play.silhouette.api.services.AuthInfoService
import com.mohiva.play.silhouette.api.util.PasswordHasher
import com.mohiva.play.silhouette.impl.providers.CredentialsProvider
import com.mohiva.play.silhouette.impl.authenticators.JWTAuthenticator
import com.mohiva.play.silhouette.impl.exceptions.IdentityNotFoundException
import com.mohiva.play.silhouette.api.Silhouette
import com.mohiva.play.silhouette.api.util.Credentials
import modules.cake.HeaderEnvironmentModule
import scala.concurrent.{ Future }
import security.models._
import models._
/**
 * This controller manage authentication of an user by identifier and password
 */
class RestCredentialsAuthController extends Silhouette[User2, JWTAuthenticator]
  with HeaderEnvironmentModule {
  implicit val restCredentialFormat = security.formatters.json.CredentialFormat.restFormat
  /**
   * Authenticates a user against the credentials provider.
   *
   * receive json like this:
   * {
   * 	"identifier": "...",
   *  	"password": "..."
   * }
   *
   * @return The result to display.
   */
  def authenticate = Action.async(parse.json[Credentials]) { implicit request =>
    println("UserServiceImpl.users")
    models.services.UserServiceImpl.users.map { u => println(u) }
    println("UserServiceImpl2.users2")
    models.services.UserServiceImpl2.users2.map { u => println(u) }

    println(env.providers)
    println(env.providers.get(CredentialsProvider.ID))

    (env.providers.get(CredentialsProvider.ID) match {
      case Some(p: CredentialsProvider) => { 
        println(request.body)
        println(p)
        p.authenticate(request.body)

      }
      case _ => {
          println("Cannot find credentials provider")
         Future.failed(new ConfigurationException(s"Cannot find credentials provider"))
      }
    }).flatMap { loginInfo =>
      println("retriving from controller")
      userService.retrieve(loginInfo).flatMap {
        case Some(user) => env.authenticatorService.create(user.loginInfo).flatMap { authenticator =>
          env.eventBus.publish(LoginEvent(user, request, request2lang))
          env.authenticatorService.init(authenticator).flatMap { token =>
            env.authenticatorService.embed(token, Future.successful {
              Ok(Json.toJson(Token(token = token, expiresOn = authenticator.expirationDate)))
            })
          }
        }
        case None => {
          println("user not found")
          Future.failed(new IdentityNotFoundException("Couldn't find user"))
          }
      }
    }.recoverWith(exceptionHandler)
  }
}
object RestCredentialsAuthController extends RestCredentialsAuthController

