package infra.paypal.objects

import play.api.libs.json.Json
import infra.paypal.format.EnumFormat

/**
 *        Each API call response includes an array of HATEOAS (Hypermedia as the Engine of Application State) links. The beauty of HATEOAS is that it allows you to interact and construct an API flow solely through the hyperlinks we provide you. You no longer need to hardcode logic into your client in order to use our API. We provide HATEOAS links for each call and for transactions within a call, if available. Learn more about how the REST Payment API uses HATEOAS.
 *
 * @param href	URL of the related HATEOAS link you can use for subsequent calls.
 * @param rel	Link relation that describes how this link relates to the previous call. Examples include self (get details of the current call), parent_payment (get details of the parent payment), or a related call such as execute or refund.
 * @param method	The HTTP method required for the related call.
 */
case class HateoasLink(href: String, rel: String, method: Method.Value)

object Method extends Enumeration with EnumFormat {
  val GET, POST, REDIRECT = Value

  implicit val format = valueFormat
}

object HateoasLink {
  implicit val format = Json.format[HateoasLink]
}