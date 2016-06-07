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

import com.mohiva.play.silhouette.api.{ Environment, LogoutEvent, Silhouette }
import com.mohiva.play.silhouette.impl.authenticators.CookieAuthenticator
import com.mohiva.play.silhouette.impl.providers.SocialProviderRegistry
import forms._
import models.User2
import play.api.i18n.MessagesApi
import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits.global
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


class BusinessServiceController @Inject() (
  val messagesApi: MessagesApi,
  val env: Environment[User2, CookieAuthenticator],
  socialProviderRegistry: SocialProviderRegistry)
  extends Silhouette[User2, CookieAuthenticator] {
   import play.api.Play.current

   val Home = Redirect(routes.ProfileController.dashboard())
   val serviceForm = Form(
    mapping(
      "id" -> optional(number),
      "title" -> nonEmptyText,
      "business_id" -> default(number, 1),
      "master_acc" -> default(text, ""))(BusinessServiceDTO.apply)(BusinessServiceDTO.unapply))

 def index() = SecuredAction { implicit request =>
      val services = BusinessServiceDAO.getAll
      val businesses = BusinessDAO.getAll
      //Ok(views.html.businesses.services(Page(services, 1, 1, services.length), 1, "%", businesses, request.identity))
      Home
  }
  implicit val bservicesReads = Json.reads[BusinessServiceDTO]
  implicit val bservicesWrites = Json.format[BusinessServiceDTO]


  def bprocesses_services() = SecuredAction { implicit request =>
      val business = request.identity.businessFirst
      val services = BusinessServiceDAO.getAll.filter(service => service.business_id == business)
      Ok(Json.toJson(services))
  }

  def create() = SecuredAction { implicit request =>
        Ok(views.html.businesses.service_form(serviceForm, request.identity))
  }
  def create_new() = SecuredAction { implicit request =>
    serviceForm.bindFromRequest.fold(
      formWithErrors => Home, //BadRequest(views.html.businesses.service_form(formWithErrors, request.identity)),
      entity => {
          val uid = request.identity.emailFilled
          val emp = EmployeeDAO.getByUID(uid).isDefined


          val biz_id = request.identity.businessFirst
          BusinessServiceDAO.pull_object(entity.copy(business_id = request.identity.businessFirst, master_acc = uid))


          Home.flashing("success" -> s"Entity ${entity.title} has been created")

      })
  }
  def update(id: Int) = SecuredAction { implicit request =>
     if (serviceOwned(id, request.identity.businessFirst)) {

      val services = BusinessServiceDAO.get(id)
      services match {
        case Some(service) =>
        val srvc = BusinessServiceDTO(service.id, service.title, service.business_id, request.identity.emailFilled)
         Ok(views.html.businesses.service_edit_form(id, serviceForm.fill(srvc), request.identity))
        case None => Ok("not found")
      }
 } else {
      Home
 }
}
  def update_make(id: Int) = SecuredAction { implicit request =>
     if (serviceOwned(id, request.identity.businessFirst)) {
      val service = BusinessServiceDAO.get(id).get

      serviceForm.bindFromRequest.fold(
        formWithErrors => BadRequest(views.html.businesses.service_edit_form(id, formWithErrors, request.identity)),
        entity => {
          Home.flashing(BusinessServiceDAO.update(id,entity.copy(business_id = service.business_id, master_acc = request.identity.emailFilled) ) match {
            case 0 => "failure" -> s"Could not update entity ${entity.title}"
            case _ => "success" -> s"Entity ${entity.title} has been updated"
          })
        })
    } else {
      Home
    }
  }
  def destroy(id: Int) = SecuredAction { implicit request =>
    if (serviceOwned(id, request.identity.businessFirst)) {
      Home.flashing(BusinessServiceDAO.delete(id) match {
        case 0 => "failure" -> "Entity has Not been deleted"
        case x => "success" -> s"Entity has been deleted (deleted $x row(s))"
      })
    } else {
      Home
    }

  }

  private def serviceOwned(id: Int, business_id: Int):Boolean = {
      BusinessServiceDAO.get(id) match {
        case Some(ser) => {
          ser.business_id == business_id
        }
        case _ => false
      }
  }

}
