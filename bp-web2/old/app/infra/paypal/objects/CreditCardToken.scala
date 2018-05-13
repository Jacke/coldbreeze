package infra.paypal.objects

import play.api.libs.json.Json

/**
 *        This object represents a token corresponding to a credit card stored with PayPal.
 *
 * @param credit_card_id	string	ID of credit card previously stored using /vault/credit-card. Required.
 * @param payer_id	string	A unique identifier that you can assign and track when storing a credit card or using a stored credit card. This ID can help to avoid unintentional use or misuse of credit cards. This ID can be any value you would like to associate with the saved card, such as a UUID, username, or email address. Required when using a stored credit card if a payer_id was originally provided when storing the credit card in vault.
 * @param last4	string	Last four digits of the stored credit card number. Assigned in response.
 * @param type	string	Credit card type. Valid types are: visa, mastercard, discover, amex. Values are presented in lowercase and not should not be used for display. Assigned in response.
 * @param expire_year	integer	4-digit expiration year. Assigned in response.
 * @param expire_month	integer	Expiration month with no leading zero. Acceptable values are 1 through 12. Assigned in response.
 */
case class CreditCardToken(credit_card_id: String,
                           payer_id: String,
                           last4: String,
                           `type`: Option[CardType.Value] = None,
                           expire_year: Option[Int] = None,
                           expire_month: Option[Int] = None
                            )


object CreditCardToken {
  implicit val format = Json.format[CreditCardToken]
}