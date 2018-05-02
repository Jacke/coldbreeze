package glob

import play.api.GlobalSettings
import play.api.mvc.WithFilters
import play.filters.gzip.GzipFilter

import java.lang.reflect.Constructor
import controllers.Default
import play.api.mvc.{RequestHeader, Filter, Result}
import scala.concurrent._
import play.api._
import play.api.mvc._
import play.api.mvc.Results._
import play.api.mvc.Results.Redirect
import play.api.mvc.WithFilters
import com.google.inject.Guice
import com.mohiva.play.silhouette.api.{ Logger, SecuredSettings }
import play.api.GlobalSettings
import utils.di.SilhouetteModule

import controllers.routes
import play.api.GlobalSettings
import play.api.i18n.{ Lang, Messages }
import play.api.mvc.Results._
import play.api.mvc.{ RequestHeader, Result }
import play.api.i18n.{Messages, Lang}
import play.api.mvc.Results._
import play.api.GlobalSettings
import play.api.mvc.{Result, RequestHeader}
import scala.concurrent.Future
import controllers.routes

import scala.concurrent.Future

object AccessLoggingFilter extends Filter {
  def apply(next: (RequestHeader) => Future[Result])(request: RequestHeader): Future[Result] = {
    val result = next(request)
    val msg = s"method=${request.method} uri=${request.uri} remote-address=${request.remoteAddress} " +
      s"domain=${request.domain} query-string=${request.rawQueryString} " +
      s"referrer=${request.headers.get("referer").getOrElse("N/A")} " +
      s"user-agent=[${request.headers.get("user-agent").getOrElse("N/A")}]"
    play.Logger.of("accesslog").info(msg)
    result
  }
}
 
object Global extends WithFilters(new GzipFilter(shouldGzip =
  (request, response) => {
    val contentType = response.headers.get("Content-Type")
    contentType.exists(_.startsWith("text/html")) || request.path.endsWith("jsroutes.js")
  }
)) with Global {


  
  /**
   * Service pages
   */
   // called when a route is found, but it was not possible to bind the request parameters
    //override def onBadRequest(request: RequestHeader, error: String) = {
    //  BadRequest("Bad Request: " + error)
    //} 
   
    // 500 - internal server error
    //override def onError(request: RequestHeader, throwable: Throwable) = {
    //  InternalServerError(views.html.errors.onError(throwable))
    //}
   
    // 404 - page not found error
    override def onHandlerNotFound(request: RequestHeader) = {
      Future.successful(NotFound("Not found"))
    }
}


trait Global extends GlobalSettings with Logger { //with SecuredSettings 

  /**
   * The Guice dependencies injector.
   */
  val injector = Guice.createInjector(new SilhouetteModule)

  /**
   * Loads the controller classes with the Guice injector,
   * in order to be able to inject dependencies directly into the controller.
   *
   * @param controllerClass The controller class to instantiate.
   * @return The instance of the controller class.
   * @throws Exception if the controller couldn't be instantiated.
   */
  override def getControllerInstance[A](controllerClass: Class[A]) = injector.getInstance(controllerClass)

  /**
   * Called when a user is not authenticated.
   *
   * As defined by RFC 2616, the status code of the response should be 401 Unauthorized.
   *
   * @param request The request header.
   * @param lang The currently selected language.
   * @return The result to send to the client.
   */
  override def onNotAuthenticated(request: RequestHeader, lang: Lang): Option[Future[Result]] = {
    Some(Future.successful(Redirect(routes.ApplicationController.signIn)))
  }

  /**
   * Called when a user is authenticated but not authorized.
   *
   * As defined by RFC 2616, the status code of the response should be 403 Forbidden.
   *
   * @param request The request header.
   * @param lang The currently selected language.
   * @return The result to send to the client.
   */
  override def onNotAuthorized(request: RequestHeader, lang: Lang): Option[Future[Result]] = {
    Some(Future.successful(Redirect(routes.ApplicationController.signIn).flashing("error" -> Messages("access.denied"))))
  }
}

import com.novus.salat.{TypeHintFrequency, StringTypeHintStrategy, Context}
import play.api.Play
import play.api.Play.current

object mongoContext {
  implicit val context = {
    val context = new Context {
      val name = "global"
      override val typeHintStrategy = StringTypeHintStrategy(when = TypeHintFrequency.WhenNecessary, typeHint = "_t")
    }
    context.registerGlobalKeyOverride(remapThis = "id", toThisInstead = "_id")
    context.registerClassLoader(Play.classloader)
    context
  }
}