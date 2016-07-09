package us.ority.min.actions
import main.scala.bprocesses._
import main.scala.utils._
import com.github.nscala_time.time.Imports._
import scala.collection.mutable._
import main.scala.simple_parts.process.Units._

case class ActionAct(
					id: Long,
					uid: String,
					session: Int,
					created_at: Option[org.joda.time.DateTime],
					updated_at: Option[org.joda.time.DateTime]
) {
	
	var results:MutableList[ActionResult] = MutableList()
}

case class ActionResult(
						id: Long,
						in: Boolean,
						out: Boolean,
						base: Boolean,
						content: String,
						act: Long,
						created_at: Option[org.joda.time.DateTime],
						updated_at: Option[org.joda.time.DateTime]
)