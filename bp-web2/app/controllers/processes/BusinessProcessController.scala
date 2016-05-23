package controllers

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
import play.api.Logger

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

import main.scala.bprocesses._
import main.scala.simple_parts.process.Units._
import models.DAO.reflect._
import models.DAO.conversion._
import cloner.util._
import scala.concurrent.ExecutionContext.Implicits.global
import scala.concurrent.duration.Duration
import scala.concurrent.{ExecutionContext, Awaitable, Await, Future}
import scala.util.Try


import models.DAO.reflect._


case class RefElemContainer(title: String,
                            desc: String = "",
                            business: Int,
                            process: Int,
                            ref: Int,
                            space_id: Option[Int]= None,
                            refActionContainer: List[RefActionContainer] = List()
                          )


case class ReactionCollection(reaction: UnitReaction,
reaction_state_outs: List[UnitReactionStateOut])
case class ElementTopologyWrapper(topo_id: Int, element_id: Int, element_title: String, space_element: Boolean = false)

case class AllProcessElementsContainer(processId: Int,
  elements: List[UndefElement],
  spaces: List[BPSpaceDTO],
  space_elements: List[SpaceElementDTO],
  element_topos: List[ElemTopology]
)

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

class BusinessProcessController @Inject() (
  val messagesApi: MessagesApi,
  val env: Environment[User2, CookieAuthenticator],
  socialProviderRegistry: SocialProviderRegistry)
  extends Silhouette[User2, CookieAuthenticator] {


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
  implicit val BProcessDTOReads = Json.reads[BProcessDTO]
  implicit val BProcessDTOWrites = Json.format[BProcessDTO]
  implicit val StationNoteReads = Json.reads[StationNoteMsg]
  implicit val StationNoteWrites = Json.format[StationNoteMsg]

  implicit val BaseContainerReads = Json.reads[BaseContainer]
  implicit val BaseContainerWrites = Json.format[BaseContainer]



  implicit val RefActionContainerReads = Json.reads[RefActionContainer]
  implicit val RefActionContainerWrites = Json.format[RefActionContainer]
  implicit val RefElemContainerReads = Json.reads[RefElemContainer]
  implicit val RefElemContainerWrites = Json.format[RefElemContainer]
  implicit val RefResultedReads = Json.reads[models.DAO.reflect.RefResulted]
  implicit val RefResultedWrites = Json.format[models.DAO.reflect.RefResulted]
  implicit val SessionElementsReads = Json.reads[SessionElements]
  implicit val SessionElementsFormat = Json.format[SessionElements]
  implicit val BPSessionStateReads = Json.reads[BPSessionState]
  implicit val BPSessionStateWrites = Json.format[BPSessionState]
  implicit val BPStateReads = Json.reads[BPState]
  implicit val BPStateWrites = Json.format[BPState]
  implicit val UnitSwitcherReads = Json.reads[UnitSwitcher]
  implicit val UnitSwitcherWrites = Json.format[UnitSwitcher]
  implicit val UnitReactionReads = Json.reads[UnitReaction]
  implicit val UnitReactionWrites = Json.format[UnitReaction]
  implicit val UnitReactionStateOutReads = Json.reads[UnitReactionStateOut]
  implicit val UnitReactionStateOutWrites = Json.format[UnitReactionStateOut]
  implicit val ReactionCollectionReads = Json.reads[ReactionCollection]
  implicit val ReactionCollectionWrites = Json.format[ReactionCollection]
  implicit val ElementTopologyReads = Json.reads[ElemTopology]
  implicit val ElementTopologyWrites = Json.format[ElemTopology]
  implicit val ElementTopologyWrapperReads = Json.reads[ElementTopologyWrapper]
  implicit val ElementTopologyWrapperWrites = Json.format[ElementTopologyWrapper]
  implicit val AllProcessElementsContainerReads = Json.reads[AllProcessElementsContainer]
  implicit val AllProcessElementsContainerWrites = Json.format[AllProcessElementsContainer]

  implicit val CachedRemovedResourceDTOReads = Json.reads[CachedRemovedResourceDTO]
  implicit val CachedRemovedResourceDTOWrites = Json.format[CachedRemovedResourceDTO]
  implicit val DeltasContainerReads = Json.reads[DeltasContainer]
  implicit val DeltasContainerWrites = Json.format[DeltasContainer]


def bprocess = SecuredAction { implicit request =>
    val business = request.identity.businessFirst
    val user_services = BusinessServiceDAO.getAllByBusiness(business).map(_.id.getOrElse(-1))

    val bprocess = BPDAO.getByServices(user_services) // TODO: Not safe
    // TODO: Add for actor, if they assigned to process

    val user = request.identity

    /**
     * Simple employee
     * Restricted by Act Permission
     */
    if (user.isEmployee && !user.isManager) {
       println(request.identity.isEmployee)
       println("Restricted by Act Permission")
       // Employee assigned process
       val acts = ActPermissionDAO.getByUID(request.identity.emailFilled)
       val bpIds = ActPermissionDAO.getByUIDprocIDS(request.identity.emailFilled)
       val procOut = bprocess.filter(bp => bpIds.contains(bp.id.get))
       Ok(Json.toJson( procOut ))
    } else {
      //***
      //** Primary manager processes
      //***
      println("Primary manager processes")
      val procOut = bprocess.filter(bp => user_services.contains(bp.service))
      Ok(Json.toJson( procOut ))
    }
}


def all_cached_bprocess(timestamp: String) = SecuredAction.async { implicit request =>
    val business = request.identity.businessFirst
    val user_services = BusinessServiceDAO.getAllByBusiness(business).map(_.id.getOrElse(-1))

    val bprocess = BPDAOF.getByServices(user_services, Some(timestamp)) // TODO: Not safe
    // TODO: Add for actor, if they assigned to process
    bprocess.flatMap { bprocess =>

    val user = request.identity
    if (user.isEmployee && !user.isManager) {
       println(request.identity.isEmployee)
       println("Restricted by Act Permission")
       // Employee assigned process
       val acts = ActPermissionDAO.getByUID(request.identity.emailFilled)
       val bpIds = ActPermissionDAO.getByUIDprocIDS(request.identity.emailFilled)
       val procOut = bprocess.filter(bp => bpIds.contains(bp.id.get))
       Future.successful(
         Ok(Json.toJson( procOut ))
      )
    } else {
      //** Primary manager processes
      val procOut = bprocess.filter(bp => user_services.contains(bp.service))
      val deltasF = CachedRemovedResourcesDAO
                          .findAllByScope(business.toString,
                            "workbench",
                              "processes",
                              Some(timestamp)
                          )
      deltasF.map { deltas =>

      val deltasJson = Json.toJson( deltas )
      val jsonProcesses = Json.toJson( procOut )
      Ok(
          JsObject(Seq(
            "c" -> jsonProcesses,
            "deltas" -> deltasJson
          ))
      )
    }

    }
    }
}






def copy(bpId: Int, orig_title: String) = SecuredAction { implicit request =>
    if (security.BRes.procIsOwnedByBiz(request.identity.businessFirst, bpId)) {
       val cloned:Int = cloner.util.ProcessCloner.clone(bpId, orig_title)
       cloned match {
         case -1 => BadRequest(Json.toJson(Map("error" -> "Cannot copy process")))
         case id:Int => Ok(Json.toJson(id))
       }
     } else {
          Forbidden(Json.obj("status" -> "Access denied"))
     }
}


def show_bprocess(id: Int) = SecuredAction { implicit request =>
    val business:Int = request.identity.businessFirst
    BPDAO.get(id) match {
      case Some(bprocess) => {
        if (security.BRes.procIsOwnedByBiz(request.identity.businessFirst, id)) {
         Ok(Json.toJson(bprocess))
        } else {
          Forbidden(Json.obj("status" -> "Access denied"))
        }
      }
      case _ => BadRequest(Json.obj("status" -> "Not found"))
    }
}



def create_bprocess = SecuredAction(BodyParsers.parse.json) { request =>
  val bpResult = request.body.validate[BProcessDTO]
  val business:Int = request.identity.businessFirst
    Logger.debug(s"trying create process with $bpResult")
    bpResult.fold(
    errors => {
       Logger.error(s"error with $bpResult")
      BadRequest(Json.obj("status" ->"KO", "message" -> JsError.toJson(errors)))
    },
    bprocess => {
      BPDAO.pull_object(bprocess.copy(business = business)) match {
        case -1 => BadRequest(Json.obj("status" -> "Cannot create process"))
        case _@id:Int => {
          AutoTracer.defaultStatesForProcess(process_id = id)
          utilities.NewUserRoutine.defaultPermsForAnalytics(process_id = id, business = bprocess.business)

          action(request.identity.emailFilled, process = Some(id),
                 action = ProcHisCom.processCreated, what = Some(ProcHisCom.processCreated), what_id = Some(id))

          Ok(Json.obj("status" ->"OK", "message" -> id ))
        }
      }

    }
  )
}
def update_bprocess(id: Int) = SecuredAction(BodyParsers.parse.json) { implicit request =>
    val bpResult = request.body.validate[BProcessDTO]
    val business:Int = request.identity.businessFirst
      bpResult.fold(
        errors => {
          BadRequest(Json.obj("status" ->"KO", "message" -> JsError.toJson(errors)))
        },
        bprocess => {
          if (security.BRes.procIsOwnedByBiz(request.identity.businessFirst, id)) {
               BPDAO.update(id, bprocess.copy(business = business))

              action(request.identity.emailFilled, process = Some(id),
                 action = ProcHisCom.processUpdated, what = Some(ProcHisCom.processUpdated), what_id = Some(id))

              Ok(Json.obj("status" ->"OK", "message" -> ("Bprocess '"+bprocess.title+"' saved.") ))
            } else {
              Forbidden(Json.obj("status" -> "Access denied"))
            }
        }
      )
}

def delete_bprocess(id: Int) = SecuredAction { implicit request =>
     val business:Int = request.identity.businessFirst
     BPDAO.get(id) match {
      case Some(bprocess) => {
        if (security.BRes.procIsOwnedByBiz(request.identity.businessFirst, id)) {
           action(request.identity.emailFilled, process = Some(id),
             action = ProcHisCom.processDeleted, what = Some(ProcHisCom.processDeleted), what_id = Some(id))
           Ok(Json.toJson(BPDAO.delete(id)))
           } else {
           Forbidden(Json.obj("status" -> "Access denied"))
        }
      }
      case _ => BadRequest(Json.obj("status" -> "Not found"))
    }
}


/*
  Histories methods
 */
import ProcHistoryDAO._

// ProcessHistoryDTO(var id: Option[Int],
// acc: String,
// process: Int,
// action: String,
// date: DateTime,
// what: Option[String] = None)
private def action(acc: String, process: Option[Int], action: String, what: Option[String]=None, what_id: Option[Int]=None) = {
  ProcHistoryDAOF.pull(ProcessHistoryDTO(
    None, acc, action, process, what, what_id, org.joda.time.DateTime.now() ))
}
private def haltActiveStations(BPid: Int) = {
    BPDAO.get(BPid) match {
      case Some(bprocess) => {
       BPStationDAO.haltByBPId(BPid)
       }
      case _ => false
    }
}



}
