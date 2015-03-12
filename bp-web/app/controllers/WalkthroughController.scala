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
import play.api.Play.current


class WalkthroughController(override implicit val env: RuntimeEnvironment[DemoUser]) extends Controller with securesocial.core.SecureSocial[DemoUser] {

def index() = SecuredAction {
	Ok("x")
}




/**
 * Walkthrough element
 */

private def createService = {

}
private def createProcess = {

}
private def createProcessElems = {

}
private def createPeople = {

}
private def shareProcess = {

}
private def invokeProcess = {

}
private def finishProcess = {

}



}