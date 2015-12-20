package a.bug

import controllers.Default
import play.api.Logger
import play.api.mvc.{Result, RequestHeader, Filter}
 
case class CORSFilter() extends Filter{
import scala.concurrent._
import ExecutionContext.Implicits.global
lazy val allowedDomain = play.api.Play.current.configuration.getString("cors.allowed.domain")

  def isPreFlight(r: RequestHeader) =(
        r.method.toLowerCase.equals("options")
        &&
        r.headers.get("Access-Control-Request-Method").nonEmpty
        )
     
  def apply(f: (RequestHeader) => Future[Result])(request: RequestHeader): Future[Result] = {
        Logger.trace("[cors] filtering request to add cors")
      if (isPreFlight(request)) {
            Logger.trace("[cors] request is preflight")
            Logger.trace(s"[cors] default allowed domain is $allowedDomain")
            Future.successful(Default.Ok.withHeaders(
            "Access-Control-Allow-Origin" -> allowedDomain.orElse(request.headers.get("Origin")).getOrElse(""),
            "Access-Control-Allow-Methods" -> request.headers.get("Access-Control-Request-Method").getOrElse("*"),
            "Access-Control-Allow-Headers" -> request.headers.get("Access-Control-Request-Headers").getOrElse(""),
            "Access-Control-Allow-Credentials" -> "true"
        ))
      } else {
            Logger.trace("[cors] request is normal")
            Logger.trace(s"[cors] default allowed domain is $allowedDomain")
            f(request).map{_.withHeaders(
            "Access-Control-Allow-Origin" -> allowedDomain.orElse(request.headers.get("Origin")).getOrElse(""),
            "Access-Control-Allow-Methods" -> request.headers.get("Access-Control-Request-Method").getOrElse("*"),
            "Access-Control-Allow-Headers" -> request.headers.get("Access-Control-Request-Headers").getOrElse(""),
            "Access-Control-Allow-Credentials" -> "true"
            )}
        }
    }
}


import play.api.cache._
import play.api._
import play.api.mvc._
import play.api.libs.iteratee.{ Iteratee, Done }
import play.api.http.HeaderNames.{ IF_NONE_MATCH, ETAG, EXPIRES }
import play.api.mvc.Results.NotModified
//import play.core.Execution.Implicits.internalContext
import java.security.MessageDigest
import scala.concurrent.duration.Duration
import scala.concurrent.{ExecutionContext, Awaitable, Await, Future}
import scala.concurrent.ExecutionContext.Implicits.global
import scala.concurrent.ExecutionContext.Implicits.global._
import play.api.libs.iteratee._
//import play.api.Play.current

/**
 * Cache an action.
 *
 * Uses both server and client caches:
 *
 *  - Adds an `Expires` header to the response, so clients can cache response content ;
 *  - Adds an `Etag` header to the response, so clients can cache response content and ask the server for freshness ;
 *  - Cache the result on the server, so the underlying action is not computed at each call.
 *
 * @param key Compute a key from the request header
 * @param duration Cache duration (in seconds, 0 means eternity)
 * @param action Action to cache
 */
case class Cached2(key: RequestHeader => String, duration: Int)(action: EssentialAction)(implicit app: Application) extends EssentialAction {
  def await[T](a: Awaitable[T])(implicit ec: ExecutionContext) = Await.result(a, Duration.Inf)
 
 private def bodyAsString[A] = Iteratee.fold[A, Array[Byte]](Array.empty[Byte]) { (str, body) =>
    body match {
      //case string: String => str + string
      //case template: Content => str + template.body
      case bytes: Array[Byte] => bytes//str + new String(bytes, charset)
      case _ => throw new Exception("Unexpected body: " + body)
    }
  }

  def apply(request: RequestHeader): Iteratee[Array[Byte], Result] = {

    val resultKey = key(request)
    val etagKey = s"$resultKey-etag"

    // Has the client a version of the resource as fresh as the last one we served?
    val notModified = for {
      requestEtag <- request.headers.get(IF_NONE_MATCH)
      etag <- Cache.getAs[String](etagKey)
      if etag == requestEtag
    } yield Done[Array[Byte], Result](NotModified)

    notModified.getOrElse {
      // Otherwise try to serve the resource from the cache, if it has not yet expired
      Cache.getOrElse(resultKey, duration) {
        // The resource was not in the cache, we have to run the underlying action
        val iterateeResult = action(request)
        val durationMilliseconds = if (duration == 0) 1000 * 60 * 60 * 24 * 365 else duration * 1000 // Set client cache expiration to one year for “eternity” duration
        val expirationDate = http.dateFormat.print(System.currentTimeMillis() + durationMilliseconds)
        // Generate a fresh ETAG for it
        //val etag = expirationDate // Use the expiration date as ETAG
        // Add cache information to the response, so clients can cache its content

        iterateeResult.map { result =>
     //  var md5 = ""    
     //  Result(result.header, result.body &> Enumeratee.map(arrOfBytes => {
     //        val body = new String(arrOfBytes.map(_.toChar))
     //        println(body)
     //        val digest = MessageDigest.getInstance("MD5").digest(arrOfBytes)    
     //        md5 = digest.map("%02x".format(_)).mkString
     //        Cache.set(etagKey, md5, duration) // Cache the new ETAG of the resource
     //  arrOfBytes
     //}), result.connection).withHeaders(ETAG -> md5, EXPIRES -> expirationDate)

await( Iteratee.flatten(result.body.apply(bodyAsString)).run.map { arrOfBytes =>
      val digest = MessageDigest.getInstance("MD5").digest(arrOfBytes)    
             val body = new String(arrOfBytes.map(_.toChar))
             println(body)      
      val md5:String = digest.map("%02x".format(_)).mkString
      println("md5: " + md5)
      Cache.set(etagKey, md5, duration)
      md5 -> Enumerator(arrOfBytes)
    }.map {
      case (md5, content) =>
        result.copy(
          header = result.header.copy(headers = result.header.headers ++ Map(ETAG -> md5, EXPIRES -> expirationDate.toString)),
          body = content//Enumerator.flatten(content)
        )
    })

/*
 private def compressResult(result: Result): Future[Result] = if (isCompressible(result)) {
    Iteratee.flatten(result.body.apply(bodyAsString)).run.map { str =>
      val compressed = compressor.compress(str.trim).getBytes(charset)
      val length = compressed.length
      length -> Enumerator(compressed)
    }.map {
      case (length, content) =>
        result.copy(
          header = result.header.copy(headers = result.header.headers ++ Map(CONTENT_LENGTH -> length.toString)),
          body = Enumerator.flatten(Future.successful(content))
        )
    }
  } else Future.successful(result)
*/

        }
      }
    }
  }

}

object Cached2 {

  /**
   * Cache an action.
   *
   * @param key Compute a key from the request header
   * @param action Action to cache
   */
  def apply(key: RequestHeader => String)(action: EssentialAction)(implicit app: Application): Cached2 = {
    apply(key, duration = 0)(action)
  }

  /**
   * Cache an action.
   *
   * @param key Cache key
   * @param action Action to cache
   */
  def apply(key: String)(action: EssentialAction)(implicit app: Application): Cached2 = {
    apply(key, duration = 0)(action)
  }

  /**
   * Cache an action.
   *
   * @param key Cache key
   * @param duration Cache duration (in seconds)
   * @param action Action to cache
   */
  def apply(key: String, duration: Int)(action: EssentialAction)(implicit app: Application): Cached2 = {
    Cached2(_ => key, duration)(action)
  }

}