package us.ority.util

import java.util.HashMap;
import java.util.Map;

import com.stripe.Stripe;
import com.stripe.exception.StripeException;
import com.stripe.model.Charge;
import com.stripe.net.RequestOptions;
import scala.collection.JavaConversions._
import com.stripe.model.Balance;
import com.stripe.model.BalanceTransaction;
import com.stripe.model.BalanceTransactionCollection;
import com.stripe.Stripe
import com.stripe.model.Customer;
import com.stripe.model.CustomerSubscriptionCollection;
import com.stripe.model.SubscriptionCollection;
import com.stripe.model.DeletedBankAccount;
import com.stripe.model.DeletedBitcoinReceiver;
import com.stripe.model.DeletedCard;
import com.stripe.model.DeletedCoupon;
import com.stripe.model.DeletedCustomer;
import com.stripe.model.Charge;
import com.stripe.model.ChargeRefundCollection;
import com.stripe.model.Subscription;
import com.stripe.model.Token;


object StripeClient {
  val API_KEY = "sk_test_b46MENsar8PaLQcVxnesQXp1"
  Stripe.apiKey = API_KEY; // stripe public

  def balance:Balance = Balance.retrieve() 

  def createCustomer(hash:String, description: String, email: Option[String]=None) = {
    val customerParams:Map[String, Any] = new HashMap[String, Any]()
    customerParams.put("description", description);
    customerParams.put("source", hash); // obtained with Stripe.js
    email match {
      case Some(em) => customerParams.put("email", em)
      case _ =>
    }
    Customer.create(customerParams.asInstanceOf[Map[String,AnyRef]]);
  }
  // amount !!!!!!!!!!!!!!!! 1000 = 10.00
  // CHECK BEFORE CALL
  def createCharge(customer: String, amount: Int, description: Option[String] = None) = {
    val chargeParams:Map[String, Any] = new HashMap[String, Any]()
    chargeParams.put("amount", amount);
    chargeParams.put("currency", "usd");
    chargeParams.put("source", customer); // obtained with Stripe.js
    description match {
      case Some(desc) => chargeParams.put("description", desc);
      case _ =>
    }
    Charge.create(chargeParams.asInstanceOf[Map[String,AnyRef]]);
  }

  def createSubscription(plan: String, customer: String) = {
    val params:Map[String, Any] = new HashMap[String, Any]()
    params.put("plan", plan);
    params.put("customer", customer);
    Subscription.create(params.asInstanceOf[Map[String,AnyRef]])
  }
  def retrieveToken(tokenId: String) = 
    Token.retrieve(tokenId)

  def receivePayment(amount: Int, number: String, exp_month: Int, exp_year: Int) = {
    val requestOptions = RequestOptions.builder().setApiKey(API_KEY).build()
    val chargeMap:Map[String, Any] = new HashMap[String, Any]()
    chargeMap.put("amount", amount)
    chargeMap.put("currency", "usd")
    val cardMap:Map[String, Any] = new HashMap[String, Any]()
    cardMap.put("number", "number")
    cardMap.put("exp_month", exp_month)
    cardMap.put("exp_year", exp_year)
    chargeMap.put("card", cardMap)
    val charge = Charge.create(chargeMap.asInstanceOf[Map[String,AnyRef]], requestOptions);
  }

}