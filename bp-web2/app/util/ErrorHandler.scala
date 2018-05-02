package utils

import javax.inject.Inject

import com.mohiva.play.silhouette.api.actions.SecuredErrorHandler
import controllers.routes
import play.api.http.DefaultHttpErrorHandler
import play.api.i18n.Messages
import play.api.mvc.Results._
import play.api.mvc.{ Result, RequestHeader }
import play.api.routing.Router
import play.api.{ OptionalSourceMapper, Configuration }
import play.api.Logger

import scala.concurrent.Future

/**
 * A secured error handler.
 */
class ErrorHandler @Inject() (
  env: play.api.Environment,
  config: Configuration,
  sourceMapper: OptionalSourceMapper,
  router: javax.inject.Provider[Router])
  extends DefaultHttpErrorHandler(env, config, sourceMapper, router) {




  override def onClientError(request: RequestHeader, statusCode: Int, message: String) = {
    statusCode match {
        case 404 => Future.successful(
          //   NotFound(views.html.auth.msg404("Not found", request))
          Status(statusCode)(views.html.auth.msg404("Not found "+message, request))
           )
        case _ => Future.successful(Status(statusCode)("A client error occurred: " + message) )
    }
   }

  override def onServerError(request: RequestHeader, exception: Throwable) = {
    Logger.error("Server error", exception)
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
