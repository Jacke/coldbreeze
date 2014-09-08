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

import views._
import models.User
import models.Page
import models.DAO.resources._
import service.DemoUser
import securesocial.core._
/**
 * Created by Sobolev on 22.07.2014.
 */
class PermissionController(override implicit val env: RuntimeEnvironment[DemoUser]) extends Controller with securesocial.core.SecureSocial[DemoUser] {
  import play.api.Play.current

val Home = Redirect(routes.BusinessController.index())
  implicit val PermiReads = Json.reads[ActPermission]
  implicit val PermiWrites = Json.format[ActPermission]


// case class ActPermission(var id: Option[Int], uid: String, front_elem_id:Option[Int], space_elem_id:Option[Int])
val elemPermForm = Form(
    mapping(
      "id" -> optional(number),
      "uid" -> nonEmptyText,
      "front_elem_id" -> optional(number),
      "space_elem_id" -> optional(number))(ActPermission.apply)(ActPermission.unapply))
 
 def index() = SecuredAction { implicit request =>
      val elemperms = ActPermissionDAO.getAll
      Ok(Json.toJson(elemperms))
      /*Ok(views.html.permissions.element.index(
        Page(elemperms, 1, 1, elemperms.length), 1, "%")(Some(request.user.main)))*/
    
  }
  def create() = SecuredAction { implicit request =>
        Ok(views.html.permissions.element.elemperm_form(elemPermForm)(Some(request.user.main)))    
  }
  def create_new() = SecuredAction { implicit request =>

    elemPermForm.bindFromRequest.fold(
      formWithErrors => BadRequest(views.html.permissions.element.elemperm_form(formWithErrors)(Some(request.user.main))),
      entity => {

          val biz_id = ActPermissionDAO.pull_object(entity)
          /*val emp_id = EmployeeDAO.getByUID(request.user.main.userId) 
          emp_id match {
            case Some(employee) => EmployeesBusinessDAO.pull(employee_id = employee.id.get, business_id = biz_id)
            case _ =>
          }*/
          
          Ok(Json.toJson(Map("success" -> entity.uid)))
          //Home.flashing("success" -> s"Entity ${entity.uid} has been created")
        
      })
  }
  def update(id: Int) = SecuredAction { implicit request =>
      val perm = ActPermissionDAO.get(id)
      perm match {
        case Some(x) =>
        val prm = ActPermission(x.id, x.uid, x.front_elem_id, x.space_elem_id)
         Ok(views.html.permissions.element.elemperm_edit_form(id, elemPermForm.fill(prm))(Some(request.user.main))) 
        case None => Ok("not found")
      }

      
    
  }
  def update_make(id: Int) = SecuredAction { implicit request =>
      elemPermForm.bindFromRequest.fold(
        formWithErrors => BadRequest(views.html.permissions.element.elemperm_edit_form(id, formWithErrors)(Some(request.user.main))),
        entity => {
          ActPermissionDAO.update(id,entity) match {
            case 0 => Ok(Json.toJson(Map("failure" -> s"${entity.uid}")))
            case _ => Ok(Json.toJson(Map("success" -> s"${entity.uid}")))
          }
        })
    
  }
  def destroy(id: Int) = SecuredAction { implicit request =>
    
      ActPermissionDAO.delete(id) match {
        case 0 => Ok(Json.toJson(Map("failure" -> "Entity has Not been deleted")))
        case x => Ok(Json.toJson(Map("success" -> s"Entity has been deleted (deleted $x row(s))")))
      }
    
  }

}
