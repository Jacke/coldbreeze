/*package controllers

import org.joda.time.DateTime
import scala.concurrent.Future

import play.api.Logger
import play.api.Play.current
import play.api.mvc._
import play.api.libs.concurrent.Execution.Implicits.defaultContext
import play.modules.reactivemongo.{ MongoController, ReactiveMongoPlugin }

import javax.inject.Inject

import com.mohiva.play.silhouette.api.{ Environment, LogoutEvent, Silhouette }
import com.mohiva.play.silhouette.impl.authenticators.SessionAuthenticator
import forms._
import models.User

import scala.concurrent.Future

import reactivemongo.api.gridfs.GridFS
import reactivemongo.api.gridfs.Implicits.DefaultReadFileReader
import reactivemongo.api.collections.default.BSONCollection
import reactivemongo.bson._

import models.Board
import models.Board._

object EntityController {

  // get the collection 'boards'
  val collection = db[BSONCollection]("boards")
  // a GridFS store named 'attachments'
  //val gridFS = new GridFS(db, "attachments")
  val gridFS = new GridFS(db)

  // let's build an index on our gridfs chunks collection if none
  gridFS.ensureIndex().onComplete {
    case index =>
      Logger.info(s"Checked index, result is $index")
  }

  // list all boards and sort them
  def index = Action.async { implicit request =>
    // get a sort document (see getSort method for more information)
    val sort = getSort(request)
    // build a selection document with an empty query and a sort subdocument ('$orderby')
    val query = BSONDocument(
      "$orderby" -> sort,
      "$query" -> BSONDocument())
    val activeSort = request.queryString.get("sort").flatMap(_.headOption).getOrElse("none")
    // the cursor of documents
    val found = collection.find(query).cursor[Board]
    // build (asynchronously) a list containing all the boards
    found.collect[List]().map { boards =>
      Ok(views.html.boards(boards, activeSort, None))
    }.recover {
      case e =>
        e.printStackTrace()
        BadRequest(e.getMessage())
    }
  }
  // list all boards and sort them
  def slats = Action.async { implicit request =>
    // get a sort document (see getSort method for more information)
    val sort = getSort(request)
    // build a selection document with an empty query and a sort subdocument ('$orderby')
    val query = BSONDocument(
      "$orderby" -> sort,
      "$query" -> BSONDocument())
    val activeSort = request.queryString.get("sort").flatMap(_.headOption).getOrElse("none")
    // the cursor of documents
    val found = collection.find(query).cursor[Board]
    // build (asynchronously) a list containing all the boards
    found.collect[List]().map { boards =>
      Ok(views.html.boards(boards, activeSort, None))
    }.recover {
      case e =>
        e.printStackTrace()
        BadRequest(e.getMessage())
    }
  }
  def showCreationForm = Action {
    Ok(views.html.editBoard(None, Board.form, None))
  }

  def showEditForm(id: String) = Action.async {
    val objectId = BSONObjectID(id)
    // get the documents having this id (there will be 0 or 1 result)
    val futureBoard = collection.find(BSONDocument("_id" -> objectId)).one[Board]
    // ... so we get optionally the matching board, if any
    // let's use for-comprehensions to compose futures (see http://doc.akka.io/docs/akka/2.0.3/scala/futures.html#For_Comprehensions for more information)
    for {
      // get a future option of board
      maybeBoard <- futureBoard
      // if there is some board, return a future of result with the board and its attachments
      result <- maybeBoard.map { board =>
        import reactivemongo.api.gridfs.Implicits.DefaultReadFileReader
        // search for the matching attachments
        // find(...).toList returns a future list of documents (here, a future list of ReadFileEntry)
        gridFS.find(BSONDocument("board" -> board.id.get)).collect[List]().map { files =>
          val filesWithId = files.map { file =>
            file.id.asInstanceOf[BSONObjectID].stringify -> file
          }
          Ok(views.html.editBoard(Some(id), Board.form.fill(board), Some(filesWithId)))
        }
      }.getOrElse(Future(NotFound))
    } yield result
  }

  def create = Action.async { implicit request =>
    Board.form.bindFromRequest.fold(
      errors => Future.successful(Ok(views.html.editBoard(None, errors, None))),
      // if no error, then insert the board into the 'boards' collection
      board =>
        collection.insert(board.copy(creationDate = Some(new DateTime()), updateDate = Some(new DateTime()))).map(_ =>
          Redirect(routes.Boards.index))
    )
  }

  def edit(id: String) = Action.async { implicit request =>
    Board.form.bindFromRequest.fold(
      errors => Future.successful(Ok(views.html.editBoard(Some(id), errors, None))),
      board => {
        val objectId = BSONObjectID(id)
        // create a modifier document, ie a document that contains the update operations to run onto the documents matching the query
        val modifier = BSONDocument(
          // this modifier will set the fields 'updateDate', 'title', 'content', and 'publisher'
          "$set" -> BSONDocument(
            "updateDate" -> BSONDateTime(new DateTime().getMillis),
            "title" -> BSONString(board.title),
            "content" -> BSONString(board.content),
            "publisher" -> BSONString(board.publisher)))
        // ok, let's do the update
        collection.update(BSONDocument("_id" -> objectId), modifier).map { _ =>
          Redirect(routes.Boards.index)
        }
      })
  }

  def delete(id: String) = Action.async {
    // let's collect all the attachments matching that match the board to delete
    gridFS.find(BSONDocument("board" -> BSONObjectID(id))).collect[List]().flatMap { files =>
      // for each attachment, delete their chunks and then their file entry
      val deletions = files.map { file =>
        gridFS.remove(file)
      }
      Future.sequence(deletions)
    }.flatMap { _ =>
      // now, the last operation: remove the board
      collection.remove(BSONDocument("_id" -> BSONObjectID(id)))
    }.map(_ => Ok).recover { case _ => InternalServerError }
  }

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
      case _ => Redirect(routes.Boards.showEditForm(id))
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
}
*/