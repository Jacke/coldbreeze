package us.ority.min.jobs
import com.typesafe.config.ConfigFactory
import scala.collection.mutable._
import main.scala.bprocesses._
import scala.concurrent.ExecutionContext.Implicits.global
import scala.concurrent._

case class LaunchStackElement(
	process: BProcess,
	processResume: (Int, Int, Int) => Future[BProcess]
)

class LaunchStack {
	var stack:ListBuffer[LaunchStackElement] = new ListBuffer()
}

object LaunchStackFactory {

  def addE(job: LaunchStackElement) = {
    println(s"Added LaunchStackElement $job")
    s.stack.find(s => s.process.id == job.process.id) match {
    	case Some(s) =>
		case _ => s.stack.+=(job)
    }
  }
  def delE(job: LaunchStackElement) = {
    println(s"Remove LaunchStackElement $job")
    s.stack.-=(job)
  }  


	val s = new LaunchStack()
	def apply():LaunchStack = s

	/****
	 * When job is completed
	 * job manager push stack
	 */
	//def executeLaunchStack(c)
}