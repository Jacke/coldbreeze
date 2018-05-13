package infra.paypal

import play.api.libs.ws.WS
import java.net.URLDecoder
import scala.concurrent.ExecutionContext

/**
 * @see https://developer.paypal.com/webapps/developer/docs/classic/mass-pay/gs_MassPay/
 */
object MassPay {
  private def user(implicit app: play.api.Application) = app.configuration.getString("paypal.out.user").get
  private def pwd(implicit app: play.api.Application) = app.configuration.getString("paypal.out.pwd").get
  private def signature(implicit app: play.api.Application) = app.configuration.getString("paypal.out.signature").get
  private def endpoint(implicit app: play.api.Application) = app.configuration.getString("paypal.out.endPoint").get

  def send(email: String, amount: BigDecimal, currency: String)(implicit app: play.api.Application, ec: ExecutionContext) = {

    val body = Seq(
    "USER="+user,
    "PWD="+pwd,
    "SIGNATURE="+signature,
    "&METHOD=MassPay",
    "&VERSION=90",
    "&RECEIVERTYPE=EmailAddress",
    "&CURRENCYCODE="+currency,
    "&L_EMAIL0="+email,
    "&L_AMT0="+decToStr(amount)
    )

    WS.url(endpoint + "?" + body.mkString("&")).get().map {resp =>
      resp.body.split('&').map{
        trm =>
          val a = trm.split('=')
          a(0) -> URLDecoder.decode( a(1), "UTF-8" )
      }.toMap
    }
  }
}
