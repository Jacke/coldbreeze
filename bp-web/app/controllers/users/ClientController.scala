/* package controllers.users

import models.DAO.resources.{ClientDTO, ClientDAO}
import models.DAO.resources.ClientBusinessDAO
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
import models.DAO.resources.ClientBusinessDAO

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
      val businesses = models.DAO.resources.BusinessDAO.getAll
      val cbs = ClientBusinessDAO.getAll
      val assign = businesses.filter(b => !(cbs.map(eb => eb._2).contains(b.id.get)))
      val assigned = businesses.filter(b => cbs.map(eb => eb._2).contains(b.id.get))
      Ok(views.html.businesses.users.clients(
        Page(clients, 1, 1, clients.length), 1, "%", assign, assigned))
    
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
  def assign_business(client_id: Int, business_id: Int) = Action { implicit request =>
      val business = BusinessDAO.get(business_id)
      business match {
        case Some(business) => 
          ClientBusinessDAO.pull(client_id = client_id, business_id = business_id)
          Home.flashing("success" -> s"Client $client_id was assigned")
        case None => Home.flashing("failure" -> s"Business with $business_id not found")
      }
    
  }
  def unassign_business(client_id: Int, business_id: Int) = Action { implicit request =>
      val business = BusinessDAO.get(business_id)
      business match {
        case Some(business) => 
          ClientBusinessDAO.deleteByClientAndBusiness(client_id, business_id)
          Home.flashing("success" -> s"Client $client_id was assigned")
        case None => Home.flashing("failure" -> s"Business with $business_id not found")
      }
    
  }
  def destroy(id: Int) = Action { implicit request =>
    
      Home.flashing(ClientDAO.delete(id) match {
        case 0 => "failure" -> "Entity has Not been deleted"
        case x => "success" -> s"Entity has been deleted (deleted $x row(s))"
      })
    
  }

}
*/