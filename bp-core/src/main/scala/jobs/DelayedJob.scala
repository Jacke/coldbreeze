
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

case class NewProbe(probe: ActorRef)
case object Tick
case object Tock

case class HelloActor() extends Actor {
  val ref = self
  def receive = {
    case "hello" => println("hello back at you")
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
                val s = scheduler.schedule("Every5Seconds", cleaner, "hello") //.asInstanceOf[QuartzCronSchedule]
  //val _t = s.buildTrigger("parseCronScheduleTest")
  //val t = _t.asInstanceOf[CronTriggerImpl]


  val receiver = _system.actorOf(Props(new ScheduleTestReceiver))
  val probe = _system.actorOf(Props(new HelloActor))
  receiver ! NewProbe(probe)
  val jobDt = QuartzSchedulerExtension(_system).schedule("Every15Seconds", receiver, Tick)




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
case class MinorityJob(id: Option[Long], owner: String, operations: List[MinorityJobOp], scheduleMilis:Option[Long]= None) {
	def check() = {
		if (!scheduleMilis.isDefined)
			true
		else
			org.joda.time.DateTime.now().getMillis() < scheduleMilis.get
	}
}

object MinorityJobs {
  var jobs:Seq[MinorityJob] = Seq.empty[MinorityJob]
  def recheck():Seq[Boolean] = {
  	jobs.map(job => job.check())
  }

}
