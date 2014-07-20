package controllers

import models.User
import play.api.libs.json.Json
import play.api.mvc.Controller
import play.api.mvc._
import play.twirl.api.Html
import play.api.http.MimeTypes
import play.api.libs.json._
import views._

/*
object APIController extends Controller with Secured  {
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
*/