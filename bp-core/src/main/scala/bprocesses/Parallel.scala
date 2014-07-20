package bprocesses


object Parallel {

    import akka.actor._

    case object PingMessage
    case object PongMessage
    case object StartMessage
    case object StopMessage

    /**
     * An Akka Actor example written by Alvin Alexander of
     * <a href="http://devdaily.com" title="http://devdaily.com">http://devdaily.com</a>
     *
     * Shared here under the terms of the Creative Commons
     * Attribution Share-Alike License: <a href="http://creativecommons.org/licenses/by-sa/2.5/" title="http://creativecommons.org/licenses/by-sa/2.5/">http://creativecommons.org/licenses/by-sa/2.5/</a>
     *
     * more akka info: <a href="http://doc.akka.io/docs/akka/snapshot/scala/actors.html" title="http://doc.akka.io/docs/akka/snapshot/scala/actors.html">http://doc.akka.io/docs/akka/snapshot/scala/actors.html</a>
     */
    class Ping(pong: ActorRef) extends Actor {
      var count = 0
      def incrementAndPrint { count += 1; println("ping") }
      def receive = {
        case StartMessage =>
          incrementAndPrint
          pong ! PingMessage
        case PongMessage =>
          incrementAndPrint
          if (count > 99) {
            sender ! StopMessage
            println("ping stopped")
            context.stop(self)
          } else {
            sender ! PingMessage
          }
      }
    }

    class Pong extends Actor {
      def receive = {
        case PingMessage =>
          println("  pong")
          sender ! PongMessage
        case StopMessage =>
          println("pong stopped")
          context.stop(self)
      }
    }



  

  /**
  *  Process thread
  */
  /*
    BPStation
    inthread: Bool
    threads_steps[n1, n]
  */
  class ProcessThread(num: Int, step: Int = 0, complete: Boolean = false) extends Actor {
    def receive = {
      case PingMessage =>
        println("  pong")
        sender ! PongMessage
      case StopMessage =>
        println("pong stopped")
        context.stop(self)
      case "move" => println("i'm moving")
      case "end" => println("looks like thread ended")
      // Execution logic
    }
  }
  // Init

  /**
   * Nested thread
   */
  // Init in thread
  // new All thread dao, that aren't completed


  

  def apply {
    val system = ActorSystem("PingPongSystem")
    val pong = system.actorOf(Props[Pong], name = "pong")
    val ping = system.actorOf(Props(new Ping(pong)), name = "ping")
    // start them going
    ping ! StartMessage


    Thread.sleep(1000)
    system.shutdown













  /**
    Parallel brick

  */
import main.scala.simple_parts.process._
import main.scala.bprocesses.BProcess
import main.scala.bprocesses.InvokeTracer
import main.scala.utils.links.LinkSearcher
import scala.util.Try
import main.scala.utils.ElementTracer
import main.scala.utils.Space
import main.scala.bprocesses._
import main.scala.bprocesses.BProcess

class ParBrick(override val id: Int,
                     title: String,
                     desc: String,
                     override val values: Option[CompositeValues],
                     override val bprocess: BProcess,
                     b_type: String,
                     type_title: String,
                     order: Int,
                     override val space_parent: Option[Space] = None,
                     override val space_role: String = ""
                      ) extends Brick(id,
  title,
  desc,
  values,
  bprocess,
  b_type,
  type_title,
  order,
  space_parent,
  space_role
) {

  override def toString = s"Brick:"
  override def invoke {
    println("RUNNING" +
      "CONTAINER" +
      "SPACE")

    bprocess.marker.moveToSpace
    //println("bprocess.marker.moveToSpace")
    bprocess.marker.moveToContainer
    println("run container")
    //bprocess.marker.runContainer(getSpace(this).get, 0)//bprocess.station.contStepVal)
    println(bprocess.station.represent)
    

    //bprocess.marker.moveUpFront


    //println("bprocess.marker.moveUpFront")
  }


  override def init {
    brick_space
  }
  override def brick_space {
    bprocess.spaces = bprocess.spaces :+ Space.apply(1, this, is_subbricks = false, is_container = true)
  }
}

import main.scala.resources.scopes._

  val parbrick = new ParBrick(1,
                     title = "parbrick",
                     desc = "desc parallel",
                     values = Option(CompositeValues()),
                     bprocess = new BProcess(new Managment),
                     b_type = "brick",
                     type_title = "containerbrick",
                     order = 1)
  /**
   *  Thread <: Space
   */
  val threadspace = main.scala.utils.Space(index=1, parbrick.asInstanceOf[Brick], is_subbricks = false, is_container = true, is_expander = false)
  

  /**
   *  StationThread */ 

  /*
   *  Inthread scenario
   */
   
   /*
   *  bp.active_thread
   *  thread marker
   move
   moveinspace
   moveincontainter
   moveupfront
   upfrontthread
   end
   ----- based on threadstation
   */

   /*
   thread bisor
   station.indread switcher
   onComplete(fun)
   onPaused(fun)
   onError(fun)
*/

  // May Runnable independent from main Invoker






  }

}
