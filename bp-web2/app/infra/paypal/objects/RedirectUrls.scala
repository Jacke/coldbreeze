package infra.paypal.objects

import play.api.libs.json.Json

/**
 *        This object represents a set of redirect URLs you provide to PayPal for PayPal account payments.
 *
 * @param return_url	string	The payer is redirected to this URL after approving the payment. Required for PayPal account payments.
 * @param cancel_url	string	The payer is redirected to this URL after canceling the payment. Required for PayPal account payments.
 */
case class RedirectUrls(return_url: Option[String], cancel_url: Option[String])

object RedirectUrls {
  implicit val format = Json.format[RedirectUrls]
}