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


case class RefElemContainer(title: String, desc: String = "", business: Int, process: Int, ref: Int, space_id: Option[Int]= None)


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
      BadRequest(Json.obj("status" ->"KO", "message" -> JsError.toFlatJson(errors)))
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
          BadRequest(Json.obj("status" ->"KO", "message" -> JsError.toFlatJson(errors)))
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

def allElements(process_ids: List[Int]) = SecuredAction.async { implicit request =>
  val securedProcessIdsF = security.BRes.processesIdsIsOwnedByBiz(request.identity.businessFirst, process_ids)

  securedProcessIdsF.map { securedProcessIds =>
    val allElementCn = securedProcessIds.map { processId =>
      val topologs_dto = ElemTopologDAO.findByBP(processId)
      Logger.debug(s"topos quantity are $topologs_dto.length")
      val topologs:List[ElementTopologyWrapper] = topologs_dto.filter(topo => topo.front_elem_id.isDefined).map { topolog =>
          val element = ProcElemDAO.findById(topolog.front_elem_id.get).get
          ElementTopologyWrapper(topo_id = topolog.id.get, element_id = element.id.get, element_title = element.title, space_element = false)
      } ++ topologs_dto.filter(topo => topo.space_elem_id.isDefined).map { topolog =>
          val element = SpaceElemDAO.findById(topolog.space_elem_id.get).get
          ElementTopologyWrapper(topo_id = topolog.id.get, element_id = element.id.get, element_title = element.title, space_element = true)
      }
      AllProcessElementsContainer(processId = processId,
        elements = ProcElemDAO.findByBPId(processId),
        spaces = BPSpaceDAO.findByBPId(processId) ,
        space_elements = SpaceElemDAO.findByBPId(processId),
        element_topos = topologs_dto
      )
    }
    Ok(Json.toJson(allElementCn) )
  }
}

/* Index */
def frontElems(id: Int) = SecuredAction { implicit request =>
    if (security.BRes.procIsOwnedByBiz(request.identity.businessFirst, id)) {
        Ok(Json.toJson(ProcElemDAO.findByBPId(id)))
    } else { Forbidden(Json.obj("status" -> "Access denied")) }
}
def show_elem_length(id: Int):Int = { ProcElemDAO.findLengthByBPId(id) }

def bpElemLength() = SecuredAction { implicit request =>
    val bps = BPDAO.getAll // TODO: Weak perm
    val elms = ProcElemDAO.getAll
    val spelms = SpaceElemDAO.getAll
    def all_length(id: Int):Int = elms.filter(_.bprocess == id).length + spelms.filter(_.bprocess == id).length
    Ok(Json.toJson(
      Map(bps.map(bp => (bp.id.get.toString -> all_length(bp.id.get))) map {s => (s._1, s._2)} : _*)//show_elem_length(bp.id.get))) map {s => (s._1, s._2)} : _*)
      ))
}
def spaces(id: Int) = SecuredAction { implicit request =>
      if (security.BRes.procIsOwnedByBiz(request.identity.businessFirst, id)) {
            Ok(Json.toJson(BPSpaceDAO.findByBPId(id)))
      } else { Forbidden(Json.obj("status" -> "Access denied")) }
}
def spaceElems(id: Int) = SecuredAction { implicit request =>
    if (security.BRes.procIsOwnedByBiz(request.identity.businessFirst, id)) {
          Ok(Json.toJson(SpaceElemDAO.findByBPId(id)))
    } else { Forbidden(Json.obj("status" -> "Access denied")) }
}
/**
 * Forms
 */
def generateCV(a: String):Some[CompositeValues] = {
  Some(CompositeValues())
}


val UndefElementForm = Form(
    mapping(
      "id" -> optional(number),
      "title" -> nonEmptyText,
      "desc" -> text,
      "business" -> number,
      "bprocess" -> number,
      "b_type" -> nonEmptyText,
      "type_title" -> nonEmptyText,
      "space_own" -> optional(number),
      "order" -> number,
      "created_at" -> optional(jodaDate),
      "updated_at" -> optional(jodaDate)
      )(UndefElement.apply)(UndefElement.unapply))
/*
id: Option[Int],
                      bprocess: Int,
                      index:Int,
                      container:Boolean,
                      subbrick:Boolean,
                      brick_front:Option[Int]=None,
                      brick_nested:Option[Int]=None,
                      nestingLevel: Int = 1
                      */
