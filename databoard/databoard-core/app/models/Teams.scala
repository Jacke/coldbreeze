package models

import java.util.UUID

import com.mohiva.play.silhouette.api.{ Identity, LoginInfo }
import play.api.libs.json.Json

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

case class Team(id: Option[UUID] = Some(UUID.randomUUID()),
				original_id: Int,
				original_title: String = "",
				employees: List[String] = List.empty,
				managers: List[String] = List.empty
	)

object Team {
  import play.api.libs.json.Json
  import play.modules.reactivemongo.json.BSONFormats._

    implicit val TeamFormat = Json.format[Team]
    implicit val TeamReader = Json.reads[Team]


}