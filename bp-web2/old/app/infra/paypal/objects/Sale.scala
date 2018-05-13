package infra.paypal.objects

import org.joda.time.DateTime
import play.api.libs.json.Json
import infra.paypal.format.{EnumFormat, DateTimeFormat}

/**
 *        This object defines a sale object.
 *
 * @param id	string	ID of the sale transaction.
 * @param amount	amount	Details about the collected amount.
 * @param description	string	Description of sale.
 * @param create_time	date_time	Time of sale as defined in RFC 3339 Section 5.6 Assigned in response.
 * @param state	string	State of the sale. One of the following: pending; completed; refunded; or partially_refunded. Assigned in response.
 * @param sale_id	string	ID of the sale transaction being refunded. Assigned in response.
 * @param parent_payment	string	ID of the payment resource on which this transaction is based. Assigned in response.
 * @param update_time	date_time	Time that the resource was last updated. Assigned in response.
 */
case class Sale(
                 id: String,
                 amount: Amount,
                 description: String,
                 create_time: Option[DateTime] = None,
                 state: Option[SaleState.Value] = None,
                 sale_id: Option[String] = None,
                 parent_payment: Option[String] = None,
                 update_time: Option[DateTime] = None
                 ) extends RelatedResource


object SaleState extends Enumeration with EnumFormat {
  val Completed = Value("completed")
  val Refunded = Value("refunded")
  val PartiallyRefunded = Value("partially_refunded")
  val Pending = Value("pending")

  implicit val format = valueFormat
}

object Sale {
  implicit private val df = DateTimeFormat.ZDateTimeReads

  implicit val format = Json.format[Sale]
}