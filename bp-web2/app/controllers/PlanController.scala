package controllers

import models.DAO.resources.{BusinessDAO, BusinessDTO}
import models.DAO._

import play.api._
import play.api.mvc._
import play.twirl.api.Html

import play.api.http.MimeTypes
import play.api.libs.json._
import play.api.cache._
import play.api.data._
import play.api.data.Forms._
import play.api.data.format.Formats
import play.api.data.format.Formatter
import play.api.data.FormError


import views._
import models.User
import service.DemoUser
import com.mohiva.play.silhouette.api.{ Environment, LogoutEvent, Silhouette }
import com.mohiva.play.silhouette.impl.authenticators.CookieAuthenticator
import com.mohiva.play.silhouette.impl.providers.SocialProviderRegistry
import forms._
import models.User2
import play.api.i18n.MessagesApi
import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits.global
import models.DAO.BProcessDTO
import models.DAO.BPDAO
import models.DAO._
import models.DAO.resources._
import models.DAO.CompositeValues
import play.api.Play.current


import infra.paypal._
import play.api.test._
import scala.concurrent.duration.FiniteDuration
import play.api.Logger
import objects._
import scala.concurrent.ExecutionContext.Implicits.global
import scala.concurrent.duration.Duration
import scala.concurrent.{ExecutionContext, Future}
import org.joda.time.DateTime
import play.api.data._
import play.api.data.Forms._

import scala.util.{Success, Failure}

case class PayInfo(number: String, exp_month: String, exp_year: String, firstname: String, lastname: String, cvv2:Option[String]=None)
case class LimitFormObject(limit: Int)
case class StatusMessage(message:String, state: String="error", lang: String="en")

import javax.inject.Inject

import com.mohiva.play.silhouette.api.{ Environment, LogoutEvent, Silhouette }
import com.mohiva.play.silhouette.impl.authenticators.CookieAuthenticator
import com.mohiva.play.silhouette.impl.providers.SocialProviderRegistry
import forms._
import models.User2
import play.api.i18n.MessagesApi
import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits.global

import play.api.mvc.{ Action, RequestHeader }

