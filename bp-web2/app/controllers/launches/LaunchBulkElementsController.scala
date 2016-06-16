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




case class AllLaunchedElementsContainer(launchId: Int,
  elements: List[SessionUndefElement],
  spaces: List[SessionSpaceDTO],
  space_elements: List[SessionSpaceElementDTO],
  element_topos: List[SessionElementTopologyWrapper],
  element_topos_native: List[SessionElemTopology] = List()
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

class LaunchBulkElementsController @Inject() (
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
implicit val AllLaunchedElementsContainerReads = Json.reads[AllLaunchedElementsContainer]
implicit val AllLaunchedElementsContainerWrites = Json.format[AllLaunchedElementsContainer]





def allElements(launchIds: List[Int]) = SecuredAction.async { implicit request =>
  val secured_ids = launchIds.filter( launchId =>
        security.BRes.sessionSecured(launchId, request.identity.emailFilled, request.identity.businessFirst))
  val elementsAllF = SessionProcElementDAOF.findByLaunchesIds(secured_ids)
  val spacesAllF = SessionSpaceDAOF.findByLaunchesIds(secured_ids)
  val spaceElementsAllF = SessionSpaceElemDAOF.findByLaunchesIds(secured_ids)

    elementsAllF.flatMap { elementsAll =>
      spacesAllF.flatMap { spacesAll =>
        spaceElementsAllF.map { spaceElementsAll =>
          
        val allElemCn:List[AllLaunchedElementsContainer] = secured_ids.map { launchId =>
        val topologs_dto = SessionElemTopologDAO.findBySession(launchId)
        Logger.debug(s"topos quantity are $topologs_dto.length")
        val topologs:List[SessionElementTopologyWrapper] = topologs_dto.filter(topo => topo.front_elem_id.isDefined).map { topolog =>
            val element = SessionProcElementDAO.findById(topolog.front_elem_id.get).get
            SessionElementTopologyWrapper(
             topo_id = topolog.id.get,
             element_id = element.id.get,
             element_title = element.title,
             space_element = false)
        } ++ topologs_dto.filter(topo => topo.space_elem_id.isDefined).map { topolog =>
            val element = SessionSpaceElemDAO.findById(topolog.space_elem_id.get).get
            SessionElementTopologyWrapper(
             topo_id = topolog.id.get,
             element_id = element.id.get,
             element_title = element.title,
             space_element = true)
        }

        AllLaunchedElementsContainer(
          launchId = launchId,
          elements = elementsAll.filter(c => c.session == launchId).toList,
          spaces = spacesAll.filter(c => c.session == launchId).toList,
          space_elements = spaceElementsAll.filter(c => c.session == launchId).toList,
          element_topos = topologs,
          element_topos_native = topologs_dto
        )
    }
    Ok( decorateAllElementsContainer(Json.toJson( allElemCn ), allElemCn)  )

  }
  }
  }


}


def allElementsCached(launchIds: List[Int], timestamp: String) = SecuredAction.async { implicit request =>
  val secured_ids = launchIds.filter( launchId =>
        security.BRes.sessionSecured(launchId, request.identity.emailFilled, request.identity.businessFirst))
  val elementsAllF = SessionProcElementDAOF.findByLaunchesIds(secured_ids)
  val spacesAllF = SessionSpaceDAOF.findByLaunchesIds(secured_ids)
  val spaceElementsAllF = SessionSpaceElemDAOF.findByLaunchesIds(secured_ids)

    elementsAllF.flatMap { elementsAll =>
      spacesAllF.flatMap { spacesAll =>
        spaceElementsAllF.map { spaceElementsAll =>

    val allElemCn:List[AllLaunchedElementsContainer] = secured_ids.map { launchId =>
	    val topologs_dto = SessionElemTopologDAO.findBySession(launchId)
	    Logger.debug(s"topos quantity are $topologs_dto.length")
	    val topologs:List[SessionElementTopologyWrapper] = topologs_dto.filter(topo => topo.front_elem_id.isDefined).map { topolog =>
	        val element = SessionProcElementDAO.findById(topolog.front_elem_id.get).get
	        SessionElementTopologyWrapper(
	         topo_id = topolog.id.get,
	         element_id = element.id.get,
	         element_title = element.title,
	         space_element = false)
	    } ++ topologs_dto.filter(topo => topo.space_elem_id.isDefined).map { topolog =>
	        val element = SessionSpaceElemDAO.findById(topolog.space_elem_id.get).get
	        SessionElementTopologyWrapper(
	         topo_id = topolog.id.get,
	         element_id = element.id.get,
	         element_title = element.title,
	         space_element = true)
	    }

	    AllLaunchedElementsContainer(
	      launchId = launchId,
	      elements = elementsAll.filter(c => c.session == launchId).toList,
	      spaces = spacesAll.filter(c => c.session == launchId).toList,
	      space_elements = spaceElementsAll.filter(c => c.session == launchId).toList,
	      element_topos = topologs,
	      element_topos_native = topologs_dto

	    )
    }
    Ok( decorateAllElementsContainer(Json.toJson( allElemCn ), allElemCn) )

  }
  }
  }

}


/***
 	Decorate elements with topo_id attribute
 */

private def decorateAllElementsContainer(cn_json: JsValue, 
										 allElemCn: List[AllLaunchedElementsContainer]):JsValue = {
	val cn_jsonArray = cn_json.as[List[JsObject]]
	Json.toJson(cn_jsonArray.map { c =>
		// replace elements collection with 
		// elements with topos_ids
		val launchId = (c \ "launchId").as[Int]
		val cn = allElemCn.find(cn => cn.launchId == launchId).get // Native structured allEl Container
		//c.elements = decorateProcElementsToJson(cn.elements, element_topos = cn.element_topos)
		c ++ Json.obj("elements" -> decorateProcElementsToJson(cn.elements, cn.element_topos_native))
	})
}

private def decorateProcElementsToJson(elements: List[SessionUndefElement], 
									   element_topos: List[SessionElemTopology]):List[JsObject] = {
  val elemIds:List[Int] = elements.map(_.id.get)
  val topos:List[SessionElemTopology] = element_topos//SessionElemTopologDAO.findByFrontElements(elemIds)
  val elemJson = Json.toJson( elements )
  val elemJsonObj = elemJson.as[List[JsObject]]
  val objWithTopos = elemJsonObj.map { obj =>
    val elemId = (obj \ "id").validate[Int].get
    val topoIdOpt = topos.find(topo => topo.front_elem_id.get == elemId )
    topoIdOpt match {
      case Some(topoIdObj) => {
        obj + ("topo_id" -> Json.toJson( topoIdObj ))
      }
      case _ => {
        obj 
      }
    }
    
  }
  objWithTopos
}






}