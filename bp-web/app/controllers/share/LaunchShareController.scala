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



class LaunchShareController(override implicit val env: RuntimeEnvironment[DemoUser]) extends Controller with securesocial.core.SecureSocial[DemoUser] {
 
  implicit val LaunchShareDTOReads = Json.reads[LaunchShareDTO]
  implicit val LaunchShareDTOWrites = Json.format[LaunchShareDTO]
  //val Home = Redirect(routes.LaunchShareController.index())


//GET     /shared/launch/:launch_hash
 def index(launchHash: String) = Action.async { implicit request =>
   val shareF = LaunchSharesDAOF.getByHash(launchHash)
   shareF.map { shareOpt =>
   	shareOpt match {
   		case Some(share) => Ok(Json.toJson(share))
   		case _ => Ok("{}")
   	}

   }
 }

//POST    /share/launch/:launch_id
def makeShare(launch_id: Int) = SecuredAction.async { implicit request =>
  val business = request.user.businessFirst
	val launchShareF: Future[LaunchShareDTO] = LaunchSharesDAOF.generateForLaunch(launch_id, workbench_id = business)
	launchShareF.map { launchShare =>
	 	Ok(Json.toJson(launchShare))
	}
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
