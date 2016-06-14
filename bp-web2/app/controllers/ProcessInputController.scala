package controllers
import play.api._
import play.api.mvc._
import play.twirl.api.Html

//{Action, Controller}

import models.DAO.resources.{BusinessDAO, BusinessDTO}
import models.DAO._

import play.api._
import play.api.mvc._
import play.twirl.api.Html

//{Action, Controller}
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

import service._
import com.mohiva.play.silhouette.api.{ Environment, LogoutEvent, Silhouette }
import com.mohiva.play.silhouette.impl.authenticators.CookieAuthenticator
import com.mohiva.play.silhouette.impl.providers.SocialProviderRegistry
import forms._
import models.User2
import play.api.i18n.MessagesApi
import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits.global
import models.DAO._
import models.DAO.resources._
import main.scala.utils.{InputParamProc, ReactionActivator}
import scala.concurrent._
import ExecutionContext.Implicits.global

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

/**
 * Created by Sobolev on 22.07.2014.
 */
class ProcessInputController @Inject() (
  val messagesApi: MessagesApi,
  val env: Environment[User2, CookieAuthenticator],
  socialProviderRegistry: SocialProviderRegistry)
  extends Silhouette[User2, CookieAuthenticator] {
  import play.api.Play.current
  import models.DAO.CompositeValues
  implicit val CompositeVReads = Json.reads[CompositeValues]
  implicit val CompositeVWrites = Json.format[CompositeValues]
  implicit val stationReads = Json.reads[BPStationDTO]
  implicit val stationWrites = Json.format[BPStationDTO]

  implicit val logReads = Json.reads[BPLoggerDTO]
  implicit val logWrites = Json.format[BPLoggerDTO]
  implicit val BPSpaceReads = Json.reads[BPSpaceDTO]
  implicit val BPSpaceWrites = Json.format[BPSpaceDTO]
  implicit val SpaceElementReads = Json.reads[SpaceElementDTO]
  implicit val SpaceElementWrites = Json.format[SpaceElementDTO]
  implicit val UndefElementReads = Json.reads[UndefElement]
  implicit val UndefElementWrites = Json.format[UndefElement]
  implicit val InputParamReads = Json.reads[InputParams]
  implicit val InputParamWrites = Json.format[InputParams]
  implicit val ReactionActivatorReads = Json.reads[ReactionActivator]
  implicit val ReactionActivatorWrites = Json.format[ReactionActivator]
  implicit val inLoggerReads = Json.reads[InputLogger]
  implicit val inLoggerWrites = Json.format[InputLogger]


// POST         /bprocess/:bpID/invoke
def invoke(bpID: Int)  = SecuredAction.async { implicit request =>
    if (security.BRes.procIsOwnedByBiz(request.identity.businessFirst, bpID)) {
      val userId = request.identity.emailFilled
      val langF = models.AccountsDAOF.getRolesAndLang(userId)
      val costsF = ElementResourceDAOF.getByProcess(bpID)
      costsF.flatMap { costs =>
        val costPipeFn = pipes.ElementResourceBuilderPipe.apply(costs.toList)
        val pipesList:List[LaunchMapPipe => ExecutedLaunchCVPipes] = List(costPipeFn)
        langF.flatMap { langOpt =>
          val lang = langOpt.get._3
          service.BuildF.run(bpID, Some(lang), invoke = true, pipesList).map { process =>
             //runned match {
              //case Some(process) => {
                action(request.identity.emailFilled, process = Some(bpID), ProcHisCom.processLaunched, None, None)
                Ok(Json.toJson(Map("success" -> "station_id", "session" -> process.session_id.toString)))
              //}
              //case _ => Ok(Json.toJson(Map("error" -> "Error output")))
              //}
          }
        }
      }
    } else { Future.successful(
      Forbidden(Json.obj("status" -> "Access denied"))
    )
   }
}






// POST         /bprocess/:bpID/invoke_from/:station_id
def invokeFrom(session_id: Int, bpID: Int) = SecuredAction(BodyParsers.parse.json) { implicit request =>
    if (security.BRes.procIsOwnedByBiz(request.identity.businessFirst, bpID)) {



      val pmsResult = request.body.validate[List[ReactionActivator]]

    /*
    case class InputLogger(var id: Option[Int],
      uid:Option[String]=None,
      action:String,
      arguments:List[String],
      front_elem_id:Option[Int],
      space_elem_id:Option[Int],
      date: org.joda.time.DateTime,
      station: Int)*/
     // TODO: Input logger for reaction
    val input_logs = pmsResult.map{
                              case entity => entity.map { pm =>
                                  InputLogger(None,
                                    uid = request.identity.email,
                                    action = "input", // TODO: Add reaction title
                                    arguments = List.empty[String],
                                    reaction = pm.reaction_id,
                                    input = None,
                                    org.joda.time.DateTime.now,
                                    session_id)
                                }
      }

    if (controlles.launches.LaunchStack.push(launchId = session_id)) {
       controllers.UserActor.updateLaunchLock(target="lock", email=request.identity.emailFilled, isLock=true, launchId=session_id)

    InputLoggerDAO.pull_for_input(input_logs.get)
        // case class InputParamProc(felem: Option[Int], selem: Option[Int], param: String, args: List[String])
       /*
        val genparams = pmsResult.map{
          case entity => {
               entity.map { t =>
                InputParamProc(t.f_elem, t.sp_elem, t.param, t.arguments.getOrElse(List.empty[String]))
                }
          }
        }*/
    service.Build.newRunFrom(session_id = session_id,bpID = bpID, params = pmsResult.get, invoke = true) match {
      case Some(process) => {
       action(request.identity.emailFilled, process = Some(bpID), ProcHisCom.processResumed, None, None)
       controlles.launches.LaunchStack.pop(launchId = session_id)
       controllers.UserActor.updateLaunchLock(target="lock", email=request.identity.emailFilled, isLock=true, launchId=session_id)

       Ok(Json.toJson(Map("success" -> process.session_id)))
      }
      case _ => BadRequest(Json.toJson(Map("error" -> "Error output")))
    }
   } else { // already launching
      BadRequest(Json.toJson(Map("error" -> "Already launching")))
   }

  } else { Forbidden(Json.obj("status" -> "Access denied")) }
}

def inputLogs(BPid: Int) = Action { implicit request =>
    Ok(Json.toJson(InputLoggerDAO.getByBP(BPid)))
}
def inputLogsBySession(BPid: Int, session_id:Int) = Action.async { implicit request =>
    InputLoggerDAOF.getBySession(session_id).map { loggers =>
      Ok(Json.toJson( loggers ))
    }
}

def schemes(BPid: Int, station_id: Int) = SecuredAction { implicit request =>
    if (security.BRes.procIsOwnedByBiz(request.identity.businessFirst, BPid)) {


    val logs = BPLoggerDAOF.findByStation(station_id)
    val elem_logs_ids = logs.diff(List(logs.last)).filter(log => log.element.isDefined).map(_.element)
    val space_logs_ids = logs.diff(List(logs.last)).filter(log => log.space_elem.isDefined).map(_.space_elem)
    // USER PERM IF ACTOR
    val owner_email = BPDAO.findOwnerByBP(BPid)
    val admins:List[String] = List(owner_email)//Employee.findAdminByBP(BPid)
    val actors = EmployeeDAO.getAllByMaster(owner_email)
    val permited_elems = ActPermissionDAO.getByUID(request.identity.emailFilled)

    if (isActor(request.identity.emailFilled, actors)) {
    Ok(
      Json.toJson(
        Map("proc_elems" -> Json.toJson(ProcElemDAO.findByBPId(BPid).filter(elem => !elem_logs_ids.contains(elem.id) && permited_elems.flatMap(_.front_elem_id).contains(elem.id)   ) ),
            "space_elems" -> Json.toJson(SpaceElemDAO.findByBPId(BPid).filter(elem => !space_logs_ids.contains(elem.id) && permited_elems.flatMap(_.space_elem_id).contains(elem.id)   ) ))
        )
      )
    }
    if (isAdmin(request.identity.emailFilled, admins)) {
      Ok(
      Json.toJson(
        Map("proc_elems" -> Json.toJson(ProcElemDAO.findByBPId(BPid).filter(elem => !elem_logs_ids.contains(elem.id)  ) ),
            "space_elems" -> Json.toJson(SpaceElemDAO.findByBPId(BPid).filter(elem => !space_logs_ids.contains(elem.id) ) ))
        )
      )
    }
    else {
      BadRequest(Json.toJson(Map("error" -> "Forbidden")))
    }
} else { Forbidden(Json.obj("status" -> "Access denied")) }
}

def isActor(email:String, actors: List[EmployeeDTO]):Boolean = {
    actors.map(_.master_acc).contains(email)
}
def isAdmin(email:String, admins: List[String]):Boolean = {
    admins.contains(email)
}
private def action(acc: String,
  process: Option[Int],
  action: String,
  what: Option[String]=None,
  what_id: Option[Int]=None):Future[Int] = {
      ProcHistoryDAOF.pull(ProcessHistoryDTO(
        None, acc, action, process, what, what_id, org.joda.time.DateTime.now() ))
}

/**
* Halt
*/
}

case class InputParams(f_elem:Option[Int] = None,
                       sp_elem:Option[Int] = None,
                       param:String,
                       arguments:Option[List[String]] = None)
