package models

import org.jboss.netty.buffer._
import org.joda.time.DateTime
import play.api.data._
import play.api.data.Forms._
import play.api.data.format.Formats._
import play.api.data.validation.Constraints._
import play.api.data.format._

import reactivemongo.bson._
case class Ownership(host: String, uid: String, group: String = "")
case class Board(
  id: Option[BSONObjectID],
  title: String,
  content: String,
  publisher: String,
  ownership: Ownership,
  creationDate: Option[DateTime],
  updateDate: Option[DateTime])
// Turn off your mind, relax, and float downstream
// It is not dying...
object Board {
  import play.api.libs.json.Json
  import play.modules.reactivemongo.json.BSONFormats._

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
        doc.getAs[BSONObjectID]("_id"),
        doc.getAs[String]("title").get,
        doc.getAs[String]("content").get,
        doc.getAs[String]("publisher").get,
        doc.getAs[Ownership]("ownership").get,
        doc.getAs[BSONDateTime]("creationDate").map(dt => new DateTime(dt.value)),
        doc.getAs[BSONDateTime]("updateDate").map(dt => new DateTime(dt.value)))
  }
  implicit object BoardBSONWriter extends BSONDocumentWriter[Board] {
    def write(board: Board): BSONDocument =
      BSONDocument(
        "_id" -> board.id.getOrElse(BSONObjectID.generate),
        "title" -> board.title,
        "content" -> board.content,
        "publisher" -> board.publisher,
        "ownership" -> board.ownership,//.collect { case Array(k, v) => (k, v) } toMap,
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
      "content" -> text,
      "publisher" -> nonEmptyText,
      "ownership" -> of[Ownership],
      /*mapping("host" -> nonEmptyText,
        "uid" -> nonEmptyText,
        "group" -> nonEmptyText
        ),*/
      "creationDate" -> optional(of[Long]),
      "updateDate" -> optional(of[Long])) { (id, title, content, publisher, ownership, creationDate, updateDate) =>
        Board(
          id.map(BSONObjectID(_)),
          title,
          content,
          publisher,
          ownership,
          creationDate.map(new DateTime(_)),
          updateDate.map(new DateTime(_)))
      } { board =>
        Some(
          (board.id.map(_.stringify),
            board.title,
            board.content,
            board.publisher,
            board.ownership,
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