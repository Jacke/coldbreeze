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
  
class InteractionController(override implicit val env: RuntimeEnvironment[DemoUser]) extends Controller with securesocial.core.SecureSocial[DemoUser] {
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


 case class SessionReactionContainer(session_state: Option[BPSessionState], 
                                     reaction: SessionUnitReaction, 
                                     outs: List[SessionUnitReactionStateOut])
 case class ReactionContainer(session_state: Option[BPSessionState], reaction: UnitReaction, outs: List[UnitReactionStateOut])
 

 case class SessionInteractionContainer(session_container:Option[SessionContainer],
                                 reactions: List[SessionReactionContainer], 
                                 outs_identity: List[BPSessionState])
 case class InteractionContainer(session_container:Option[SessionContainer],
                                 reactions: List[ReactionContainer], 
                                 outs_identity: List[BPSessionState])

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


def fetchInteraction(session_id: Int) = SecuredAction { implicit request => 
  if (security.BRes.sessionSecured(session_id, request.user.main.userId, request.user.businessFirst)) {


   val result = models.DAO.BPSessionDAO.findById(id = session_id)
  
   result match {

  	case Some(session) => {   
  		val process:BProcessDTO = session.process
  	  val reactions:List[SessionUnitReaction] = SessionReactionDAO.findUnapplied(process.id.get, session_id)
      Logger.debug("Session Reactions")
      Logger.debug(s"reaction length ${reactions.length}")

      val reaction_outs:List[SessionUnitReactionStateOut] = SessionReactionStateOutDAO.findByReactions(reactions.map(_.id.get))
       
  	  val session_states: List[BPSessionState] = BPSessionStateDAO.findByOriginIds(reaction_outs.map(_.state_ref))
        Logger.debug("Session state")
        Logger.debug(s"session_states length ${session_states.length}")
          val reaction_container = reactions.map(reaction => 
          	SessionReactionContainer(session_state = session_states.find(state => Some(reaction.from_state) == state.origin_state),
          					  reaction, reaction_outs.filter(out => Some(out.reaction) == reaction.id))
          )

  	   Ok(Json.toJson(SessionInteractionContainer(result,reaction_container, session_states)))
  	}
  	case _ => BadRequest(Json.toJson(Map("error" -> "Session not found")))
  }
} else { Forbidden(Json.obj("status" -> "Access denied")) }    
}


}