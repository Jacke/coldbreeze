package controllers
import sys.process._

import play.api._
import play.api.mvc._
import play.twirl.api.Html
//{Action, Controller}
import play.api.http.MimeTypes
import play.api.libs.json._
import play.api.cache._
import play.api.libs.json._
import play.api.libs.functional.syntax._
import play.api.Logger

import views._
import models.{AccountsDAO, User}

import controllers.users._
import models.DAO.resources._



import play.api.mvc.{ Action, RequestHeader }
import javax.inject.Inject

import com.mohiva.play.silhouette.api.{ Environment, LogoutEvent, Silhouette }
import com.mohiva.play.silhouette.impl.authenticators.CookieAuthenticator
import com.mohiva.play.silhouette.impl.providers.SocialProviderRegistry
import forms._
import models.User2
import play.api.i18n.MessagesApi
import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits.global


class Application @Inject() (
  val messagesApi: MessagesApi,
  val env: Environment[User2, CookieAuthenticator],
  hook: utils.MessageQueueConnection,
  socialProviderRegistry: SocialProviderRegistry)
  extends Silhouette[User2, CookieAuthenticator] {
  import play.api.Play.current

  val applicationLogger = play.api.Logger("application")

  /**
   * Returns the JavaScript router that the client can use for "type-safe" routes.
   * Uses browser caching; set duration (in seconds) according to your release cycle.
   * @param varName The name of the global variable, defaults to `jsRoutes`
   */
  def jsRoutes(varName: String = "jsRoutes") = //Cached(_ => "jsRoutes", duration = 86400) {
    Action { implicit request =>
      Ok(
        Routes.javascriptRouter(varName)(
          routes.javascript.ApplicationController2.signIn,
            routes.javascript.ProcessElementsController.frontElems,
            routes.javascript.ProcessElementsController.spaces,
            routes.javascript.BusinessProcessController.copy,
            users.routes.javascript.EmployeeController.create_new,
            routes.javascript.GroupController.create_new,
            routes.javascript.GroupController.destroy,
            routes.javascript.GroupController.assign_user,
            routes.javascript.GroupController.unassign_user,
            routes.javascript.Application.index,
            routes.javascript.Application.whoami,
            routes.javascript.Application.proPage,
            routes.javascript.Application.subscribePro,
            routes.javascript.Application.subscribeEa,
            routes.javascript.ProfileController.dashboard,
            routes.javascript.ProcessSessionController.update_note,
            routes.javascript.ProcessInputController.invokeFrom,
            //routes.javascript.APIController.v1,
            routes.javascript.CostFillController.createCostElement,
            routes.javascript.CostFillController.createLaunchCostElement,
            routes.javascript.CostFillController.update_assigned_element,
            routes.javascript.CostFillController.delete_assigned_element,
            routes.javascript.CostFillController.delete_launch_assigned_element,
            routes.javascript.CostFillController.removeEntityById,
            routes.javascript.DataController.refill_slat,
            routes.javascript.DataController.fill_slat,
            routes.javascript.DataController.api_create_resource

          // TODO Add your routes here
        )
      ).as("text/javascript")
    //}
  }

  def index() = Action { implicit request =>
    Ok("test " + request.domain.toString + " " + request.host.toString)
  }



  def app() = SecuredAction { implicit request =>
    // Expired plan checking
      //AccountPlanDAO.getByMasterAcc(request.identity.masterFirst) match {
      //  case Some(current_plan) => applicationLogger.info(s"Plan expired_at: ${current_plan.expired_at}")
      //  case _ =>
      //}
      //if (current_plan.expired_at.isBefore( org.joda.time.DateTime.now() ) ) {
      //  Redirect(routes.PlanController.index)
      //} else {
      if (request.identity.businessFirst < 1)
        Redirect(routes.SettingController.workbench())
      else
        Ok(views.html.app(request.identity))
      //}
  }

  def app2() = SecuredAction { implicit request =>
        Ok(views.html.app2(request.identity))
  }

  def error_test() = Action { implicit request =>
    val test_error = 1 / 0
    Ok(Json.toJson(test_error))
  }
  
  def proPage() = SecuredAction { implicit request =>
      AccountsDAO.getAccountInfo(request.identity.emailFilled) match {
        case Some(infos) => {
                val eaSubmited  = infos.ea
                val proSubmited = infos.pro
                Ok(views.html.pro(request.identity, eaSubmited, proSubmited))
        }
        case _ => Ok(views.html.pro(request.identity, false,false))
      }

  }
  def subscribePro() = SecuredAction(BodyParsers.parse.json) { implicit request =>
      println(request.body)
      AccountsDAO.subscribeToPro(request.identity.emailFilled)
      AccountsDAO.getAccountInfo(request.identity.emailFilled) match {
        case Some(infos) => {
                val eaSubmited  = infos.ea
                val proSubmited = infos.pro
                Ok(s"{status: 'ok', ea_submited: $eaSubmited, pro_submited: $proSubmited}")
        }
        case _ => Ok("{status: 'not found'}")
      }
  }

  def subscribeEa() = SecuredAction(BodyParsers.parse.json) { implicit request =>
      println(request.body)
      AccountsDAO.subscribeToEA(request.identity.emailFilled)
      AccountsDAO.getAccountInfo(request.identity.emailFilled) match {
        case Some(infos) => {
                val eaSubmited  = infos.ea
                val proSubmited = infos.pro
                Ok(s"{status: 'ok', ea_submited: $eaSubmited, pro_submited: $proSubmited}")
        }
        case _ => Ok("{status: 'not found'}")
      }
  }

  case class ConfigurationWrapper(switcher_options: List[String],
                                  switcher_cmd: List[String],
                                  switcher_target: List[String],
                                  switcher_desc: Map[String, String])
  implicit val ConfigurationWrapperReads = Json.reads[ConfigurationWrapper]
  implicit val ConfigurationWrapperWrites = Json.format[ConfigurationWrapper]


  def configuration() = Action { implicit request =>
    Ok(Json.toJson(ConfigurationWrapper(
      main.scala.bprocesses.refs.UnitRefs.SwitcherConfiguration.switcher_options,
      main.scala.bprocesses.refs.UnitRefs.SwitcherConfiguration.switcher_cmd,
      main.scala.bprocesses.refs.UnitRefs.SwitcherConfiguration.switcher_target,
      main.scala.bprocesses.refs.UnitRefs.SwitcherConfiguration.switcher_desc)))
  }


case class UptimeMessage(server: String, uptime: String)
case class WhoAmIdentify(email: String,
  business: Int = 0,
  manager: Boolean,
  employee: Boolean,
  lang: String = "en",
  payed: Boolean = false,
  env: String = "prod",
  bb_ping: Boolean = false)
  implicit val WhoAmIdentifyReads = Json.reads[WhoAmIdentify]
  implicit val WhoAmIdentifyWrites = Json.format[WhoAmIdentify]
  implicit val UptimeMessageReads = Json.reads[UptimeMessage]
  implicit val UptimeMessageWrites = Json.format[UptimeMessage]


def uptime() = Action { implicit request =>

          val main_uptime = "uptime" !!
          val a_uptime    = "ansible a.min.ority.us -a 'uptime'" !!

         Ok(Json.toJson(List(
			UptimeMessage("min.ority.us", main_uptime.split("\n")(0)),
			UptimeMessage("a.min.ority.us", a_uptime.split("\n")(1))
			)))
}


  def whoami = SecuredAction.async { implicit request =>
    val email = request.identity.emailFilled
    val business = request.identity.businessFirst
    applicationLogger.debug("Attempting risky calculation.")
    applicationLogger.debug(request.host.toString)

    AccountPlanDAOF.getByWorkbenchAcc(workbench_id = business).flatMap { acc_plan =>
      models.AccountsDAOF.getRolesAndLang(email, business).map { credentials =>


    val (isManager, isEmployee, lang):(Boolean, Boolean, String) = credentials.get
    val current_plan = acc_plan.getOrElse(
            AccountPlanDTO(None,
                business_id = -1,
                master_acc = email)
            )

    val env_mode = play.api.Play.current.mode

    //minority.utils.BBoardWrapper().ping.map { bb_ping =>

    Ok(Json.toJson(WhoAmIdentify(request.identity.emailFilled,
      request.identity.businessFirst,
      isManager, isEmployee,
      lang,
      payed = current_plan.expired_at.isAfter( org.joda.time.DateTime.now()),
      env_mode.toString(),
      false//bb_ping
      )))
    //}
    }
  }
}





/**
For this Action we’ll need to define an implicit Reads[Place] to convert a JsValue to our model.

implicit val locationReads: Reads[Location] = (
  (JsPath \ "lat").read[Double] and
  (JsPath \ "long").read[Double]
)(Location.apply _)

implicit val placeReads: Reads[Place] = (
  (JsPath \ "name").read[String] and
  (JsPath \ "location").read[Location]
)(Place.apply _)

Next we’ll define the Action.

def savePlace = Action(BodyParsers.parse.json) { request =>
  val placeResult = request.body.validate[Place]
  placeResult.fold(
    errors => {
      BadRequest(Json.obj("status" ->"KO", "message" -> JsError.toJson(errors)))
    },
    place => {
      Place.save(place)
      Ok(Json.obj("status" ->"OK", "message" -> ("Place '"+place.name+"' saved.") ))
    }
  )
}
*/
import models.DAO.UndefElement
import models.DAO.CompositeValues
import models.DAO._
implicit val CompositeVReads = Json.reads[CompositeValues]
implicit val CompositeVWrites = Json.format[CompositeValues]
implicit val UndefElement1Reads = Json.reads[UndefElement]
implicit val UndefElementWrites = Json.format[UndefElement]
implicit val SpaceElementReads = Json.reads[SpaceElementDTO]
implicit val SpaceElementWrites = Json.format[SpaceElementDTO]
implicit val BPSpaceDTOReads = Json.reads[BPSpaceDTO]
implicit val BPSpaceDTOWrites = Json.format[BPSpaceDTO]

implicit val BPLoggerDTOReads = Json.reads[BPLoggerDTO]
implicit val BPLoggerDTOWrites = Json.format[BPLoggerDTO]

import com.github.nscala_time.time.Imports._



}





trait SubdomainController extends Controller {
  def WithSubdomain(f: => String => Request[AnyContent] => Result) = Action { implicit request =>
    val splitDomain = request.domain.split("\\.")

    if (splitDomain.length < 2) {
      BadRequest("Domain not found!")
    } else {
      f(splitDomain.head)(request)
    }
  }
}


class TestController extends SubdomainController{
  def index() = WithSubdomain { implicit domain => implicit request =>
   // Domain.findByName(domain) match {
    //  case Some(foundDomain: Domain) =>
        Ok("domain" + domain.toString)
      //case _ => Ok("Nothing found!")
    //}
  }
}
