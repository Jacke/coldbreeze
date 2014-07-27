package controllers.users

import models.DAO.resources.{ClientDTO, ClientDAO}
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
import models.DAO.resources.web._

/**
 * Created by Sobolev on 22.07.2014.
 */
class ClientController(override implicit val env: RuntimeEnvironment[DemoUser]) extends Controller with securesocial.core.SecureSocial[DemoUser] {
  import play.api.Play.current
 
   val Home = Redirect(routes.ClientController.index())

   val clientForm = Form(
    mapping(
      "id" -> optional(number),
      "uid" -> nonEmptyText)(ClientDTO.apply)(ClientDTO.unapply))
 
 def index() = Action { implicit request =>
      val clients = ClientDAO.getAll
      Ok(views.html.businesses.users.clients(
        Page(clients, 1, 1, clients.length), 1, "%"))
    
  }
  def create() = Action { implicit request =>
        Ok(views.html.businesses.users.client_form(clientForm))    
  }
  def create_new() = Action { implicit request => 
    println(request)
    println(clientForm.bindFromRequest)
    clientForm.bindFromRequest.fold(
      formWithErrors => BadRequest(views.html.businesses.users.client_form(formWithErrors)),
      entity => {

          ClientDAO.pull_object(entity)
          Home.flashing("success" -> s"Entity ${entity.uid} has been created")
        
      })
  }
  def update(id: Int) = Action { implicit request =>
      val client = ClientDAO.get(id)
      client match {
        case Some(client) =>
        val cl = ClientDTO(client.id, client.uid)
         Ok(views.html.businesses.users.client_edit_form(id, clientForm.fill(cl))) 
        case None => Ok("not found")
      }

      
    
  }
  def update_make(id: Int) = Action { implicit request =>
      clientForm.bindFromRequest.fold(
        formWithErrors => BadRequest(views.html.businesses.users.client_edit_form(id, formWithErrors)),
        entity => {
          Home.flashing(ClientDAO.update(id,entity) match {
            case 0 => "failure" -> s"Could not update entity ${entity.uid}"
            case _ => "success" -> s"Entity ${entity.uid} has been updated"
          })
        })
    
  }
  def destroy(id: Int) = Action { implicit request =>
    
      Home.flashing(ClientDAO.delete(id) match {
        case 0 => "failure" -> "Entity has Not been deleted"
        case x => "success" -> s"Entity has been deleted (deleted $x row(s))"
      })
    
  }

}