val BPSpaceForm = Form(
    mapping(
      "id" -> optional(number),
      "bprocess" -> number,
      "index" -> number,
      "container" -> boolean,
      "subbrick" -> boolean,
      "brick_front" -> optional(number),
      "brick_nested" -> optional(number),
      "nestingLevel" -> number,
      "created_at" -> optional(jodaDate),
      "updated_at" -> optional(jodaDate))(BPSpaceDTO.apply)(BPSpaceDTO.unapply))
/*
id: Option[Int],
                        title:String,
                        desc:String,
                        business:Int,
                        bprocess:Int,
                        b_type:String,
                        type_title:String,
                        space_own:Option[Int],
                        space_owned: Int,
                        space_role:Option[String],
                        order:Int,
                        comps: Option[List[CompositeValues]]
                        */
val SpaceElementForm = Form(
    mapping(
      "id" -> optional(number),
      "title" -> nonEmptyText,
      "desc" -> text,
      "business" -> number,
      "bprocess" -> number,
      "b_type" -> nonEmptyText,
      "type_title" -> nonEmptyText,
      "space_own" -> optional(number),
      "space_owned" -> number,
      "space_role" -> optional(text),
      "order" -> number,
      "created_at" -> optional(jodaDate),
      "updated_at" -> optional(jodaDate))(SpaceElementDTO.apply)(SpaceElementDTO.unapply))




def createFrontElem() = SecuredAction.async(BodyParsers.parse.json) { implicit request =>

request.body.validate[RefElemContainer].map {
  case entity => {
         if (security.BRes.procIsOwnedByBiz(request.identity.businessFirst, entity.process)) {
            haltActiveStations(entity.process)
            RefDAOF.retrive(entity.ref,
                           entity.process,
                           entity.business,
                           in = "front",
                           entity.title,
                           entity.desc,
                           space_id = None).map { retrived =>
                              retrived match {//ProcElemDAO.pull_object(entity) match {
                                case None =>  Ok(Json.toJson(Map("failure" ->  s"Could not create front element ${entity.title}")))
                                case ref_resulted =>  {
                                  val element_result = ref_resulted
                                  val elem_id = element_result match {
                                    case Some(res) => res.proc_elems.headOption
                                    case _ => None
                                }
                              action(request.identity.emailFilled, process = Some(entity.process),
                                action = ProcHisCom.elementCreated,
                                what = Some(entity.title),
                                what_id = elem_id)
                              Ok(Json.toJson(Map("success" ->  Json.toJson(ref_resulted))))
                            }
                          }
          }
        } else { Future( Forbidden(Json.obj("status" -> "Access denied")) ) }
    }
    }.recoverTotal{
      e => Future( BadRequest("formWithErrors") )
    }
}
def createSpace() = SecuredAction(BodyParsers.parse.json) { implicit request =>
  val placeResult = request.body.validate[BPSpaceDTO]
   request.body.validate[BPSpaceDTO].map{
    case entity => {
            if (security.BRes.procIsOwnedByBiz(request.identity.businessFirst, entity.bprocess)) {
            haltActiveStations(entity.bprocess);BPSpaceDAO.pull_object(entity) match {
            case -1 =>  Ok(Json.toJson(Map("failure" ->  s"Could not create space ${entity.index}")))
            case id =>  Ok(Json.toJson(Map("success" ->  id)))
          }
    } else { Forbidden(Json.obj("status" -> "Access denied")) }
    }
    }.recoverTotal{
      e => BadRequest("formWithErrors")
    }
}

def createSpaceElem() = SecuredAction.async(BodyParsers.parse.json) { implicit request =>
//RefDAO.retrive(k: Int, entity.bprocess, entity.business, in = "nested", entity.title, entity.desc, space_id: Option[Int] = None)
//models.DAO.reflect.RefResulted
  val placeResult = request.body.validate[RefElemContainer]
    request.body.validate[RefElemContainer].map{
    case entity => Logger.debug(s"entity are $entity")
  }
  request.body.validate[RefElemContainer].map{
      case entity => {
            if (security.BRes.procIsOwnedByBiz(request.identity.businessFirst, entity.process)) {
                haltActiveStations(entity.process);
                 RefDAOF.retrive(entity.ref,
                                 entity.process,
                                 entity.business,
                                 in = "nested",
                                 entity.title,
                                 entity.desc,
                                 entity.space_id).map { retrived =>
                                retrived match { //SpaceElemDAO.pull_object(entity) match {
                                  case None =>  Ok(Json.toJson(Map("failure" ->  s"Could not create space element ${entity.title}")))
                                  case ref_resulted =>   {
                                    val element_result = ref_resulted
                                    val elem_id = element_result match {
                                      case Some(res) => res.space_elems.headOption
                                      case _ => None
                                    }
                                    action(request.identity.emailFilled, process = Some(entity.process),
                                      action = ProcHisCom.spaceElementCreated,
                                      what = Some(entity.title),
                                      what_id = elem_id)
                                    Ok(Json.toJson(Map("success" ->  Json.toJson(ref_resulted))))
                                  }
                                }
                  }
          } else { Future(Forbidden(Json.obj("status" -> "Access denied"))) }
      }
    }.recoverTotal{
      e => Future(BadRequest("formWithErrors"))
    }
}



