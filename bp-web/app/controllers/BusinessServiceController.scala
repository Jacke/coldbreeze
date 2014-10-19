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
import models.DAO.resources._
import models.DAO._
import service.DemoUser
import securesocial.core._
/**
 * Created by Sobolev on 22.07.2014.
 */
object BusinessServiceForms {
  val serviceForm = Form(
    mapping(
      "id" -> optional(number),
      "title" -> nonEmptyText,
      "business_id" -> default(number, 1),
      "master_acc" -> default(text, ""))(BusinessServiceDTO.apply)(BusinessServiceDTO.unapply))
}

class BusinessServiceController(override implicit val env: RuntimeEnvironment[DemoUser]) extends Controller with securesocial.core.SecureSocial[DemoUser] {
  import play.api.Play.current



 val Home = Redirect(routes.ProfileController.profile())

   val serviceForm = Form(
    mapping(
      "id" -> optional(number),
      "title" -> nonEmptyText,
      "business_id" -> default(number, 1),
      "master_acc" -> default(text, ""))(BusinessServiceDTO.apply)(BusinessServiceDTO.unapply))

 def index() = SecuredAction { implicit request =>
      val services = BusinessServiceDAO.getAll
      val businesses = BusinessDAO.getAll
      Ok(views.html.businesses.services(
        Page(services, 1, 1, services.length), 1, "%", businesses, request.user))

  }
  implicit val bservicesReads = Json.reads[BusinessServiceDTO]
  implicit val bservicesWrites = Json.format[BusinessServiceDTO]


  def bprocesses_services() = SecuredAction { implicit request =>
      val services = BusinessServiceDAO.getAll.filter(service => service.master_acc == request.user.main.email.get)
      val businesses = BusinessDAO.getAll.contains(EmployeesBusinessDAO.getByUID(request.user.main.email.get).map(e => Some(e._2)))
      Ok(Json.toJson(services))
  }

  def create() = SecuredAction { implicit request =>
        Ok(views.html.businesses.service_form(serviceForm, request.user))
  }
  def create_new() = SecuredAction { implicit request =>
    println(request)
    println(serviceForm.bindFromRequest)
    serviceForm.bindFromRequest.fold(
      formWithErrors => BadRequest(views.html.businesses.service_form(formWithErrors, request.user)),
      entity => {
          val uid = request.user.main.email.get
          val emp = EmployeeDAO.getByUID(uid).isDefined


          val biz_id = EmployeesBusinessDAO.getByUID(uid).get._2
          BusinessServiceDAO.pull_object(entity.copy(business_id = biz_id, master_acc = uid))
          
          
          Home.flashing("success" -> s"Entity ${entity.title} has been created")

      })
  }
  def update(id: Int) = SecuredAction { implicit request =>
      val services = BusinessServiceDAO.get(id)
      services match {
        case Some(service) =>
        val srvc = BusinessServiceDTO(service.id, service.title, service.business_id)
         Ok(views.html.businesses.service_edit_form(id, serviceForm.fill(srvc), request.user))
        case None => Ok("not found")
      }



  }
  def update_make(id: Int) = SecuredAction { implicit request =>
      serviceForm.bindFromRequest.fold(
        formWithErrors => BadRequest(views.html.businesses.service_edit_form(id, formWithErrors, request.user)),
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
