package us.ority.min.actions
import main.scala.bprocesses._
import main.scala.utils._
import scala.collection.mutable._
import main.scala.simple_parts.process._

case class ActionAct(
					id: Option[Long],
					uid: String,
					session: Int,
					reaction: Int,
					created_at: Option[org.joda.time.DateTime] = None,
					updated_at: Option[org.joda.time.DateTime] = None
) {

	var results:MutableList[ActionResult] = MutableList()
	var statuses:MutableList[ActionStatus] = MutableList()

	def makeResult(result: ActionResult) =
	  results += result
	def makeStatus(status: ActionStatus) =
	  statuses += status

}

case class ActionStatus(id: Option[Long],
						content: String,
						act: Long,
						created_at: Option[org.joda.time.DateTime] = None,
						updated_at: Option[org.joda.time.DateTime] = None
)

case class ActionResult(
						id: Option[Long],
						in: Boolean,
						out: Boolean,
						base: Boolean,
						content: String,
						act: Long,
						created_at: Option[org.joda.time.DateTime] = None,
						updated_at: Option[org.joda.time.DateTime] = None
)