package controllers

import models.DAO.resources.{BusinessDAO, BusinessDTO}
import models.DAO.resources.EmployeesBusinessDAO
import models.DAO.resources.EmployeeDAO

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
import com.mohiva.play.silhouette.api.{ Environment, LogoutEvent, Silhouette }
import com.mohiva.play.silhouette.impl.authenticators.CookieAuthenticator
import com.mohiva.play.silhouette.impl.providers.SocialProviderRegistry
import forms._
import models.User2
import play.api.i18n.MessagesApi
import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits.global
import models.DAO.resources.web._

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

/**
 * Created by Sobolev on 22.07.2014.
 */
class BusinessController @Inject() (
  val messagesApi: MessagesApi,
  val env: Environment[User2, CookieAuthenticator],
  socialProviderRegistry: SocialProviderRegistry)
  extends Silhouette[User2, CookieAuthenticator] {
  import play.api.Play.current

   val Home = Redirect(routes.BusinessController.index())

   val businessForm = Form(
    mapping(
      "id" -> optional(number),
      "title" -> nonEmptyText,
      "phone" -> optional(text),
      "website" -> optional(text),
      "country" -> text,
      "city" -> text,
      "address" -> optional(text),
      "nickname" -> optional(text),
      "walkthrough" -> boolean,
      "created_at"-> optional(jodaDate),
      "updated_at"-> optional(jodaDate),
      "organization" -> boolean)(BusinessDTO.apply)(BusinessDTO.unapply))

 def index() = SecuredAction { implicit request =>
    val businesses = BusinessDAO.getAll
    Ok(views.html.businesses.index(
      Page(businesses, 1, 1, businesses.length), 1, "%", request.identity))
  }

  def create() = SecuredAction { implicit request =>
        Ok(views.html.businesses.business_form(businessForm, request.identity))
  }

  def create_new() = SecuredAction { implicit request =>
    businessForm.bindFromRequest.fold(
      formWithErrors => BadRequest(views.html.businesses.business_form(formWithErrors, request.identity)),
      entity => {
          val biz_id = BusinessDAO.pull_object(entity)
          val emp_id = EmployeeDAO.getByUID(request.identity.emailFilled)
          emp_id match {
            case Some(employee) => EmployeesBusinessDAO.pull(employee_id = employee.id.get, business_id = biz_id)
            case _ =>
          }
          Home.flashing("success" -> s"Entity ${entity.title} has been created")
      })
  }

def update(id: Int) = SecuredAction { implicit request =>
    val business = BusinessDAO.get(id)
    business match {
      case Some(business) =>
        val biz = BusinessDTO(business.id, business.title, business.phone, business.website, business.country, business.city, business.address)
         Ok(views.html.businesses.business_edit_form(id, businessForm.fill(biz), request.identity))
      case None => Ok("not found")
    }
  }

def update_make(id: Int) = SecuredAction { implicit request =>
    businessForm.bindFromRequest.fold(
      formWithErrors => BadRequest(views.html.businesses.business_edit_form(id, formWithErrors, request.identity)),
      entity => {
        Home.flashing(BusinessDAO.update(id,entity) match {
          case 0 => "failure" -> s"Could not update entity ${entity.title}"
          case _ => "success" -> s"Entity ${entity.title} has been updated"
        })
      })
}

def destroy(id: Int) = SecuredAction { implicit request =>
    Home.flashing(BusinessDAO.delete(id) match {
      case 0 => "failure" -> "Entity has Not been deleted"
      case x => "success" -> s"Entity has been deleted (deleted $x row(s))"
    })
}

}
