package controllers
import models.DAO.resources.{BusinessDAO, BusinessDTO}
import models.DAO._

import play.api._
import play.api.mvc._
import play.twirl.api.Html
import play.api.http.MimeTypes
import play.api.libs.json._
import play.api.cache._
import play.api.data._
import play.api.data.Forms._
import play.api.data.format.Formats
import play.api.data.format.Formatter
import play.api.data.FormError
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

import views._
import models.User
import service.DemoUser
import securesocial.core._
import models.DAO.BProcessDTO
import models.DAO.BPDAO
import models.DAO._
import models._
import models.DAO.resources._
import models.DAO.CompositeValues
import play.api.Play.current
import models.DAO.resources.web.BizFormDTO
import scala.concurrent.ExecutionContext.Implicits.global
import com.github.tototoshi.slick.JdbcJodaSupport._
import scala.concurrent.duration.Duration
import scala.concurrent.{ExecutionContext, Awaitable, Await, Future}



class LaunchShareController(override implicit val env: RuntimeEnvironment[DemoUser]) extends Controller with securesocial.core.SecureSocial[DemoUser] {
implicit val InputLoggerReads = Json.reads[InputLogger]
implicit val InputLoggerWrites = Json.format[InputLogger]
implicit val SessionStateLogReads  = Json.reads[SessionStateLog]
implicit val SessionStateLogWrites  = Json.format[SessionStateLog]

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


  implicit val LaunchShareDTOReads = Json.reads[LaunchShareDTO]
  implicit val LaunchShareDTOWrites = Json.format[LaunchShareDTO]
  //val Home = Redirect(routes.LaunchShareController.index())


//GET     /shared/launch/:launch_hash
 def index(launchHash: String) = Action.async { implicit request =>
   val shareF = LaunchSharesDAOF.getByHash(launchHash)
   shareF.flatMap { shareOpt =>
    shareOpt match {
      case Some(share) => { 
        val session_ids:List[Int] = List(share.launch_id)
        val sess_cnsF = BPSessionDAOF.findByBusinessAndIds(share.workbench_id, session_ids, 
                      withArroundVal = true)
        sess_cnsF.flatMap { sess_cns =>
          InputLoggerDAOF.fetchPeopleBySessions(sess_cns).map { sess_cns_with_peoples =>
              //Ok(Json.toJson( sess_cns_with_peoples )) 
            val cnOpt = sess_cns_with_peoples.find(cn => 
              cn.sessions.length > 0
            )
            val elementTree:Option[ElementTree] = cnOpt.get.sessions.head.around.get.tree
            println("elementTree " + elementTree)
            Ok(views.html.share.launchShare("Shared", cnOpt, elementTree ))
          }
        }

      }
      case _ => Future.successful(Ok(views.html.share.launchShare("Shared not found") ) )
    }

   }
 }

//POST    /share/launch/:launch_id
def makeShare(launch_id: Int) = SecuredAction.async { implicit request =>
  val business = request.user.businessFirst
  val launchShareF: Future[LaunchShareDTO] = LaunchSharesDAOF.generateForLaunch(launch_id, workbench_id = business)
  launchShareF.map { launchShare =>
    Ok(Json.toJson(launchShare))
  }
}


/*
https://github.com/timezra/dropbox-sdk-scala
https://github.com/vjousse/dropbox-scala-play/tree/master/app/views
https://github.com/Shinsuke-Abe/dropbox4s
https://github.com/Rovak/ReactiveDropbox
https://github.com/akiomik/dispatch-dropbox
https://github.com/emchristiansen/ResolveDropboxConflictedCopy
https://github.com/julianmichael/5langs
*/

}
