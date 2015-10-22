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
import service.DemoUser
import scala.concurrent._
import scala.concurrent.duration._
import securesocial.core._
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
// ResourceEntitySelector for assign resource form
// case class ResourceEntitySelector(resource: ResourceDTO, entities: List[Entity])
// by default accepted resource work for all entities
case class ResourceElementSelector(elementId: Int, resourceId: Int, entityId: String = "*")


class CostFillController(override implicit val env: RuntimeEnvironment[DemoUser]) extends Controller with securesocial.core.SecureSocial[DemoUser] {
  import play.api.libs.json.Json
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


/****
 * Resource elements
 */
//GET      /data/cost/collection/             @controllers.CostFillController.assignResourceCollection
def assignResourceCollection = SecuredAction.async { implicit request => 
  var (isManager, isEmployee, lang) = AccountsDAO.getRolesAndLang(request.user.main.email.get).get
    val resources = ResourceDAO.findByBusinessId(request.user.businessFirst)
	val resEntFut:Future[List[ResourceEntitySelector]] = BBoardWrapper().getEntityByResources(resources)
     for {
        resEntity <- resEntFut
     } yield   Ok(Json.toJson(resEntity))
}
// GET	 /data/cost/assigns/:process_id
def assigns(process_id: Int) = SecuredAction { implicit request => 
	var (isManager, isEmployee, lang) = AccountsDAO.getRolesAndLang(request.user.main.email.get).get
	val assigns = ElementResourceDAO.getByProcess(process_id)
    Ok(Json.toJson(assigns))
}
// GET	 /data/cost/launch_assigns/:launch_id
def launch_assigns(launch_id: Int) = SecuredAction { implicit request => 
	var (isManager, isEmployee, lang) = AccountsDAO.getRolesAndLang(request.user.main.email.get).get
	val assigns = SessionElementResourceDAO.getBySession(launch_id)
    Ok(Json.toJson(assigns))
}
//POST	 /data/cost/assign/:resource_id		@controllers.CostFillController.assign_element(resource_id: Int)
def assign_element(id: Int) = SecuredAction(BodyParsers.parse.json) { implicit request => 
	var (isManager, isEmployee, lang) = AccountsDAO.getRolesAndLang(request.user.main.email.get).get
    val selected = request.body.validate[List[ResourceElementSelector]]
    selected.fold(
    errors => {
       Logger.error(s"error with $selected")
      BadRequest(Json.obj("status" ->"KO", "message" -> JsError.toFlatJson(errors)))
    },
    resElSelects => { 
    	println(resElSelects)
    	resElSelects.foreach { resElSelect =>
	    	val elem_topology = ElemTopologDAO.get(resElSelect.elementId)
	    	elem_topology match {
	    		case Some(topo) => {
			    	ElementResourceDAO.pull_object(ElementResourceDTO(None, element_id = topo.id.get,
			  														  process_id       = topo.process,
			  														  resource_id      = resElSelect.resourceId,
			  														  entities = resElSelect.entityId)) 
			    	//Ok(Json.toJson(Map("message" -> "ok")))

	    		}
	    		case _ => //BadRequest(Json.obj("status" ->"KO", "message" -> "not found"))
	    	}
    	}
    	Ok(Json.toJson(Map("message" -> "ok")))
    }
  )
}
//POST	 /data/cost/up_assign/:resource_id	@controllers.CostFillController.update_assigned_element(resource_id: Int)
def update_assigned_element(id: Int) = SecuredAction(BodyParsers.parse.json) { implicit request => 
	var (isManager, isEmployee, lang) = AccountsDAO.getRolesAndLang(request.user.main.email.get).get
    val selected = request.body.validate[ResourceElementSelector]
    selected.fold(
    errors => {
       Logger.error(s"error with $selected")
      BadRequest(Json.obj("status" ->"KO", "message" -> JsError.toFlatJson(errors)))
    },
    resElSelect => { 
    	println(resElSelect)
    }
  )
    Ok(Json.toJson(Map("message" -> "ok")))
}
//POST	 /data/cost/del_assign/:resource_id @controllers.CostFillController.delete_assigned_element(resource_id: Int)
def delete_assigned_element(id: Int) = SecuredAction(BodyParsers.parse.json) { implicit request => 
	var (isManager, isEmployee, lang) = AccountsDAO.getRolesAndLang(request.user.main.email.get).get
    /*
    val selected = request.body.validate[ResourceElementSelector]
    selected.fold(
    errors => {
       Logger.error(s"error with $selected")
      BadRequest(Json.obj("status" ->"KO", "message" -> JsError.toFlatJson(errors)))
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





}