class PlanController @Inject() (
  val messagesApi: MessagesApi,
  val env: Environment[User2, CookieAuthenticator],
  socialProviderRegistry: SocialProviderRegistry)
  extends Silhouette[User2, CookieAuthenticator] {



/**
* Index action
*/
val PayForm = Form(
    mapping(
      "number" -> nonEmptyText,
      "exp_month" -> nonEmptyText,
      "exp_year" -> nonEmptyText,
      "first-name" -> nonEmptyText,
      "last-name" -> nonEmptyText,
      "cvv2" -> optional(text)
        )(PayInfo.apply)(PayInfo.unapply))

//  BillingInfoDTO(var id: Option[Int], business:Int, firstName:String, lastName:String, address:String, zipcode:String, created_at: DateTime, updated_at: DateTime)
val BillingInfoForm = Form(mapping(
  "id" -> optional(number),
  "business" -> number,
  "firstName" -> nonEmptyText,
  "lastName" -> nonEmptyText,
  "address" -> nonEmptyText,
  "zipcode" -> nonEmptyText,
  "created_at" -> default(jodaDate, org.joda.time.DateTime.now()),
  "updated_at" -> default(jodaDate, org.joda.time.DateTime.now())
)(models.DAO.BillingInfoDTO.apply)(models.DAO.BillingInfoDTO.unapply))
val LimitForm = Form(mapping(
    "limit" -> number
  )(LimitFormObject.apply)(LimitFormObject.unapply))


/*****
 *  Main plan page
 */

def redirect_url() = SecuredAction { implicit request =>
  Redirect(routes.PlanController.index)
}
def cancel_url() = SecuredAction { implicit request =>
  Redirect(routes.PlanController.index)
}

def index() = SecuredAction { implicit request =>
  val business = request.identity.businessFirst
  if (business < 1) {
    Redirect(controllers.routes.SettingController.workbench())
  } else {
    val user = request.identity.emailFilled
   	val plans = PlanDAO.getAll.sortBy(_.order).filter(p => !p.hidden)
   	val bills = BillDAO.getAllByWorkbench(business)
    println("Workbench " + business)
    val current_plan = AccountPlanDAO.getByWorkbenchAcc(workbench_id = business).get //REFACTOR
    println(current_plan)
    val limit_form = LimitForm.fill(LimitFormObject(current_plan.limit))
    val billing_info = BillingInfosDAO.getByBusiness(business)
    val billing_info_form = billing_info match {
     case Some(info) => BillingInfoForm.fill(info)
     case _ => BillingInfoForm
    }
   	Ok(views.html.plans.index(request.identity, plans, bills, PayForm, billing_info_form, limit_form, current_plan))
  }
}



def update_billinginfos() = SecuredAction { implicit request =>
  //TODO: Business checking
  BillingInfoForm.bindFromRequest.fold(
        formWithErrors => Redirect(routes.PlanController.index),
        entity => {
            BillingInfosDAO.push(entity)
        })
      Redirect(routes.PlanController.index)
}

 /**
  * Switch method
  */
def switch(plan_id: Int) = SecuredAction { implicit request =>
  val business = request.identity.businessFirst
  if (business < 1) {
    Redirect(controllers.routes.SettingController.workbench())
  } else {
  val user = request.identity.emailFilled
  val plans = PlanDAO.getAll.sortBy(_.order).filter(p => !p.hidden)
  val bills = BillDAO.getAllByWorkbench(business)

  val current_plan = AccountPlanDAO.getByWorkbenchAcc(workbench_id = business).get
  val desired_plan = PlanDAO.get(plan_id)

  desired_plan match {
    case Some(plan) => {
      AccountPlanDAO.update(current_plan.id.get, current_plan.copy(plan = plan_id) )
      val bill_id = BillDAO.pull_object(BillDTO(None, s"Bill ${DateTime.now}", user, DateTime.now(),
        approved = false,
        expired = DateTime.now().plusMonths(1),
        sum = plan.price,
        workbench = business))
          AccountPlanHistoryDAO.pull_object(AccountPlanHistoryDTO(None,
                                                                  account_plan = current_plan.id.get,
                                                                  limit_diff = -1,
                                                                  plan_diff = plan_id,
                                                                  byBill = bill_id))
 	    Redirect(routes.PlanController.index)
  }
  case _ => BadRequest("Plan not found")
  }
}
}

def delete_bill(billId: Int) = SecuredAction { implicit request =>
  val business = request.identity.businessFirst
  if (business < 1) {
    Redirect(controllers.routes.SettingController.workbench())
  } else {
    val user = request.identity.emailFilled

    val bills = BillDAO.getAllByWorkbench(business)
    bills.find(bill => bill.id.get == billId && !bill.approved) match {
      case Some(bill) => {
        BillDAO.delete(billId)
        Redirect(routes.PlanController.index)
      }
      case _ => Redirect(routes.PlanController.index)
    }
  }
}

/**
 * Switch limit
 */
def switchLimit(plan_id: Int) = SecuredAction { implicit request =>
  val business = request.identity.businessFirst
  if (business < 1) {
    Redirect(controllers.routes.SettingController.workbench())
  } else {

  val user = request.identity.emailFilled
  val plans = PlanDAO.getAll.sortBy(_.order).filter(p => !p.hidden)
  val bills = BillDAO.getAllByWorkbench(business)
  var limit = -1
  LimitForm.bindFromRequest.fold(
        formWithErrors => Redirect(routes.PlanController.index),
        entity => {
          var limit = entity.limit
        })
  val current_plan = AccountPlanDAO.getByWorkbenchAcc(workbench_id = business).get
  val desired_plan = PlanDAO.get(plan_id)
  val current_limit = current_plan.limit
  val limit_dif = limit - current_limit


  limit_dif match {
    case x if x < 1 => {
        Redirect(routes.PlanController.index)
    }
    case _ => {
      desired_plan match {
        case Some(plan) => {
          val ammount = limit_dif * 5
          val bill_id = BillDAO.pull_object(BillDTO(None, s"Bill for increase user slots ${DateTime.now}",
            user, DateTime.now, false, DateTime.now().plusMonths(1), BigDecimal(ammount), workbench = business)
            )
          AccountPlanDAO.update(current_plan.id.get, current_plan.copy(limit = current_plan.limit + limit ) )
          AccountPlanHistoryDAO.pull_object(AccountPlanHistoryDTO(None,
                                                                  account_plan = current_plan.id.get,
                                                                  limit_diff = limit_dif,
                                                                  plan_diff = -1,
                                                                  byBill = bill_id))
          Redirect(routes.PlanController.index)
      }
      case _ => BadRequest("Plan not found")
      }
    }
  }
  }
}

def status() = SecuredAction { implicit request =>
  Ok("test")
}
def test_pay() = SecuredAction.async { implicit request =>
 val item = Item(1, "ff", BigDecimal(1),"RUB",Some("001"))
val card = CreditCard(
                        id = None,
                        payer_id = None,
            number = "5189010006963418",
            `type` = CardType.MasterCard,
            expire_month = "11",
            expire_year = "2017",
            cvv2 = Some("678"),
            first_name = "STANISLAV",
           last_name = "SUSHKO",
                        billing_address = None,
                        state = None,
                        valid_until = None)

CheckoutUtil.checkout_proceed(item, Some(card)).map { result =>
  println(result)
  Ok(result.toString)
}
}
/**
 * Checkout action
 */
def checkout(bill_id: Int) = SecuredAction { implicit request =>
  val business = request.identity.businessFirst
  if (business < 1) {
    Redirect(controllers.routes.SettingController.workbench())
  } else {
  val user = request.identity.emailFilled
  val plans = PlanDAO.getAll.sortBy(_.order).filter(p => !p.hidden)
  val bill = BillDAO.get(bill_id).get
  val bills = BillDAO.getAllByWorkbench(business)
  val current_plan = AccountPlanDAO.getByWorkbenchAcc(workbench_id = business).get
  val billing_info = BillingInfosDAO.getByBusiness(business)
  val billing_info_form = billing_info match {
   case Some(info) => BillingInfoForm.fill(info)
   case _ => BillingInfoForm
  }
  val limit_form = LimitForm.fill(LimitFormObject(current_plan.limit))
  val plan_dao = PlanDAO.get(current_plan.plan).get
  val plan_price:BigDecimal = plan_dao.price

  val bill_his = AccountPlanHistoryDAO.getByBill(bill_id)
  bill_his match {
    case Some(his) => {
      if (!bill.approved) {
          val forPlan = true
          val forLimit = false
          var statusMessage:Option[StatusMessage]=None

                 //BillDAO.update(bill.id.get, bill.copy( approved = true) )
                 if (bill_his.get.limit_diff == -1) {
                   // AccountPlanDAO.update(current_plan.id.get, current_plan.copy(expired_at = DateTime.now().plusMonths(1) ))
                 }
                 if (bill_his.get.plan_diff == -1) {
                    // limit bill changes
                 }
        // quantity: String, name: String, price: BigDecimal, currency: String, sku: Option[String] = None
        CheckoutUtil.checkout_proceed(Item(1, plan_dao.title, plan_price, "USD", Some("001")),
          None)
        /*CreditCard(
            id = None,
            payer_id = None,
            number = entity.number,
            `type` = CardType.MasterCard,//CardType.fetchType(entity.number),
            expire_month = entity.exp_month,
            expire_year = entity.exp_year,
            cvv2 = entity.cvv2,
            first_name = entity.firstname,
            last_name = entity.lastname,
            billing_address = None,
            state = None,
            valid_until = None
              )*/.onComplete {

              case Success(x) => {

                 println("checkout Success")
                 println(x.state)
                 Redirect(x.links.get.find(link => link.method == Method.REDIRECT ).get.href)

                 //BillDAO.update(bill.id.get, bill.copy( approved = true) )
                 //AccountPlanDAO.update(current_plan.id.get, current_plan.copy(expired_at = DateTime.now().plusMonths(1) ))
              }
              case Failure(t) => {
                println("checkout Failure")
                println(t)
              }
            }
//         })
          Ok(views.html.plans.index(request.identity,
          plans,
          bills,
          PayForm,
          billing_info_form,
          limit_form,
          current_plan,
          statusMessage))
      } else {
        Redirect(routes.PlanController.index)
      }
    }
    case _ => Redirect(routes.PlanController.index)
  }
}

}


}

