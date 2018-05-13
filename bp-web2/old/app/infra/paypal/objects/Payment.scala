package infra.paypal.objects

import org.joda.time.DateTime
import play.api.libs.json.Json
import infra.paypal.format.{EnumFormat, DateTimeFormat}

/**
 *
 *        This object represents a payer’s funding instrument, such as a credit card or token that represents a credit card.
 *
 * @param intent	string	Payment intent; Must be set to sale currently. Required.
 * @param payer	payer	Source of the funds for this payment represented by a PayPal account or a direct credit card. Required.
 * @param transactions	array of transaction objects	Transactional details including the amount and item details. Required.
 * @param redirect_urls	redirect_urls	Set of redirect URLs you provide only for PayPal-based payments. Required for PayPal payments.
 * @param id	string	ID of the created payment Assigned in response.
 * @param create_time	date_time	Payment creation time as defined in RFC 3339 Section 5.6. Assigned in response.
 * @param state	string	Payment state. Must be one of the following: created; approved; failed; pending; canceled; or expired. Assigned in response.
 * @param update_time	date_time	Time that the resource was last updated. Assigned in response.
 */
case class Payment(
                    intent: Intent.Value,
                    payer: Payer,
                    transactions: Seq[Transaction],
                    redirect_urls: Option[RedirectUrls] = None,
                    id: Option[String] = None,
                    create_time: Option[DateTime] = None,
                    state: Option[PaymentState.Value] = None,
                    update_time: Option[DateTime] = None,
                    links: Option[Seq[HateoasLink]] = None
                    )


object PaymentState extends Enumeration with EnumFormat {
  val Created = Value("created")
  val Approved = Value("approved")
  val Failed = Value("failed")
  val Pending = Value("pending")
  val Canceled = Value("canceled")
  val Expired = Value("expired")

  implicit val format = valueFormat
}


object Intent extends Enumeration with EnumFormat {
  val Sale = Value("sale")
  val Authorize = Value("authorize")

  implicit val format = valueFormat
}

object Payment {
  implicit private val df = DateTimeFormat.ZDateTimeReads

  implicit val format = Json.format[Payment]

  case class Execute(payer_id: String, transactions: Option[Seq[Amount]] = None)

  implicit val execFormat = Json.format[Execute]
}
