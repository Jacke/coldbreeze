package infra.paypal.objects

import play.api.libs.json.Json


/**
 *
 *        This object provides a list of items and related shipping addresses within a transaction.
 *
 * @param items	array of item objects	List of items.
 * @param shipping_address	shipping_address	Shipping address, if different than the payer address.
 */
case class ItemList(items: Seq[Item], shipping_address: Option[ShippingAddress] = None)


object ItemList {
  implicit val format = Json.format[ItemList]
}
