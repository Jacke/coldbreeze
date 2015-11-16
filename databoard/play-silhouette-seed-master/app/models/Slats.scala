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
case class SlatSelector(entities_ids: List[String])

case class Slat(
  id: Option[UUID] = Some(UUID.randomUUID()),
  title: String,
  boardId: UUID,
  entityId: UUID,  
  sval: String,
  publisher: String,
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
object Slat {
  import play.api.libs.json.Json
  import play.modules.reactivemongo.json.BSONFormats._
  
  implicit val MetaValFormat = Json.format[MetaVal]
  implicit val MetaValReader = Json.reads[MetaVal]

  def UUIDgen(v: String):UUID = {
    v match {
      case "" => UUID.randomUUID()
      case c:String => UUID.fromString(c)
    }
  }

  implicit val jsonBoardFormat = Json.format[Slat]
  implicit object SlatBSONReader extends BSONDocumentReader[Slat] {
    def read(doc: BSONDocument): Slat =
      Slat(
        None,//doc.getAs[UUID]("_id"),
        doc.getAs[String]("title").get,
		    UUID.fromString(doc.getAs[String]("boardId").get),
 		    UUID.fromString(doc.getAs[String]("entityId").get),       
        doc.getAs[String]("sval").get,
        doc.getAs[String]("publisher").get,
        List.empty[MetaVal],//doc.getAs[List[MetaVal]]("meta").get,        
        doc.getAs[BSONDateTime]("creationDate").map(dt => new DateTime(dt.value)),
        doc.getAs[BSONDateTime]("updateDate").map(dt => new DateTime(dt.value)))

 

  }
  implicit object SlatBSONWriter extends BSONDocumentWriter[Slat] {
    def write(board: Slat): BSONDocument =
      BSONDocument(
        "_id" -> None,//board.id.getOrElse(UUID.randomUUID()),
        "title" -> board.title,
        "boardId" -> board.boardId.toString,
        "entityId" -> board.entityId.toString, 
        "sval" -> board.sval,
        "publisher" -> board.publisher,
        "meta" -> BSONArray.empty,
        "creationDate" -> board.creationDate.map(date => BSONDateTime(date.getMillis)),
        "updateDate" -> board.updateDate.map(date => BSONDateTime(date.getMillis)))
  }
  val form = Form(
    mapping(
      "id" -> optional(of[String] verifying pattern(
        """[a-fA-F0-9]{24}""".r,
        "constraint.objectId",
        "error.objectId")),
      "title" -> nonEmptyText,
      "boardId" -> default(nonEmptyText, ""),
      "entityId" -> default(nonEmptyText, ""),      
      "sval" -> nonEmptyText,
      "publisher" -> default(nonEmptyText, ""),
      "meta" -> list(
      mapping(
        "key" -> nonEmptyText,
        "value" -> nonEmptyText
      )(MetaVal.apply)(MetaVal.unapply)),
      
      "creationDate" -> optional(of[Long]),
      "updateDate" -> optional(of[Long])) { (id, title, boardId, entityId, sval, publisher, meta, creationDate, updateDate) =>
        Slat(
          None,
          title,
          UUIDgen(boardId),
          UUIDgen(entityId),          
          sval,
          publisher,
          meta,
          creationDate.map(new DateTime(_)),
          updateDate.map(new DateTime(_)))
      } { board =>
        Some(
          (None,
            board.title,
            board.boardId.toString,
            board.entityId.toString,
            board.sval,
            board.publisher,
            board.meta,
            board.creationDate.map(_.getMillis),
            board.updateDate.map(_.getMillis)))
      })
}