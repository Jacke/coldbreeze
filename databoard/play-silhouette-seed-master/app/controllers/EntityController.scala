package controllers
import org.joda.time.DateTime
import scala.concurrent.Future
import play.api.Logger
import play.api.Play.current
import play.api.mvc._
import play.api.libs.concurrent.Execution.Implicits.defaultContext
import javax.inject.Inject
//import com.mohiva.play.silhouette.api.{ Environment, LogoutEvent, Silhouette }
//import com.mohiva.play.silhouette.impl.authenticators.SessionAuthenticator
import forms._
import models.User
import scala.concurrent.Future
import reactivemongo.api.gridfs.GridFS
import reactivemongo.api.gridfs.Implicits.DefaultReadFileReader
import reactivemongo.api.collections._ //default.BSONCollection
import reactivemongo.bson._
import models._
import models.Board._


import javax.inject.Inject

import play.api.mvc.Controller
import play.modules.reactivemongo._
import play.modules.reactivemongo.json._
import play.modules.reactivemongo.json.collection._

import com.mohiva.play.silhouette.api.{ Environment, LogoutEvent, Silhouette }
import com.mohiva.play.silhouette.impl.authenticators.CookieAuthenticator
import com.mohiva.play.silhouette.impl.providers.SocialProviderRegistry
import play.api.libs.concurrent.Execution.Implicits.defaultContext
import play.modules.reactivemongo.json.collection.JSONCollection
import play.modules.reactivemongo.json._
import reactivemongo.api._
import play.api.libs.json._
import play.api.Play.current
//import play.api.i18n.Messages.Implicits._
import java.util.UUID
import play.api.i18n.MessagesApi
import play.api.libs.concurrent.Execution.Implicits._
import play.api.libs.json.Json
import play.api.mvc.{AnyContent, Result, Request, Action}
//class BoardController @Inject() (implicit val env: Environment[User, SessionAuthenticator])
//  extends Silhouette[User, SessionAuthenticator] with MongoController {

