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

case class Credentials(firstName:  Option[String], lastName:  Option[String], fullName: Option[String])

class SettingController(override implicit val env: RuntimeEnvironment[DemoUser]) extends Controller with securesocial.core.SecureSocial[DemoUser] {
 

  val Home = Redirect(routes.SettingController.index())

  val credForm = Form(
  mapping(
    "firstName" -> optional(text),
    "lastName" -> optional(text),
    "fullName" -> optional(text))(Credentials.apply)(Credentials.unapply)) 

 def index() = SecuredAction { implicit request =>
 	val plans = List()
 	
 	Ok(views.html.settings.index(credForm, request.user))
 }

 def update_credentials() = SecuredAction { implicit request =>
    val cred = Credentials(request.user.main.firstName, request.user.main.lastName, request.user.main.fullName)
    credForm.bindFromRequest.fold(
        formWithErrors => BadRequest(views.html.settings.index(credForm.fill(cred), request.user)),
        entity => {
          Home.flashing(AccountsDAO.updateCredentials(request.user.main.email.get, entity) match {
            case false => "failure" -> s"Could not update entity ${entity}"
            case _ => "success" -> s"Entity ${entity} has been updated"
          })
        })
 }
 def update_email() = SecuredAction { implicit request =>
   	Ok(views.html.settings.index(credForm, request.user))
???
 }



}