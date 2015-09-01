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

import main.scala.bprocesses._
import main.scala.simple_parts.process.Units._
import models.DAO.reflect._
import models.DAO.conversion._
import ProcHistoryDAO._
import helpers._
import decorators._
import builders._

case class StationNoteMsg(msg: String)
case class LogsContainer(session_loggers: List[BPLoggerDTO], process_histories: List[ProcessHistoryDTO], stations: List[BPStationDTO])
class ProcessSessionController(override implicit val env: RuntimeEnvironment[DemoUser]) extends Controller with securesocial.core.SecureSocial[DemoUser] {
  

  implicit val CompositeVReads = Json.reads[CompositeValues]
  implicit val CompositeVWrites = Json.format[CompositeValues]
  implicit val logReads = Json.reads[BPLoggerDTO]
  implicit val logWrites = Json.format[BPLoggerDTO]
  implicit val ProcessHistoryDTOreads = Json.reads[ProcessHistoryDTO]
  implicit val ProcessHistoryDTOformat = Json.format[ProcessHistoryDTO]
  implicit val stationReads = Json.reads[BPStationDTO]
  implicit val stationWrites = Json.format[BPStationDTO]
  implicit val StationNoteReads = Json.reads[StationNoteMsg]
  implicit val StationNoteWrites = Json.format[StationNoteMsg]
  implicit val LogsContainerreads = Json.reads[LogsContainer]
  implicit val LogsContainerformat = Json.format[LogsContainer]
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



def station_index(id: Int) = SecuredAction { implicit request => 
if (security.BRes.procIsOwnedByBiz(request.user.businessFirst, id)) {  

   val result = models.DAO.BPStationDAO.findByBPId(id) //BPStationDAO.findByBPId(id)
   Ok(Json.toJson(result))

} else { Forbidden(Json.obj("status" -> "Not found")) }   
}
def all_stations() = SecuredAction { implicit request =>
  Ok(Json.toJson(BPStationDAO.getAll))
}

def process_all_session(pid: Int) = SecuredAction { implicit request =>
if (security.BRes.procIsOwnedByBiz(request.user.businessFirst, pid)) {

  val sess = BPSessionDAO.findByProcess(pid)  
  sess match { 
    case Some(sessionContainer) => {
        //val updatedStatuses:List[SessionStatus] = sessionContainer.sessions.map(status => InputLoggerDAO.launchPeopleFetcher(status)) 
        //val updatedCN = updatedStatuses.map(status => sessionContainer.updateStatus(status))

        Ok(Json.toJson(InputLoggerDAO.fetchPeople(sessionContainer))) //InputLoggerDAO.launchPeopleFetcher(cn))))
   }
    case _ => Ok(Json.toJson(Map("status" -> 404)))
  }
} else { Forbidden(Json.obj("status" -> "Not found")) }
}

def all_sessions() = SecuredAction { implicit request =>
	val email = request.user.main.email.get
	val business_request:Option[Tuple2[Int, Int]] = models.DAO.resources.EmployeesBusinessDAO.getByUID(email) 
    val business = business_request match {
      case Some(biz) => biz._2
      case _ => -1
    }
	  val sess_cns = BPSessionDAO.findByBusiness(business)
       //val updated_cns:List[SessionContainer] = sess_cns.map { cn => 
       //val updatedStatuses:List[SessionStatus] = cn.sessions.map(status => InputLoggerDAO.launchPeopleFetcher(status)) 
       //val updatedCN = updatedStatuses.map(status => cn.updateStatus(status))
        
      
      Ok(Json.toJson(sess_cns.map(cn => InputLoggerDAO.fetchPeople(cn))))
}


// /bprocess/:id/station/:station_id  
def show_station(id: Int, station_id: Int) = SecuredAction { implicit request =>
  if (security.BRes.stationSecured(station_id, request.user.main.userId, request.user.businessFirst)) {
     Ok(Json.toJson(BPStationDAO.findById(station_id)))
  } else { Forbidden(Json.obj("status" -> "Not found")) }
}
// /bprocess/:id/station/:station_id/halt  
def halt_session(id: Int, session_id: Int) = SecuredAction { implicit request =>
  if (security.BRes.stationSecured(session_id, request.user.main.userId, request.user.businessFirst)) {

    val station_id = BPStationDAO.findBySession(session_id) 
    station_id match {
      case Some(station) => BPStationDAO.haltUpdate(station.id.get);Ok(Json.toJson(Map("success" -> "halted")))
      case _ => Ok(Json.toJson(Map("failure" -> "not halted")))
    }
  } else { Forbidden(Json.obj("status" -> "Not found")) }
}




def makeUnlisted(id: Int) = SecuredAction { implicit request =>
    if (security.BRes.sessionSecured(id, request.user.main.userId, request.user.businessFirst)) {
         Ok(Json.toJson(BPSessionDAO.makeUnlisted(id)))
    } else { Forbidden(Json.obj("status" -> "Not found")) }

}
def makeListed(id: Int) = SecuredAction { implicit request =>
  if (security.BRes.sessionSecured(id, request.user.main.userId, request.user.businessFirst)) {
     Ok(Json.toJson(BPSessionDAO.makeListed(id)))
  } else { Forbidden(Json.obj("status" -> "Not found")) }
}
// DELETE /session/:session_id/  
def delete_session(session_id: Int) = SecuredAction { implicit request =>
    if (security.BRes.sessionSecured(session_id, request.user.main.userId, request.user.businessFirst)) {
  Ok(Json.toJson(BPSessionDAO.delete(session_id)))
    } else { Forbidden(Json.obj("status" -> "Not found")) }
}




def stations_elems_around(id: Int, station_id: Int) = SecuredAction { implicit request =>
  if (security.BRes.procIsOwnedByBiz(request.user.businessFirst, id)) {
      Ok(Json.toJson(AroundProcessElementsBuilder.detect(id, station_id)))
  } else { Forbidden(Json.obj("status" -> "Not found")) }
}




/**
 * Fetch all sessions logs for process
 */
def logs_index(id: Int) = SecuredAction { implicit request => 
  if (security.BRes.procIsOwnedByBiz(request.user.businessFirst, id)) {
      val processHistories = ProcHistoryDAO.getByProcess(id)
      val session_loggers = BPLoggerDAO.findByBPId(id)
      val stations = BPStationDAO.findByBPId(id)

      Ok(Json.toJson(LogsContainer(session_loggers, processHistories, stations)))
  } else { Forbidden(Json.obj("status" -> "Not found")) }
}


  
  
  
/**
 * Update station note
 */
def update_note(id: Int, station_id: Int) = SecuredAction(BodyParsers.parse.json) { implicit request =>
  val perm = true // TODO: Make permission !!!
  if (security.BRes.procIsOwnedByBiz(request.user.businessFirst, id)) {

  request.body.validate[StationNoteMsg].map{ 
    case entity => {
        if (perm) {
          BPStationDAO.updateNote(station_id, entity.msg)
          Ok(Json.toJson(Map("success" -> s"station $id note updated")))
        } else {
          BadRequest("Access Denied")
        }

        }
    }.recoverTotal{
      e => BadRequest("formWithErrors")
    }
  } else { Forbidden(Json.obj("status" -> "Not found")) }  
}


}	