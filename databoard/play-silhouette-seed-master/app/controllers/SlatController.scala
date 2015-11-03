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

//class BoardController @Inject() (implicit val env: Environment[User, SessionAuthenticator])
//  extends Silhouette[User, SessionAuthenticator] with MongoController {
class SlatController @Inject() (val reactiveMongoApi: ReactiveMongoApi,val messagesApi: MessagesApi,
  val env: Environment[User, CookieAuthenticator],
  socialProviderRegistry: SocialProviderRegistry)
  extends Controller with Silhouette[User, CookieAuthenticator] with MongoController with ReactiveMongoComponents {


    implicit val SlatSelectorFormat = Json.format[SlatSelector]
    implicit val SlatSelectorReader = Json.reads[SlatSelector]

  // get the collection 'boards'
  def slatCollection: JSONCollection = db.collection[JSONCollection]("slats")
  def entityCollection: JSONCollection = db.collection[JSONCollection]("entities")  
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
    val cursor = slatCollection.find(Json.obj("query" -> BSONDocument())).cursor[Slat](readPreference = ReadPreference.primary)
    //val user = Some(request.identity)
	  cursor.collect[List]().map { slats =>
	           Ok(Json.toJson(slats))
	  }

  }
  def showCreationForm(id: String, entity_id: String) = Action {
    Ok(views.html.editSlat(id, entity_id, None, Slat.form, None))
  }

  
  def showEditForm(id: String, entity_id:String, slat_id: String) = Action.async {
    //val objectId = BSONObjectID(id)
    // get the documents having this id (there will be 0 or 1 result)
    val futureBoard = slatCollection.find(BSONDocument("id" -> slat_id)).one[Slat]
    // ... so we get optionally the matching slat, if any
    // let's use for-comprehensions to compose futures (see http://doc.akka.io/docs/akka/2.0.3/scala/futures.html#For_Comprehensions for more information)
    
    for {    
      maybeBoard <- futureBoard
      result <- maybeBoard.map { slat =>
          Future(Ok(views.html.editSlat(id, entity_id, Some(slat_id), Slat.form.fill(slat), None)))
      }.getOrElse(Future(NotFound))
    } yield result
  }


  def create(id: String, entity_id:String) = Action.async { implicit request =>
    println("try to create ")
     //val user = request.identity
    Slat.form.bindFromRequest.fold(
      errors => { println(errors.toString);Future.successful(Ok(errors.toString)) } ,
      // if no error, then insert the slat into the 'boards' slatCollection
      slat =>
        slatCollection.insert(slat.copy(id = Some(UUID.randomUUID()),
        									   boardId = UUID.fromString(id), 
        									   entityId = UUID.fromString(entity_id),       	
                                               publisher = "",//user.email.getOrElse(""),
                                               creationDate = Some(new DateTime()), 
                                               updateDate = Some(new DateTime()))).map(_ =>
          Redirect(routes.BoardController.index))
    )
  }
  def edit(id: String, entity_id:String, slat_id: String) = Action.async { implicit request =>
    Slat.form.bindFromRequest.fold(
      errors => Future.successful(Ok(views.html.editSlat(id, entity_id, Some(slat_id), errors, None))),
      board => {
        // create a modifier document, ie a document that contains the update operations to run onto the documents matching the query
        val date = new DateTime().getMillis
        println(date)
        val modifier = BSONDocument(
          // this modifier will set the fields 'updateDate', 'title', 'content', and 'publisher'
          "$set" -> BSONDocument(
            "updateDate" -> BSONLong(date),
            "title" -> BSONString(board.title),
            "sval" -> BSONString(board.sval),
            "meta" -> BSONString(board.meta),
            "publisher" -> BSONString(board.publisher)))
        // ok, let's do the update
        slatCollection.update(BSONDocument("id" -> id), modifier).map { _ =>
          Redirect(routes.BoardController.index)
        } 
      })
  }

  def delete(id: String) = Action { implicit request =>
      slatCollection.remove(BSONDocument("id" -> id))
      Redirect(routes.BoardController.index)
  }

/****
 * API
 */
