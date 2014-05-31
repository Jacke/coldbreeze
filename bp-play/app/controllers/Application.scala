package controllers

import play.api._
import play.api.mvc._
import play.twirl.api.Html

//{Action, Controller}
import play.api.http.MimeTypes
import play.api.libs.json._

import views._
import models.User

object Application extends Controller with Secured  {

  import play.api.libs.json._
  import play.api.libs.functional.syntax._

  case class Person(name: String, age: Int, lovesChocolate: Option[Boolean])

  implicit val personReads = Json.reads[Person]
  //implicit val userReads = Json.reads[User]

  implicit val personWrites = Json.format[Person]
  //implicit val personWrites = Json.writes[Person]


  def index = SecureAction { user => _ =>
    //Ok(views.html.Index())
    Ok(views.html.index("Your new application is ready."))

  }
  def bprocesses = Action {
    Ok(Json.toJson(4))
  }
  def bprocess = Action {
    Ok(Json.toJson(Person("xxx", 12, None )))
  }

  def readToken() = SecureAction { user => _ => 
    Ok(User.findByEmail(user).get.token)
  }
  def readByToken(token: String) = Action {

    
    Ok(User.findByToken(token).get.email)
  }
  def getToken() = SecureAction { user => _ =>
   User.createToken(user) match {
     case Right(token) => Ok(Json.toJson(Map("token" -> token.token)))
     case Left(error) => Ok(error)
   }
  }
}
