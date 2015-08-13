package controllers

import models.DAO.resources._
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
import models.AccountDAO
/**
 * Created by Sobolev on 19.05.2015.
 */

class GroupController(override implicit val env: RuntimeEnvironment[DemoUser]) extends Controller with securesocial.core.SecureSocial[DemoUser] {
  import play.api.Play.current

   val Home = Redirect(users.routes.EmployeeController.index())

  implicit val GroupDTOReads = Json.reads[GroupDTO]
  implicit val GroupDTOWrites = Json.format[GroupDTO]
   val groupForm = Form(
    mapping(
      "id" -> optional(number),
      "title" -> nonEmptyText,
      "business" -> number,
      "created_at" -> optional(jodaDate),
      "created_at" -> optional(jodaDate))(GroupDTO.apply)(GroupDTO.unapply))

 def index() = SecuredAction { implicit request =>
      val user = request.user
      //val employees = EmployeeDAO.getAllByMaster(user.main.email.get)
      //val accounts = models.AccountsDAO.findAllByEmails(employees.map(emp => emp.uid))
      val businesses = BusinessDAO.getAll
      //val ebs = EmployeesBusinessDAO.getAll
      //val assign = businesses.filter(b => !(ebs.map(eb => eb._2).contains(b.id.get)))
      //val assigned = businesses.filter(b => ebs.map(eb => eb._2).contains(b.id.get))
      Ok("Ok")
      //Ok(views.html.businesses.users.employees(
      //  Page(employees, 1, 1, employees.length), accounts, 1, "%", assign, assigned)(user))

  }
  def create() = SecuredAction { implicit request =>
        Home//Ok(views.html.businesses.users.employee_form(groupForm, request.user))
  }
  def create_new() = SecuredAction(BodyParsers.parse.json) { implicit request =>
  	val now = org.joda.time.DateTime.now()
    val true_business = EmployeesBusinessDAO.getByUID(request.user.main.email.get)
    println("true_business")
    println(true_business)
    println(request.body.validate[GroupDTO])
    true_business match {
    case Some(x) => { request.body.validate[GroupDTO].map{
        case entity => { 
              println("entity")
              println(entity, x)
          val idd = GroupsDAO.pull_object(GroupDTO(None, entity.title, business = x._2, Some(now),Some(now)))
          Ok(Json.toJson(Map("success" -> Json.toJson(entity), "id" -> Json.toJson(idd))))
        }
      }.recoverTotal{
        e => BadRequest("Can't create group")
      }
    }
    case _ => BadRequest("Can't create group")
    }
  }
  def update(id: Int) = SecuredAction { implicit request =>
      val employee = EmployeeDAO.get(id)
      employee match {
        case Some(group) =>
         Home//Ok(views.html.businesses.users.employee_edit_form(id, groupForm.fill(group), request.user))
        case None => Ok("not found")
      }
  }
  def update_make(id: Int) = SecuredAction { implicit request =>
      groupForm.bindFromRequest.fold(
        formWithErrors => Home,//BadRequest(views.html.businesses.users.employee_edit_form(id, formWithErrors, request.user)),
        entity => {
          Home.flashing(GroupsDAO.update(id,entity) match {
            case 0 => "failure" -> s"Could not update entity ${entity.id}"
            case _ => "success" -> s"Entity ${entity.id} has been updated"
          })
        })

  }
  def assign_user(account_id: String, group_id: Int) = SecuredAction { implicit request =>
  	AccountGroupDAO.assign(account_id, group_id) match {
  		case -1 => BadRequest("asigned operation failed")
  		case _ => Ok("asigned")
  	}
  }
  def unassign_user(account_id: String, group_id: Int) = SecuredAction { implicit request =>
  	AccountGroupDAO.unassign(account_id, group_id) match {
  		case -1 => BadRequest("unassigned operation failed")
  		case _ => Ok("unassigned")
  	}
  }
  def destroy(id: Int) = SecuredAction { implicit request =>
      Home.flashing(GroupsDAO.delete(id) match {
        case 0 => "failure" -> "Entity has Not been deleted"
        case x => "success" -> s"Entity has been deleted (deleted $x row(s))"
      })

  }

}