/* Update */
def updateFrontElem(bpId: Int, elem_id: Int) = SecuredAction(BodyParsers.parse.json) { implicit request =>
  request.body.validate[UndefElement].map{
    case entity => {
          if (security.BRes.procIsOwnedByBiz(request.identity.businessFirst, entity.bprocess)) {
              ProcElemDAO.update(elem_id,entity) match {
                case -1   =>  Ok(Json.toJson(Map("failure" ->  s"Could not update front element ${entity.title}")))
                case _@id => {
                 action(request.identity.emailFilled, process = Some(entity.bprocess),
                  action = ProcHisCom.elementRenamed, what = Some(entity.title), what_id = Some(id))
                 Ok(Json.toJson(entity.id))
                }
              }
          } else { Forbidden(Json.obj("status" -> "Access denied")) }
    }
    }.recoverTotal{
      e => BadRequest("formWithErrors")
    }
}

def updateSpace(id: Int, space_id: Int) = SecuredAction(BodyParsers.parse.json) { implicit request =>
  request.body.validate[BPSpaceDTO].map{
    case entity => {
        if (security.BRes.procIsOwnedByBiz(request.identity.businessFirst, entity.bprocess)) {

           BPSpaceDAO.update(space_id,entity) match {
            case -1 =>  Ok(Json.toJson(Map("failure" ->  s"Could not update space ${entity.id}")))
            case _@x =>  Ok(Json.toJson(entity.id))
          }
        } else { Forbidden(Json.obj("status" -> "Access denied")) }
    }
    }.recoverTotal{
      e => BadRequest("formWithErrors")
    }
}
def updateSpaceElem(id: Int, spelem_id: Int) = SecuredAction(BodyParsers.parse.json) { implicit request =>
  request.body.validate[SpaceElementDTO].map{
    case entity => {
        if (security.BRes.procIsOwnedByBiz(request.identity.businessFirst, entity.bprocess)) {
             SpaceElemDAO.update(spelem_id,entity) match {
                case false =>  Ok(Json.toJson(Map("failure" ->  s"Could not update space element ${entity.title}")))
                case _ => {
                 action(request.identity.emailFilled, process = Some(entity.bprocess),
                  action = ProcHisCom.spaceElementRenamed, what = Some(entity.title), what_id = Some(id))

                 Ok(Json.toJson(entity.id))
                }
             }
        } else { Forbidden(Json.obj("status" -> "Access denied")) }
    }
  }.recoverTotal{
      e => BadRequest("formWithErrors")
    }
}

