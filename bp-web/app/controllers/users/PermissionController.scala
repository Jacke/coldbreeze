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
import models.DAO._
import service.DemoUser
import securesocial.core._
import models.AccountDAO


/**
 * Created by Sobolev on 22.07.2014.
 */
class PermissionController(override implicit val env: RuntimeEnvironment[DemoUser]) extends Controller with securesocial.core.SecureSocial[DemoUser] {


case class ActPermissionJSON(elemperms: List[ActPermission], employees: List[EmployeeDTO], accounts: List[AccountDAO])
val Home = Redirect(routes.BusinessController.index())



  implicit val EmployeeDTOReads = Json.reads[EmployeeDTO]
  implicit val EmployeeDTOWrites = Json.format[EmployeeDTO]
  implicit val AccountDAOReads = Json.reads[AccountDAO]
  implicit val AccountDAOWrites = Json.format[AccountDAO]
  implicit val PermiReads = Json.reads[ActPermission]
  implicit val PermiWrites = Json.format[ActPermission]

  implicit val ActPermissionJSONReads = Json.reads[ActPermissionJSON]
  implicit val ActPermissionJSONWrites = Json.format[ActPermissionJSON]

// case class ActPermission(var id: Option[Int], uid: String, front_elem_id:Option[Int], space_elem_id:Option[Int])
val elemPermForm = Form(
    mapping(
      "id" -> optional(number),
      "uid" -> nonEmptyText,
      "bprocess" -> number,
      "front_elem_id" -> optional(number),
      "space_elem_id" -> optional(number))(ActPermission.apply)(ActPermission.unapply))
 
 def index() = SecuredAction { implicit request =>
      val user_services = BusinessServiceDAO.getByMaster(request.user.main.email.getOrElse("")).map(_.id)
      var proc_ids:List[Int] = BPDAO.getByServices(user_services.flatten).map(_.id).flatten
      if (request.user.isEmployee) { 
       // Employee assigned process
       val acts = ActPermissionDAO.getByUID(request.user.main.email.get)
       val bpIds = ActPermissionDAO.getByUIDprocIDS(request.user.main.email.get)
       proc_ids = proc_ids ++ bpIds
      }
      val elemperms = ActPermissionDAO.getByProcessesIDS(proc_ids)





      val employees = EmployeeDAO.getAllByMaster(request.user.main.email.get)
      val accounts = models.AccountsDAO.findAllByEmails(employees.map(emp => emp.uid)).map(ac => ac.copy(password = "", hasher = ""))

      Ok(Json.toJson(ActPermissionJSON(elemperms, employees, accounts)))
      /*Ok(views.html.permissions.element.index(
        Page(elemperms, 1, 1, elemperms.length), 1, "%")(Some(request.user.main)))*/
    
  }
  def proc_index(BPid: Int) = SecuredAction { implicit request =>
    val elemperms = ActPermissionDAO.getAll
    val elms = ProcElemDAO.findByBPId(BPid).map(_.id)
    val spelms = SpaceElemDAO.findByBPId(BPid).map(_.id)
    
    val employees = EmployeeDAO.getAllByMaster(request.user.main.email.get)
    val accounts = models.AccountsDAO.findAllByEmails(employees.map(emp => emp.uid)).map(ac => ac.copy(password = "", hasher = ""))

    Ok(Json.toJson(
      ActPermissionJSON(
        elemperms.filter(perm => elms.contains(perm.front_elem_id) || spelms.contains(perm.space_elem_id) ),
        employees,
        accounts
        )))
  }
  def create() = SecuredAction { implicit request =>
        Ok("x")//views.html.permissions.element.elemperm_form(elemPermForm)(Some(request.user.main)))    
  }
  def create_new() = SecuredAction { implicit request =>
    elemPermForm.bindFromRequest.fold(
      formWithErrors => BadRequest(Json.toJson(Map("success" -> formWithErrors.toString))),
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
        val prm = ActPermission(x.id, x.uid, x.bprocess, x.front_elem_id, x.space_elem_id)
         Ok("Updated") 
        case None => Ok("not found")
      }

      
    
  }
  def update_make(id: Int) = SecuredAction { implicit request =>
      /*elemPermForm.bindFromRequest.fold(
        formWithErrors => BadRequest(views.html.permissions.element.elemperm_edit_form(id, formWithErrors)(Some(request.user.main))),
        entity => {
          ActPermissionDAO.update(id,entity) match {
            case 0 => Ok(Json.toJson(Map("failure" -> s"${entity.uid}")))
            case _ => Ok(Json.toJson(Map("success" -> s"${entity.uid}")))
          }
        })*/ Ok("updated")
    
  }
  def destroy(id: Int) = SecuredAction { implicit request =>
    
      ActPermissionDAO.delete(id) match {
        case 0 => Ok(Json.toJson(Map("failure" -> "Entity has Not been deleted")))
        case x => Ok(Json.toJson(Map("success" -> s"Entity has been deleted (deleted $x row(s))")))
      }
    
  }

}
