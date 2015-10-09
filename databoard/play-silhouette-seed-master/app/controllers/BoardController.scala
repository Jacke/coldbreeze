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
import models.User
import models.daos.UserDAO
import scala.concurrent._
import scala.concurrent.duration._
//class BoardController @Inject() (implicit val env: Environment[User, SessionAuthenticator])
//  extends Silhouette[User, SessionAuthenticator] with MongoController {

case class BBInitPayload(employees: List[String],
                         managers: List[String],
                         team_title: Option[String], 
                         original_id: Int)
case class BoardContainer(boards: List[Board], entities:List[Entity], slats:List[Slat])

class BoardController @Inject() (val reactiveMongoApi: ReactiveMongoApi,val messagesApi: MessagesApi,
  val env: Environment[User, CookieAuthenticator],
  socialProviderRegistry: SocialProviderRegistry, userDAO: UserDAO)
  extends Controller with Silhouette[User, CookieAuthenticator] with MongoController with ReactiveMongoComponents {
  import play.api.libs.json.Json
  import play.modules.reactivemongo.json.BSONFormats._

    implicit val BBInitPayloadFormat = Json.format[BBInitPayload]
    implicit val BBInitPayloadReader = Json.reads[BBInitPayload]

  implicit val MetaValReader = Json.reads[MetaVal]
 implicit val MetaValFormat = Json.format[MetaVal]
  implicit val personHandler = Json.reads[Ownership]
  implicit val jsonOwnershipFormat = Json.format[Ownership]
  implicit val jsonBoardReaders = Json.reads[Board]
  implicit val jsonBoardFormat = Json.format[Board]
  implicit val EntityReaders = Json.reads[Entity]
  implicit val EntityFormat = Json.format[Entity]
  implicit val SlatReaders = Json.reads[Slat]
  implicit val SlatFormat = Json.format[Slat]

  implicit val BoardContainerReaders = Json.reads[BoardContainer]
  implicit val BoardContainerFormat = Json.format[BoardContainer]

  // get the collection 'boards'
  def collection: JSONCollection         = db.collection[JSONCollection]("boards")
  def entityCollection: JSONCollection = db.collection[JSONCollection]("entities")
  def slatCollection: JSONCollection     = db.collection[JSONCollection]("slats")
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
  def index = Action.async { implicit request =>
    // get a sort document (see getSort method for more information)  
    val sort = getSort(request)
    // build a selection document with an empty query and a sort subdocument ('$orderby')
    val query = BSONDocument(
      "orderby" -> sort,
      "query" -> BSONDocument())
    val activeSort = request.queryString.get("sort").flatMap(_.headOption).getOrElse("none")
    // the cursor of documents
    
    val entityCollectionCursor = entityCollection.find(Json.obj("query" -> BSONDocument())).cursor[Entity](readPreference = ReadPreference.primary)
    val slatCollectionCursor = slatCollection.find(Json.obj("query" -> BSONDocument())).cursor[Slat](readPreference = ReadPreference.primary)

    val cursor = collection.find(Json.obj("query" -> BSONDocument())).cursor[Board](readPreference = ReadPreference.primary)
    //val user = Some(request.identity)
    var boardsCol:List[Board] = List()
    for {
        boards <- cursor.collect[List]()
        entities <-  entityCollectionCursor.collect[List]()
        slats <- slatCollectionCursor.collect[List]()
     } yield Ok(views.html.boards(boards, entities, slats, activeSort, None))

    

  }

  def showCreationForm = Action {
    Ok(views.html.editBoard(None, Board.form, None))
  }

  
  def showEditForm(id: String) = Action.async {
    //val objectId = BSONObjectID(id)
    // get the documents having this id (there will be 0 or 1 result)
    val futureBoard = collection.find(BSONDocument("id" -> id)).one[Board]
    // ... so we get optionally the matching board, if any
    // let's use for-comprehensions to compose futures (see http://doc.akka.io/docs/akka/2.0.3/scala/futures.html#For_Comprehensions for more information)
    
    for {    
      maybeBoard <- futureBoard
      result <- maybeBoard.map { board =>
          Future(Ok(views.html.editBoard(Some(id), Board.form.fill(board), None)))
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


  def create = Action.async { implicit request =>
    println("try to create ")
     //val user = request.identity

    Board.form.bindFromRequest.fold(
      errors => Future.successful(Ok(errors.toString)),
      // if no error, then insert the board into the 'boards' collection
      board =>
        collection.insert(board.copy(id = Some(UUID.randomUUID()),
                                               publisher = "", //user.email.getOrElse(""),
                                               creationDate = Some(new DateTime()), 
                                               updateDate = Some(new DateTime()))).map(_ =>
          Redirect(routes.BoardController.index))
    )
  }
  def edit(id: String) = Action.async { implicit request =>
    Board.form.bindFromRequest.fold(
      errors => { 
        println(">>>>>>>>>")
        println(errors)
        Future.successful(Ok(views.html.editBoard(Some(id), errors, None))) },
      board => {
        // create a modifier document, ie a document that contains the update operations to run onto the documents matching the query
        val date = new DateTime().getMillis
        play.api.Logger.debug(board.meta.toString)
        board.meta.foreach { m => play.api.Logger.debug(m.toString) }
        var metas = BSONArray.empty
        board.meta.foreach { meta =>
          metas = metas ++ BSONDocument("key" -> meta.key, "value" -> meta.value) 
        }
        val modifier = BSONDocument(
          // this modifier will set the fields 'updateDate', 'title', 'content', and 'publisher'
          "$set" -> BSONDocument(
            "updateDate" -> BSONLong(date),
            "title" -> BSONString(board.title),
            "content" -> BSONString(board.content),
            "publisher" -> BSONString(board.publisher),
             "meta" -> metas))
         
        // ok, let's do the update
        collection.update(BSONDocument("id" -> id), modifier).map { _ =>
          Redirect(routes.BoardController.index)
        }
      })
  }

  def delete(id: String) = Action { implicit request =>
/*    // let's collect all the attachments matching that match the board to delete
    gridFS.find(BSONDocument("board" -> BSONObjectID(id))).collect[List]().flatMap { files =>
      // for each attachment, delete their chunks and then their file entry
      val deletions = files.map { file =>
        gridFS.remove(file)
      }
      Future.sequence(deletions)
    }.flatMap { _ =>
      // now, the last operation: remove the board
    }.map(_ => Ok).recover { case _ => InternalServerError }
*/
      collection.remove(BSONDocument("id" -> id))
      Redirect(routes.BoardController.index)
  }

  private def getSort(request: Request[_]) = {
    request.queryString.get("sort").map { fields =>
      val sortBy = for {
        order <- fields.map { field =>
          if (field.startsWith("-"))
            field.drop(1) -> -1
          else field -> 1
        }
        if order._1 == "title" || order._1 == "publisher" || order._1 == "creationDate" || order._1 == "updateDate"
      } yield order._1 -> BSONInteger(order._2)
      BSONDocument(sortBy)
    }
  }

def initiate() = Action.async(parse.json) { implicit request =>
    request.body.validate[BBInitPayload].map { data =>
      println(data)
      // Check if it's minority
      // Map Users from Managers, Employees
      val users = (data.employees ++ data.managers).toSeq.toList
      val filtered = users.filter(u => (users.map(u => Await.result(userDAO.findByEmail(u), Duration(5000, MILLISECONDS))).flatten.map(_.email)).contains(u) )
      users.map(u => forms.SignUpForm.Data(
        firstName = "",
        lastName = "",
        email = u,
        password = "12344321"    ))
      // # Add
      // Map Business
        // data.team_title
        // data.original_id
      // 
    }
Future(Ok("initiated"))
}



/****
 * API
 */

def APIindex = Action.async { implicit request =>
    val query = BSONDocument(
      "query" -> BSONDocument())

    val entityCollectionCursor = entityCollection.find(Json.obj("query" -> 
                                            BSONDocument())).cursor[Entity](readPreference = ReadPreference.primary)
    val slatCollectionCursor = slatCollection.find(Json.obj("query" -> 
                                            BSONDocument())).cursor[Slat](readPreference = ReadPreference.primary)
    val cursor = collection.find(Json.obj("query" -> 
                              BSONDocument())).cursor[Board](readPreference = ReadPreference.primary)
    for {
        boards <- cursor.collect[List]()
        entities <-  entityCollectionCursor.collect[List]()
        slats <- slatCollectionCursor.collect[List]()
     } yield Ok(Json.toJson(BoardContainer(boards, entities, slats)))
}
def APIcreate = Action.async(parse.json) { implicit request =>
    request.body.validate[Board].map { board =>
        collection.insert(board.copy(id = Some(UUID.randomUUID()),
                                               publisher = "", //user.email.getOrElse(""),
                                               creationDate = Some(new DateTime()), 
                                               updateDate = Some(new DateTime())))
    }
    //.recoverTotal { error =>
    //    Future(Ok(Json.obj("message" -> "failed")))
    //}
    Future(Ok(Json.obj("message" -> "ok")))
}
def APIdelete(id:String) = Action { implicit request =>
  collection.remove(BSONDocument("id" -> id))
  Ok("ok")
}
def APIedit(id:String) = Action { implicit request =>
  Ok("ok")
}














}

/*

  // save the uploaded file as an attachment of the board with the given id
  def saveAttachment(id: String) = Action.async(gridFSBodyParser(gridFS)) { request =>
    // here is the future file!
    val futureFile = request.body.files.head.ref
    // when the upload is complete, we add the board id to the file entry (in order to find the attachments of the board)
    val futureUpdate = for {
      file <- futureFile
      // here, the file is completely uploaded, so it is time to update the board
      updateResult <- {
        gridFS.files.update(
          BSONDocument("_id" -> file.id),
          BSONDocument("$set" -> BSONDocument("board" -> BSONObjectID(id))))
      }
    } yield updateResult

    futureUpdate.map {
      case _ => Redirect(routes.BoardController.showEditForm(id))
    }.recover {
      case e => InternalServerError(e.getMessage())
    }
  }

  def getAttachment(id: String) = Action.async { request =>
    // find the matching attachment, if any, and streams it to the client
    val file = gridFS.find(BSONDocument("_id" -> BSONObjectID(id)))
    request.getQueryString("inline") match {
      case Some("true") => serve(gridFS, file, CONTENT_DISPOSITION_INLINE)
      case _            => serve(gridFS, file)
    }
  }

  def removeAttachment(id: String) = Action.async {
    gridFS.remove(BSONObjectID(id)).map(_ => Ok).recover { case _ => InternalServerError }
  }
  */