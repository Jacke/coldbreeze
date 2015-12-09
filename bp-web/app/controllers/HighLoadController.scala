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
import play.api.libs.json._


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
import main.scala.bprocesses.BPSession 
import models.DAO.reflect._
import models.DAO.conversion._
import ProcHistoryDAO._
import helpers._
import decorators._
import main.scala.simple_parts.process.Units._  
import main.scala.bprocesses._
import builders._
import minority.utils._
import scala.util.{Success, Failure}
import scala.concurrent._
import scala.concurrent.duration._

 case class CostContainer(elementId: Int,
                          entities: List[Entity], 
                          resource: ResourceDTO,
                          slats: List[Slat] = List())

 case class SessionReactionContainer(session_state: Option[BPSessionState], 
                                     reaction: SessionUnitReaction, 
                                     outs: List[SessionUnitReactionStateOut],
                                     costs: List[CostContainer] = List())
 case class ReactionContainer(session_state: Option[BPSessionState], 
                              reaction: UnitReaction, 
                              outs: List[UnitReactionStateOut])

 case class SessionInteractionContainer(session_container:Option[SessionContainer],
                                        reactions: List[SessionReactionContainer], 
                                        outs_identity: List[BPSessionState],
                                        costs: List[CostContainer] = List())
 case class InteractionContainer(session_container:Option[SessionContainer],
                                 reactions: List[ReactionContainer], 
                                 outs_identity: List[BPSessionState])

object InteractionKeepr {
	var keepr:Option[SessionInteractionContainer] = None
}


class HighLoadController(override implicit val env: RuntimeEnvironment[DemoUser]) extends Controller with securesocial.core.SecureSocial[DemoUser] {
  implicit val SessionElementsReads = Json.reads[SessionElements]
  implicit val SessionElementsFormat = Json.format[SessionElements]
  implicit val CompositeVReads = Json.reads[CompositeValues]
  implicit val CompositeVWrites = Json.format[CompositeValues]
  implicit val logReads = Json.reads[BPLoggerDTO]
  implicit val logWrites = Json.format[BPLoggerDTO]
  implicit val stationReads = Json.reads[BPStationDTO]
  implicit val stationWrites = Json.format[BPStationDTO]
  implicit val StationNoteReads = Json.reads[StationNoteMsg]
  implicit val StationNoteWrites = Json.format[StationNoteMsg]
  implicit val AroundAttrReads = Json.reads[AroundAttr]
  implicit val AroundAttrWrites = Json.format[AroundAttr]
  implicit val ElemAroundReads = Json.reads[ElemAround]
  implicit val ElemAroundWrites = Json.format[ElemAround]
  implicit val ListAroundReads = Json.reads[ListAround]
  implicit val ListAroundWrites = Json.format[ListAround]
  implicit val sessionReads = Json.reads[BPSession]
  implicit val sessionWrites = Json.format[BPSession]
  implicit val BProcessDTOReads = Json.reads[BProcessDTO]
  implicit val BProcessDTOWrites = Json.format[BProcessDTO]
  implicit val SessionPeoplesReads = Json.reads[SessionPeoples]
  implicit val SessionPeoplesFormat = Json.format[SessionPeoples]
  implicit val SessionStatusReads = Json.reads[SessionStatus]
  implicit val SessionStatusWrites = Json.format[SessionStatus]  
  implicit val SessionContainerReads = Json.reads[SessionContainer]
  implicit val SessionContainerWrites = Json.format[SessionContainer]
  implicit val UnitReactionReads = Json.reads[UnitReaction]
  implicit val UnitReactionWrites = Json.format[UnitReaction]
  implicit val UnitReactionStateOutReads = Json.reads[UnitReactionStateOut]
  implicit val UnitReactionStateOutWrites = Json.format[UnitReactionStateOut]
  implicit val BPSessionStateReads = Json.reads[BPSessionState]
  implicit val BPSessionStateWrites = Json.format[BPSessionState]

  implicit val MetaValFormat = Json.format[MetaVal]
  implicit val MetaValReader = Json.reads[MetaVal]
  implicit val EntityFormat = Json.format[Entity]
  implicit val EntityReaders = Json.reads[Entity]
  implicit val SlatFormat = Json.format[Slat]
  implicit val SlatReaders = Json.reads[Slat]  
  implicit val ResourceDTOReaders = Json.reads[ResourceDTO]
  implicit val ResourceDTOFormat = Json.format[ResourceDTO]


implicit val CostContainerReads = Json.reads[CostContainer]
implicit val CostContainerWrites = Json.format[CostContainer]

