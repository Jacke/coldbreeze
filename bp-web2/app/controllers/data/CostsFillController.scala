package controllers
import java.util.UUID
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
import org.jboss.netty.buffer._
import org.joda.time.DateTime
import play.api.data._
import play.api.data.Forms._
import play.api.data.format.Formats._
import play.api.data.validation.Constraints._
import play.api.data.format._
import scala.concurrent._
import scala.concurrent.duration._
import views._
import models.User

import scala.concurrent._
import scala.concurrent.duration._
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
import models._
import models.DAO.resources._
import models.DAO.CompositeValues
import play.api.Play.current
import models.DAO.resources.web.BizFormDTO
import minority.utils._
import play.api.data.format.Formats._
import scala.util.{Success, Failure}
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
import play.api.libs.json.Json
import models.DAO._
import main.scala.bprocesses.BPSession
import models.DAO.sessions._
import main.scala.simple_parts.process.Units._


// ResourceEntitySelector for assign resource form
// case class ResourceEntitySelector(resource: ResourceDTO, entities: List[Entity])
// by default accepted resource work for all entities
case class ResourceElementSelector(elementId: Int, resourceId: Int, entityId: String = "*")
case class ElementResourceContainer(obj: ElementResourceDTO, entities: List[Entity])

case class WarpData(
                      boards: List[Board],
                      entities: List[Entity],
                      slats: List[Slat])
case class DatasContainer(costs: List[SessionElementResourceContainer], warp: WarpData)

case class ElementCosts(inBoard: Board, entity: Entity, value: Option[Slat], resource: Option[ResourceDTO])
case class DatasElementContainer(obj: SessionElementResourceDTO, costs: List[ElementCosts])

case class SessionElementResourceContainer(
                      obj: SessionElementResourceDTO,
                      entities: List[Entity],
                      slats: List[Slat])


case class DataTableIndicators(
  processes: Seq[BProcessDTO],
  launches_indicators: Seq[LaunchIndicator]
)
  case class LaunchIndicator(
    launch:BPSession,
    elements: Seq[LaunchIndicatorElement]
  )
    case class LaunchIndicatorElement(
      element: SessionUndefElement,
      topology: SessionElemTopology,
      indicators: List[DatasElementContainer] = List()
    )

