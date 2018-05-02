package infra.paypal.objects

import play.api.libs.json._

/**
 *
 *        This object is pre-filled by PayPal when the payment_method is paypal.
 *
 * @param email	string	Email address representing the payer. 127 characters max.
 * @param first_name	string	First name of the payer. Assigned in response.
 * @param last_name	string	Last name of the payer. Assigned in response.
 * @param payer_id	string	PayPal assigned Payer ID. Assigned in response.
 * @param phone	string	Phone number representing the payer. 20 characters max.
 * @param shipping_address	shipping_address	Shipping address of payer PayPal account. Assigned in response.
 */
case class PayerInfo(email: Option[String] = None,
                     first_name: Option[String] = None,
                     last_name: Option[String] = None,
                     payer_id: Option[String],
                     phone: Option[String],
                     shipping_address: Option[ShippingAddress]
                      )

object PayerInfo {
  val format = Json.format[PayerInfo]

  implicit val writes: Writes[PayerInfo] = format
  implicit val reads: Reads[PayerInfo] = new Reads[PayerInfo] {
    def reads(json: JsValue): JsResult[PayerInfo] = {
      json \ "shipping_address" match {
        case _: JsUndefined => /////| JsObject(Seq()) =>
          json.transform((__ \ "shipping_address").json.prune) match {
            case JsSuccess(j, _) =>
              format.reads(j)
            case e: JsError =>
              e
          }
        case _ =>
          format.reads(json)
      }
    }
  }
}
