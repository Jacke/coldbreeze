package infra.paypal.objects

import org.joda.time.DateTime
import play.api.libs.json.Json
import infra.paypal.format.DateTimeFormat

/**
 *        This object defines a capture object.
 *
 * @param amount	amount object	Amount being captured. If the amount matches the orginally authorized amount, the state of the authorization changes to captured. If not, the state of the authorization changes to partially_captured. Alternatively, you can set the is_final_capture to true to indicate a final capture.
 * @param is_final_capture	boolean	If set to true, all remaining funds held by the authorization will be released in the funding instrument. Default is ‘false’.
 * @param create_time	date_time	Time of capture as defined in RFC 3339 Section 5.6. Assigned in response.
 * @param update_time	date_time	Time that the resource was last updated. Assigned in response.
 * @param state	enum	State of the sale. Either pending, completed, refunded, or partially_refunded. Assigned in response.
 * @param parent_payment	string	ID of the payment resource on which this transaction is based. Assigned in response.
 * @param id	string	ID of the capture transaction. Assigned in response.
 * @param links	array of links objects	HATEOAS links related to this request. Assigned in response.
 */
case class Capture(amount: Amount,
                   is_final_capture: Option[Boolean] = None,
                   create_time: Option[DateTime] = None,
                   update_time: Option[DateTime] = None,
                   state: Option[SaleState.Value] = None,
                   parent_payment: Option[String] = None,
                   id: Option[String] = None,
                   links: Option[Seq[HateoasLink]] = None
                    ) extends RelatedResource


object Capture {
  implicit private val df = DateTimeFormat.ZDateTimeReads

  implicit val format = Json.format[Capture]
}
