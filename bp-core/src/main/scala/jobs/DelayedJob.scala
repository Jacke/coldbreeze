
package us.ority.min.jobs
import com.typesafe.config.ConfigFactory
import akka.actor.ActorSystem
import java.util.{Calendar, GregorianCalendar, Date, TimeZone}
import org.quartz.impl.calendar._
import org.quartz.impl.triggers.CronTriggerImpl
import org.quartz.TriggerUtils
import scala.collection.JavaConverters._
import com.typesafe.akka.extension.quartz._
import com.typesafe.akka.extension.quartz.QuartzSchedulerExtension._
import akka.actor._
import scala.collection.mutable._

case class NewProbe(probe: ActorRef)
case object Tick
case object Tock

case class HelloActor() extends Actor {
  val ref = self
  def receive = {
    case "clean" => {
      MinorityJobs.recheck()
    }
    case _       => println("huh?")
  }
}


class ScheduleTestReceiver extends Actor with ActorLogging {
var probe: ActorRef = _
def receive = {
  case HelloActor() =>
    println("fff")
  case NewProbe(_p) =>
    probe = _p
  case Tick =>
    log.info("Got a Tick.")
    //  MinorityJobs.jobs

    probe ! Tock
}
}


object DelayedJob {

  val _system = ActorSystem("MinorityCoreSystem")
                val scheduler = QuartzSchedulerExtension(_system)
                val cleaner = _system.actorOf(Props[HelloActor])
                val s = scheduler.schedule("Every5Seconds", cleaner, "clean") //.asInstanceOf[QuartzCronSchedule]
  //val _t = s.buildTrigger("parseCronScheduleTest")
  //val t = _t.asInstanceOf[CronTriggerImpl]

/*
  val receiver = _system.actorOf(Props(new ScheduleTestReceiver))
  val probe = _system.actorOf(Props(new HelloActor))
  receiver ! NewProbe(probe)
  val jobDt = QuartzSchedulerExtension(_system).schedule("Every15Seconds", receiver, Tick)
*/



  // By Duration
  def byDuration() = ???
  // By DateTime
  def byDateTime() = ???


  /* Hooks for */
  // Before delay

  // After delay


}

case class MinorityJobOp(
	action: String,
	objInt: Int,
	argument: String
)
// MinorityJobOp("RESUME_LAUNCH", 1)
// MinorityJobOp("TURNON_STATE", 1, "100")
// MinorityJobOp("TURNOFF_STATE", 1, "0")
// MinorityJobOp("DISABLE_STATE", 1, "-100")
case class MinorityJob(id: Option[Long], 
                       owner: String, // REACTION ID
                       operations: List[MinorityJobOp], 
                       scheduleMilis:Option[Long]= None) {
	def check() = {
    scheduleMilis match {
      case Some(m) => {
        //println(s"check ${org.joda.time.DateTime.now().getMillis()}: ${scheduleMilis.get}")
        val result:Boolean = org.joda.time.DateTime.now().getMillis() > (scheduleMilis.get + 10000)
        if (result == true) {
          println(s"check $result and it's true")
          // Execute final job
          MinorityJobs.checkReady(operations.head.objInt, owner.toInt)
          MinorityJobs.delJob(this)
        }
        result
      }
      case _ => {
        true
      }
    }
	}
}

/*
 +-----------------+      +---------------+
 |  Strategy   1)  |      | LaunchStack 2)+---------+
 |  projection     |      | resum/delta fn++        |
 +--------+--------+      +-------+-------+         |
          |                       |                 |
          |Time(in delay)         |                 |
          |LaunchId               |find()           |
          |                       |                 v
+---------+----------+    +-------+-------+         +------------------------+
|  JobDelayer  2)    |    | checkReady() 4]         | Execute launch with  5)|
|                    +----+               |         | Delayed op             |
+--------------------+    +---------------+         | (e.g. highlight state) |
                                                    |                        |
                                                    +------------------------+

*/

object MinorityJobs {
  val _system = DelayedJob._system

  def addJob(job: MinorityJob) = {
    println(s"Added minorityJob $job")
    jobs.+=(job)
  }
  def delJob(job: MinorityJob) = {
    println(s"Remove minorityJob $job")
    jobs.-=(job)
  }  

  var jobs:ListBuffer[MinorityJob] = ListBuffer.empty[MinorityJob]
  def recheck():ListBuffer[Boolean] = {
  	jobs.map(job => job.check())
  }

  // 5)
  def checkReady(launchId: Int, reaction_id: Int) = {
    println(s"checkReady ${LaunchStackFactory().stack.length}")
    val procInStackOpt = LaunchStackFactory().stack.find(c => 
      c.process.session_id == launchId
    )
    procInStackOpt match {
      case Some(procInStack) => {
        println("in stack") 
        procInStack.processResume(procInStack.process.id.get, 
                                                          launchId, reaction_id)
      }
      case _ => println("not in stack")
    }
  }

}
