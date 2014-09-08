package controllers.users

import models.DAO.resources.{EmployeeDTO, EmployeeDAO}
import models.DAO.resources.EmployeesBusinessDAO
import models.DAO.resources.BusinessDAO
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

import views._
import models.Page
import models.User
import service.DemoUser
import securesocial.core._
import models.DAO.resources.ClientBusinessDAO
import models.DAO.resources.web._

/**
 * Created by Sobolev on 22.07.2014.
 */
class EmployeeController(override implicit val env: RuntimeEnvironment[DemoUser]) extends Controller with securesocial.core.SecureSocial[DemoUser] {
  import play.api.Play.current
 
   val Home = Redirect(routes.EmployeeController.index())

   case class UIDS(emails: List[String], manager: Boolean)
  implicit val InputParamReads = Json.reads[UIDS]
  implicit val InputParamWrites = Json.format[UIDS]
   //val uidsForm = Form()
   // case class EmployeeDTO(var id: Option[Int], uid: String, acc:Int, position:Option[String], manager:Boolean = false)
   val employeeForm = Form(
    mapping(
      "id" -> optional(number),
      "uid" -> nonEmptyText,
      "master_acc" -> nonEmptyText,
      "position" -> optional(text),
      "manager" -> boolean)(EmployeeDTO.apply)(EmployeeDTO.unapply))
 
 def index() = SecuredAction { implicit request =>
      val user = request.user.main
      val employees = EmployeeDAO.getAll
      val businesses = BusinessDAO.getAll
      val ebs = EmployeesBusinessDAO.getAll
      val assign = businesses.filter(b => !(ebs.map(eb => eb._2).contains(b.id.get)))
      val assigned = businesses.filter(b => ebs.map(eb => eb._2).contains(b.id.get))
      Ok(views.html.businesses.users.employees(
        Page(employees, 1, 1, employees.length), 1, "%", assign, assigned)(Some(user)))
    
  }
  def create() = Action { implicit request =>
        Ok(views.html.businesses.users.employee_form(employeeForm))    
  }
  def create_new() = SecuredAction(BodyParsers.parse.json) { implicit request => 
    println(request)
    println(employeeForm.bindFromRequest)
    println("from")
    println(request.user.main.email)
    println(request.body.validate[UIDS])
    Ok(Json.toJson(Map("xx" -> 1)))
    /*
    employeeForm.bindFromRequest.fold(
      formWithErrors => BadRequest(views.html.businesses.users.employee_form(formWithErrors)),
      entity => {
          println("FIND OR CREATE!!!!!!!!!!")
          println(models.User.findByEmail(entity.uid))
          //EmployeeDAO.pull_object(entity)
          Home.flashing("success" -> s"Entity ${entity.uid} has been created")
        
      })*/
  }
  def update(id: Int) = Action { implicit request =>
      val employee = EmployeeDAO.get(id)
      employee match {
        case Some(employee) =>
         Ok(views.html.businesses.users.employee_edit_form(id, employeeForm.fill(employee))) 
        case None => Ok("not found")
      }

      
    
  }
  def update_make(id: Int) = Action { implicit request =>
      employeeForm.bindFromRequest.fold(
        formWithErrors => BadRequest(views.html.businesses.users.employee_edit_form(id, formWithErrors)),
        entity => {
          Home.flashing(EmployeeDAO.update(id,entity) match {
            case 0 => "failure" -> s"Could not update entity ${entity.uid}"
            case _ => "success" -> s"Entity ${entity.uid} has been updated"
          })
        })
    
  }
  def assign_business(employee_id: Int, business_id: Int) = Action { implicit request =>
      val business = BusinessDAO.get(business_id)
      business match {
        case Some(business) => 
          EmployeesBusinessDAO.pull(employee_id = employee_id, business_id = business_id)
          Home.flashing("success" -> s"Employee $employee_id was assigned")
        case None => Home.flashing("failure" -> s"Business with $business_id not found")
      }
    
  }
  def unassign_business(employee_id: Int, business_id: Int) = Action { implicit request =>
      val business = BusinessDAO.get(business_id)
      business match {
        case Some(business) => 
          EmployeesBusinessDAO.deleteByEmployeeAndBusiness(employee_id, business_id)
          Home.flashing("success" -> s"Employee $employee_id was assigned")
        case None => Home.flashing("failure" -> s"Business with $business_id not found")
      }
    
  }
  def destroy(id: Int) = Action { implicit request =>
    
      Home.flashing(EmployeeDAO.delete(id) match {
        case 0 => "failure" -> "Entity has Not been deleted"
        case x => "success" -> s"Entity has been deleted (deleted $x row(s))"
      })
    
  }

}
