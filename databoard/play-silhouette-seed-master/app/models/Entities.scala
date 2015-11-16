package models

import org.jboss.netty.buffer._
import org.joda.time.DateTime
import play.api.data._
import play.api.data.Forms._
import play.api.data.format.Formats._
import play.api.data.validation.Constraints._
import play.api.data.format._
import play.modules.reactivemongo._
import play.modules.reactivemongo.json._
import play.modules.reactivemongo.json.collection._
import play.api.libs.concurrent.Execution.Implicits.defaultContext
import play.modules.reactivemongo.json.collection.JSONCollection
import play.modules.reactivemongo.json._
import reactivemongo.api._
import play.api.libs.json._
import play.api.Play.current
import play.api.i18n.Messages.Implicits._
import reactivemongo.bson._
import java.util.UUID

case class Entity(
  id: Option[UUID] = Some(UUID.randomUUID()),
  title: String,
  boardId: UUID,
  description: String,
  publisher: String,
  etype: String,
  default: String = "",
  meta: List[MetaVal] = List.empty,  
  creationDate: Option[DateTime] = None,
  updateDate: Option[DateTime] = None) {
  	
  def getId:String = id match {
    case Some(uuid) => uuid.toString
    case _ => ""
  }
}
// Turn off your mind, relax, and float downstream
// It is not dying...
object Entity {
  import play.api.libs.json.Json
  import play.modules.reactivemongo.json.BSONFormats._

  implicit val MetaValFormat = Json.format[MetaVal]
  implicit val MetaValReader = Json.reads[MetaVal]

  implicit val jsonBoardFormat = Json.format[Entity]
  implicit object EntityBSONReader extends BSONDocumentReader[Entity] {
    def read(doc: BSONDocument): Entity =
      Entity(
        None,//doc.getAs[UUID]("_id"),
        doc.getAs[String]("title").get,
        UUID.fromString(doc.getAs[String]("boardId").get),
        doc.getAs[String]("description").get,
        doc.getAs[String]("publisher").get,
        doc.getAs[String]("etype").get,
        doc.getAs[String]("default").get,
        List.empty[MetaVal],//doc.getAs[List[MetaVal]]("meta").get,        

        doc.getAs[BSONDateTime]("creationDate").map(dt => new DateTime(dt.value)),
        doc.getAs[BSONDateTime]("updateDate").map(dt => new DateTime(dt.value)))

 

  }


  implicit object EntityBSONWriter extends BSONDocumentWriter[Entity] {
    def write(board: Entity): BSONDocument =
      BSONDocument(
        "_id" -> None,//board.id.getOrElse(UUID.randomUUID()),
        "title" -> board.title,
        "boardId" -> board.boardId.toString,
        "description" -> board.description,
        "publisher" -> board.publisher,
        "etype" -> board.etype,
        "default" -> board.default,
        "meta" -> BSONArray.empty,        
        "creationDate" -> board.creationDate.map(date => BSONDateTime(date.getMillis)),
        "updateDate" -> board.updateDate.map(date => BSONDateTime(date.getMillis)))
  }
  def UUIDgen(v: String):UUID = {
  	v match {
  		case "" => UUID.randomUUID()
  		case c:String => UUID.fromString(c)
  	}
  }

  val form = Form(
    mapping(
      "id" -> optional(of[String] verifying pattern(
        """[a-fA-F0-9]{24}""".r,
        "constraint.objectId",
        "error.objectId")),
      "title" -> nonEmptyText,
      "boardId" -> default(nonEmptyText, ""),
      "description" -> default(text, ""),
      "publisher" -> default(nonEmptyText, ""),
      "etype" -> nonEmptyText,
      "default" -> default(text, ""),
      "meta" -> list(
      mapping(
        "key" -> nonEmptyText,
        "value" -> nonEmptyText
      )(MetaVal.apply)(MetaVal.unapply)),      
      "creationDate" -> optional(of[Long]),
      "updateDate" -> optional(of[Long])) { (id, title, boardId, description, publisher, etype, default, meta, creationDate, updateDate) =>
        Entity(
          None,
          title,
          UUIDgen(boardId),
          description,
          publisher,
          etype,
          default,
          meta,
          creationDate.map(new DateTime(_)),
          updateDate.map(new DateTime(_)))
      } { board =>
        Some(
          (None,
            board.title,
            board.boardId.toString,
            board.description,
            board.publisher,
            board.etype,
            board.default,
            board.meta,            
            board.creationDate.map(_.getMillis),
            board.updateDate.map(_.getMillis)))
      })
}