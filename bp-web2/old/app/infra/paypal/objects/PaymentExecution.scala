package infra.paypal.objects

import play.api.libs.json.Json

/**
 *        This object includes information necessary to execute a PayPal account payment with the payer_id obtained in the web approval_url.
 *
 * @param payer_id	string	The ID of the Payer, passed in the return_url by PayPal. Required.
 * @param transactions	array of transaction objects	Transactional details including the amount and item details. Required.
 */
case class PaymentExecution(payer_id: String, transactions: Seq[Transaction])

object PaymentExecution {
  implicit val format = Json.format[PaymentExecution]
}
