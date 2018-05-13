package infra.paypal.objects

import org.joda.time.DateTime
import play.api.libs.json.Json
import infra.paypal.format.{EnumFormat, DateTimeFormat}

/**
 *        This object defines an authorization object.
 *
 * @param amount	amount object	Amount being authorized.
 * @param create_time	date_time	Time of authorization as defined in RFC 3339 Section 5.6. Assigned in response.
 * @param update_time	date_time	Time that the resource was last updated. Assigned in response.
 * @param state	enum	State of the authorization. Either pending, authorized, captured, partially_captured, expired, or voided. Assigned in response.
 * @param parent_payment	string	ID of the payment resource on which this transaction is based. Assigned in response.
 * @param id	string	ID of the authorization transaction. Assigned in response.
 * @param valid_until	date_time	AuthorizationB expiration time and date as defined in RFC 3339 Section 5.6. Assigned in response.
 * @param links	array of links objects	HATEOAS links related to this request. Assigned in response.
 */
case class AuthorizationB(
                          amount: Option[Amount] = None,
                          create_time: Option[DateTime] = None,
                          update_time: Option[DateTime] = None,
                          state: Option[AuthorizationState.Value] = None,
                          parent_payment: Option[String] = None,
                          id: Option[String] = None,
                          valid_until: Option[DateTime] = None,
                          links: Option[Seq[HateoasLink]] = None
                          )  extends RelatedResource

object AuthorizationState extends Enumeration with EnumFormat {
  val Voided = Value("voided")
  val Expired = Value("expired")
  val PartiallyCaptured = Value("partially_captured")
  val Captured = Value("captured")
  val Authorized = Value("authorized")
  val Pending = Value("pending")

  implicit val format = valueFormat
}

object AuthorizationB {
  implicit private val df = DateTimeFormat.ZDateTimeReads

  implicit val format = Json.format[AuthorizationB]

  case class Capture(amount: Amount, is_final_capture: Boolean = false)

  implicit val cf = Json.format[Capture]

  case class Reauthorize(amount: Amount)

  implicit val rf = Json.format[Reauthorize]
}