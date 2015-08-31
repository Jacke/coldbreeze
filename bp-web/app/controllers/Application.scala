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
import service.DemoUser
import securesocial.core._
import controllers.users._
import models.DAO.resources._



class Application(override implicit val env: RuntimeEnvironment[DemoUser]) extends Controller with securesocial.core.SecureSocial[DemoUser] { // with Secured  {
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
          routes.javascript.CustomLoginController.login,
            routes.javascript.BusinessProcessController.frontElems,
            routes.javascript.BusinessProcessController.spaces,
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
            routes.javascript.ProfileController.profile,
            routes.javascript.ProcessSessionController.update_note,
            routes.javascript.ProcessInputController.invokeFrom,
            routes.javascript.APIController.v1

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
      val user = request.user.main.userId
      val current_plan = AccountPlanDAO.getByMasterAcc(user).get
      applicationLogger.info(s"Plan expired_at: ${current_plan.expired_at}")
      //if (current_plan.expired_at.isBefore( org.joda.time.DateTime.now() ) ) {
      //  Redirect(routes.PlanController.index)
      //} else {
          Ok(views.html.app(request.user))
      //}
  }

  def proPage() = SecuredAction { implicit request =>
      Ok(views.html.pro(request.user))
  }
  def subscribePro() = SecuredAction(BodyParsers.parse.json) { implicit request =>
      println(request.body)
      Ok(views.html.pro(request.user))
  }

  def subscribeEa() = SecuredAction(BodyParsers.parse.json) { implicit request =>
      println(request.body)
      Ok(views.html.pro(request.user))
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
case class WhoAmIdentify(email: String, business: Int = 0, manager: Boolean, employee: Boolean, lang: String = "en", payed: Boolean = false, env: String = "prod")
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


  def whoami = SecuredAction { implicit request =>
    val email = request.user.main.email.get
    applicationLogger.debug("Attempting risky calculation.")
    applicationLogger.debug(request.host.toString)

    val (isManager, isEmployee, lang):(Boolean, Boolean, String) = AccountsDAO.getRolesAndLang(email).get
    val business_request:Option[Tuple2[Int, Int]] = models.DAO.resources.EmployeesBusinessDAO.getByUID(email) 
    val business = business_request match {
      case Some(biz) => biz._2
      case _ => -1
    }
    val current_plan = AccountPlanDAO.getByMasterAcc(email).getOrElse(
            AccountPlanDTO(None, 
                business_id = Some(-1), 
                master_acc = email 
      ))

    val env_mode = play.api.Play.current.mode

    Ok(Json.toJson(WhoAmIdentify(request.user.main.userId, request.user.businessFirst, isManager, isEmployee, lang, payed = current_plan.expired_at.isAfter( org.joda.time.DateTime.now()), env_mode.toString() )))
  }

  // a sample action using an authorization implementation
  def onlyTwitter = SecuredAction(WithProvider("twitter")) { implicit request =>
    Ok("You can see this because you logged in using Twitter")
  }


  /**
   * Sample use of SecureSocial.currentUser. Access the /current-user to test it
   
  def currentUser = Action.async { implicit request =>
    import play.api.libs.concurrent.Execution.Implicits._
    SecureSocial.currentUser[DemoUser].map { maybeUser =>
      val userId = maybeUser.map(_.main.userId).getOrElse("unknown")
      Ok(s"Your id is $userId")
    }
  }
*/

// An Authorization implementation that only authorizes uses that logged in using twitter
  case class WithProvider(provider: String) extends Authorization[DemoUser] {
    def isAuthorized(user: DemoUser, request: RequestHeader) = {
      user.main.providerId == provider
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
      BadRequest(Json.obj("status" ->"KO", "message" -> JsError.toFlatJson(errors)))
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
