package infra.paypal.objects

import org.joda.time.DateTime
import play.api.libs.json.Json
import infra.paypal.format.{EnumFormat, DateTimeFormat}

/**
 *        This object defines a refund object
 *
 * @param id	string	ID of the refund transaction. 17 characters max.
 * @param amount	amount	Details including both refunded amount (to payer) and refunded fee (to payee). 10 characters max.
 * @param create_time	date_time	Time of refund as defined in RFC 3339 Section 5.6 Assigned in response.
 * @param state	string	State of the refund. One of the following: pending; completed; or failed. Assigned in response.
 * @param sale_id	string	ID of the sale transaction being refunded. Assigned in response.
 * @param parent_payment	string	ID of the payment resource on which this transaction is based. Assigned in response.
 * @param update_time	date_time	Time that the resource was last updated. Assigned in response.
 */
case class Refund(
                   id: String,
                   amount: Amount,
                   create_time: Option[DateTime] = None,
                   state: Option[RefundState.Value] = None,
                   sale_id: Option[String] = None,
                   parent_payment: Option[String],
                   update_time: Option[DateTime]
                   )  extends RelatedResource


object RefundState extends Enumeration with EnumFormat {
  val Completed = Value("completed")
  val Failed = Value("failed")
  val Pending = Value("pending")

  implicit val format = valueFormat
}

object Refund {
  implicit private val df = DateTimeFormat.ZDateTimeReads

  implicit val format = Json.format[Refund]
}