def moveUpFrontElem(bpId: Int, elem_id: Int) = SecuredAction(BodyParsers.parse.json) { implicit request =>
    if (security.BRes.procIsOwnedByBiz(request.identity.businessFirst, bpId)) {
          ProcElemDAO.moveUp(bpId, elem_id)
          action(request.identity.emailFilled, process = Some(bpId),
           action = ProcHisCom.elementMovedUp, what = Some(ProcHisCom.elementMovedUp), what_id = Some(elem_id))

          Ok(Json.toJson("moved"))
    } else { Forbidden(Json.obj("status" -> "Access denied")) }

}
def moveDownFrontElem(bpId: Int, elem_id: Int) = SecuredAction(BodyParsers.parse.json) { implicit request =>
    if (security.BRes.procIsOwnedByBiz(request.identity.businessFirst, bpId)) {
      ProcElemDAO.moveDown(bpId, elem_id)
      action(request.identity.emailFilled, process = Some(bpId),
        action = ProcHisCom.elementDown, what = Some(ProcHisCom.elementDown), what_id = Some(elem_id))

      Ok(Json.toJson("moved"))
    } else { Forbidden(Json.obj("status" -> "Access denied")) }
}
def moveUpSpaceElem(id: Int, spelem_id: Int, space_id: Int) = SecuredAction(BodyParsers.parse.json) { implicit request =>
    val process_id = id
    if (security.BRes.procIsOwnedByBiz(request.identity.businessFirst, process_id)) {
      SpaceElemDAO.moveUp(id, spelem_id, space_id)
      action(request.identity.emailFilled, process = Some(process_id),
        action = ProcHisCom.spaceElementMovedUp, what = Some(ProcHisCom.spaceElementMovedUp), what_id = Some(spelem_id))

      Ok(Json.toJson("moved"))
    } else { Forbidden(Json.obj("status" -> "Access denied")) }
}
def moveDownSpaceElem(id: Int, spelem_id: Int, space_id: Int) = SecuredAction(BodyParsers.parse.json) { implicit request =>
    val process_id = id
    if (security.BRes.procIsOwnedByBiz(request.identity.businessFirst, process_id)) {
      SpaceElemDAO.moveDown(id, spelem_id, space_id)
      action(request.identity.emailFilled, process = Some(process_id),
        action = ProcHisCom.spaceElementMovedDown, what = Some(ProcHisCom.spaceElementMovedDown), what_id = Some(spelem_id))

      Ok(Json.toJson("moved"))
    } else { Forbidden(Json.obj("status" -> "Access denied")) }
}





/* Delete */
def deleteFrontElem(bpID: Int, elem_id: Int) = SecuredAction { implicit request =>
    if (security.BRes.procIsOwnedByBiz(request.identity.businessFirst, bpID)) {
      val elem = ProcElemDAO.findById(elem_id).get

      haltActiveStations(bpID);ProcElemDAO.delete(elem_id) match {
            case 0 =>  Ok(Json.toJson(Map("failure" -> "Entity has Not been deleted")))
            case x =>  {
              deleteOwnedSpace(elem_id = Some(elem_id), spelem_id = None);
              action(request.identity.emailFilled, process = Some(bpID),
                action = ProcHisCom.elementDeleted, what = Some(elem.title), what_id = Some(elem_id))

              Ok(Json.toJson(Map("success" -> s"Entity has been deleted (deleted $x row(s))")))
            }
          }
     } else { Forbidden(Json.obj("status" -> "Access denied")) }
}
def deleteSpace(bpID: Int, space_id: Int) = SecuredAction { implicit request =>
    if (security.BRes.procIsOwnedByBiz(request.identity.businessFirst, bpID)) {

    haltActiveStations(bpID);BPSpaceDAO.delete(space_id) match {
        case 0 =>  Ok(Json.toJson(Map("failure" -> "Entity has Not been deleted")))
        case x =>  Ok(Json.toJson(Map("success" -> s"Entity has been deleted (deleted $x row(s))")))
      }
    } else { Forbidden(Json.obj("status" -> "Access denied")) }
}
def deleteSpaceElem(bpID: Int, spelem_id: Int) = SecuredAction { implicit request =>
    if (security.BRes.procIsOwnedByBiz(request.identity.businessFirst, bpID)) {
      val spelem = SpaceElemDAO.findById(spelem_id).get
      haltActiveStations(bpID)
      SpaceElemDAO.delete(spelem_id) match {
        case 0 =>  Ok(Json.toJson(Map("failure" -> "Entity has Not been deleted")))
        case x =>  {
          deleteOwnedSpace(elem_id = None, spelem_id = Some(spelem_id))
          action(request.identity.emailFilled, process = Some(bpID),
            action = ProcHisCom.spaceElementDeleted, what = Some(spelem.title), what_id = Some(spelem_id))

          Ok(Json.toJson(Map("success" -> s"Entity has been deleted (deleted $x row(s))")))
        }
      }
    } else { Forbidden(Json.obj("status" -> "Access denied")) }
}


/**
 * Element topology
 */

