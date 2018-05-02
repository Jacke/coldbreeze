package infra.paypal.objects

import play.api.libs.json.Json

/**
 *        address object (for payments)
 *        This object is used for shipping or billing addresses.
 *
 * @param line1	string	Line 1 of the address (e.g., Number, street, etc). 100 characters max. Required.
 * @param line2	string	Line 2 of the address (e.g., Suite, apt #, etc). 100 characters max.
 * @param city	string	City name. 50 characters max. Required.
 * @param country_code	string	2-letter country code. 2 characters max. Required.
 * @param postal_code	string	Zip code or equivalent is usually required for countries that have them. 20 characters max. Required in certain countries.
 * @param state	string	2-letter code for US states, and the equivalent for other countries. 100 characters max. Required.
 * @param phone	string	Phone number in e.123 format.
 */
case class Address(line1: String,
                   line2: Option[String] = None,
                   city: String,
                   country_code: String,
                   postal_code: Option[String],
                   state: String,
                   phone: Option[String] = None
                    )

object Address {
  implicit val format = Json.format[Address]
}