class CostFillController @Inject() (
  val messagesApi: MessagesApi,
  val env: Environment[User2, CookieAuthenticator],
  socialProviderRegistry: SocialProviderRegistry)
  extends Silhouette[User2, CookieAuthenticator] {

  implicit val BProcessDTO_format = Json.format[BProcessDTO]
  implicit val BProcessDTO_reads = Json.reads[BProcessDTO]
  implicit val BPSession_reads = Json.reads[BPSession]
  implicit val BPSession_format = Json.format[BPSession]

implicit val SessionUndefElementJformat = Json.format[SessionUndefElement]
implicit val SessionUndefElementreads = Json.reads[SessionUndefElement]
implicit val SessionElemTopologyreads = Json.reads[SessionElemTopology]
implicit val SessionElemTopologyJformat = Json.format[SessionElemTopology]

  implicit val MetaValFormat = Json.format[MetaVal]
  implicit val MetaValReader = Json.reads[MetaVal]
  implicit val personHandler = Json.reads[Ownership]
  implicit val jsonOwnershipFormat = Json.format[Ownership]
  implicit val jsonBoardFormat = Json.format[Board]
  implicit val jsonBoardReaders = Json.reads[Board]
  implicit val EntityFormat = Json.format[Entity]
  implicit val EntityReaders = Json.reads[Entity]
  implicit val SlatFormat = Json.format[Slat]
  implicit val SlatReaders = Json.reads[Slat]
  implicit val BoardContainerReaders = Json.reads[BoardContainer]
  implicit val BoardContainerFormat = Json.format[BoardContainer]
  implicit val ResourceDTOReaders = Json.reads[ResourceDTO]
  implicit val ResourceDTOFormat = Json.format[ResourceDTO]
  implicit val ResourceEntitySelectorFormat = Json.format[ResourceEntitySelector]
  implicit val ResourceEntitySelectorReaders = Json.reads[ResourceEntitySelector]
  implicit val ResourceElementSelectorReaders = Json.reads[ResourceElementSelector]
  implicit val ResourceElementSelectorFormat = Json.format[ResourceElementSelector]
  implicit val ElementResourceDTOFormat = Json.format[ElementResourceDTO]
  implicit val ElementResourceDTOReaders = Json.reads[ElementResourceDTO]
  implicit val SessionElementResourceDTOFormat = Json.format[SessionElementResourceDTO]
  implicit val SessionElementResourceDTOReaders = Json.reads[SessionElementResourceDTO]
  implicit val ElementResourceContainerFormat = Json.format[ElementResourceContainer]
  implicit val ElementResourceContainerReaders = Json.reads[ElementResourceContainer]
  implicit val SessionElementResourceContainerFormat = Json.format[SessionElementResourceContainer]
  implicit val SessionElementResourceContainerReaders = Json.reads[SessionElementResourceContainer]
  


  implicit val ElementCostsFormat = Json.format[ElementCosts]
  implicit val ElementCostsFormatReads = Json.reads[ElementCosts]
  implicit val DatasElementContainerFormat = Json.format[DatasElementContainer]
  implicit val DatasElementContainerReaders = Json.reads[DatasElementContainer]


  implicit val LaunchIndicatorElementJformat = Json.format[LaunchIndicatorElement]
  implicit val LaunchIndicatorElementreads = Json.reads[LaunchIndicatorElement]
  implicit val LaunchIndicatorJformat = Json.format[LaunchIndicator]
  implicit val LaunchIndicatorreads = Json.reads[LaunchIndicator]

  implicit val DataTableIndicators_format = Json.format[DataTableIndicators]
  implicit val DataTableIndicators_reads = Json.reads[DataTableIndicators]


  implicit val WarpDatarFormat = Json.format[WarpData]
  implicit val WarpDataReaders = Json.reads[WarpData]
  implicit val DatasContainerFormat = Json.format[DatasContainer]
  implicit val DatasContainerReaders = Json.reads[DatasContainer]

/****
 * Primary datatables of all indicators assigned to launch assigned to processes
 */
def indicatorsTable = SecuredAction.async { implicit request =>
  val business = request.identity.businessFirst
  val user_services = BusinessServiceDAO.getAllByBusiness(business).map(_.id.getOrElse(-1))
  // processes ->
  val bprocessF = BPDAOF.getByServices(user_services) // TODO: Not safe

  bprocessF.flatMap { processes =>
    // launches ->
    val launchesF = BPSessionDAOF.findByProcesses(processes.map(p => p.id.get))


    launchesF.flatMap { launches =>
      val launchesIds = launches.map(l => l.id.get).toList
      val allToposF = SessionElemTopologDAOF.getBySessions(launchesIds)
      val allElementsF = SessionProcElementDAOF.findByLaunchesIds(launchesIds)
      allToposF.flatMap { allTopos =>
        allElementsF.map { allElements =>
        // indicator values[resource,entity,value]
        val tables = DataTableIndicators(
          processes = processes,
          launches_indicators = launches.map { launch =>
            val launch_id = launch.id.get
            val assigns = SessionElementResourceDAO.getBySession(launch_id)
            val warpDatas = Await.result(wrapper.getWarpBoardByLaunch(launch_id), 
                                          Duration(waitSeconds, MILLISECONDS))
            val warpBoards = warpDatas.boards
            val warpEntities = warpDatas.entities
            val warpSlats = warpDatas.slats
            val resources = ResourceDAO.findByBusinessId(request.identity.businessFirst)
            println(s"finded assigns ${assigns.length}")
            val launch_assigns_cn = assigns.map { obj =>
              val entities:List[Entity] = findEntitiesFromLaunch(launch_id, List(obj))
              //val entities_ids = entities.map(o => idGetter(o.id))
              //SessionElementResourceContainer(obj, entities, findSlats(entities_ids, launch_id) )
                DatasElementContainer(
                  obj,
                  entities.map { entity =>
                    val board = warpBoards.find { b =>
                      val idString = b.id.get
                      println("board id:"+idString)
                      println("entity.boardId id:"+entity.boardId)
                      println("idString == entity.boardId:"+ idString == entity.boardId)

                      idString == entity.boardId
                    }
                    println("findResource" + findResource(board.get, entity, resources))
                    ElementCosts(
                      board.get, entity, findValueForElement(idGetter(entity.id), launch_id, obj.element_id),
                      findResource(board.get, entity, resources)
                    )
                  }
                )
            }

            LaunchIndicator(
              launch,
              allElements.filter(el => el.session == launch.id.get).map { element =>
                    LaunchIndicatorElement(
                      element = element,
                      topology = allTopos.find(topo => topo.front_elem_id == element.id).get,
                      indicators = launch_assigns_cn
                    )
              }
            )

            }
          )
          Ok(Json.toJson(tables))
        }
      }  
      

    }
  }
}

/****
 * Primary datatables of all indicators assigned to launch assigned to processes
 */
def actsTable = SecuredAction.async { implicit request =>
  // processes ->
  // launches ->
  // acts -> outputs
  Future.successful(
    Ok(Json.toJson("good"))
  )
}


/****
 * Resource elements
 */
//GET      /data/cost/collection/             @controllers.CostFillController.assignResourceCollection
def assignResourceCollection = SecuredAction.async { implicit request =>
  var (isManager, isEmployee, lang) = AccountsDAO.getRolesAndLang(request.identity.emailFilled).get
  val resources = ResourceDAO.findByBusinessId(request.identity.businessFirst)
	val resEntFut:Future[List[ResourceEntitySelector]] = BBoardWrapper().getEntityByResources(resources)
  for {
      resEntity <- resEntFut
  } yield   Ok(Json.toJson(resEntity))
}
// GET	 /data/cost/assigns/:process_id
def assigns(process_id: Int) = SecuredAction { implicit request =>
	var (isManager, isEmployee, lang) = AccountsDAO.getRolesAndLang(request.identity.emailFilled).get
	val assigns = ElementResourceDAO.getByProcess(process_id).map { obj =>
      ElementResourceContainer(obj, findEntitiesElRes(List(obj)) )
    }
    Ok(Json.toJson(assigns))
}
// BBOARD: getEntityByResourceId
// BBOARD: getSlatByEntitiesIds
// BBOARD: getWarpBoardByLaunch
//
// GET	 /data/cost/launch_assigns/:launch_id
def launch_assigns(launch_id: Int) = SecuredAction { implicit request =>
	var (isManager, isEmployee, lang) = AccountsDAO.getRolesAndLang(request.identity.emailFilled).get
  val assigns = SessionElementResourceDAO.getBySession(launch_id)
  println(s"finded assigns ${assigns.length}")
  val launch_assigns_cn = assigns.map { obj =>
      val entities:List[Entity] = findEntitiesFromLaunch(launch_id, List(obj))
      val entities_ids = entities.map(o => idGetter(o.id))
      SessionElementResourceContainer(obj, entities, findSlats(entities_ids, launch_id) )
  }
  val resources = ResourceDAO.findByBusinessId(request.identity.businessFirst)

  // Fill by warped datas
  val warpDatas = Await.result(wrapper.getWarpBoardByLaunch(launch_id), Duration(waitSeconds, MILLISECONDS))
  val warpBoards = warpDatas.boards
  val warpEntities = warpDatas.entities
  val warpSlats = warpDatas.slats
    Ok(Json.toJson(DatasContainer(costs = launch_assigns_cn,

      WarpData(warpBoards, warpEntities, warpSlats)) ))

}

// GET	 /data/cost/elem_launch_assigns/:launch_id
def launch_assigns_for_elements(launch_id: Int) = SecuredAction.async { implicit request =>
	var (isManager, isEmployee, lang) = AccountsDAO.getRolesAndLang(request.identity.emailFilled).get
  val assigns = SessionElementResourceDAO.getBySession(launch_id)

  val warpDatas = Await.result(wrapper.getWarpBoardByLaunch(launch_id), Duration(waitSeconds, MILLISECONDS))
  val warpBoards = warpDatas.boards
  val warpEntities = warpDatas.entities
  val warpSlats = warpDatas.slats

  val resources = ResourceDAO.findByBusinessId(request.identity.businessFirst)

  println(s"finded assigns ${assigns.length}")
  val launch_assigns_cn = assigns.map { obj =>
      val entities:List[Entity] = findEntitiesFromLaunch(launch_id, List(obj))
      //val entities_ids = entities.map(o => idGetter(o.id))
      //SessionElementResourceContainer(obj, entities, findSlats(entities_ids, launch_id) )
        DatasElementContainer(
          obj,
          entities.map { entity =>
            val board = warpBoards.find { b =>
              val idString = b.id.get
              println("board id:"+idString)
              println("entity.boardId id:"+entity.boardId)
              println("idString == entity.boardId:"+ idString == entity.boardId)

              idString == entity.boardId
            }
            println("findResource" + findResource(board.get, entity, resources))
            ElementCosts(
              board.get, entity, findValueForElement(idGetter(entity.id), launch_id, obj.element_id),
              findResource(board.get, entity, resources)
            )
          }
        )
  }


  // ElementCosts(entity: Entity, value: Option[Slat])
  // DatasElementContainer(obj: SessionElementResourceDTO, costs: List[ElementCosts])

    Future.successful(
        Ok(Json.toJson(
          launch_assigns_cn
        ))
    )
}




//POST	 /data/cost/assign/:resource_id		@controllers.CostFillController.assign_element(resource_id: Int)
def createCostElement(id: Int) = SecuredAction(BodyParsers.parse.json) { implicit request =>
	var (isManager, isEmployee, lang) = AccountsDAO.getRolesAndLang(request.identity.emailFilled).get
    val selected = request.body.validate[List[ResourceElementSelector]]
    // V
    selected.fold(
    errors => {
       Logger.error(s"error with $selected")
      BadRequest(Json.obj("status" ->"KO", "message" -> JsError.toJson(errors)))
    },
    resElSelects => {
    	println(resElSelects)
    	val results = resElSelects.map { resElSelect =>
	    	val elem_topology = ElemTopologDAO.get(resElSelect.elementId)
	    	elem_topology match {
	    		case Some(topo) => {
			    	ElementResourceDAO.pull_object(ElementResourceDTO(None, element_id = topo.id.get,
			  														  process_id       = topo.process,
			  														  resource_id      = resElSelect.resourceId,
			  														  entities = resElSelect.entityId))
			    	Json.toJson(Map("message" -> "ok"))
	    		}
	    		case _ => Json.obj("status" ->"KO", "message" -> "not created")
	    	}
    	}
      Ok(Json.toJson(results))
    }
  )
}

//POST	 /data/cost/launch_assign/:resource_id		@controllers.CostFillController.launch_assign_element(resource_id: Int)
def createLaunchCostElement(id: Int, session_id: Int) = SecuredAction.async(BodyParsers.parse.json) { implicit request =>
	var (isManager, isEmployee, lang) = AccountsDAO.getRolesAndLang(request.identity.emailFilled).get
    val selected = request.body.validate[List[ResourceElementSelector]]
    selected.fold(
    errors => {
       Logger.error(s"error with $selected")
      Future.successful( BadRequest(Json.obj("status" ->"KO", "message" -> JsError.toJson(errors))) )
    },
    resElSelects => {
    	println(resElSelects)
    	val resElSelect = resElSelects.head
	    	val elem_topologyF = SessionElemTopologDAOF.get(resElSelect.elementId)
        elem_topologyF.map { elem_topology =>


	    	elem_topology match {
	    		case Some(topo) => {
            // 1. Create or find board
            // 2. Create Entity
            val resourceId = SessionElementResourceDAO.pull_object(
            SessionElementResourceDTO(None, element_id = topo.id.get,
                                      process_id       = topo.process,
                                      resource_id      = resElSelect.resourceId,
                                      session_id = session_id,
                                      entities = resElSelect.entityId))
            // Add value

            Ok(Json.toJson(Map("message" -> "ok", "resource_id" -> resourceId.toString )))
	    		}
	    		case _ => BadRequest(Json.obj("status" ->"KO", "message" -> "not found"))
	    	}
        }

    	//Ok(Json.toJson(Map("message" -> "ok")))
    }
  )
}



//POST	 /data/cost/up_assign/:resource_id	@controllers.CostFillController.update_assigned_element(resource_id: Int)
def update_assigned_element(id: Int) = SecuredAction(BodyParsers.parse.json) { implicit request =>
	var (isManager, isEmployee, lang) = AccountsDAO.getRolesAndLang(request.identity.emailFilled).get
    val selected = request.body.validate[ResourceElementSelector]
    selected.fold(
    errors => {
       Logger.error(s"error with $selected")
      BadRequest(Json.obj("status" ->"KO", "message" -> JsError.toJson(errors)))
    },
    resElSelect => {
    	println(resElSelect)
    }
  )
    Ok(Json.toJson(Map("message" -> "ok")))
}





//POST
def removeEntityById(entity_id: String) = SecuredAction.async { implicit request =>
  wrapper.removeEntityById(entity_id).map { result =>
    Ok(Json.toJson( "oK"))
  }
}





//POST	 /data/cost/del_assign/:resource_id @controllers.CostFillController.delete_assigned_element(resource_id: Int)
def delete_assigned_element(id: Int) = SecuredAction(BodyParsers.parse.json) { implicit request =>
	var (isManager, isEmployee, lang) = AccountsDAO.getRolesAndLang(request.identity.emailFilled).get
    /*
    val selected = request.body.validate[ResourceElementSelector]
    selected.fold(
    errors => {
       Logger.error(s"error with $selected")
      BadRequest(Json.obj("status" ->"KO", "message" -> JsError.toJson(errors)))
    },
    resElSelect => {
    	println(resElSelect)
    	ElementResourceDAO.delete(id) match {
    		case _ => Ok(Json.toJson(Map("message" -> "ok")))
    	}
    }
  )*/
  ElementResourceDAO.delete(id) match {
  	case _ => Ok(Json.toJson(Map("message" -> "ok")))
  }
}

def delete_launch_assigned_element(id: Int) = SecuredAction(BodyParsers.parse.json) { implicit request =>
	var (isManager, isEmployee, lang) = AccountsDAO.getRolesAndLang(request.identity.emailFilled).get

  // 1. Remove values
  // 2. Remove entities
  SessionElementResourceDAO.delete(id) match {
  	case a => Ok(Json.toJson(Map("message" -> a.toString)))
  }
}


val wrapper = minority.utils.BBoardWrapper.apply()
val waitSeconds = 100000
private def idGetter(id:Option[UUID]):String = {
  id match {
    case Some(id) => id.toString
    case _ => ""
  }
}

private def findEntitiesElRes(costs:List[ElementResourceDTO]):List[Entity] = {
  val resource_ids = costs.map(_.resource_id)
  val entities_ft = resource_ids.map(resource_id => wrapper.getEntityByResourceId(resource_id))
  val entities = entities_ft.map(ft => Await.result(ft, Duration(waitSeconds, MILLISECONDS)))
  entities.flatten
}
private def findEntitiesFromLaunch(launch_id:Int,costs: List[SessionElementResourceDTO]):List[Entity] = {
  val resource_ids = costs.map(_.resource_id)
  val entities_ft = resource_ids.map(resource_id => wrapper.getEntityByResourceId(resource_id))
  val entities = entities_ft.map(ft => Await.result(ft, Duration(waitSeconds, MILLISECONDS)))
  entities.flatten
}
private def findSlats(entities_ids: List[String], launchId: Int):List[Slat] = {
  val ft = wrapper.getSlatByEntitiesIds(entities_ids)
  val result = Await.result(ft, Duration(waitSeconds, MILLISECONDS))
  val finalResult = result.filter(slat => detectMetaLaunch(slat.meta) == launchId)
  println(s"find Slats for costs ${finalResult.length}")
  finalResult.map(c => println("slat id"+ c.id))
  finalResult
}
private def findResource(board:Board, entity: Entity, resources: List[ResourceDTO]):Option[ResourceDTO] = {
    val resourceID = board.meta.find(meta => meta.key == "resource_id").map(meta => meta.value)
    resourceID match {
      case Some(resId) => {
        resources.find(r => r.id.get == resId.toInt)
      }
      case _ => None
    }
}
private def findValue(entity_id:String, launchId: Int):Option[Slat] = {
  val entities_ids = List(entity_id)
  val ft = wrapper.getSlatByEntitiesIds(entities_ids)
  val result = Await.result(ft, Duration(waitSeconds, MILLISECONDS))
  val finalResult = result.filter(slat => detectMetaLaunch(slat.meta) == launchId)
  println(s"find Slats for costs ${finalResult.length}")
  finalResult.map(c => println("slat id"+ c.id))
  finalResult.headOption
}
private def findValueForElement(entity_id:String, launchId: Int, elementId: Int):Option[Slat] = {
  val entities_ids = List(entity_id)
  val ft = wrapper.getSlatByEntitiesIds(entities_ids)
  val result = Await.result(ft, Duration(waitSeconds, MILLISECONDS))
  val finalResult = result.filter(slat => detectMetaLaunch(slat.meta) == launchId && detectMetaElement(slat.meta) == elementId)
  println(s"find Slats for costs ${finalResult.length}")
  finalResult.map(c => println("slat id"+ c.id))
  finalResult.headOption
}

private def detectMetaElement(meta: List[minority.utils.MetaVal]) = meta.find(m => m.key == "elementId") match {
    case Some(meta) => meta.value.toInt
    case _ => -1
}
private def detectMetaLaunch(meta: List[minority.utils.MetaVal]) = meta.find(m => m.key == "launchId") match {
    case Some(meta) => meta.value.toInt
    case _ => -1
}



}
