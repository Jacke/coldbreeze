package models	

import org.jboss.netty.buffer._
import org.joda.time.DateTime
import play.api.data._
import play.api.data.Forms._
import play.api.data.format.Formats._
import play.api.data.validation.Constraints._

import reactivemongo.bson._

case class Slat(
  id: Option[BSONObjectID],
  title: String,
  content: String,
  publisher: String,
  creationDate: Option[DateTime],
  updateDate: Option[DateTime]) {
}

object Slat {
  implicit object ArticleBSONReader extends BSONDocumentReader[Slat] {
    def read(doc: BSONDocument): Slat =
      Slat(
        doc.getAs[BSONObjectID]("_id"),
        doc.getAs[String]("title").get,
        doc.getAs[String]("content").get,
        doc.getAs[String]("publisher").get,
        doc.getAs[BSONDateTime]("creationDate").map(dt => new DateTime(dt.value)),
        doc.getAs[BSONDateTime]("updateDate").map(dt => new DateTime(dt.value)))
  }
  implicit object ArticleBSONWriter extends BSONDocumentWriter[Slat] {
    def write(slat: Slat): BSONDocument =
      BSONDocument(
        "_id" -> slat.id.getOrElse(BSONObjectID.generate),
        "title" -> slat.title,
        "content" -> slat.content,
        "publisher" -> slat.publisher,
        "creationDate" -> slat.creationDate.map(date => BSONDateTime(date.getMillis)),
        "updateDate" -> slat.updateDate.map(date => BSONDateTime(date.getMillis)))
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
      "creationDate" -> optional(of[Long]),
      "updateDate" -> optional(of[Long])) { (id, title, content, publisher, creationDate, updateDate) =>
        Slat(
          id.map(BSONObjectID(_)),
          title,
          content,
          publisher,
          creationDate.map(new DateTime(_)),
          updateDate.map(new DateTime(_)))
      } { slat =>
        Some(
          (slat.id.map(_.stringify),
            slat.title,
            slat.content,
            slat.publisher,
            slat.creationDate.map(_.getMillis),
            slat.updateDate.map(_.getMillis)))
      })
}
