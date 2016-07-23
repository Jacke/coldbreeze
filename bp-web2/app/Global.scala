//package a.bug
import play.api.GlobalSettings
import play.api.mvc.WithFilters
import play.filters.gzip.GzipFilter
import java.lang.reflect.Constructor
//import controllers.plugin._
import controllers.Default
import play.api.Logger
import play.api.mvc.{RequestHeader, Filter, Result}
import scala.concurrent._
import play.api._
import play.api.mvc._
import play.api.mvc.Results._
import play.api.mvc.Results.Redirect
import play.api.mvc.WithFilters

//import controllers.CustomRoutesService

import java.lang.reflect.Constructor

class AccessLoggingFilter(implicit val mat: akka.stream.Materializer) extends Filter {
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

object Global extends play.api.GlobalSettings {



}




case class AccessLog()(implicit val mat: akka.stream.Materializer)  extends Filter {

  def apply(f: (RequestHeader) => Future[Result])(request: RequestHeader): Future[Result] = {
    val msg = s"method=${request.method} uri=${request.uri} remote-address=${request.remoteAddress} " +
      s"domain=${request.domain} query-string=${request.rawQueryString} " +
      s"referrer=${request.headers.get("referer").getOrElse("N/A")} " +
      s"user-agent=[${request.headers.get("user-agent").getOrElse("N/A")}]"
    // UNCOMMENT THIS play.Logger.of("accesslog").info(msg)
    //play.Logger.info(msg)
    f(request)
  }
}
