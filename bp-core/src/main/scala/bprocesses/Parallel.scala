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
  val threadspace1 = main.scala.utils.Space(index=1, brick = parbrick.asInstanceOf[Brick], is_subbricks = false, is_container = true, is_expander = false)
  val threadspace2 = main.scala.utils.Space(index=2, brick = parbrick.asInstanceOf[Brick], is_subbricks = false, is_container = true, is_expander = false)


  /**
   *  StationThread */ 
class StationThread(val thread: Space) {
  

  var state = true
  var step = 0
  var space = 0
  // Step for space nesting
  var container_step = Array.empty[Int]
  var expand_step = Array.empty[Int]
  // State for space nesting
  var container_state = Array.empty[Boolean]
  var expand_state = Array.empty[Boolean]
  var started: Boolean = false
  var finished: Boolean = false
  var inspace: Boolean = false
  var incontainer: Boolean = false
  var inexpands: Boolean = false
  var paused: Boolean = false

 /**
  * Process information
  */
  def isStarted:Boolean = started
  def isRunned:Boolean  = started && !(finished && paused)
  def isPaused:Boolean  = paused
  def isInFront:Boolean = !inspace
  def isStopped:Boolean = !state
  def contStepVal:Int = {
    if (container_step.length > 0) {
      container_step.last
    }
    else { 0 }
  }
  def expStepVal:Int = {
    if (expand_step.length > 0) {
      expand_step.last
    }
    else { 0 }
  }

  def update_state(state: Boolean) = { this.state = state }
  def update_step(v: Int)          = { this.step  = v     }
  def update_space(v: Int)         = { this.space = v     }
  
  def update_container_step(v: Int)       = this.container_step = this.container_step   :+ v
  def update_container_state(v: Boolean)  = this.container_state = this.container_state  :+ v
  def change_container_step(v: Int)       = this.container_step(this.container_step.length-1) = v
  def update_expand_step(v: Int)          = this.expand_step = this.expand_step      :+ v
  def change_expand_step(v: Int)          = this.expand_step(this.expand_step.length-1) =  v
  def update_expand_state(v: Boolean)     = this.expand_state = this.expand_state     :+ v

  def flush_container_step()   = if(!this.container_step.isEmpty) { this.container_step = this.container_step.init }
  def flush_container_state()  = if(!this.container_state.isEmpty){ this.container_state = this.container_state.init }

  def flush_expand_step()      = if(!this.expand_step.isEmpty)    { this.expand_step    = this.expand_step.init }
  def flush_expand_state()     = if(!this.expand_state.isEmpty)   { this.expand_state    = this.expand_state.init }

  def inSpace(v: Boolean)     = { this.inspace     = v }
  def inContainer(v: Boolean) = { this.incontainer = v }
  def inExpand(v: Boolean)    = { this.inexpands   = v }

  def current_expand_state:Boolean    = if(!this.container_state.isEmpty){ this.container_state.last } else { false }
  def current_container_state:Boolean = if(!this.expand_state.isEmpty)   { this.expand_state.last } else { false }

  def update_started(s: Boolean)  = { this.started  = s }
  def update_paused(p: Boolean)   = { this.paused   = p }
  def update_finished(f: Boolean) = { this.finished = f }

  def update_variables(
                        new_state:Boolean,
                        new_step:Int,
                        new_space:Int,
                        new_container_step: Array[Int],
                        new_expand_step: Array[Int],
                        new_started:Boolean,
                        new_finished:Boolean,
                        new_inspace:Boolean,
                        new_incontainer:Boolean,
                        new_inexpands:Boolean,
                        new_paused:Boolean
                        ) 
  {
                       
                        state = new_state
                        step = new_step
                        space = new_space
                        container_step = new_container_step
                        expand_step = new_expand_step
                        started = new_started
                        finished = new_finished
                        inspace = new_inspace
                        incontainer = new_incontainer
                        inexpands = new_inexpands
                        paused = new_paused
  } 

  /**
   * Representation
   */
  def represent: String =
    s"""
      |****************
      |state          $state
      |step           $step
      |space          $space
      |container_step ${container_step.length}
      |expand_step    ${expand_step.length}
      | ${container_step.toList}
      | ${expand_step.toList}
      | ${expand_state.toList}
      | ${container_state.toList}
      |started        $started
      |finished       $finished
      |inspace        $inspace
      |incontainer    $incontainer
      |inexpands      $inexpands
      |paused         $paused
      |****************
    """.stripMargin

