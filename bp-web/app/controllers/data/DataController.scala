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



class DataController(override implicit val env: RuntimeEnvironment[DemoUser]) extends Controller with securesocial.core.SecureSocial[DemoUser] {
 

 val Home = Redirect(routes.DataController.index())


 def index() = SecuredAction { implicit request =>
    var (isManager, isEmployee, lang) = AccountsDAO.getRolesAndLang(request.user.main.email.get).get
 	Ok(views.html.data.index(request.user, isManager))
 }


def create_resources() = SecuredAction { implicit request => 
  	var (isManager, isEmployee, lang) = AccountsDAO.getRolesAndLang(request.user.main.email.get).get
 	Ok(views.html.data.index(request.user, isManager))
}
def update_resources(id: Int) = SecuredAction { implicit request => 
	var (isManager, isEmployee, lang) = AccountsDAO.getRolesAndLang(request.user.main.email.get).get
 	Ok(views.html.data.index(request.user, isManager))
}
def delete_resources(id: Int) = SecuredAction { implicit request => 
	var (isManager, isEmployee, lang) = AccountsDAO.getRolesAndLang(request.user.main.email.get).get
 	Ok(views.html.data.index(request.user, isManager))
}



}
