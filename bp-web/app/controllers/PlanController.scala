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
import securesocial.core._
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

case class PayInfo(number: String, exp_month: String, exp_year: String, firstname: String, lastname: String)
case class LimitFormObject(limit: Int)

class PlanController(override implicit val env: RuntimeEnvironment[DemoUser]) extends Controller with securesocial.core.SecureSocial[DemoUser] {
 
 val SomeRedirectUrls = Some(RedirectUrls(Some("http://localhost:9000/your_redirect_url/"), 
                                          Some("http://localhost:9000/your_cancel_url/")))

/**
* Index action
*/
val PayForm = Form(
    mapping(
      "numner" -> nonEmptyText,
      "exp_month" -> nonEmptyText,
      "exp_year" -> nonEmptyText,
      "first-name" -> nonEmptyText,
      "last-name" -> nonEmptyText
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

def index() = SecuredAction { implicit request =>
  val user = request.user.main.userId
 	val plans = PlanDAO.getAll
 	val bills = BillDAO.getAllByMasterAcc(user)
  val current_plan = AccountPlanDAO.getByMasterAcc(user).get
  val limit_form = LimitForm.fill(LimitFormObject(current_plan.limit))

        val billing_info = BillingInfosDAO.getByBusiness(EmployeesBusinessDAO.getByUID(user).get._2)
        val billing_info_form = billing_info match {
         case Some(info) => BillingInfoForm.fill(info)
         case _ => BillingInfoForm
        }
 	Ok(views.html.plans.index(request.user, plans, bills, PayForm, billing_info_form, limit_form, current_plan))
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
  val user = request.user.main.userId
  val plans = PlanDAO.getAll
  val bills = BillDAO.getAllByMasterAcc(user)

  val current_plan = AccountPlanDAO.getByMasterAcc(user).get
  val desired_plan = PlanDAO.get(plan_id)
  
  desired_plan match {
    case Some(plan) => {
      AccountPlanDAO.update(current_plan.id.get, current_plan.copy(plan = plan_id) )
      val bill_id = BillDAO.pull_object(BillDTO(None, s"Bill ${DateTime.now}", user, DateTime.now().plusMonths(1)))
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

def delete_bill(billId: Int) = SecuredAction { implicit request => 
    val user = request.user.main.userId

    val bills = BillDAO.getAllByMasterAcc(user)
    bills.find(bill => bill.id.get == billId && !bill.approved) match {
      case Some(bill) => {
        BillDAO.delete(billId)
        Redirect(routes.PlanController.index)
      }
      case _ => Redirect(routes.PlanController.index)
    }
}

/**
 * Switch limit
 */
def switchLimit(plan_id: Int) = SecuredAction { implicit request =>
  val user = request.user.main.userId
  val plans = PlanDAO.getAll
  val bills = BillDAO.getAllByMasterAcc(user)
  var limit = -1
  LimitForm.bindFromRequest.fold(
        formWithErrors => Redirect(routes.PlanController.index),
        entity => {
          
          var limit = entity.limit
          
        })


  val current_plan = AccountPlanDAO.getByMasterAcc(user).get
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
            user, DateTime.now, false, DateTime.now().plusMonths(1), BigDecimal(ammount))
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

/**
 * Checkout action
 */
def checkout(bill_id: Int) = SecuredAction { implicit request =>
  val user = request.user.main.userId
  val plans = PlanDAO.getAll
  val bill = BillDAO.get(bill_id).get
  val bills = BillDAO.getAllByMasterAcc(user)
  val current_plan = AccountPlanDAO.getByMasterAcc(user).get
  val billing_info = BillingInfosDAO.getByBusiness(EmployeesBusinessDAO.getByUID(user).get._2)
        val billing_info_form = billing_info match {
         case Some(info) => BillingInfoForm.fill(info)
         case _ => BillingInfoForm
        }
  val plan_dao = PlanDAO.get(current_plan.plan).get
  val plan_price:BigDecimal = plan_dao.price

  val bill_his = AccountPlanHistoryDAO.getByBill(bill_id)
  
  val forPlan = true
  val forLimit = false
  PayForm.bindFromRequest.fold(
      formWithErrors =>     Redirect(routes.PlanController.index),
      entity => {
         println(entity)


             BillDAO.update(bill.id.get, bill.copy( approved = true) )
             if (bill_his.get.limit_diff == -1) {
               AccountPlanDAO.update(current_plan.id.get, current_plan.copy(expired_at = DateTime.now().plusMonths(1) ))
             }
             if (bill_his.get.plan_diff == -1) {
                // limit bill changes
             }
/*
  CheckoutUtil.checkout_proceed(Item(plan_dao.title, plan_dao.title, plan_price, "USD"), 
  CreditCard( 
    None, None, entity.number, CardType.fetchType(entity.number), entity.exp_month, entity.exp_year, first_name = entity.firstname, last_name = entity.lastname
      )).onComplete {

          case Success(x) => {
             println(x.state)
             BillDAO.update(bill.id.get, bill.copy( approved = true) )
             AccountPlanDAO.update(current_plan.id.get, current_plan.copy(expired_at = DateTime.now().plusMonths(1) ))
          }
          case Failure(t) => { 
            println(t)
          }
        }
*/      })
      
   Redirect(routes.PlanController.index)    
}





/*
Paypal Utils

*/
object CheckoutUtil {

def checkout_proceed(item: Item, card: CreditCard):Future[Payment] = {
  val item_list = ItemList(Seq(item))
  val body = Payment(
        Intent.Sale,
        redirect_urls = SomeRedirectUrls,
        payer = Payer(Some(PaymentMethod.Paypal)),
        transactions = Seq(Transaction(Amount("USD", item.price), None, Some(item_list) ))
      )

  Paypal.post[Payment]("payments/payment", body) 

  val instrument =
      FundingInstrument(credit_card = Some(card), credit_card_token = None)

  val item_list2 = ItemList(Seq(item))
  val paymentAuthorize = Payment(
      Intent.Authorize,
      redirect_urls = SomeRedirectUrls,
      payer = Payer(Some(PaymentMethod.CreditCard), funding_instruments = Some(Seq(instrument))),
      transactions = Seq(Transaction(Amount("USD", item.price), None, Some(item_list2) ))
  )



  // Authorize payment payment
  val auth_payment = Paypal.post[Payment]("payments/payment", paymentAuthorize) 


   
  // "capture authorization"
  Paypal.post[Payment]("payments/payment", paymentAuthorize).flatMap {
      _.transactions.head.related_resources.get.head match {
        case a: AuthorizationB =>
          Paypal.post[Capture](s"payments/authorization/${a.id.get}/capture", AuthorizationB.Capture(Amount("USD", item.price)))
      }
    } 

  // "authorize paypal payment"      
  Paypal.post[Payment]("payments/payment", paymentAuthorize.copy(payer = Payer(Some(PaymentMethod.Paypal)))) 

  auth_payment
}
}


}
