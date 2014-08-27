package controllers
import play.api._
import play.api.mvc._
import play.twirl.api.Html

//{Action, Controller}
import play.api.http.MimeTypes
import play.api.libs.json._
import play.api.cache._
import play.api.data._
import play.api.data.Forms._
import java.util.UUID
import models.DAO.resources.BusinessServiceDTO
import models.DAO.resources.BusinessServiceDAO
import models.DAO.resources.{BusinessDAO, BusinessDTO}

import views._
import models.Page
import models.User
import service.DemoUser
import securesocial.core._
/**
 * Created by Sobolev on 22.07.2014.
 */
class BusinessServiceController(override implicit val env: RuntimeEnvironment[DemoUser]) extends Controller with securesocial.core.SecureSocial[DemoUser] {
  import play.api.Play.current
 


 val Home = Redirect(routes.BusinessServiceController.index())

   val serviceForm = Form(
    mapping(
      "id" -> optional(number),
      "title" -> nonEmptyText,
      "business_id" -> number)(BusinessServiceDTO.apply)(BusinessServiceDTO.unapply))
 
 def index() = SecuredAction { implicit request =>
      val services = BusinessServiceDAO.getAll
      val businesses = BusinessDAO.getAll
      Ok(views.html.businesses.services(
        Page(services, 1, 1, services.length), 1, "%", businesses))
    
  }
  implicit val bservicesReads = Json.reads[BusinessServiceDTO]
  implicit val bservicesWrites = Json.format[BusinessServiceDTO]


  def bprocesses_services() = Action { implicit request =>
      val services = BusinessServiceDAO.getAll
      val businesses = BusinessDAO.getAll
      Ok(Json.toJson(services))
  }
  
  def create() = SecuredAction { implicit request =>
        Ok(views.html.businesses.service_form(serviceForm))    
  }
  def create_new() = SecuredAction { implicit request =>
    println(request)
    println(serviceForm.bindFromRequest)
    serviceForm.bindFromRequest.fold(
      formWithErrors => BadRequest(views.html.businesses.service_form(formWithErrors)),
      entity => {

          BusinessServiceDAO.pull_object(entity)
          Home.flashing("success" -> s"Entity ${entity.title} has been created")
        
      })
  }
  def update(id: Int) = SecuredAction { implicit request =>
      val services = BusinessServiceDAO.get(id)
      services match {
        case Some(service) =>
        val srvc = BusinessServiceDTO(service.id, service.title, service.business_id)
         Ok(views.html.businesses.service_edit_form(id, serviceForm.fill(srvc))) 
        case None => Ok("not found")
      }

      
    
  }
  def update_make(id: Int) = SecuredAction { implicit request =>
      serviceForm.bindFromRequest.fold(
        formWithErrors => BadRequest(views.html.businesses.service_edit_form(id, formWithErrors)),
        entity => {
          Home.flashing(BusinessServiceDAO.update(id,entity) match {
            case 0 => "failure" -> s"Could not update entity ${entity.title}"
            case _ => "success" -> s"Entity ${entity.title} has been updated"
          })
        })
    
  }
  def destroy(id: Int) = SecuredAction { implicit request =>
      println("destroy")
      Home.flashing(BusinessServiceDAO.delete(id) match {
        case 0 => "failure" -> "Entity has Not been deleted"
        case x => "success" -> s"Entity has been deleted (deleted $x row(s))"
      })
    
  }

}