package us.ority.min.jobs
import com.typesafe.config.ConfigFactory
import scala.collection.mutable._
import main.scala.bprocesses._

class LaunchStack {
	val stack:ListBuffer[BProcess] = new ListBuffer()
}

object LaunchStackFactory {
	val s = new LaunchStack()
	def apply():LaunchStack = s

	/****
	 * When job is completed
	 * job manager push stack
	 */
	//def executeLaunchStack(c)
}