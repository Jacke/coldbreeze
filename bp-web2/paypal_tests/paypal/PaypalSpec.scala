package infra.paypal

import play.api.test._
import scala.concurrent.duration.FiniteDuration
import play.api.Logger
import objects._
import scala.concurrent.ExecutionContext.Implicits.global

/**
 * @author alari (name.alari@gmail.com)
 * @since 18.10.13 16:46
 */
class PaypalSpec extends PlaySpecification {

  "paypal api" should {

    "convert BigDecimal to String custom way" in {
      decToStr(7) must_== "7"
      decToStr(7.47) must_== "7.47"
      decToStr(7.4) must_== "7.40"
      decToStr(7.402) must_== "7.40"
    }

    "obtain request token" in new WithApplication {


      Paypal.requestToken must beLike[AccessToken] {
        case token =>
          token.expires_in must be_>=(1)
      }.await(1, FiniteDuration(15, "second"))
    }

    val boringSomeRedirectUrls = Some(RedirectUrls(Some("http://localhost:9000/your_redirect_url/"), Some("http://localhost:9000/your_cancel_url/")))

    "create a new payment with api wrapper" in new WithApplication {
      val item_list = ItemList(Seq(Item("1", "xx", 7.47, "USD")))
      val body = Payment(
        Intent.Sale,
        redirect_urls = boringSomeRedirectUrls,
        payer = Payer(Some(PaymentMethod.Paypal)),
        transactions = Seq(Transaction(Amount("USD", 7.47), None, Some(item_list) ))
      )

      Paypal.post[Payment]("payments/payment", body) must beLike[Payment] {
        case p =>
          p.state must beSome(PaymentState.Created)
      }.await(1, FiniteDuration(15, "second"))
    }


    val instrument =
      FundingInstrument(credit_card = Some(CreditCard(
        None, None, "4971929812305651", CardType.Visa, "10", "2018", first_name = "John", last_name = "Malkovitch"
      )), credit_card_token = None)

    val item_list2 = ItemList(Seq(Item("1", "xx", 222.12, "USD")))
    val paymentAuthorize = Payment(
      Intent.Authorize,
      redirect_urls = boringSomeRedirectUrls,
      payer = Payer(Some(PaymentMethod.CreditCard), funding_instruments = Some(Seq(instrument))),
      transactions = Seq(Transaction(Amount("USD", 222.12), None, Some(item_list2) ))
    )

    "authorize a payment" in new WithApplication {

      Paypal.post[Payment]("payments/payment", paymentAuthorize) must beLike[Payment] {
        case p =>
          Logger.info(p.toString)
          p.transactions.head.related_resources.get.head must beLike[RelatedResource] {
            case a: Authorization =>
              Logger.info(a.toString)
              a.id must beSome
              a.state must beSome(AuthorizationState.Authorized)
          }

          p.state must beSome(PaymentState.Approved)
          p.intent must_== Intent.Authorize
      }.await(1, FiniteDuration(15, "second"))
    }

    "capture authorization" in new WithApplication {

      Paypal.post[Payment]("payments/payment", paymentAuthorize).flatMap {
        _.transactions.head.related_resources.get.head match {
          case a: Authorization =>
            a.id must beSome
            Paypal.post[Capture](s"payments/authorization/${a.id.get}/capture", Authorization.Capture(Amount("USD", 100)))

        }
      } must beLike[Capture] {
        case c =>
          Logger.info(c.toString)
          c.id must beSome
      }.await(1, FiniteDuration(15, "second"))
    }

    "authorize paypal payment" in new WithApplication {
      Paypal.post[Payment]("payments/payment", paymentAuthorize.copy(payer = Payer(Some(PaymentMethod.Paypal)))) must beLike[Payment] {
        case p =>
          Logger.info(p.toString)
          p.links.exists(_.exists(_.rel == "approval_url")) must beTrue

          p.state must beSome(PaymentState.Created)
          p.intent must_== Intent.Authorize
      }.await(1, FiniteDuration(15, "second"))
    }
  }
}