  /**
   * Represent BPStation variables as
   * @return BPStationState object
   */
  def state_represent: BPStationState = new BPStationState(
    state = this.state,
    step = this.step,
    space = this.space,
    container_step = this.container_step,
    expand_step = this.expand_step,
    container_state = this.container_state,
    expand_state = this.expand_state,
    started = this.started,
    finished = this.finished,
    inspace = this.inspace,
    incontainer = this.incontainer,
    inexpands = this.inexpands,
    paused = this.paused)
}


































/*
object ThreadMarker {
  val station = new StationThread()
  def toStation = station
  //  def toLogger(bp: BProcess, result: BPLoggerResult) = bp.logger.log(result)
  def step_inc = station.update_step(station.step + 1)



  def invokeContainer = {
    bp.getSpaceByIndex(station.space).container.map(ex => ex.invoke)
  }

  def start = {
    toStation.update_started(true)
    move
  }

  def start_from
  {
    if(station.isStarted && !station.finished) {
      station.update_paused(false)
      move
    }
  }

  def endOrPause = {
    if (station.isPaused)
      println("paused")
    else
      toStation.update_finished(true)
      println("end")
  }

  def elem_invoked = step_inc
  def sp_elem_invoked(space_type: String) = {
    space_type match {
      case "ddf" => true
      case _ => None
    }
  }


  def isElementEnded:Boolean = station.step == station.space.getElemsLength


def move:Unit = {
    // ended?
    if ((!station.inspace && isElementEnded) || blocator)
    {
      endOrPause
    }
    else 
    {
    if (station.inspace) {
        if (isSpaceEnded) {
          moveUpFrontSpace
        } else {
        station match {
          case expanded if (station.incontainer && station.inexpands) => println("double invokation"); thru_expander; thru_container;
          case container => thru_container
          case expanded =>  thru_expander
          case _ => false
          }
          //moveUpFront
          move
        }
    } else {

      val elem = bp.variety(toStation(bp).step)

     


      front(elem)

      toStation(bp).update_step(station.step + 1)
      // Sygnal step inc elem invoked

      if (station.isInFront | station.inspace) {
        move //  println("station")
             //  println(station.isInFront)
      }
    }
  }
}

/*** Instruction execution */
  def front(b: ProcElems) = b.invoke
  def thru_container = runContainer(bp.spaces(station.space-1),station.contStepVal)
  def thru_expander  =  { }

 def runContainer(space: Space, con_step: Int) {
    var counter = 0
    for (el ← space.container.drop(con_step)) {
      if (station.state) {

        if (bp.spaces.indexOf(space)+1 == station.space) {
        station.change_container_step(station.container_step.last + 1)
        el.invoke
        }
      } else {
        println(station.step + "state false")
      }
    }
    // Move upfront
    if (bp.spaces.indexOf(space)+1 == station.space) {
      moveUpFront
    } else { move }
    println(station.inspace)
    
  }

  def moveToSpace = { 
    station.update_space(station.space + 1)
    station.inSpace(true)

  }
  def moveToExpand = {
    station.inExpand(true)
    station.update_expand_step(0)
    station.update_expand_state(true)
  }
  def moveToContainer = {
    station.inContainer(true)
    station.update_container_step(0)
    station.update_container_state(true)
  }
  def moveUpFront = {
      if (    (station.container_step.length < 2 || station.container_step.isEmpty)
                                                 &&
              (station.expand_step.length < 2    || station.expand_step.isEmpty))
      {
        station.inExpand(false)
        station.inContainer(false)
        station.inSpace(false)
        station.flush_container_step
        station.flush_expand_step
        
        station.flush_container_state
        station.flush_expand_state
        
        station.update_space(station.space - 1) } 
      else 
      { 
        moveUpFrontSpace 
      }
  }

  def moveUpFrontSpace = {
    station.inSpace(true)

    station.flush_container_state
    station.flush_expand_state
    if (station.current_expand_state) {
    station.inExpand(true)
    } else {
    station.inExpand(false)
    }
    if (station.current_container_state) {
    station.inContainer(true)
    } else {
      station.inContainer(false)
    }

    station.flush_container_step
    station.flush_expand_step


    station.update_space(station.space - 1)
  }




  def blocator: Boolean = {
    station.state && !station.started && !station.isPaused
  }
  def isSpaceEnded:Boolean = {

    if (station.incontainer) {
      Option(bp.spaces(station.space-1).container.length) == station.container_step.lastOption
    } 
    if (station.inexpands) {
      Option(bp.spaces(station.space-1).expands.length) == station.expand_step.lastOption
    } else {
      false
    }
  }
  
}  






*/







  /*************************************************************************************************
   *  Inthread scenario
   **************************************************************************************************/








   /*
   *  bp.active_thread*/
   
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
