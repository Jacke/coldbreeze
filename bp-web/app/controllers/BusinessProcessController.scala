package controllers

import models.DAO.resources.{BusinessDAO, BusinessDTO}
import models.DAO._

import play.api._
import play.api.mvc._
import play.twirl.api.Html

//{Action, Controller}
import play.api.http.MimeTypes
import play.api.libs.json._
import play.api.cache._

import views._
import models.User
import service.DemoUser
import securesocial.core._

class BusinessProcessController(override implicit val env: RuntimeEnvironment[DemoUser]) extends Controller with securesocial.core.SecureSocial[DemoUser] {
import play.api.Play.current


  def index() = Action(parse.json) { implicit request =>
    val businesses = BusinessDAO.getAll
    Ok(views.html.index11())

  }
  def create() = Action(parse.json) { implicit request =>
    // retrive BusinessDAO
    println("dao")
    Ok(views.html.index11())

  }
  def update() = Action(parse.json) { implicit request =>

    Ok(views.html.index11())

  }
  def destroy() = Action(parse.json) { implicit request =>

    Ok(views.html.index11())

  }

  /**
   * Station
   */
  /**
   * Loggs
   */
  /**
   * Input calls
   */
  /**
   * Halt
   */
}
