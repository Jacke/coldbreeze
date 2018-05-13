package infra.paypal

import play.api.libs.json.Json


case class AccessToken(scope: String, access_token: String, token_type: String, app_id: String, expires_in: Int) extends Serializable

object AccessToken {
  implicit val format = Json.format[AccessToken]
}