  implicit val SessionUnitReactionStateOutReads = Json.reads[SessionUnitReactionStateOut]
  implicit val SessionUnitReactionStateOutWrites = Json.format[SessionUnitReactionStateOut]
  implicit val SessionUnitReactionReads = Json.reads[SessionUnitReaction]
  implicit val SessionUnitReactionWrites = Json.format[SessionUnitReaction]
  implicit val ReactionContainerReads = Json.reads[ReactionContainer]
  implicit val ReactionContainerWrites = Json.format[ReactionContainer]
  implicit val SessionReactionContainerReads = Json.reads[SessionReactionContainer]
  implicit val SessionReactionContainerWrites = Json.format[SessionReactionContainer]
  implicit val SessionInteractionContainerReads = Json.reads[SessionInteractionContainer]
  implicit val SessionInteractionContainerWrites = Json.format[SessionInteractionContainer]
  implicit val InteractionContainerReads = Json.reads[InteractionContainer]
  implicit val InteractionContainerWrites = Json.format[InteractionContainer]

 val waitSeconds = 100000
 val wrapper = minority.utils.BBoardWrapper.apply()

/** Fetch interaction action, used in input bar for making request directly to launch
  * 
  * @param  session_id id of launch
  * @return return either SessionInteractionContainer with session, reaction containers, and session states.
  */
def load(session_id: Int) = SecuredAction { implicit request => 
  if (security.BRes.sessionSecured(session_id, request.user.main.userId, request.user.businessFirst)) {


   val session = models.DAO.BPSessionDAO.findById(id = session_id)
  
   session match {

  	case Some(session) => {   
  		val process:BProcessDTO = session.process
  	  val reactions:List[SessionUnitReaction] = SessionReactionDAO.findUnapplied(process.id.get, session_id)
      Logger.debug("Session Reactions")
      Logger.debug(s"reaction length ${reactions.length}")

      val reaction_outs:List[SessionUnitReactionStateOut] = SessionReactionStateOutDAO.findByReactions(reactions.map(_.id.get))
      
      val costs:List[CostContainer] = reactions.map(reaction => findCost(sessionElemTopoId = reaction.element, 
                                                                         launchId=session_id)).flatten
  	  val session_states: List[BPSessionState] = BPSessionStateDAO.findByOriginIds(reaction_outs.map(_.state_ref))

      Logger.debug("Session state")
      Logger.debug(s"session_states length ${session_states.length}")
        val reaction_container = reactions.map(reaction => 
        	SessionReactionContainer(session_state = session_states.find(state => Some(reaction.from_state) == state.origin_state),
        					  reaction, 
                    reaction_outs.filter(out => Some(out.reaction) == reaction.id),
                    costs)
        )
        	InteractionKeepr.keepr = Some(SessionInteractionContainer(Some(session), reaction_container, session_states))

  	   Ok(Json.toJson(SessionInteractionContainer(Some(session), reaction_container, session_states)))
  	}
  	case _ => BadRequest(Json.toJson(Map("error" -> "Session not found")))
  }
} else { Forbidden(Json.obj("status" -> "Access denied")) }    
}
def semiload(session_id: Int) = SecuredAction { implicit request => 
  if (security.BRes.sessionSecured(session_id, request.user.main.userId, request.user.businessFirst)) {


   val session = models.DAO.BPSessionDAO.findById(id = session_id)
  
   session match {

  	case Some(session) => {   
  		val process:BProcessDTO = session.process
  	  val reactions:List[SessionUnitReaction] = SessionReactionDAO.findUnapplied(process.id.get, session_id)
      Logger.debug("Session Reactions")
      Logger.debug(s"reaction length ${reactions.length}")

      val reaction_outs:List[SessionUnitReactionStateOut] = SessionReactionStateOutDAO.findByReactions(reactions.map(_.id.get))
      
      val costs:List[CostContainer] = List()
  	  val session_states: List[BPSessionState] = BPSessionStateDAO.findByOriginIds(reaction_outs.map(_.state_ref))

      Logger.debug("Session state")
      Logger.debug(s"session_states length ${session_states.length}")
        val reaction_container = reactions.map(reaction => 
        	SessionReactionContainer(session_state = session_states.find(state => Some(reaction.from_state) == state.origin_state),
        					  reaction, 
                    reaction_outs.filter(out => Some(out.reaction) == reaction.id),
                    costs)
        )
        	InteractionKeepr.keepr = Some(SessionInteractionContainer(Some(session), reaction_container, session_states))

  	   Ok(Json.toJson(SessionInteractionContainer(Some(session), reaction_container, session_states)))
  	}
  	case _ => BadRequest(Json.toJson(Map("error" -> "Session not found")))
  }
} else { Forbidden(Json.obj("status" -> "Access denied")) }    
}
def highload(session_id: Int) = SecuredAction { implicit request => 
	Ok(Json.toJson(InteractionKeepr.keepr.get))
}

def fillSlat(slat_id: String) = SecuredAction.async(BodyParsers.parse.json) { request => 
    val sval = request.body.validate[String]
    sval.fold(
    errors => {
       Logger.error(s"error with $sval")
       Future.successful(BadRequest(Json.obj("status" ->"KO", "message" -> JsError.toFlatJson(errors))))
    },
    sval => { 
      println(sval)
      wrapper.fillSlat(slat_id, sval).map { _ =>
        Ok(Json.toJson("ok"))
      }
    }
  )  
  Future.successful(Ok("ok"))
}
def refillSlat(slat_id: String) = SecuredAction.async(BodyParsers.parse.json) { request => 
    val sval = request.body.validate[String]
    sval.fold(
    errors => {
       Logger.error(s"error with $sval")
       Future.successful(BadRequest(Json.obj("status" ->"KO", "message" -> JsError.toFlatJson(errors))))
    },
    sval => { 
      println(sval)
      wrapper.refillSlat(slat_id, sval).map { _ =>
        Ok(Json.toJson("ok"))
      }
    }
  )
  Future.successful(Ok("ok"))
}

/** Retrive cost through container by session topology id
  * 
  * @param  sessionElemTopoId session element topology id
  * @return List of cost containers that content topo elementId, list of entities 
  *         and resource dto.
  */
private def findCost(sessionElemTopoId: Int, launchId: Int):List[CostContainer] = {
  /* CostContainer(elementId: Int,
                          entity: List[Entity], 
                          resource: ResourceDTO)  */

  val elementResources:List[SessionElementResourceDTO] = SessionElementResourceDAO.getAllByElement(sessionElemTopoId)
  val enitiesIds = elementResources.map(_.entities)
  val wildCard = enitiesIds.find(id => id == "*").isDefined
  def retriveResource(resourcesId:Int) = {
    ResourceDAO.get(resourcesId).get
  }
  def retriveEntity(resourcesId:Int, entityId: String, wildcard: Boolean = false):List[Entity] = {
    val resource = retriveResource(resourcesId)
    val entities: List[Entity] = wildcard match {
      case false => {
          val ft = wrapper.getEntityByResource(resource)
          Await.result(ft, Duration(waitSeconds, MILLISECONDS)) match {
            case x => { 
              println("entity finded by id: ")
              x.headOption.map(x => println(x.entities))
              println(entityId)

               x.headOption match {
                  case Some(xx) => xx.entities.filter { entity => 
                                                    println(entity.id); entityId == entity.id.get.toString 
                                                }
                  case _ => List.empty[Entity]                                                 
               }
            }
          }        
      }
      case _ => {
          val ft = wrapper.getEntityByResource(resource)
          Await.result(ft, Duration(waitSeconds, MILLISECONDS)) match {
            case x => { 
              println("entity finded by wildcard: ")
              println(x)
              x.headOption match {
                case Some(xx) => xx.entities
                case _ => List.empty[Entity]   
              }
            }
          }                
      }
    }
    entities
  }
  def retriveSlat(entitiesIds: List[String]):List[Slat] = {
    val ft = wrapper.getSlatByEntitiesIds(entitiesIds)
    val result = Await.result(ft, Duration(waitSeconds, MILLISECONDS))
    result.filter(slat => detectMetaLaunch(slat.meta) == launchId)
    }
  def detectMetaLaunch(meta: List[minority.utils.MetaVal]) = meta.find(m => m.key == "launchId") match {
    case Some(meta) => meta.value.toInt
    case _ => -1
  }
 

  elementResources.map { cost =>
  val wildcard = cost.entities == "*"
  val entities = retriveEntity(cost.resource_id, cost.entities, wildcard)

  CostContainer(cost.element_id, 
                entities, 
                retriveResource(cost.resource_id),
                retriveSlat(entities.map(e => e.id.get.toString))
                )
  }
}


}