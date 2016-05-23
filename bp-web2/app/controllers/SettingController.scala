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
import com.mohiva.play.silhouette.api.{ Environment, LogoutEvent, Silhouette }
import com.mohiva.play.silhouette.impl.authenticators.CookieAuthenticator
import com.mohiva.play.silhouette.impl.providers.SocialProviderRegistry
import forms._
import models.User2
import play.api.i18n.MessagesApi
import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits.global
import models.DAO.BProcessDTO
import models.DAO.BPDAO
import models.DAO._
import models._
import models.DAO.resources._
import models.DAO.CompositeValues
import play.api.Play.current
import models.DAO.resources.web.BizFormDTO
import scala.concurrent.ExecutionContext.Implicits.global
import com.github.tototoshi.slick.PostgresJodaSupport._
import scala.concurrent.duration.Duration
import scala.concurrent.{ExecutionContext, Awaitable, Await, Future}
import play.api.cache._
import play.api.Play.current

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
class SettingController @Inject() (
  val messagesApi: MessagesApi,
  val env: Environment[User2, CookieAuthenticator],
  socialProviderRegistry: SocialProviderRegistry)
  extends Silhouette[User2, CookieAuthenticator] {


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
    val business = request.identity.businessFirst
   	val cred = models.AccountsDAO.fetchCredentials(request.identity.emailFilled)
    //val biz0 = fetchBiz(request.identity.emailFilled).get
    //val biz = BizFormDTO(biz0.title, biz0.phone, biz0.website, biz0.country, biz0.city, biz0.address, biz0.nickname)
    var (isManager, isEmployee, lang) = AccountsDAO.getRolesAndLang(request.identity.emailFilled, business).get
   	Ok(views.html.settings.index(credForm.fill(cred.get), request.identity, isManager))
 }



 def workbench() = SecuredAction  { implicit request =>
    val biz0 = fetchBiz(request.identity.emailFilled)
    println(biz0)
    val employeesF = EmployeeDAOF.getAllByEmpByUID(request.identity.emailFilled)
    val bizFormObj = biz0 match {
      case Some(biz0) => Some(
          bizForm.fill(BizFormDTO(biz0.title, biz0.phone, biz0.website, biz0.country, biz0.city, biz0.address, biz0.nickname))
          )
      case _ => None
    }
    val account_benches = biz0 match {
      case Some(biz0) => AccountInfosDAOF.await(employeesF).filter(b => b.workbench == biz0.id.get)
      case _ => AccountInfosDAOF.await(employeesF)
    }
    val workbench_id = biz0 match {
      case Some(w) => w.id.get
      case _ => -1
    }

    val benches = BusinessDAO.getByIDS(account_benches.map(_.workbench).toList)
    println("account_benches "+account_benches)

    var (isManager, isEmployee, lang) = AccountsDAO.getRolesAndLang(request.identity.emailFilled, workbench_id).get

    if (benches.length == 0) {
      utilities.NewUserRoutine.initiate_env(request.identity.emailFilled)
      Redirect(routes.SettingController.workbench())
    } else {
      Ok(views.html.settings.workbench(bizFormObj, request.identity, isManager, biz0, benches ))
    }
 }

 def resetBench(bench_id: Int) = SecuredAction.async { implicit request =>
    bench_id match {
      case -1 => AccountInfosDAOF.updateCurrentWorkbench(request.identity.emailFilled, None).map { r =>
                 Cache.remove(s"employee.business.${request.identity.emailFilled}")
                 Redirect(routes.SettingController.workbench())
                 }
      case _ =>  AccountInfosDAOF.updateCurrentWorkbench(request.identity.emailFilled, Some(bench_id)).map { r =>
                 Cache.remove(s"employee.business.${request.identity.emailFilled}")
                 Redirect(routes.SettingController.workbench())
                 }
    }
}


 def update_credentials() = SecuredAction { implicit request =>
    val cred = Credentials(request.identity.firstName, request.identity.lastName,
      request.identity.fullName)
    credForm.bindFromRequest.fold(
        formWithErrors => Redirect(routes.SettingController.index),//BadRequest(views.html.settings.index(credForm.fill(cred), request.identity)),
        entity => {
          Home.flashing(AccountsDAO.updateCredentials(
            request.identity.emailFilled, entity.copy(fullName = entity.getFullName,
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

  val founded_biz = fetchBiz(request.identity.emailFilled).get
  val biz = BizFormDTO(founded_biz.title, founded_biz.phone, founded_biz.website, founded_biz.country, founded_biz.city, founded_biz.address)
    bizForm.bindFromRequest.fold(
        formWithErrors => Redirect(routes.SettingController.index),//BadRequest(views.html.settings.index(credForm.fill(cred), request.identity)),
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
