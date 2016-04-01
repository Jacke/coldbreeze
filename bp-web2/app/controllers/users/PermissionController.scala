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
import play.api.libs.json._
import play.api.libs.functional.syntax._
import play.api.data.validation._

import views._
import utilities._
import models.User
import models.Page
import models.DAO.resources._
import models.DAO._
import service.DemoUser
import com.mohiva.play.silhouette.api.{ Environment, LogoutEvent, Silhouette }
import com.mohiva.play.silhouette.impl.authenticators.CookieAuthenticator
import com.mohiva.play.silhouette.impl.providers.SocialProviderRegistry
import forms._
import models.User2
import play.api.i18n.MessagesApi
import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits.global
import models.AccountDAO


/**
 * Created by Sobolev on 22.07.2014.
 */
case class ActPermissionJSON(elemperms: List[ActPermission], employees: List[EmployeeDTO], employee_groups:List[GroupDTO], accounts: List[models.daos.DBUser])
case class PeopleJSON(employees: List[EmployeeDTO], employee_groups:List[GroupDTO], accounts: List[models.daos.DBUser])
case class ActPermissionOnlyJSON(elemperms: List[ActPermission])

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
class PermissionController @Inject() (
  val messagesApi: MessagesApi,
  val env: Environment[User2, CookieAuthenticator],
  socialProviderRegistry: SocialProviderRegistry)
  extends Silhouette[User2, CookieAuthenticator] {



val Home = Redirect(routes.BusinessController.index())


import play.api.libs.json._

implicit def OptionReads[T](implicit fmt: Reads[T]): Reads[Option[T]] = new Reads[Option[T]] {
  import scala.util.control.Exception._
  def reads(json: JsValue) = fmt.reads(json).fold(e => JsSuccess(None), v => JsSuccess(Some(v)))
}


implicit val DbUserreads = Json.reads[models.daos.DBUser]
implicit val DbUserformat = Json.format[models.daos.DBUser]

  implicit val EmployeeDTOReads = Json.reads[EmployeeDTO]
  implicit val EmployeeDTOWrites = Json.format[EmployeeDTO]
  implicit val AccountDAOReads = Json.reads[AccountDAO]
  implicit val AccountDAOWrites = Json.format[AccountDAO]
  implicit val GroupDTOReads = Json.reads[GroupDTO]
  implicit val GroupDTOWrites = Json.format[GroupDTO]
  //implicit val PermiReads = Json.reads[ActPermission]
  implicit val PermiWrites = Json.format[ActPermission]

  val permValidate = Reads.StringReads.filter(ValidationError("Not allowed role."))(PermissionRole.roles.contains(_))
implicit val PermiReads: Reads[ActPermission] = (
    (JsPath \ "id").read[Option[Int]] and
    (JsPath \ "uid").read[Option[String]] and
    (JsPath \ "group").read[Option[Int]] and
    (JsPath \ "process").read[Int] and
    (JsPath \ "front_elem_id").read[Option[Int]] and
    (JsPath \ "space_elem_id").read[Option[Int]] and
    (JsPath \ "reaction").read[Option[Int]] and
    (JsPath \ "username").read[String](permValidate)
)(ActPermission.apply _)

  implicit val ActPermissionJSONReads = Json.reads[ActPermissionJSON]
  implicit val ActPermissionJSONWrites = Json.format[ActPermissionJSON]
  implicit val PeopleJSONReads = Json.reads[PeopleJSON]
  implicit val PeopleJSONWrites = Json.format[PeopleJSON]
  implicit val ActPermissionOnlyJSONJSONReads = Json.reads[ActPermissionOnlyJSON]
  implicit val ActPermissionOnlyJSONJSONWrites = Json.format[ActPermissionOnlyJSON]
// case class ActPermission(var id: Option[Int], uid: String, front_elem_id:Option[Int], space_elem_id:Option[Int])
val elemPermForm = Form(
    mapping(
      "id" -> optional(number),
      "uid" -> optional(text),
      "group" -> optional(number),
      "process" -> number,
      "front_elem_id" -> optional(number),
      "space_elem_id" -> optional(number),
      "reaction" -> optional(number),
      "role" -> text)(ActPermission.apply)(ActPermission.unapply))

/*
(var id: Option[Int],
                         uid: Option[String],
                         group:Option[Int],
                         process: Int,
                         front_elem_id:Option[Int],
                         space_elem_id:Option[Int],
                         reaction: Option[Int])
                         role: String = "interact",
                          */
 def index() = SecuredAction { implicit request =>
      val user_services = BusinessServiceDAO.getByMaster(request.identity.masterFirst).map(_.id)
      var proc_ids:List[Int] = BPDAO.getByServices(user_services.flatten).map(_.id).flatten
      if (request.identity.isEmployee) {
       // Employee assigned process
       val acts = ActPermissionDAO.getByUID(request.identity.emailFilled)
       val bpIds = ActPermissionDAO.getByUIDprocIDS(request.identity.emailFilled)
       proc_ids = proc_ids ++ bpIds
      }
      val elemperms = ActPermissionDAO.getByProcessesIDS(proc_ids)





      val employees = EmployeeDAO.getAllByMaster(request.identity.masterFirst)
      val employee_groups = AccountGroupDAO.getByAccounts(employees.map(_.master_acc)).distinct

      val accounts = models.AccountsDAO.findAllByEmails(employees.map(emp => emp.uid))//.map(ac => ac.copy(password = "", hasher = ""))

      Ok(Json.toJson(ActPermissionJSON(elemperms, employees, employee_groups, accounts)))
      /*Ok(views.html.permissions.element.index(
        Page(elemperms, 1, 1, elemperms.length), 1, "%")(Some(request.identity.emailFilled)))*/
  }
//GET         /bprocess/:BPid/elemperms           @controllers.PermissionController.proc_index(BPid: Int)
def proc_index(BPid: Int) = SecuredAction.async { implicit request =>
  val elemperms = ActPermissionDAO.getAll
  val elms = ProcElemDAO.findByBPId(BPid).map(_.id)
  val spelms = SpaceElemDAO.findByBPId(BPid).map(_.id)
  val business                    = request.identity.businessFirst


  val employeesF                  = EmployeeDAOF.getAllByWorkbench(business)
  employeesF.map { employees =>
    val employeesList = employees.toList
    val employee_groups = AccountGroupDAO.getByAccounts(employeesList.map(_.master_acc)).distinct
    val accounts = models.AccountsDAO.findAllByEmails(employeesList.map(emp => emp.uid)).map(ac => AccountCredHiding.hide(ac))

    Ok(Json.toJson(
      ActPermissionJSON(
        elemperms.filter(perm => perm.process == BPid ),
        employeesList,
        employee_groups,
        accounts
        )))
  }
}
def permsOnly(BPid: Int) = SecuredAction { implicit request =>
    val elemperms = ActPermissionDAO.getAll
    //val elms = ProcElemDAO.findByBPId(BPid).map(_.id)
    //val spelms = SpaceElemDAO.findByBPId(BPid).map(_.id)
    //val employees = EmployeeDAO.getAllByMaster(request.identity.emailFilled)
    //val employee_groups = AccountGroupDAO.getByAccounts(employees.map(_.master_acc)).distinct
    //val accounts = models.AccountsDAO.findAllByEmails(employees.map(emp => emp.uid)).map(ac => AccountCredHiding.hide(ac))
    Ok(Json.toJson(
      ActPermissionOnlyJSON(
        elemperms.filter(perm => perm.process == BPid )
        )))
  }
  def peoplesOnly = SecuredAction { implicit request =>
    //val elemperms = ActPermissionDAO.getAll
    //val elms = ProcElemDAO.findByBPId(BPid).map(_.id)
    //val spelms = SpaceElemDAO.findByBPId(BPid).map(_.id)
    val employees = EmployeeDAO.getAllByMaster(request.identity.masterFirst)
    val employee_groups = AccountGroupDAO.getByAccounts(employees.map(_.master_acc)).distinct
    val accounts = models.AccountsDAO.findAllByEmails(employees.map(emp => emp.uid)).map(ac => AccountCredHiding.hide(ac))
    Ok(Json.toJson(
      PeopleJSON(
        employees,
        employee_groups,
        accounts
        )))
  }

  def create() = SecuredAction { implicit request =>
        Ok("x")//views.html.permissions.element.elemperm_form(elemPermForm)(Some(request.identity.emailFilled)))
  }

  def create_new() = SecuredAction(BodyParsers.parse.json) { request =>
    val business = request.identity.businessFirst

    val permResult = request.body.validate[ActPermission]
      permResult.fold(
      errors => {
        BadRequest(Json.obj("status" ->"KO", "message" -> JsError.toJson(errors)))
      },
      perm => {
        security.BRes.procIsOwnedByBiz(business = business, process_id = perm.process) match {
          case true => {
            ActPermissionDAO.pull_object(perm) match {
              case -1 => BadRequest(Json.obj("status" -> "Can't create permission"))
              case _@id:Int => {
              action(request.identity.emailFilled, process = Some(perm.process),
                action = ProcHisCom.permCreated, what = Some(ProcHisCom.permCreated), what_id = perm.id)

                Ok(Json.obj("status" ->"OK", "message" -> ("Perm '"+id+"' saved.") ))
              }
            }
          }
          case _ => BadRequest(Json.obj("status" -> "Access Denied"))
        }

      }
    )
  }


def update(id: Int) = SecuredAction(BodyParsers.parse.json) { implicit request =>
    val permResult = request.body.validate[ActPermission]
      permResult.fold(
        errors => {
          BadRequest(Json.obj("status" ->"KO", "message" -> JsError.toJson(errors)))
        },
        perm => {
          ActPermissionDAO.update(id, perm)
          Ok(Json.obj("status" ->"OK", "message" -> ("Perm '"+perm.id+"' updated.") ))
        }
      )
}


def destroy(id: Int) = SecuredAction { implicit request =>
    ActPermissionDAO.get(id) match {
      case Some(permission) => {

        ActPermissionDAO.delete(id) match {
          case 0 => Ok(Json.toJson(Map("failure" -> "Entity has Not been deleted")))
          case x => {
            action(request.identity.emailFilled, process = Some(permission.process),
              action = ProcHisCom.permDeleted, what = Some(ProcHisCom.permDeleted), what_id = permission.id)
            Ok(Json.toJson(Map("success" -> s"Entity has been deleted (deleted $x row(s))")))
          }
        }
      }
      case _ => { Forbidden(Json.obj("status" -> "Access denied")) }
    }
}

private def action(acc: String, process: Option[Int], action: String, what: Option[String]=None, what_id: Option[Int]=None) = {
  ProcHistoryDAO.pull_object(ProcessHistoryDTO(
    None, acc, action, process, what, what_id, org.joda.time.DateTime.now() ))
}


}
