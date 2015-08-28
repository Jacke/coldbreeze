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
import models.DAO.resources.{AccoutGroupDTO,
AccountGroupDAO,
GroupDTO,
GroupsDAO}
import models.DAO.resources.ClientBusinessDAO
import models.DAO.resources.web._
import models.AccountDAO

  import play.api.libs.json._
    import play.api.libs.functional.syntax._

/**
 * Created by Sobolev on 22.07.2014.
 */
case class ActorCont(emps: List[EmployeeDTO], creds:List[AccountDAO])

class EmployeeController(override implicit val env: RuntimeEnvironment[DemoUser]) extends Controller with securesocial.core.SecureSocial[DemoUser] {
  import play.api.Play.current
  import models.AccImplicits._
   val Home = Redirect(routes.EmployeeController.index())

   case class UIDS(emails: List[String], manager: Boolean)


  implicit val UIDSReads = Json.reads[UIDS]
  implicit val UIDSWrites = Json.format[UIDS]
  implicit val InputParamReads = Json.reads[EmployeeDTO]
  implicit val InputParamWrites = Json.format[EmployeeDTO]
  implicit val AccountReads = Json.reads[AccountDAO]
  implicit val AccountWrites = Json.format[AccountDAO]
  implicit val ActorContReads = Json.reads[ActorCont]
  implicit val ActorContWrites = Json.format[ActorCont]

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
      val user = request.user
      val employees = EmployeeDAO.getAllByMaster(user.main.email.get)
      val accounts = models.AccountsDAO.findAllByEmails(employees.map(emp => emp.uid))
      val businesses = BusinessDAO.getAll
      val ebs = EmployeesBusinessDAO.getAll
      val assign = businesses.filter(b => !(ebs.map(eb => eb._2).contains(b.id.get)))
      val assigned = businesses.filter(b => ebs.map(eb => eb._2).contains(b.id.get))
      val true_business = EmployeesBusinessDAO.getByUID(request.user.main.email.get)
      var groups: List[GroupDTO] = List()
      true_business match {
        case Some(biz) => groups = GroupsDAO.getAllByBusiness(biz._2)
        case _ => groups = List()
      }
      Ok(views.html.businesses.users.employees(
        Page(employees, 1, 1, employees.length), accounts, 1, "%", assign, assigned, groups)(user))
  }
  def index_group(group_id: Int) = SecuredAction { implicit request =>
      val user = request.user
      val all_employees = EmployeeDAO.getAllByMaster(user.main.email.get)
      val grouped_employees = AccountGroupDAO.getAllByGroup(group_id).map(_.account_id)

      val employees = all_employees.filter(emp => grouped_employees.contains(emp.uid))
      val employees_ungrouped = all_employees.filter(emp => !grouped_employees.contains(emp.uid))

      val accounts = models.AccountsDAO.findAllByEmails(all_employees.map(emp => emp.uid))
      println("Accounts: ")
      employees.map(emp => println(emp.uid))
      println(accounts)

      val businesses = BusinessDAO.getAll
      val ebs = EmployeesBusinessDAO.getAll
      val assign = businesses.filter(b => !(ebs.map(eb => eb._2).contains(b.id.get)))
      val assigned = businesses.filter(b => ebs.map(eb => eb._2).contains(b.id.get))
      val true_business = EmployeesBusinessDAO.getByUID(request.user.main.email.get)
      var groups: List[GroupDTO] = List()

      true_business match {
        case Some(biz) => groups = GroupsDAO.getAllByBusiness(biz._2)
        case _ => groups = List()
      }
      Ok(views.html.businesses.users.employees_group(
        Page(employees, 1, 1, employees.length), accounts, 1, "%", assign, assigned, groups, employees_ungrouped)(user))

  }


  def actors() = SecuredAction { implicit request =>
     val user = request.user.main
     val employees:List[EmployeeDTO] = EmployeeDAO.getAllByMaster(user.email.get)
     val creds:List[AccountDAO] =  models.AccountsDAO.findAllByEmails(employees.map(_.master_acc))

      Ok(Json.toJson(ActorCont(employees, creds)))
  }
  def create() = SecuredAction { implicit request =>
        Ok(views.html.businesses.users.employee_form(employeeForm, request.user))
  }
  def create_new() = SecuredAction(BodyParsers.parse.json) { implicit request =>

    request.body.validate[UIDS].map{
      case entity => { entity.emails.map {
            e => EmployeeDTO(None, e, request.user.main.email.get, None, entity.manager)
      }.map{ emp =>
        EmployeeDAO.pull_object_for(emp, request.user.main.email.get)
        controllers.CustomRegistration.handleStartSignUp(emp.uid, request.host)
      }
      Ok(Json.toJson(Map("success" -> Json.toJson(entity))))
      }
    }.recoverTotal{
      e => BadRequest(Json.toJson(Map("xx" -> 1)))
    }
  }
  def update(id: Int) = SecuredAction { implicit request =>
      val employee = EmployeeDAO.get(id)
      employee match {
        case Some(employee) =>
         Ok(views.html.businesses.users.employee_edit_form(id, employeeForm.fill(employee), request.user))
        case None => Ok("not found")
      }



  }
  def update_make(id: Int) = SecuredAction { implicit request =>
      employeeForm.bindFromRequest.fold(
        formWithErrors => BadRequest(views.html.businesses.users.employee_edit_form(id, formWithErrors, request.user)),
        entity => {
          Home.flashing(EmployeeDAO.update(id,entity) match {
            case 0 => "failure" -> s"Could not update entity ${entity.uid}"
            case _ => "success" -> s"Entity ${entity.uid} has been updated"
          })
        })

  }
  def assign_business(employee_id: Int, business_id: Int) = SecuredAction { implicit request =>
      val business = BusinessDAO.get(business_id)
      business match {
        case Some(business) =>
          EmployeesBusinessDAO.pull(employee_id = employee_id, business_id = business_id)
          Home.flashing("success" -> s"Employee $employee_id was assigned")
        case None => Home.flashing("failure" -> s"Business with $business_id not found")
      }

  }
  def unassign_business(employee_id: Int, business_id: Int) = SecuredAction { implicit request =>
      val business = BusinessDAO.get(business_id)
      business match {
        case Some(business) =>
          EmployeesBusinessDAO.deleteByEmployeeAndBusiness(employee_id, business_id)
          Home.flashing("success" -> s"Employee $employee_id was assigned")
        case None => Home.flashing("failure" -> s"Business with $business_id not found")
      }

  }
  def destroy(id: Int) = SecuredAction { implicit request =>

      Home.flashing(EmployeeDAO.delete(id) match {
        case 0 => "failure" -> "Entity has Not been deleted"
        case x => "success" -> s"Entity has been deleted (deleted $x row(s))"
      })

  }

}
