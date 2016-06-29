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

case class Ownership(host: String, uid: String, group: String = "")
case class MetaVal(key: String, value: String)
case class Board(
  id: Option[UUID] = Some(UUID.randomUUID()),
  title: String,
  content: String,
  publisher: String,
  ownership: Ownership,
  meta: List[MetaVal] = List.empty,  
  creationDate: Option[DateTime],
  updateDate: Option[DateTime]) {
  
  def getId:String = id match {
    case Some(uuid) => uuid.toString
    case _ => ""
  }
}
// Turn off your mind, relax, and float downstream
// It is not dying...
object Board {
  import play.api.libs.json.Json
  import play.modules.reactivemongo.json.BSONFormats._

  implicit val MetaValFormat = Json.format[MetaVal]
  implicit val MetaValReader = Json.reads[MetaVal]

  implicit val personHandler = Macros.handler[Ownership]
  implicit val jsonOwnershipFormat = Json.format[Ownership]
  implicit val jsonBoardFormat = Json.format[Board]

 implicit def OwnershipFormat: Formatter[Ownership] = new Formatter[Ownership] {
    def bind(key: String, data: Map[String, String]) = {
      Right(data.get(key).getOrElse("false")).right.flatMap {
        case "true" => Right(Ownership("","",""))
        case "false" => Right(Ownership("","",""))
        case _ => Left(Seq(FormError(key, "error.ownership", Nil)))
      }
    }
    def unbind(key: String, value: Ownership) = Map(key -> value.host)
  }

  implicit object BoardBSONReader extends BSONDocumentReader[Board] {
    def read(doc: BSONDocument): Board =
      Board(
        None,//doc.getAs[UUID]("_id"),
        doc.getAs[String]("title").get,
        doc.getAs[String]("content").get,
        doc.getAs[String]("publisher").get,
        doc.getAs[Ownership]("ownership").get,
        List.empty[MetaVal],//doc.getAs[List[MetaVal]]("meta").get,        
        doc.getAs[BSONDateTime]("creationDate").map(dt => new DateTime(dt.value)),
        doc.getAs[BSONDateTime]("updateDate").map(dt => new DateTime(dt.value)))

 

  }
  implicit object BoardBSONWriter extends BSONDocumentWriter[Board] {
    def write(board: Board): BSONDocument =
      BSONDocument(
        "_id" -> None,//board.id.getOrElse(UUID.randomUUID()),
        "title" -> board.title,
        "content" -> board.content,
        "publisher" -> board.publisher,
        "ownership" -> board.ownership,//.collect { case Array(k, v) => (k, v) } toMap,
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
      "content" -> default(text, ""),
      "publisher" -> default(nonEmptyText, ""),
      "ownership" -> of[Ownership],
      "meta" -> list(
      mapping(
        "key" -> nonEmptyText,
        "value" -> nonEmptyText
      )(MetaVal.apply)(MetaVal.unapply)),

      /*mapping("host" -> nonEmptyText,
        "uid" -> nonEmptyText,
        "group" -> nonEmptyText
        ),*/
      "creationDate" -> optional(of[Long]),
      "updateDate" -> optional(of[Long])) { (id, title, content, publisher, ownership, meta, creationDate, updateDate) =>
        Board(
          None,
          title,
          content,
          publisher,
          ownership,
          meta,
          creationDate.map(new DateTime(_)),
          updateDate.map(new DateTime(_)))
      } { board =>
        Some(
          (None,
            board.title,
            board.content,
            board.publisher,
            board.ownership,
            board.meta,
            board.creationDate.map(_.getMillis),
            board.updateDate.map(_.getMillis)))
      })
}
object BSONMap {
  implicit def MapReader[V](implicit vr: BSONDocumentReader[V]): BSONDocumentReader[Map[String, V]] = new BSONDocumentReader[Map[String, V]] {
    def read(bson: BSONDocument): Map[String, V] = {
      val elements = bson.elements.map { tuple =>
        // assume that all values in the document are BSONDocuments
        tuple._1 -> vr.read(tuple._2.seeAsTry[BSONDocument].get)
      }
      elements.toMap
    }
  }

  implicit def MapWriter[V](implicit vw: BSONDocumentWriter[V]): BSONDocumentWriter[Map[String, V]] = new BSONDocumentWriter[Map[String, V]] {
    def write(map: Map[String, V]): BSONDocument = {
      val elements = map.toStream.map { tuple =>
        tuple._1 -> vw.write(tuple._2)
      }
      BSONDocument(elements)
    }
  }
}