package controllers.pipes

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
import play.api.Logger
import play.api.i18n.{ I18nSupport, MessagesApi }

import javax.inject.Inject
import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits.global
import play.api.mvc.{ Action, RequestHeader }
import scala.concurrent.duration.Duration
import scala.concurrent.{ExecutionContext, Awaitable, Await, Future}
import scala.util.Try

import play.api.ApplicationLoader
import play.api.Configuration
import play.api.inject._
import play.api.inject.guice._
import models.DAO._
import models.DAO.resources._



trait LaunchesPipes {
  def a:Boolean

}

class LaunchesPipesImpl extends LaunchesPipes {
  def a:Boolean = true


}
