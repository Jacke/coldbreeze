package infra.paypal.objects

import play.api.libs.json.Json
import infra.paypal.format.EnumFormat

/**
 *        This object is used for the shipping address.
 *
 * @param recipient_name	string	Name of the recipient at this address. 50 characters max. Required
 * @param type	string	Address type. Must be one of the following: residential, business, or mailbox.
 * @param line1	string	Line 1 of the address (e.g., Number, street, etc). 100 characters max. Required.
 * @param line2	string	Line 2 of the address (e.g., Suite, apt #, etc). 100 characters max.
 * @param city	string	City name. 50 characters max. Required.
 * @param country_code	string	2-letter country code. 2 characters max. Required.
 * @param postal_code	string	Zip code or equivalent is usually required for countries that have them. 20 characters max. Required in certain countries.
 * @param state	string	2-letter code for US states, and the equivalent for other countries. 100 characters max. Required.
 * @param phone	string	Phone number in e.123 format. 50 characters max.
 */
case class ShippingAddress(recipient_name: Option[String],
                           `type`: Option[AddressType.Value],
                           line1: Option[String],
                           line2: Option[String] = None,
                           city: Option[String],
                           country_code: Option[String],
                           postal_code: Option[String] = None,
                           state: Option[String],
                           phone: Option[String] = None)



object AddressType extends Enumeration with EnumFormat {
  val Residential = Value("residential")
  val Business = Value("business")
  val Mailbox = Value("mailbox")

  implicit val format = valueFormat
}

object ShippingAddress {
  implicit val format = Json.format[ShippingAddress]
}