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
import service.DemoUser
import securesocial.core._


class Application(override implicit val env: RuntimeEnvironment[DemoUser]) extends Controller with securesocial.core.SecureSocial[DemoUser] { // with Secured  {
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
          routes.javascript.CustomLoginController.login//Application.login
          
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


  def index = SecuredAction { implicit request =>
    Ok(views.html.index(request.user.main))
  }

  // a sample action using an authorization implementation
  def onlyTwitter = SecuredAction(WithProvider("twitter")) { implicit request =>
    Ok("You can see this because you logged in using Twitter")
  }

  def linkResult = SecuredAction { implicit request =>
    Ok(views.html.linkResult(request.user))
  }

  /**
   * Sample use of SecureSocial.currentUser. Access the /current-user to test it
   */
  def currentUser = Action.async { implicit request =>
    import play.api.libs.concurrent.Execution.Implicits._
    SecureSocial.currentUser[DemoUser].map { maybeUser =>
      val userId = maybeUser.map(_.main.userId).getOrElse("unknown")
      Ok(s"Your id is $userId")
    }
  }


// An Authorization implementation that only authorizes uses that logged in using twitter
  case class WithProvider(provider: String) extends Authorization[DemoUser] {
    def isAuthorized(user: DemoUser, request: RequestHeader) = {
      user.main.providerId == provider
    }
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
