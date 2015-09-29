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


object ResourceForms {
  val resourceForm = Form(
    mapping(
      "id" -> optional(number),
      "title" -> nonEmptyText,
      "business" -> default(number, 0),
      "created_at"-> optional(jodaDate),
      "updated_at"-> optional(jodaDate))(ResourceDTO.apply)(ResourceDTO.unapply))
}

class DataController(override implicit val env: RuntimeEnvironment[DemoUser]) extends Controller with securesocial.core.SecureSocial[DemoUser] {
 

 val Home = Redirect(routes.DataController.index())


 def index() = SecuredAction { implicit request =>
    var (isManager, isEmployee, lang) = AccountsDAO.getRolesAndLang(request.user.main.email.get).get
 	Ok(views.html.data.index(request.user, isManager, ResourceForms.resourceForm))
 }

/****
 * Resources
 */
def create_resources() = SecuredAction { implicit request => 
  	var (isManager, isEmployee, lang) = AccountsDAO.getRolesAndLang(request.user.main.email.get).get

    ResourceForms.resourceForm.bindFromRequest.fold(
      formWithErrors => BadRequest(views.html.data.index(request.user, isManager, ResourceForms.resourceForm)),
      entity => {

          //val biz_id = BusinessDAO.pull_object(entity)
          //val emp_id = EmployeeDAO.getByUID(request.user.main.userId) 
          //emp_id match {
          //  case Some(employee) => EmployeesBusinessDAO.pull(employee_id = employee.id.get, business_id = biz_id)
          //  case _ =>
          //}
          
          
          Home.flashing("success" -> s"Entity ${entity.title} has been created")
        
      })

 	Ok(views.html.data.index(request.user, isManager, ResourceForms.resourceForm))
}
def update_resources(id: Int) = SecuredAction { implicit request => 
	var (isManager, isEmployee, lang) = AccountsDAO.getRolesAndLang(request.user.main.email.get).get
 	Ok(views.html.data.index(request.user, isManager, ResourceForms.resourceForm))
}
def delete_resources(id: Int) = SecuredAction { implicit request => 
	var (isManager, isEmployee, lang) = AccountsDAO.getRolesAndLang(request.user.main.email.get).get
 	Ok(views.html.data.index(request.user, isManager, ResourceForms.resourceForm))
}
// Resource elements
def assign_element(id: Int) = SecuredAction { implicit request => 
	var (isManager, isEmployee, lang) = AccountsDAO.getRolesAndLang(request.user.main.email.get).get
 	Ok(views.html.data.index(request.user, isManager, ResourceForms.resourceForm))
}
def update_assigned_element(id: Int) = SecuredAction { implicit request => 
	var (isManager, isEmployee, lang) = AccountsDAO.getRolesAndLang(request.user.main.email.get).get
 	Ok(views.html.data.index(request.user, isManager, ResourceForms.resourceForm))
}
def delete_assigned_element(id: Int) = SecuredAction { implicit request => 
	var (isManager, isEmployee, lang) = AccountsDAO.getRolesAndLang(request.user.main.email.get).get
 	Ok(views.html.data.index(request.user, isManager, ResourceForms.resourceForm))
}





/****
 * Entities
 */
def create_entity() = SecuredAction { implicit request => 
  	var (isManager, isEmployee, lang) = AccountsDAO.getRolesAndLang(request.user.main.email.get).get
 	Ok(views.html.data.index(request.user, isManager, ResourceForms.resourceForm))
}
def update_entity() = SecuredAction { implicit request => 
  	var (isManager, isEmployee, lang) = AccountsDAO.getRolesAndLang(request.user.main.email.get).get
 	Ok(views.html.data.index(request.user, isManager, ResourceForms.resourceForm))
}
def delete_entity() = SecuredAction { implicit request => 
  	var (isManager, isEmployee, lang) = AccountsDAO.getRolesAndLang(request.user.main.email.get).get
 	Ok(views.html.data.index(request.user, isManager, ResourceForms.resourceForm))
}

private def createDefaultBoardsForRes(res: ResourceDTO) = {
    // Cost board
}


}
