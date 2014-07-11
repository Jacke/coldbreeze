package controllers

import play.api._
import play.api.mvc._
import play.twirl.api.Html

//{Action, Controller}
import play.api.http.MimeTypes
import play.api.libs.json._
import play.api.cache._

import views._
import models.User

object Application extends Controller with Secured  {
  import play.api.Play.current
  /**
   * Returns the JavaScript router that the client can use for "type-safe" routes.
   * Uses browser caching; set duration (in seconds) according to your release cycle.
   * @param varName The name of the global variable, defaults to `jsRoutes`
   */
  def jsRoutes(varName: String = "jsRoutes") = Cached(_ => "jsRoutes", duration = 86400) {
    Action { implicit request =>
      Ok(
        Routes.javascriptRouter(varName)(
          routes.javascript.Application.login
          
          // TODO Add your routes here
        )
      ).as(JAVASCRIPT)
    }
  }

  import play.api.libs.json._
  import play.api.libs.functional.syntax._

  case class Person(name: String, age: Int, lovesChocolate: Option[Boolean])

  implicit val personReads = Json.reads[Person]
  //implicit val userReads = Json.reads[User]

  implicit val personWrites = Json.format[Person]
  //implicit val personWrites = Json.writes[Person]


/**
   * Log-in a user. Expects the credentials in the body in JSON format.
   *
   * Set the cookie [[AuthTokenCookieKey]] to have AngularJS set the X-XSRF-TOKEN in the HTTP
   * header.
   *
   * @return The token needed for subsequent requests
   */
  def login() = Action(parse.json) { implicit request =>
    
      Ok(views.html.index11())
    
  }
  def logout() = Action(parse.json) { implicit request =>
    
      Ok(views.html.index11())
    
  }

  def index = SecureAction { user => _ =>
    //Ok(views.html.Index())
    Ok(views.html.index("Your new application is ready."))

  }
  def index11 = Action {
    Ok(views.html.index11())
  }
  def bprocesses = Action {
    Ok(Json.toJson(4))
  }
  def bprocess = Action {
    Ok(Json.toJson(Person("xxx", 12, None )))
  }




}
