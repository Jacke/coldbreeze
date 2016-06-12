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
import models.DAO.sessions._
import models.DAO.resources._
import models.DAO.CompositeValues
import play.api.Play.current

import main.scala.bprocesses._
import main.scala.simple_parts.process.Units._
import models.DAO.reflect._
import models.DAO.conversion._
import cloner.util._
import ProcHistoryDAO._
import scala.util.{Success, Failure}
import scala.concurrent._
import scala.concurrent.duration._


case class SessionElementTopologyWrapper(topo_id: Int, element_id: Int, element_title: String, space_element: Boolean = false)
case class SessionReactionCollection(reaction: SessionUnitReaction, reaction_state_outs: List[SessionUnitReactionStateOut])



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

class LaunchElementsControllers @Inject() (
  val messagesApi: MessagesApi,
  val env: Environment[User2, CookieAuthenticator],
  socialProviderRegistry: SocialProviderRegistry)
  extends Silhouette[User2, CookieAuthenticator] {



implicit val SessionElemTopologyReads = Json.reads[SessionElemTopology]
implicit val SessionElemTopologyWrites = Json.format[SessionElemTopology]
implicit val SessionInitialStateReads = Json.reads[SessionInitialState]
implicit val SessionInitialStateWrites = Json.format[SessionInitialState]
implicit val SessionUndefElementReads = Json.reads[SessionUndefElement]
implicit val SessionUndefElementWrites = Json.format[SessionUndefElement]
implicit val SessionUnitReactionReads = Json.reads[SessionUnitReaction]
implicit val SessionUnitReactionWrites = Json.format[SessionUnitReaction]
implicit val SessionUnitReactionStateOutReads = Json.reads[SessionUnitReactionStateOut]
implicit val SessionUnitReactionStateOutWrites = Json.format[SessionUnitReactionStateOut]
implicit val SessionSpaceElementDTOReads = Json.reads[SessionSpaceElementDTO]
implicit val SessionSpaceElementDTOWrites = Json.format[SessionSpaceElementDTO]
implicit val SessionSpaceDTOReads = Json.reads[SessionSpaceDTO]
implicit val SessionSpaceDTOWrites = Json.format[SessionSpaceDTO]
implicit val SessionElementsReads = Json.reads[SessionElements]
implicit val SessionElementsFormat = Json.format[SessionElements]
implicit val BPSessionStateReads = Json.reads[BPSessionState]
implicit val BPSessionStateWrites = Json.format[BPSessionState]
implicit val SessionUnitSwitcherReads = Json.reads[SessionUnitSwitcher]
implicit val SessionUnitSwitcherWrites = Json.format[SessionUnitSwitcher]
implicit val SessionElementTopologyWrapperReads = Json.reads[SessionElementTopologyWrapper]
implicit val SessionElementTopologyWrapperWrites = Json.format[SessionElementTopologyWrapper]
implicit val SessionReactionCollectionReads = Json.reads[SessionReactionCollection]
implicit val SessionReactionCollectionWrites = Json.format[SessionReactionCollection]

/* Index */
def frontElems(launch_id: Int) = SecuredAction { implicit request =>
    if (security.BRes.launchIsOwnedByBiz(request.identity.businessFirst, launch_id)) {
      val frontLaunchElements = SessionProcElementDAO.findBySession(launch_id)
      val frontLaunchElementsWithTopos = decorateProcElementsToJson(frontLaunchElements)
        Ok(Json.toJson( frontLaunchElementsWithTopos) )
    } else { Forbidden(Json.obj("status" -> "Access denied")) }
}
def show_elem_length(launch_id: Int):Int = { SessionProcElementDAO.findLengthByBPId(launch_id) }

def bpElemLength() = SecuredAction { implicit request =>
    val bps    = BPDAOF.getAll // TODO: Weak perm
    val elms   = SessionProcElementDAO.getAll
    val spelms = SessionProcElementDAO.getAll
    def all_length(id: Int):Int = elms.filter(_.bprocess == id).length + spelms.filter(_.bprocess == id).length
    Ok(Json.toJson(
      Map(bps.map(bp => (bp.id.get.toString -> all_length(bp.id.get))) map {s => (s._1, s._2)} : _*)//show_elem_length(bp.id.get))) map {s => (s._1, s._2)} : _*)
      ))
}
def spaces(launch_id: Int) = SecuredAction { implicit request =>
      if (security.BRes.launchIsOwnedByBiz(request.identity.businessFirst, launch_id)) {
            Ok(Json.toJson(SessionSpaceDAO.findBySession(launch_id)))
      } else { Forbidden(Json.obj("status" -> "Access denied")) }
}
def spaceElems(launch_id: Int) = SecuredAction { implicit request =>
    if (security.BRes.launchIsOwnedByBiz(request.identity.businessFirst, launch_id)) {
          Ok(Json.toJson(SessionSpaceElemDAO.findBySession(launch_id)))
    } else { Forbidden(Json.obj("status" -> "Access denied")) }
}
/**
 * Element topology
 */
def element_topos(launch_id: Int) = SecuredAction.async { implicit request =>
  if (security.BRes.launchIsOwnedByBiz(request.identity.businessFirst, launch_id)) {
      val topologs_dtoF = SessionElemTopologDAOF.getAllBySession(launch_id)
      topologs_dtoF.flatMap { topologs_dto =>
        Logger.debug(s"topos quantity are $topologs_dto.length")
        val topologsF:Future[List[SessionElementTopologyWrapper]] = Future.sequence(topologs_dto.filter(topo => topo.front_elem_id.isDefined).map { topolog =>
            SessionProcElementDAOF.findById(topolog.front_elem_id.get).map { elementOpt =>
              val element = elementOpt.get
              SessionElementTopologyWrapper(
               topo_id = topolog.id.get,
               element_id = element.id.get,
               element_title = element.title,
               space_element = false)
             }
          }.toList ++ topologs_dto.filter(topo => topo.space_elem_id.isDefined).map { topolog =>
            SessionSpaceElemDAOF.findById(topolog.space_elem_id.get).map { elementOpt =>
              val element = elementOpt.get
              SessionElementTopologyWrapper(
                topo_id = topolog.id.get,
                element_id = element.id.get,
                element_title = element.title,
                space_element = true)
            }
          }.toList)
          topologsF.map { topologs =>
            Ok(Json.toJson(topologs))
          }
        }
  } else { Future.successful( Forbidden(Json.obj("status" -> "Access denied")) ) }
}

/**
 * State, reactions, switchers
 **/
def state_index(launch_id: Int) = SecuredAction { implicit request =>
  if (security.BRes.launchIsOwnedByBiz(request.identity.businessFirst, launch_id)) {
    Ok(Json.toJson(SessionInitialStateDAO.findBySession(launch_id)))
  } else { Forbidden(Json.obj("status" -> "Access denied")) }
}

def state_session_index(launch_id: Int) = SecuredAction { implicit request =>
  if (security.BRes.launchIsOwnedByBiz(request.identity.businessFirst, launch_id)) {
    Ok(Json.toJson(BPSessionStateDAOF.findBySession(launch_id)))
  } else { Forbidden(Json.obj("status" -> "Access denied")) }
}

def switches_index(launch_id: Int) = SecuredAction { implicit request =>
  if (security.BRes.launchIsOwnedByBiz(request.identity.businessFirst, launch_id)) {
     Ok(Json.toJson(SessionSwitcherDAO.findBySession(launch_id)))
  } else { Forbidden(Json.obj("status" -> "Access denied")) }

}
def reactions_index(launch_id: Int) = SecuredAction { implicit request =>
  if (security.BRes.launchIsOwnedByBiz(request.identity.businessFirst, launch_id)) {
    Ok(Json.toJson(SessionReactionDAO.findBySession(launch_id).map(react => SessionReactionCollection(react,
    	SessionReactionStateOutDAO.findByReaction(react.id.get)))))
  } else { Forbidden(Json.obj("status" -> "Access denied")) }
}






/**
 * Not used stuff for CUD Operations
 */

def moveUpFrontElem(bpId: Int, elem_id: Int) = SecuredAction(BodyParsers.parse.json) { implicit request =>
    if (security.BRes.procIsOwnedByBiz(request.identity.businessFirst, bpId)) {
          SessionProcElementDAO.moveUp(bpId, elem_id)
          action(request.identity.emailFilled, process = Some(bpId),
           action = ProcHisCom.elementMovedUp, what = Some(ProcHisCom.elementMovedUp), what_id = Some(elem_id))

          Ok(Json.toJson("moved"))
    } else { Forbidden(Json.obj("status" -> "Access denied")) }

}
def moveDownFrontElem(bpId: Int, elem_id: Int) = SecuredAction(BodyParsers.parse.json) { implicit request =>
    if (security.BRes.procIsOwnedByBiz(request.identity.businessFirst, bpId)) {
      SessionProcElementDAO.moveDown(bpId, elem_id)
      action(request.identity.emailFilled, process = Some(bpId),
        action = ProcHisCom.elementDown, what = Some(ProcHisCom.elementDown), what_id = Some(elem_id))

      Ok(Json.toJson("moved"))
    } else { Forbidden(Json.obj("status" -> "Access denied")) }
}
def moveUpSpaceElem(id: Int, spelem_id: Int, space_id: Int) = SecuredAction(BodyParsers.parse.json) { implicit request =>
    val process_id = id
    if (security.BRes.procIsOwnedByBiz(request.identity.businessFirst, process_id)) {
      SessionSpaceElemDAO.moveUp(id, spelem_id, space_id)
      action(request.identity.emailFilled, process = Some(process_id),
        action = ProcHisCom.spaceElementMovedUp, what = Some(ProcHisCom.spaceElementMovedUp), what_id = Some(spelem_id))

      Ok(Json.toJson("moved"))
    } else { Forbidden(Json.obj("status" -> "Access denied")) }
}
def moveDownSpaceElem(id: Int, spelem_id: Int, space_id: Int) = SecuredAction(BodyParsers.parse.json) { implicit request =>
    val process_id = id
    if (security.BRes.procIsOwnedByBiz(request.identity.businessFirst, process_id)) {
      SessionSpaceElemDAO.moveDown(id, spelem_id, space_id)
      action(request.identity.emailFilled, process = Some(process_id),
        action = ProcHisCom.spaceElementMovedDown, what = Some(ProcHisCom.spaceElementMovedDown), what_id = Some(spelem_id))

      Ok(Json.toJson("moved"))
    } else { Forbidden(Json.obj("status" -> "Access denied")) }
}

/*
def createFrontElem() = SecuredAction(BodyParsers.parse.json) { implicit request =>

request.body.validate[RefElemContainer].map{
  case entity => {
         if (security.BRes.procIsOwnedByBiz(request.identity.businessFirst, entity.process)) {
            haltActiveStations(entity.process)
            RefDAO.retrive(entity.ref, entity.process, entity.business, in = "front", entity.title, entity.desc, space_id = None) match {//SessionProcElementDAO.pull_object(entity) match {
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
        } else { Forbidden(Json.obj("status" -> "Access denied")) }
    }
    }.recoverTotal{
      e => BadRequest("formWithErrors")
    }
}
def createSpace() = SecuredAction(BodyParsers.parse.json) { implicit request =>
  val placeResult = request.body.validate[BPSpaceDTO]
   request.body.validate[BPSpaceDTO].map{
    case entity => {
            if (security.BRes.procIsOwnedByBiz(request.identity.businessFirst, entity.bprocess)) {
            haltActiveStations(entity.bprocess);BPSpaceDAOF.pull_object(entity) match {
            case -1 =>  Ok(Json.toJson(Map("failure" ->  s"Could not create space ${entity.index}")))
            case id =>  Ok(Json.toJson(Map("success" ->  id)))
          }
    } else { Forbidden(Json.obj("status" -> "Access denied")) }
    }
    }.recoverTotal{
      e => BadRequest("formWithErrors")
    }
}

def createSpaceElem() = SecuredAction(BodyParsers.parse.json) { implicit request =>
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
                RefDAO.retrive(entity.ref,
                entity.process,
                entity.business,
                in = "nested",
                entity.title,
                entity.desc,
                entity.space_id) match { //SessionSpaceElemDAO.pull_object(entity) match {
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
          } else { Forbidden(Json.obj("status" -> "Access denied")) }
      }
    }.recoverTotal{
      e => BadRequest("formWithErrors")
    }
}



/* Update */
def updateFrontElem(bpId: Int, elem_id: Int) = SecuredAction(BodyParsers.parse.json) { implicit request =>
  request.body.validate[UndefElement].map{
    case entity => {
          if (security.BRes.procIsOwnedByBiz(request.identity.businessFirst, entity.bprocess)) {
              SessionProcElementDAO.update(elem_id,entity) match {
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
             SessionSpaceElemDAO.update(spelem_id,entity) match {
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
/* Delete */
def deleteFrontElem(bpID: Int, elem_id: Int) = SecuredAction { implicit request =>
    if (security.BRes.procIsOwnedByBiz(request.identity.businessFirst, bpID)) {
      val elem = SessionProcElementDAO.findById(elem_id).get

      haltActiveStations(bpID);SessionProcElementDAO.delete(elem_id) match {
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
      val spelem = SessionSpaceElemDAO.findById(spelem_id).get
      haltActiveStations(bpID)
      SessionSpaceElemDAO.delete(spelem_id) match {
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
*/

def update_session_state(session_id: Int, state_id: Int) = SecuredAction { implicit request =>
  if (security.BRes.launchIsOwnedByBiz(request.identity.businessFirst, session_id)) {
    Ok(Json.toJson("Ok"))
  } else { Forbidden(Json.obj("status" -> "Access denied")) }
}
def delete_session_state(session_id: Int, state_id: Int) = SecuredAction { implicit request =>
  if (security.BRes.launchIsOwnedByBiz(request.identity.businessFirst, session_id)) {
    Ok(Json.toJson("Ok"))
  } else { Forbidden(Json.obj("status" -> "Access denied")) }
}
def update_state(launch_id: Int, state_id: Int) = SecuredAction { implicit request =>
  if (security.BRes.launchIsOwnedByBiz(request.identity.businessFirst, launch_id)) {
    Ok(Json.toJson("Ok"))
  } else { Forbidden(Json.obj("status" -> "Access denied")) }
}
def delete_state(launch_id: Int, state_id: Int) = SecuredAction { implicit request =>
  if (security.BRes.launchIsOwnedByBiz(request.identity.businessFirst, launch_id)) {
     Ok(Json.toJson("Ok"))
  } else { Forbidden(Json.obj("status" -> "Access denied")) }
}



private def decorateProcElementsToJson(elements: List[SessionUndefElement]) = {
  val elemIds:List[Int] = elements.map(_.id.get)
  val topos:List[SessionElemTopology] = SessionElemTopologDAO.findByFrontElements(elemIds)
  val elemJson = Json.toJson( elements )
  val elemJsonObj = elemJson.as[List[JsObject]]
  val objWithTopos = elemJsonObj.map { obj =>
    val elemId = (obj \ "id").validate[Int].get
    obj + ("topo_id" -> Json.toJson(topos.find(topo => topo.front_elem_id.get == elemId ).get  ))
  }
  objWithTopos
}




private def action(acc: String, process: Option[Int], action: String, what: Option[String]=None, what_id: Option[Int]=None) = {
  //ProcHistoryDAOF.pull(ProcessHistoryDTO(
  //  None, acc, action, process, what, what_id, org.joda.time.DateTime.now() ))
}

private def deleteOwnedSpace(elem_id:Option[Int],spelem_id:Option[Int]) {
  if (elem_id.isDefined) {
    SessionSpaceDAO.deleteOwnedSpace(elem_id,spelem_id)
  }
  if (spelem_id.isDefined) {
    SessionSpaceDAO.deleteOwnedSpace(elem_id,spelem_id)
  }
}



}
