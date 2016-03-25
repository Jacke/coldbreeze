package infra.paypal.objects

import play.api.libs.json.Json

/**
 *        This object represents an error returned in the response.
 *
 * @param name	string	Human readable, unique name of the error.
 * @param debug_id	string	PayPal internal identifier used for correlation purposes.
 * @param message	string	Message describing the error.
 * @param information_link	string	URI for detailed information related to this error for the developer.
 * @param details	error_details	Additional details of the error.
 */
case class ErrorObject(
                  name: String,
                  debug_id: String,
                  message: String,
                  information_link: String,
                  details: Option[Seq[ErrorDetails]]
                  )


object ErrorObject {
  implicit val format = Json.format[ErrorObject]
}
