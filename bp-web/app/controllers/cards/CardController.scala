package controllers
import java.util.UUID
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
import org.jboss.netty.buffer._
import org.joda.time.DateTime
import play.api.data._
import play.api.data.Forms._
import play.api.data.format.Formats._
import play.api.data.validation.Constraints._
import play.api.data.format._
import scala.concurrent._
import scala.concurrent.duration._
import views._
import models.User
import service.DemoUser
import scala.concurrent._
import scala.concurrent.duration._
import securesocial.core._
import models.DAO.BProcessDTO
import models.DAO.BPDAO
import models.DAO._
import models._
import models.DAO.resources._
import models.DAO.CompositeValues
import play.api.Play.current
import models.DAO.resources.web.BizFormDTO
import minority.utils._
import play.api.data.format.Formats._
import scala.util.{Success, Failure}

class CardController(override implicit val env: RuntimeEnvironment[DemoUser]) extends Controller with securesocial.core.SecureSocial[DemoUser] {
 val Home = Redirect(routes.CardController.index())

 def index() = SecuredAction.async { implicit request =>
    var (isManager, isEmployee, lang) = AccountsDAO.getRolesAndLang(request.user.main.email.get).get
    Future(Ok(views.html.cards.index(request.user, isManager)))
 }
}