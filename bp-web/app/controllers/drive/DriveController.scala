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
import scala.concurrent.ExecutionContext.Implicits.global
import com.github.tototoshi.slick.JdbcJodaSupport._
import scala.concurrent.duration.Duration
import scala.concurrent.{ExecutionContext, Awaitable, Await, Future}




class DriveController(override implicit val env: RuntimeEnvironment[DemoUser]) extends Controller with securesocial.core.SecureSocial[DemoUser] {
 

  val Home = Redirect(routes.DriveController.index())





 def index() = SecuredAction { implicit request =>
  val business = request.user.businessFirst
 	val cred = models.AccountsDAO.fetchCredentials(request.user.main.email.get)
  //val biz0 = fetchBiz(request.user.main.userId).get
  //val biz = BizFormDTO(biz0.title, biz0.phone, biz0.website, biz0.country, biz0.city, biz0.address, biz0.nickname)
  var (isManager, isEmployee, lang) = AccountsDAO.getRolesAndLang(request.user.main.email.get, business).get
 	Ok(views.html.drive.index(request.user, isManager))
 }


}