def element_topos(id: Int) = SecuredAction { implicit request =>
  if (security.BRes.procIsOwnedByBiz(request.identity.businessFirst, id)) {
      val topologs_dto = ElemTopologDAO.findByBP(id)
      Logger.debug(s"topos quantity are $topologs_dto.length")
      val topologs:List[ElementTopologyWrapper] = topologs_dto.filter(topo => topo.front_elem_id.isDefined).map { topolog =>
          val element = ProcElemDAO.findById(topolog.front_elem_id.get).get
          ElementTopologyWrapper(topo_id = topolog.id.get, element_id = element.id.get, element_title = element.title, space_element = false)
        } ++ topologs_dto.filter(topo => topo.space_elem_id.isDefined).map { topolog =>
          val element = SpaceElemDAO.findById(topolog.space_elem_id.get).get
          ElementTopologyWrapper(topo_id = topolog.id.get, element_id = element.id.get, element_title = element.title, space_element = true)
        }
      Ok(Json.toJson(topologs))
  } else { Forbidden(Json.obj("status" -> "Access denied")) }
}










/**
 * State, reactions, switchers
 **/
def state_index(BPid: Int) = SecuredAction { implicit request =>
  if (security.BRes.procIsOwnedByBiz(request.identity.businessFirst, BPid)) {
    Ok(Json.toJson(BPStateDAO.findByBP(BPid)))
  } else { Forbidden(Json.obj("status" -> "Access denied")) }
}
def state_session_index(BPid: Int, session_id: Int) = SecuredAction { implicit request =>
  if (security.BRes.procIsOwnedByBiz(request.identity.businessFirst, BPid)) {
    Ok(Json.toJson(BPSessionStateDAO.findByBPAndSession(BPid, session_id)))
  } else { Forbidden(Json.obj("status" -> "Access denied")) }
}
def update_session_state(BPid: Int, session_id: Int, state_id: Int) = SecuredAction { implicit request =>
  if (security.BRes.procIsOwnedByBiz(request.identity.businessFirst, BPid)) {
    Ok(Json.toJson("Ok"))
  } else { Forbidden(Json.obj("status" -> "Access denied")) }
}
def delete_session_state(BPid: Int, session_id: Int, state_id: Int) = SecuredAction { implicit request =>
  if (security.BRes.procIsOwnedByBiz(request.identity.businessFirst, BPid)) {
    Ok(Json.toJson("Ok"))
  } else { Forbidden(Json.obj("status" -> "Access denied")) }
}
def update_state(BPid: Int, state_id: Int) = SecuredAction { implicit request =>
  if (security.BRes.procIsOwnedByBiz(request.identity.businessFirst, BPid)) {
    Ok(Json.toJson("Ok"))
  } else { Forbidden(Json.obj("status" -> "Access denied")) }
}
def delete_state(BPid: Int, state_id: Int) = SecuredAction { implicit request =>
  if (security.BRes.procIsOwnedByBiz(request.identity.businessFirst, BPid)) {
     Ok(Json.toJson("Ok"))
  } else { Forbidden(Json.obj("status" -> "Access denied")) }
}
def switches_index(BPid: Int) = SecuredAction { implicit request =>
  if (security.BRes.procIsOwnedByBiz(request.identity.businessFirst, BPid)) {
     Ok(Json.toJson(SwitcherDAO.findByBPId(BPid)))
  } else { Forbidden(Json.obj("status" -> "Access denied")) }

}
def update_switcher(id: Int) = SecuredAction { implicit request =>
  Ok(Json.toJson("Ok"))
}
def delete_switcher(id: Int) = SecuredAction { implicit request =>
  Ok(Json.toJson("Ok"))
}
def reactions_index(BPid: Int) = SecuredAction { implicit request =>
  if (security.BRes.procIsOwnedByBiz(request.identity.businessFirst, BPid)) {
    Ok(Json.toJson(ReactionDAO.findByBP(BPid).map(react => ReactionCollection(react, ReactionStateOutDAO
    findByReaction(react.id.get)))))
  } else { Forbidden(Json.obj("status" -> "Access denied")) }
}
def update_reaction(id: Int) = SecuredAction { implicit request =>
  Ok(Json.toJson("Ok"))
}
def delete_reaction(id: Int) = SecuredAction { implicit request =>
  Ok(Json.toJson("Ok"))
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
  ProcHistoryDAO.pull_object(ProcessHistoryDTO(
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

def embed() = {
  ???
}
private def deleteOwnedSpace(elem_id:Option[Int],spelem_id:Option[Int]) {
  if (elem_id.isDefined) {
    BPSpaceDAO.deleteOwnedSpace(elem_id,spelem_id)
  }
  if (spelem_id.isDefined) {
    BPSpaceDAO.deleteOwnedSpace(elem_id,spelem_id)
  }
}


}