def APIindex(id: String) = Action { implicit request =>
  Ok("ok")
}
def APIFindByEntities() = Action.async(parse.json) { implicit request =>
  request.body.validate[SlatSelector].map { selector =>
    val uids:List[UUID] = selector.entities_ids.map(id => UUID.fromString(id))
    
    val query = BSONDocument(
      "query" -> BSONDocument())
    // the cursor of documents
    val cursor = slatCollection.find(Json.obj("query" -> BSONDocument("id" -> BSONDocument("$in" -> uids.map(u => u.toString)) ))).cursor[Slat](readPreference = ReadPreference.primary)
    val cursor3 = slatCollection.find(Json.obj("query" -> BSONDocument())).cursor[Slat](readPreference = ReadPreference.primary)
    
    //val user = Some(request.identity)
    cursor.collect[List]().map { slats =>
             Ok(Json.toJson(slats))
    }
  }.recoverTotal {
      case error =>
        Future.successful(Ok(Json.obj("message" -> "invalid.data")))
    }
}


// POST
def APIdelete(id: String) = Action { implicit request =>
      println(s"slat delete request for id: $id")
      slatCollection.remove(BSONDocument("id" -> id))
      Ok(Json.obj("message" -> "ok")) 
}

def APIcreate(entity_id: String) = Action.async(parse.json) { implicit request =>
   request.body.validate[Slat].map { slat =>

    val futureEntity = entityCollection.find(BSONDocument("id" -> entity_id)).one[Entity]
    for {    
      maybeEntity <- futureEntity
      result <- maybeEntity.map { entity =>
          slatCollection.insert(slat.copy(id = Some(UUID.randomUUID()),
                               boardId = entity.boardId, 
                               entityId = UUID.fromString(entity_id),         
                                                 publisher = "",//user.email.getOrElse(""),
                                                 creationDate = Some(new DateTime()), 
                                                 updateDate = Some(new DateTime()))).map(_ =>
          Ok(Json.obj("message" -> "ok")) )


      }.getOrElse(Future(Ok(Json.obj("message" -> "failed"))))
    } yield result




    }.recoverTotal {
      case error =>
        Future.successful(Ok(Json.obj("message" -> "invalid.data")))
    }
   Future(Ok(Json.obj("message" -> "ok"))) 
}
// /api/v1/ent/:entity_id/slat/:slat_id/edit
def APIedit(entity_id: String, slat_id: String) = Action.async(parse.json) { implicit request =>
request.body.validate[Slat].map { slat =>
        // create a modifier document, ie a document that contains the update operations to run onto the documents matching the query
        // create a modifier document, ie a document that contains the update operations to run onto the documents matching the query
        val date = new DateTime().getMillis
        println(date)
        val modifier = BSONDocument(
          // this modifier will set the fields 'updateDate', 'title', 'content', and 'publisher'
          "$set" -> BSONDocument(
            "updateDate" -> BSONLong(date),
            "title" -> BSONString(slat.title),
            "sval" -> BSONString(slat.sval),
            "meta" -> BSONString(slat.meta),
            "publisher" -> BSONString(slat.publisher)))
        // ok, let's do the update
        slatCollection.update(BSONDocument("id" -> slat_id), modifier).map { _ =>
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
// /api/v1/slat/:slat_id/fill
def APIfill(slat_id: String) = Action.async(parse.json) { implicit request =>
request.body.validate[String].map { sval =>
        // create a modifier document, ie a document that contains the update operations to run onto the documents matching the query
        // create a modifier document, ie a document that contains the update operations to run onto the documents matching the query
        val date = new DateTime().getMillis
        println(date)
        val modifier = BSONDocument(
          // this modifier will set the fields 'updateDate', 'title', 'content', and 'publisher'
          "$set" -> BSONDocument(
            "sval" -> BSONString(sval)))
        // ok, let's do the update
        slatCollection.update(BSONDocument("id" -> slat_id), modifier).map { _ =>
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
// /api/v1/slat/:slat_id/refill
def APIrefill(slat_id: String) = Action.async(parse.json) { implicit request =>
request.body.validate[String].map { sval =>
        // create a modifier document, ie a document that contains the update operations to run onto the documents matching the query
        // create a modifier document, ie a document that contains the update operations to run onto the documents matching the query
        val date = new DateTime().getMillis
        println(date)
        val modifier = BSONDocument(
          // this modifier will set the fields 'updateDate', 'title', 'content', and 'publisher'
          "$set" -> BSONDocument(
            "sval" -> BSONString(sval)))
        // ok, let's do the update
        slatCollection.update(BSONDocument("id" -> slat_id), modifier).map { _ =>
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

}

