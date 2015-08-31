package a.bug

import play.api.GlobalSettings
import play.api.mvc.WithFilters
import play.filters.gzip.GzipFilter

import controllers.CustomRoutesService
import java.lang.reflect.Constructor
import securesocial.core.RuntimeEnvironment
import service.{DemoUser, MyEventListener, InMemoryUserService}
import controllers.plugin._
import scaldi.play.ScaldiSupport
import controllers.Default
import play.api.Logger
import play.api.mvc.{SimpleResult, RequestHeader, Filter, Result}
import scala.concurrent._
import play.api._
import play.api.mvc._
import play.api.mvc.Results._
import play.api.mvc.Results.Redirect
import play.api.mvc.WithFilters
import com.mohiva.play.htmlcompressor.HTMLCompressorFilter

object AccessLoggingFilter extends Filter {
  def apply(next: (RequestHeader) => Future[Result])(request: RequestHeader): Future[Result] = {
    val result = next(request)
    val msg = s"method=${request.method} uri=${request.uri} remote-address=${request.remoteAddress} " +
      s"domain=${request.domain} query-string=${request.rawQueryString} " +
      s"referrer=${request.headers.get("referer").getOrElse("N/A")} " +
      s"user-agent=[${request.headers.get("user-agent").getOrElse("N/A")}]"
    //play.Logger.of("accesslog").info(msg)
    result
  }
}
 
object Global extends WithFilters(new GzipFilter(shouldGzip =
  (request, response) => {
    val contentType = response.headers.get("Content-Type")
    contentType.exists(_.startsWith("text/html")) || request.path.endsWith("jsroutes.js")
  }
), CORSFilter(), AccessLog(), AccessLoggingFilter, HTMLCompressorFilter()) with play.api.GlobalSettings {

  /**
   * The runtime environment for this sample app.
   */
  object MyRuntimeEnvironment extends RuntimeEnvironment.Default[DemoUser] {
    override lazy val routes = new CustomRoutesService()
    override lazy val viewTemplates = ViewTemplates1.Default(this)
    override lazy val userService: InMemoryUserService = new InMemoryUserService()
    override lazy val eventListeners = List(new MyEventListener())
  }

  
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
      Future.successful(NotFound(views.html.custom.msg404("", request)))
    }



  /**
   * An implementation that checks if the controller expects a RuntimeEnvironment and
   * passes the instance to it if required.
   *
   * This can be replaced by any DI framework to inject it differently.
   *
   * @param controllerClass
   * @tparam A
   * @return
   */
  override def getControllerInstance[A](controllerClass: Class[A]): A = {
    val instance  = controllerClass.getConstructors.find { c =>
      val params = c.getParameterTypes
      params.length == 1 && params(0) == classOf[RuntimeEnvironment[DemoUser]]
    }.map {
      _.asInstanceOf[Constructor[A]].newInstance(MyRuntimeEnvironment)
    }
    instance.getOrElse(super.getControllerInstance(controllerClass))
  }
}

case class AccessLog() extends Filter {

  def apply(f: (RequestHeader) => Future[SimpleResult])(request: RequestHeader): Future[SimpleResult] = {
    val msg = s"method=${request.method} uri=${request.uri} remote-address=${request.remoteAddress} " +
      s"domain=${request.domain} query-string=${request.rawQueryString} " +
      s"referrer=${request.headers.get("referer").getOrElse("N/A")} " +
      s"user-agent=[${request.headers.get("user-agent").getOrElse("N/A")}]"
    // UNCOMMENT THIS play.Logger.of("accesslog").info(msg)
    //play.Logger.info(msg)
    f(request)
  }
}