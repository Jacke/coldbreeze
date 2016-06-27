package bprocesses.reactions
import main.scala.simple_parts.process._
import main.scala.simple_parts.process.Units._
import main.scala.bprocesses._
import main.scala.utils._
import com.github.nscala_time.time.Imports._
import scala.collection.mutable.ListBuffer  
import com.typesafe.scalalogging.Logger
import org.slf4j.LoggerFactory

class ReactionReducer(
	reducerType: String
) {
	
}
object ReactionReducer {
	def apply(reducerType: String) = {
		new ReactionReducer(reducerType)
	}
}

case class DelayedReactionReducer(reducerType: String = "delayed") {

}
case class ShellReactionReducer(reducerType: String = "shell") {

}