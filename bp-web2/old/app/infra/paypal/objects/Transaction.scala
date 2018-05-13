package infra.paypal.objects

import play.api.libs.json._

/**
 *        This object provides payment transactions details.
 *
 * @param amount	amount	Amount being collected . Required.
 * @param description	string	Description of transaction.
 * @param item_list	item_list	Items within a transaction.
 * @param related_resources	array of sale, authorization, capture, or refund, objects	Financial transactions related to a payment.
 */
case class Transaction(amount: Amount,
                       description: Option[String] = None,
                       item_list: Option[ItemList] = None,
                       related_resources: Option[Seq[RelatedResource]] = None
                        ) {
  require(item_list.map(_.items).map(_.map(i => i.price * i.quantity.toInt).sum).exists(_ == amount.total), {
    val sum = item_list.map(_.items).map(_.map(i => i.price * i.quantity.toInt).sum)
    s"Sum of items = $sum, total = ${amount.total} must match\n${item_list.map(_.items.mkString("\n"))}"
  })
}

trait RelatedResource

object RelatedResource {
  implicit val format = new Format[RelatedResource] {
    def reads(json: JsValue): JsResult[RelatedResource] = json.as[JsObject].keys.head match {
      case "sale" =>  {
        val res = json \ "sale"

        Sale.format.reads(res.get)

        }
      case "refund" =>  {
        val res = json \ "refund"

        Refund.format.reads(res.get)

        }
      case "capture" =>  {
        val res = json \ "capture"

        Capture.format.reads(res.get)

        }
      case "authorization" => {
        val res = json \ "authorization"

        AuthorizationB.format.reads(res.get)

        }
    }

    def writes(o: RelatedResource): JsValue = o match {
      case s : Sale => Json.obj("sale" -> s)
      case r : Refund => Json.obj("refund" -> r)
      case c : Capture => Json.obj("capture" -> c)
      case a : AuthorizationB => Json.obj("authorization" -> a)
    }
  }
}


object Transaction {
  implicit val format = Json.format[Transaction]
}
