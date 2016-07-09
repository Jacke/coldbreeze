package us.ority.min.actions
import main.scala.bprocesses._
import main.scala.utils._
import scala.collection.mutable._
import main.scala.simple_parts.process.Units._

case class ActionAct(
					id: Option[Long],
					uid: String,
					session: Int,
					reaction: Int,
					created_at: Option[org.joda.time.DateTime],
					updated_at: Option[org.joda.time.DateTime]
) {

	var results:MutableList[ActionResult] = MutableList()
}

case class ActionResult(
						id: Option[Long],
						in: Boolean,
						out: Boolean,
						base: Boolean,
						content: String,
						act: Long,
						created_at: Option[org.joda.time.DateTime],
						updated_at: Option[org.joda.time.DateTime]
)