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
import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits.global

import javax.inject.Inject

import com.mohiva.play.silhouette.api.{ Environment, LogoutEvent, Silhouette }
import com.mohiva.play.silhouette.impl.authenticators.CookieAuthenticator
import com.mohiva.play.silhouette.impl.providers.SocialProviderRegistry
import forms._
import models.User2
import play.api.i18n.MessagesApi
import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits.global
import com.mohiva.play.silhouette.impl.authenticators.JWTAuthenticator

import play.api.mvc.{ Action, RequestHeader }

class APIController @Inject() (
  val messagesApi: MessagesApi,
  val env: Environment[User2, JWTAuthenticator],
  socialProviderRegistry: SocialProviderRegistry)
  extends Silhouette[User2, JWTAuthenticator] {


implicit val SessionElementsReads = Json.reads[SessionElements]
implicit val SessionElementsWrites = Json.format[SessionElements]
implicit val BPSessionStateReads = Json.reads[BPSessionState]
implicit val BPSessionStateWrites = Json.format[BPSessionState]
implicit val LaunchStateObjectsReads = Json.reads[LaunchStateObjects]
implicit val LaunchStateObjectsWrites = Json.format[LaunchStateObjects]

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


  // GET         /api/v1/sessions
  def all_sessions_v1() = SecuredAction.async { implicit request =>
  	val email = request.identity.emailFilled
    val sess_cnsF = BPSessionDAOF.findByBusiness(request.identity.businessFirst)
    //val updated_cns:List[SessionContainer] = sess_cns.map { cn =>
    //val updatedStatuses:List[SessionStatus] = cn.sessions.map(status => InputLoggerDAO.launchPeopleFetcher(status))
    //val updatedCN = updatedStatuses.map(status => cn.updateStatus(status))
    sess_cnsF.flatMap { sess_cns =>
      InputLoggerDAOF.fetchPeopleBySessions(sess_cns).map { sess_cns_with_peoples =>
          Ok(Json.toJson( sess_cns_with_peoples ))
      }
    }
  }


}
/*
object APIController extends Controller with Secured  {
  def readToken() = SecureAction { user => _ =>
    Ok(User.findByEmail(user).get.token)
  }
  def readByToken(token: String) = Action {


    Ok(User.findByToken(token).get.email)
  }
  def getToken() = SecureAction { user => _ =>
    User.createToken(user) match {
      case Right(token) => Ok(Json.toJson(Map("token" -> token.token)))
      case Left(error) => Ok(error)
    }
  }
}
*/
case class ApiSpec(spec_url: String)
