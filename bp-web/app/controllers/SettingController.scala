package controllers

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


import views._
import models.User
import service.DemoUser
import securesocial.core._
import models.DAO.BProcessDTO
import models.DAO.BPDAO
import models.DAO._
import models._
import models.DAO.resources._
import models.DAO.CompositeValues
import play.api.Play.current
import models.DAO.resources.web.BizFormDTO
import scala.concurrent.ExecutionContext.Implicits.global
import com.github.tototoshi.slick.JdbcJodaSupport._
import scala.concurrent.duration.Duration
import scala.concurrent.{ExecutionContext, Awaitable, Await, Future}


case class Credentials(firstName:  Option[String], 
  lastName: Option[String], 
  fullName: Option[String], 
  lang: String = "en", 
  country: Option[String] = None, 
  phone: Option[String] = None,
  nickname: Option[String] = None) {
  def getFullName: Option[String] = {
    (firstName, lastName) match {
      case (Some(first), Some(last)) => Some(first + " " + last)
      case (None, Some(last)) => Some(last)
      case (Some(first), None) => Some(first)
      case (None, None) => Some("")  
    }
  }
}

class SettingController(override implicit val env: RuntimeEnvironment[DemoUser]) extends Controller with securesocial.core.SecureSocial[DemoUser] {
 

  val Home = Redirect(routes.SettingController.index())

  val credForm = Form(
  mapping(
    "firstName" -> optional(text),
    "lastName" -> optional(text),
    "fullName" -> optional(text),
    "lang" -> text,
    "country" -> optional(text),
    "phone" -> optional(text),
    "nickname" -> optional(text))(Credentials.apply)(Credentials.unapply)) 

  val bizForm = Form(
    mapping(
      "title" -> text,
      "phone" -> optional(text),
      "website" -> optional(text),
      "country" -> text,
      "city" -> text,
      "address" -> optional(text),
      "nickname" -> optional(text)
    )(BizFormDTO.apply)(BizFormDTO.unapply))





 def index() = SecuredAction { implicit request =>
 	val cred = models.AccountsDAO.fetchCredentials(request.user.main.email.get)
  //val biz0 = fetchBiz(request.user.main.userId).get
  //val biz = BizFormDTO(biz0.title, biz0.phone, biz0.website, biz0.country, biz0.city, biz0.address, biz0.nickname)
  var (isManager, isEmployee, lang) = AccountsDAO.getRolesAndLang(request.user.main.email.get).get
 	Ok(views.html.settings.index(credForm.fill(cred.get), request.user, isManager))
 }
 def workbench() = SecuredAction  { implicit request =>
  val biz0 = fetchBiz(request.user.main.userId)
  val benchesF = EmployeeDAOF.getAllByEmpByUID(request.user.main.userId)
  val bizFormObj = biz0 match {
    case Some(biz0) => Some(
        bizForm.fill(BizFormDTO(biz0.title, biz0.phone, biz0.website, biz0.country, biz0.city, biz0.address, biz0.nickname))
        )
    case _ => None
  }
  val account_benches = biz0 match {
    case Some(biz0) => AccountInfosDAOF.await(benchesF).filter(b => b.workbench != biz0.id.get)
    case _ => AccountInfosDAOF.await(benchesF)
  }
  val benches = BusinessDAO.getByIDS(account_benches.map(_.workbench).toList)

  var (isManager, isEmployee, lang) = AccountsDAO.getRolesAndLang(request.user.main.email.get).get
  Ok(views.html.settings.workbench(bizFormObj, request.user, isManager, biz0, benches ))
 }

 def resetBench(bench_id: Int) = SecuredAction.async { implicit request =>
    bench_id match {
      case -1 => AccountInfosDAOF.updateCurrentWorkbench(request.user.main.email.get, None).map { r =>
                 Redirect(routes.SettingController.workbench())
                 }
      case _ =>  AccountInfosDAOF.updateCurrentWorkbench(request.user.main.email.get, Some(bench_id)).map { r => 
                 Redirect(routes.SettingController.workbench())
                 }          
    }    
}


 def update_credentials() = SecuredAction { implicit request =>
    val cred = Credentials(request.user.main.firstName, request.user.main.lastName, request.user.main.fullName)
    credForm.bindFromRequest.fold(
        formWithErrors => Redirect(routes.SettingController.index),//BadRequest(views.html.settings.index(credForm.fill(cred), request.user)),
        entity => {
          Home.flashing(AccountsDAO.updateCredentials(
            request.user.main.email.get, entity.copy(fullName = entity.getFullName, 
                                                     lang = entity.lang, 
                                                     country = entity.country, 
                                                     phone = entity.phone,
                                                     nickname = entity.nickname)) match {
            case false => "failure" -> s"Could not update entity ${entity}"
            case _ => "success" -> s"Entity ${entity} has been updated"
          })
        })
 }
 

 def update_biz_credentials() = SecuredAction { implicit request =>
  
  val founded_biz = fetchBiz(request.user.main.userId).get
  val biz = BizFormDTO(founded_biz.title, founded_biz.phone, founded_biz.website, founded_biz.country, founded_biz.city, founded_biz.address)
    bizForm.bindFromRequest.fold(
        formWithErrors => Redirect(routes.SettingController.index),//BadRequest(views.html.settings.index(credForm.fill(cred), request.user)),
        entity => {
          Home.flashing(models.DAO.resources.web.BusinessDAO.updateCredentials(
            founded_biz.id.get, entity) match {
            case false => "failure" -> s"Could not update entity ${entity}"
            case _ => "success" -> s"Entity ${entity} has been updated"
          })
        })

 }

 def update_email() = SecuredAction { implicit request =>
   	Redirect(routes.SettingController.index)
    ???
 }


private def fetchBiz(email: String):Option[BusinessDTO] = {
  AccountInfosDAOF.await(AccountInfosDAOF.getByInfoByUID(email)) match {
    case Some(info) => BusinessDAO.get(info.currentWorkbench.getOrElse(-1))
    case _ => None
  }
}


}