/*
Paypal Utils

*/
object CheckoutUtil {

 val SomeRedirectUrls = Some(RedirectUrls(Some("http://192.168.1.102/plans/redirect_url/"),
                                          Some("http://192.168.1.102/plans/cancel_url/")))

def checkout_proceed(item: Item, card: Option[CreditCard]):Future[Payment] = {
  val item_list = ItemList(Seq(item))
  //val instrument = FundingInstrument(credit_card = Some(card), credit_card_token = None)

  val item_list2 = ItemList(Seq(item))
  val body = Payment(
        intent = Intent.Sale,
        //payer = Payer(Some(PaymentMethod.CreditCard), funding_instruments = Some(Seq(instrument))),
        payer = Payer(Some(PaymentMethod.Paypal)),
        redirect_urls = SomeRedirectUrls,
        transactions = Seq(Transaction(Amount(item.currency, item.price), None, Some(item_list2) )) )
        //transactions = Seq(Transaction(Amount(item.currency, item.price),None, None)) ) //,Some(item_list) )) )
  val post_payment = Paypal.post[Payment]("payments/payment", body)
  println("check quantity")
  println(body.transactions.head.item_list.get.items.head.quantity)
  println(infra.paypal.objects.Item.toJson(body.transactions.head.item_list.get.items.head))
  println(body.transactions.head.item_list.get.items.head.quantity.getClass)
  //val paymentAuthorize = Payment(
  //    Intent.Authorize,
  //    redirect_urls = SomeRedirectUrls,
  //    payer = Payer(Some(PaymentMethod.CreditCard), funding_instruments = Some(Seq(instrument))),
  //    transactions = Seq(Transaction(Amount(item.currency, item.price), None, Some(item_list2) )) )
  // Authorize payment payment
  //val auth_payment = Paypal.post[Payment]("payments/payment", paymentAuthorize)
  // "capture authorization"
  //Paypal.post[Payment]("payments/payment", paymentAuthorize).flatMap {
  //    _.transactions.head.related_resources.get.head match {
  //      case a: AuthorizationB =>
  //        Paypal.post[Capture](s"payments/authorization/${a.id.get}/capture", AuthorizationB.Capture(Amount(item.currency, item.price)))
  //    }
  //  }
  // "authorize paypal payment"
  //Paypal.post[Payment]("payments/payment", paymentAuthorize.copy(payer = Payer(Some(PaymentMethod.Paypal))))
  //auth_payment
  post_payment
}

}