class EntityController @Inject() (val reactiveMongoApi: ReactiveMongoApi,val messagesApi: MessagesApi,
  val env: Environment[User, CookieAuthenticator],
  socialProviderRegistry: SocialProviderRegistry)
  extends Controller with Silhouette[User, CookieAuthenticator] with MongoController with ReactiveMongoComponents {


  // get the collection 'boards'
  def entityCollection: JSONCollection = db.collection[JSONCollection]("entities")
  def slatCollection: JSONCollection = db.collection[JSONCollection]("slats")
  // a GridFS store named 'attachments'
  //val gridFS = new GridFS(db, "attachments")
  val gridFS = new GridFS(db)

  // let's build an index on our gridfs chunks collection if none
  gridFS.ensureIndex().onComplete {
    case index =>
      Logger.info(s"Checked index, result is $index")
  }

/*******
 * list all boards and sort them
 *******/
  def index(id: String) = Action.async { implicit request =>
    // get a sort document (see getSort method for more information)  
    // build a selection document with an empty query and a sort subdocument ('$orderby')
    val query = BSONDocument(
      "query" -> BSONDocument())
    // the cursor of documents
    // build (asynchronously) a list containing all the boards

    val cursor = entityCollection.find(Json.obj("query" -> BSONDocument())).cursor[Entity](readPreference = ReadPreference.primary)
    //val user = Some(request.identity)
     
      cursor.collect[List]().map { entities =>
               Ok(Json.toJson(entities))
      }

  }
  // list all boards and sort them
  def indexSlat(id:String, entity_id:String) = Action.async { implicit request =>
    // get a sort document (see getSort method for more information)
    // build a selection document with an empty query and a sort subdocument ('$orderby')
    val query = BSONDocument(
      "query" -> BSONDocument())
    // the cursor of documents
    val found = slatCollection.find(query).cursor[Slat](readPreference = ReadPreference.primary)
    // build (asynchronously) a list containing all the boards
    found.collect[List]().map { slat =>
      Ok(Json.toJson(slat))
    }
  }
  def showCreationForm(id: String) = Action {
    Ok(views.html.editEntity(id, None, Entity.form, None))
  }

  
  def showEditForm(id: String, entity_id: String) = Action.async {
    //val objectId = BSONObjectID(id)
    // get the documents having this id (there will be 0 or 1 result)
    val futureBoard = entityCollection.find(BSONDocument("id" -> entity_id)).one[Entity]
    // ... so we get optionally the matching board, if any
    // let's use for-comprehensions to compose futures (see http://doc.akka.io/docs/akka/2.0.3/scala/futures.html#For_Comprehensions for more information)
    
    for {    
      maybeBoard <- futureBoard
      result <- maybeBoard.map { entity =>
          Future(Ok(views.html.editEntity(id, Some(entity_id), Entity.form.fill(entity), None)))
      }.getOrElse(Future(NotFound))
    } yield result
    
//for {
      // get a future option of board
  //    maybeBoard <- futureBoard
      // if there is some board, return a future of result with the board and its attachments
//      result <- maybeBoard.map { board =>
        //import reactivemongo.api.gridfs.Implicits.DefaultReadFileReader
        // search for the matching attachments
        // find(...).toList returns a future list of documents (here, a future list of ReadFileEntry)
        //}
      //}//.getOrElse(Future(NotFound))
    //} yield result
  }


  def create(id: String) = Action.async { implicit request =>
    println("try to create ")
     //val user = request.identity
    Entity.form.bindFromRequest.fold(
      errors => { println(errors.toString);Future.successful(Ok(errors.toString)) }, 
      // if no error, then insert the entity into the 'boards' collection
      entity => {
        println(entity)
        entityCollection.insert(entity.copy(id = Some(UUID.randomUUID()),
        										boardId = UUID.fromString(id),
                                               publisher = "",//user.email.getOrElse(""),
                                               creationDate = Some(new DateTime()), 
                                               updateDate = Some(new DateTime()))).map(_ =>
          Redirect(routes.BoardController.index))
	 }                                               
    )
  }
  def edit(id: String, entity_id: String) = Action.async { implicit request =>
    Entity.form.bindFromRequest.fold(
      errors => Future.successful(Ok(views.html.editEntity(id, Some(entity_id), errors, None))),
      entity => {
        // create a modifier document, ie a document that contains the update operations to run onto the documents matching the query
        val date = new DateTime().getMillis
        println(date)
        val modifier = BSONDocument(
          // this modifier will set the fields 'updateDate', 'title', 'content', and 'publisher'
          "$set" -> BSONDocument(
            "updateDate" -> BSONLong(date),
            "title" -> BSONString(entity.title),
            "description" -> BSONString(entity.description),
            "etype" -> BSONString(entity.etype),
            "default" -> BSONString(entity.default)))
        // ok, let's do the update
        entityCollection.update(BSONDocument("id" -> id), modifier).map { _ =>
          Redirect(routes.BoardController.index)
        }
      })
  }

  def delete(id: String) = Action { implicit request =>
      entityCollection.remove(BSONDocument("id" -> id))
      Redirect(routes.BoardController.index)
  }


/***
 * API
 */
def APIindex(id:String) = Action.async { implicit request =>
  // get a sort document (see getSort method for more information)  
    // build a selection document with an empty query and a sort subdocument ('$orderby')
    val query = BSONDocument(
      "query" -> BSONDocument())
    // the cursor of documents
    // build (asynchronously) a list containing all the boards
    val cursor = entityCollection.find(Json.obj("query" -> BSONDocument())).cursor[Entity](readPreference = ReadPreference.primary)
    //val user = Some(request.identity)     
    cursor.collect[List]().map { entities =>
             Ok(Json.toJson(entities))
    }
}
def APIcreate(id:String) = Action.async(parse.json) { implicit request =>
request.body.validate[Entity].map { entity =>
        
        println(entity)
        entityCollection.insert(entity.copy(id = Some(UUID.randomUUID()),
                            boardId = UUID.fromString(id),
                                               publisher = "",//user.email.getOrElse(""),
                                               creationDate = Some(new DateTime()), 
                                               updateDate = Some(new DateTime()))).map(_ =>
         Ok(Json.obj("message" -> "ok")))
                      
    }.recoverTotal {
      case error =>
      Future.successful(Ok(Json.obj("message" -> "invalid.data")))
    }
}
// http://${connection.host}:${connection.port}/api/v1/board/${board_id}/entity/${entity_id}
def APIedit(board_id:String, entity_id:String) = Action.async(parse.json) { implicit request =>
request.body.validate[Entity].map { entity =>
        // create a modifier document, ie a document that contains the update operations to run onto the documents matching the query
        val date = new DateTime().getMillis
        println(date)
        val modifier = BSONDocument(
          // this modifier will set the fields 'updateDate', 'title', 'content', and 'publisher'
          "$set" -> BSONDocument(
            "updateDate" -> BSONLong(date),
            "title" -> BSONString(entity.title),
            "description" -> BSONString(entity.description),
            "etype" -> BSONString(entity.etype),
            "default" -> BSONString(entity.default)))
        // ok, let's do the update
        entityCollection.update(BSONDocument("id" -> entity_id), modifier).map { _ =>
          println("updated")
          Ok(Json.obj("message" -> "ok"))
        }
    }.recoverTotal {
      case error => {
        println("error")
        println(error)
        Future.successful(Ok(Json.obj("message" -> "invalid.data")))
      }
    }
}

def APIindexSlat(id:String, entity_id:String) = Action { implicit request =>
  Ok("ok")
}








}

