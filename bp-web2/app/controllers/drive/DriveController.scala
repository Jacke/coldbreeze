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

import com.mohiva.play.silhouette.api.{ Environment, LogoutEvent, Silhouette }
import com.mohiva.play.silhouette.impl.authenticators.CookieAuthenticator
import com.mohiva.play.silhouette.impl.providers.SocialProviderRegistry
import forms._
import models.User2
import play.api.i18n.MessagesApi
import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits.global
import models.DAO.BProcessDTO
import models.DAO.BPDAO
import models.DAO._
import models._
import models.DAO.resources._
import models.DAO.CompositeValues
import play.api.Play.current
import models.DAO.resources.web.BizFormDTO
import scala.concurrent.ExecutionContext.Implicits.global
import com.github.tototoshi.slick.PostgresJodaSupport._
import scala.concurrent.duration.Duration
import scala.concurrent.{ExecutionContext, Awaitable, Await, Future}



import javax.inject.Inject

import com.mohiva.play.silhouette.api.{ Environment, LogoutEvent, Silhouette }
import com.mohiva.play.silhouette.impl.authenticators.CookieAuthenticator
import com.mohiva.play.silhouette.impl.providers.SocialProviderRegistry
import forms._
import models.User2
import play.api.i18n.MessagesApi
import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits.global

import play.api.mvc.{ Action, RequestHeader }
class DriveController @Inject() (
  val messagesApi: MessagesApi,
  val env: Environment[User2, CookieAuthenticator],
  socialProviderRegistry: SocialProviderRegistry)
  extends Silhouette[User2, CookieAuthenticator] {


  val Home = Redirect(routes.DriveController.index())





 def index() = SecuredAction { implicit request =>
  val business = request.identity.businessFirst
 	val cred = models.AccountsDAO.fetchCredentials(request.identity.emailFilled)
  //val biz0 = fetchBiz(request.identity.emailFilled).get
  //val biz = BizFormDTO(biz0.title, biz0.phone, biz0.website, biz0.country, biz0.city, biz0.address, biz0.nickname)
  var (isManager, isEmployee, lang) = AccountsDAO.getRolesAndLang(request.identity.emailFilled, business).get
 	Ok(views.html.drive.index(request.identity, isManager))
 }


/*
https://github.com/timezra/dropbox-sdk-scala
https://github.com/vjousse/dropbox-scala-play/tree/master/app/views
https://github.com/Shinsuke-Abe/dropbox4s
https://github.com/Rovak/ReactiveDropbox
https://github.com/akiomik/dispatch-dropbox
https://github.com/emchristiansen/ResolveDropboxConflictedCopy
https://github.com/julianmichael/5langs
*/

}
