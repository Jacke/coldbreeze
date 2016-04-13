package utils

import javax.inject.Inject

import com.mohiva.play.silhouette.api.SecuredErrorHandler
import controllers.routes
import play.api.http.DefaultHttpErrorHandler
import play.api.i18n.Messages
import play.api.mvc.Results._
import play.api.mvc.{ Result, RequestHeader }
import play.api.routing.Router
import play.api.{ OptionalSourceMapper, Configuration }

import scala.concurrent.Future

/**
 * A secured error handler.
 */
class ErrorHandler @Inject() (
  env: play.api.Environment,
  config: Configuration,
  sourceMapper: OptionalSourceMapper,
  router: javax.inject.Provider[Router])
  extends DefaultHttpErrorHandler(env, config, sourceMapper, router)
  with SecuredErrorHandler {

  /**
   * Called when a user is not authenticated.
   *
   * As defined by RFC 2616, the status code of the response should be 401 Unauthorized.
   *
   * @param request The request header.
   * @param messages The messages for the current language.
   * @return The result to send to the client.
   */
  override def onNotAuthenticated(request: RequestHeader, messages: Messages): Option[Future[Result]] = {
    println(request.uri)
    if (isJsonRequest(request)) {
      Some(Future.successful(Ok(jsonNotAuthorized)))
    } else {
      Some(Future.successful(Redirect(routes.ApplicationController2.signIn())))
    }
  }

  /**
   * Called when a user is authenticated but not authorized.
   *
   * As defined by RFC 2616, the status code of the response should be 403 Forbidden.
   *
   * @param request The request header.
   * @param messages The messages for the current language.
   * @return The result to send to the client.
   */
  override def onNotAuthorized(request: RequestHeader, messages: Messages): Option[Future[Result]] = {
    println(request.uri)
    if (isJsonRequest(request)) {
      Some(Future.successful(Ok(jsonNotAuthorized)))
    } else {
      Some(Future.successful(Redirect(routes.ApplicationController2.signIn()).flashing("error" -> Messages("access.denied")(messages))))
    }
  }



  //override def onClientError(request: RequestHeader, statusCode: Int, message: String) = {
  //  statusCode match {
  //      case Status.NOT_FOUND => Future.successful(
  //           NotFound(views.html.auth.msg404("Not found", request)) )
  //      case _ => Future.successful(Status(statusCode)("A client error occurred: " + message) )
  //  }
  // }

  override def onServerError(request: RequestHeader, exception: Throwable) = {
     Future.successful(
       InternalServerError(views.html.auth.msg400("", Some(exception)))
     )
   }



  private def isJsonRequest(request: RequestHeader):Boolean = {
    request.contentType.isDefined && request.contentType.get == "application/json"
  }
  private def jsonNotAuthorized:String = {
    """{"errors":[{"message":"Not authorized access","code":1488}]}"""
  }
}
