package infra.paypal.objects

import play.api.libs.json.Json
import infra.paypal.format.EnumFormat


/**
 *
 *        This object includes information about the payer including payment method, funding instruments, and details about the payer.
 *
 * @param payment_method	string	Payment method used. Must be either credit_card or paypal. Required.
 * @param funding_instruments	array of funding_instrument objects	A list of funding instruments for the current payment
 * @param payer_info	payer_info	Information related to the payer.
 */
case class Payer(
                  payment_method: Option[PaymentMethod.Value],
                  funding_instruments: Option[Seq[FundingInstrument]] = None,
                  payer_info: Option[PayerInfo] = None)

object PaymentMethod extends Enumeration with EnumFormat {
  val CreditCard = Value("credit_card")
  val Paypal = Value("paypal")

  implicit val format = valueFormat
}

object Payer {
  implicit val format = Json.format[Payer]
}