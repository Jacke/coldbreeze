package controllers.comments
import sys.process._
import play.api._
import play.api.mvc._
import play.twirl.api.Html
//{Action, Controller}
import play.api.http.MimeTypes
import play.api.libs.json._
import play.api.cache._
import play.api.libs.json._
import play.api.libs.functional.syntax._
import play.api.Logger

import views._
import models.{AccountsDAO, User}

import com.mohiva.play.silhouette.api.{ Environment, LogoutEvent, Silhouette }
import com.mohiva.play.silhouette.impl.authenticators.CookieAuthenticator
import com.mohiva.play.silhouette.impl.providers.SocialProviderRegistry
import forms._
import models.User2
import models.comments._
import play.api.i18n.MessagesApi
import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits.global
import controllers.users._
import models.DAO.resources._
import scala.util.{Success, Failure}
import scala.concurrent._
import scala.concurrent.duration._
import scala.collection.mutable.ListBuffer
import play.api.libs.ws._
import play.api.libs.ws.ning.NingAsyncHttpClientConfigBuilder
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

case class LaunchCommentContainer(comment: Comment, launch_comment: LaunchComment)

class CommentsController @Inject() (
  val messagesApi: MessagesApi,
  val env: Environment[User2, CookieAuthenticator],
  socialProviderRegistry: SocialProviderRegistry)
  extends Silhouette[User2, CookieAuthenticator] {



/*
Comment(
var id: Option[Long],
author: String,
body:String = "",
created_at: Option[org.joda.time.DateTime] = None,
updated_at: Option[org.joda.time.DateTime] = None)

case class LaunchComment(
var id: Option[Long],
comment:Long,
launch:Int,
created_at: Option[org.joda.time.DateTime] = None,
updated_at: Option[org.joda.time.DateTime] = None)
*/
implicit val CommentFormat = Json.format[Comment]
implicit val CommentReaders = Json.reads[Comment]
implicit val LaunchCommentFormat = Json.format[LaunchComment]
implicit val LaunchCommentReaders = Json.reads[LaunchComment]
implicit val LaunchCommentContainerFormat = Json.format[LaunchCommentContainer]
implicit val LaunchCommentContainerReaders = Json.reads[LaunchCommentContainer]


// GET    /launch_comments/:launchId   @controllers.comments.CommentsController.indexLaunchComments(launchId: Int)
	def indexLaunchComments(launchId: Int) = SecuredAction.async { implicit request =>
		LaunchCommentDAOF.getAllByLaunch(launchId).flatMap { launchComments =>
			val commentsIds:Seq[Long] = launchComments.map(_.comment)
			val commentsF:Future[Seq[Comment]] = CommentsDAOF.getAllByIds(commentsIds)
			commentsF.map { comments =>
				val commentContainers = comments.map { comment =>
					LaunchCommentContainer(
						comment = comment,
						launch_comment = launchComments.find(lC => lC.comment == comment.id.get).get
					)
				}
				Ok(Json.toJson(commentContainers))
			} 
		}
	}


//  POST   /launch_comments 			@controllers.comments.CommentsController.createLaunchComment()
	def createLaunchComment() = SecuredAction.async(BodyParsers.parse.json) { implicit request =>
	  request.body.validate[LaunchCommentContainer].map{
	    case entity => CommentsDAOF.pull(entity.comment).flatMap { obj =>
	        obj match {
	            case -1 =>  Future.successful( Ok(Json.toJson(Map("failure" ->  s"Could not create ref ${entity}"))) )
	            case id =>  {
	            	LaunchCommentDAOF.pull(entity.launch_comment).map { lC =>
		              Ok(Json.toJson(Map("success" ->  lC)))
	            	}
	            }
	          }
	      }
	    }.recoverTotal{
	      e => Future.successful( BadRequest(s"formWithErrors ${e.toString}") )
	    }
	}

// POST   /launch_comment/:id 		@controllers.comments.CommentsController.updateLaunchComment(id: Long) 
	def updateLaunchComment(id: Long) = SecuredAction.async(BodyParsers.parse.json) { implicit request =>
	   request.body.validate[LaunchCommentContainer].map {
	   	// LaunchCommentDAOF.update(id: Long, launches_comment: LaunchComment
	    // CommentsDAOF.update(id: Long, comment: Comment) 
	     case entity => CommentsDAOF.update(id, entity.comment).map { c =>
	     	   c match { 
	             case -1 =>  Ok(Json.toJson(Map("failure" ->  s"Could not update reaction ${entity.comment}")))
	             case _ =>  { Ok(Json.toJson(entity)) }
	           }
	     	}
	     }.recoverTotal{
	       e => Future.successful( BadRequest(s"formWithErrors ${e.toString}") )
	     }
	}

//DELETE /launch_comment/:id 		@controllers.comments.CommentsController.deleteLaunchComment(id: Long) 
	def deleteLaunchComment(id: Long) = SecuredAction.async { implicit request =>
	  LaunchCommentDAOF.delete(id).map { res =>
	    res match {
	      case 0 =>  Ok(Json.toJson(Map("failure" -> "Entity has Not been deleted")))
	      case x =>  Ok(Json.toJson(Map("success" -> s"Entity has been deleted (deleted $x row(s))")))
	    }
	  }
	}


}