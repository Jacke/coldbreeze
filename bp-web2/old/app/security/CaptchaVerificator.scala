package security

import scala.concurrent.ExecutionContext.Implicits.global
import play.api.Play.current

import scala.concurrent.duration.Duration
import scala.concurrent.{ExecutionContext, Awaitable, Await, Future}
import scala.util.Try
import play.api.libs.ws._
import play.api.libs.ws.ning.NingAsyncHttpClientConfigBuilder

object CaptchaVerificator {
  val URL = "https://www.google.com/recaptcha/api/siteverify"

  val SECRET = "6LcuuyUTAAAAAJckp8o6LEii5STsLeJvwVigueKb"

  /**
   * @param response from client-side recaptcha verification
   * @return boolean Result of verification
   */
  def verify(response: String):Future[Boolean] = {
    WS.url(URL).post(Map("response" -> Seq(response), "secret" -> Seq(SECRET))).map { response =>
          val res = response.json
          (res \ "success").as[Boolean] 
        }.recover{ case c => {
          println(c)
          false
        }
      }
  }
}