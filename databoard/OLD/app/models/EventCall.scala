package models
import models.operations._
import org.jboss.netty.buffer._
import org.joda.time.DateTime
import play.api.data._
import play.api.data.Forms._
import play.api.data.format.Formats._
import play.api.data.validation.Constraints._
import reactivemongo.bson._
import org.jboss.netty.buffer._
import org.joda.time.DateTime
import play.api.data._
import play.api.data.Forms._
import play.api.data.format.Formats._
import play.api.data.validation.Constraints._
import reactivemongo.bson._
import play.api.libs.json._
import play.api.libs.json.util._
//import play.api.libs.json.Reads._
//import play.api.libs.json.Writes._
/*
implicit object BSONDateTimeHandler extends BSONHandler[BSONDateTime, DateTime] {
  def read(time: BSONDateTime) = new DateTime(time.value)
  def write(jdtime: DateTime) = BSONDateTime(jdtime.getMillis)
}*/

case class Event(id: Option[BSONObjectID],
				 executor: String, 
				 body: String, 
				 publisher: String,
				 datetime: Option[DateTime])
object Event {
  implicit object EventBSONReader extends BSONDocumentReader[Event] {
    def read(doc: BSONDocument): Event =
      Event(
        doc.getAs[BSONObjectID]("_id"),
        doc.getAs[String]("executor").get,
        doc.getAs[String]("body").get,
        doc.getAs[String]("publisher").get,
        doc.getAs[BSONDateTime]("datetime").map(dt => new DateTime(dt.value)))
  }
  implicit object EventBSONWriter extends BSONDocumentWriter[Event] {
    def write(event: Event): BSONDocument =
      BSONDocument(
        "_id" -> event.id.getOrElse(BSONObjectID.generate),
        "executor" -> event.executor,
        "body" -> event.body,
        "publisher" -> event.publisher,
        "datetime" -> event.datetime.map(date => BSONDateTime(date.getMillis)))
  }
  val form = Form(
    mapping(
      "id" -> optional(of[String] verifying pattern(
        """[a-fA-F0-9]{24}""".r,
        "constraint.objectId",
        "error.objectId")),
      "executor" -> nonEmptyText,
      "body" -> text,
      "publisher" -> nonEmptyText,
      "datetime" -> optional(of[Long])) { (id, executor, body, publisher, datetime) =>
        Event(
          id.map(BSONObjectID(_)),
          executor,
          body,
          publisher,
          datetime.map(new DateTime(_)))
      } { event =>
        Some(
          (event.id.map(_.stringify),
            event.executor,
            event.body,
            event.publisher,
            event.datetime.map(_.getMillis)))
      })
}

case class EventCall(e: Event, op: Operation, value: play.api.libs.json.JsObject) {
    def apply(e: Event, op: Operation, value: play.api.libs.json.JsObject) = {
    	println(e)
    	println(op)
    	println(value)
    }
}