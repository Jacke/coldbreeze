package infra.paypal.objects

import play.api.libs.json.{JsString, Writes, Json}

/**
 *        This object defines a amount object
 *
 * @param currency	string	3-letter currency code. PayPal does not support all currencies. Required.
 * @param total	string	Total amount charged from the payer to the payee. In case of a refund, this is the refunded amount to the original payer from the payee. 10 characters max with support for 2 decimal places. Required.
 * @param details	details	Additional details related to a payment amount.
 */
case class Amount(currency: String, total: BigDecimal, details: Option[Details] = None)


object Amount {
  implicit val wbd = infra.paypal.Implicits.writesBigDecimal

  implicit val format = Json.format[Amount]


}
