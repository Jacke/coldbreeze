package main.scala.bprocesses

import com.typesafe.scalalogging.Logger
//import com.typesafe.scalalogging.slf4j.Logger
import main.scala.simple_parts.process._
import main.scala.utils.Space
import org.slf4j.LoggerFactory
/***
 *** Grand invoking algorithm
 *** © Stanislav @stanthoughts 2014-2015
 ***/

/**
 * Ivoking process by moving NIMarker
 */

class NIMarker(val bp: BProcess) extends BottomLine
with StateLigher
with NIMoves
with NISygnals
with NIRestrictors
with NIDeterms 
{
  // Push Info
  var station:BPStation = bp.station
  def toStation(bp: BProcess): BPStation = { bp.station }
  def toLogger(bp: BProcess, result: BPLoggerResult) = bp.logger.log(result)
  def step_inc = station.update_step(station.step + 1)


  // exec
  def invokeExpand = {
    bp.getSpaceByIndex(station.space).expands.map(ex => ex.invoke)
  }
  def invokeContainer = {
    bp.getSpaceByIndex(station.space).container.map(ex => ex.invoke)
  }




}

object NInvoker {

  val appLogger = Logger(LoggerFactory.getLogger("name"))

  def toApplogger(msg: Any, log_type: String = "info") = {
    log_type match {
      case "debug" => appLogger.info(msg.toString)
      case "info" => appLogger.info(msg.toString)
      case "error" => appLogger.info(msg.toString)
    }
  }

  def run_proc(proc: BProcess) {
    if (proc.station.inspace) {
      proc.nimarker.start_from
    }

    if (!proc.station.isStarted) {
      proc.nimarker.start
    }
    else {
      proc.nimarker.start_from
    }
  }
}

trait NIDeterms extends StateLigher {
  var station:BPStation
  val bp:BProcess
  var loop_num:Int
  def maxLoop:Int
  def toStation(bp: BProcess): BPStation
  def toStationLogger(sygnal: String): Array[BPStationLoggerResult]

  def lightElem(elem: ProcElems, state: String, rate: Int = 100, reason: String = "flow"):Unit
  def haltElem(elem: ProcElems, state: String, rate: Int = 0, reason: String = "flow"):Unit
  def lightProcess(state: String, rate: Int = 100, reason: String = "flow"):Unit
  def haltProcess(state: String, rate:Int = 0, reason: String = "flow"):Unit

  def move

  def start = { 
    toStation(bp).update_started(true)
    toStationLogger("start")
    lightProcess("initiated")
    lightProcess("invoking")
    NInvoker.toApplogger("start")

    move
  }

  def start_from
  {
    if(station.isStarted && !station.finished) {
      station.update_paused(false)
      toStationLogger("unpaused")
      haltProcess("paused")
      move
    }
  }

  def endOrPause = {
    if (loop_num > maxLoop) {
      NInvoker.toApplogger("Infinite loop detected!")
    }
    if (station.isPaused) {
      toStationLogger("paused")
      NInvoker.toApplogger("paused")
      lightProcess("paused")
    }
    else {
      NInvoker.toApplogger(loop_num.toString + " > " + maxLoop.toString)
      toStation(bp).update_finished(true)
      lightProcess("finished")
      toStationLogger("end")
      NInvoker.toApplogger("end")
    }
  }
}


trait NISygnals {
  def step_inc
  var station:BPStation
  val bp:BProcess
  def elem_invoked = step_inc
  def sp_elem_invoked(space_type: String) = {
    space_type match {
      case "ddf" => true
      case _ => None
    }
  }

}
trait NIMoves extends StateLigher {
  var station:BPStation
  val bp:BProcess
  def toStation(bp: BProcess): BPStation

  def toLogger(bp: BProcess, result: BPLoggerResult)
  def toLoggerBefore(bp: BProcess, result: BPLoggerResult) = bp.logger.logBefore(result)
  def toStationLogger(sygnal: String) = bp.station.station_logger.log(BPStationLoggerResult(bp.station, sygnal, bp.station.state_represent))
  def commonBottomLine(elem: ProcElems)
  def commonSpaceBottomLine(space: Space)

  def step_inc
  def endOrPause
  def isElementEnded:Boolean = station.step == bp.getElemsLength
  def blocator: Boolean
  def isSpaceEnded:Boolean



  /**
   * Infinite loop recovering
   */
  def maxLoop:Int = scala.math.pow(bp.allElements.length+1,bp.allElements.length+1).toInt
  var loop_num:Int  = 0 
  def loopNumAdd() = loop_num = loop_num + 1
  def isInfiniteLoop:Boolean = loop_num > maxLoop 

def move:Unit = {

    NInvoker.toApplogger("moving")
    NInvoker.toApplogger(station.step)
    toStationLogger("moving")
    loopNumAdd()
    // ended?
    if ((!station.inspace && isElementEnded) || blocator || station.paused || isInfiniteLoop)
    {
      endOrPause
    }
    else 
    {
    if (station.inspace) {
      NInvoker.toApplogger(">>>>>>>>inspace")
      NInvoker.toApplogger(station.incontainer)
        if (bp.spaces.length < 1) {
          toStationLogger("preparemoveupfront")
          //moveUpFront
          toStationLogger("moveupfront")
          move
        } else
        if (isSpaceEnded) {
          NInvoker.toApplogger("spaceended")
          toStationLogger("preparemoveupfrontspace")
          //moveUpFrontSpace
          toStationLogger("moveupfrontspace")
        } else {
          NInvoker.toApplogger("spacenotended")

          // Choose container execution
          thru_container
          //moveUpFront
          move
        }
    } else {

      /**
       * Front launch
       */
      val elem = bp.variety(toStation(bp).step)
      commonBottomLine(elem)
     

      if (station.isInFront | station.inspace) {
        move //  NInvoker.toApplogger("station")
             //  NInvoker.toApplogger(station.isInFront)
      }
    }
  }
}
/*** Instruction execution */
  def front(b: ProcElems) = b.invoke
  def thru_container = runContainer(bp.getSpaceById(station.spaces_ids.last),station.contStepVal) //runContainer(bp.spaces(station.space-1),station.contStepVal) // BUG
  def thru_expander  =  { }

 def runContainer(space: Space, con_step: Int) {
    NInvoker.toApplogger("move upfront")
    NInvoker.toApplogger("bp.spaces.indexOf(space)+1 == station.space")
    NInvoker.toApplogger(bp.spaces.indexOf(space)+1 == station.space)
    NInvoker.toApplogger("con_step")
    NInvoker.toApplogger(con_step)
    NInvoker.toApplogger(space.container.length)

    var counter = 0
    val dropped = space.container.drop(con_step-1)
    println(dropped)
   println(dropped.length)
    for (el ← dropped) {
      if (station.state) {

        if (bp.spaces.indexOf(space)+1 == station.space) {
          NInvoker.toApplogger("Invoking the: " + el);
          station.change_container_step(station.container_step.last + 1)
          toStationLogger("prepareinvokinginspace")
          commonBottomLine(el)
          toStationLogger("invokinginspace")
        }
        NInvoker.toApplogger(station.step)
      } else {
        NInvoker.toApplogger(station.step + "state false")
      }
    }
    // Move upfront

   commonSpaceBottomLine(space)

   /** TODO: Not sure, how common space bottom line work with
    *  moveUpFront, check for safety
    */
    NInvoker.toApplogger("move upfront")
    NInvoker.toApplogger("bp.spaces.indexOf(space)+1 == station.space")
    NInvoker.toApplogger(bp.spaces.indexOf(space)+1 == station.space)
    if (bp.spaces.indexOf(space)+1 == station.space) {
      println(bp.spaces.indexOf(space)+1)
      println(station.space)
      moveUpFront
    } else { move }
    NInvoker.toApplogger(station.inspace)
    
  }

  def moveToSpace = { 
    toStationLogger("preparemovetospace")
    station.update_space(station.space + 1)
    station.inSpace(true)
    toStationLogger("movetospace")


  }
  def moveToSpaceByIndx(index: Int, spaceId: Option[Int] = None) = {
    toStationLogger("preparemovetospace")
    station.update_space(index)
    station.inSpace(true)
    if (spaceId.isDefined)
      station.add_space_id(spaceId.get)
    toStationLogger("movetospace")

  }
  def moveToContainer = {
    toStationLogger("preparemovetocontainer")
    station.inContainer(true)
    station.update_container_step(0)
    station.update_container_state(true)
    toStationLogger("movetocontainer")
  }
  def moveUpFront = {
      if (    (station.container_step.length < 2 || station.container_step.isEmpty)
                                                 &&
              (station.expand_step.length < 2    || station.expand_step.isEmpty))
      {
        toStationLogger("preparemoveupfront")
        station.inExpand(false)
        station.inContainer(false)
        station.inSpace(false)
        station.flush_container_step
        station.flush_expand_step
        
        station.flush_container_state
        station.flush_expand_state
        
        station.update_space(station.space - 1)
        station.del_space_id(station.spaces_ids.last) } 
      else 
      { 
        moveUpFrontSpace 
      }
      toStationLogger("moveupfront")

  }
  def moveUpFrontSpace = {
    toStationLogger("preparemoveupfrontspace")
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


    station.del_space_id(station.spaces_ids.last)
    station.update_space(station.space - 1)
    toStationLogger("moveupfrontspace")

  }
}


trait NIRestrictors {
 /**
   * Restrictors
   */
   var station:BPStation
   val bp:BProcess

  def blocator: Boolean = {
    station.state && !station.started && !station.isPaused
  }
  def isSpaceEnded:Boolean = {
    if (bp.spaces.length == 0) {
      true
    }
    if (station.incontainer && bp.spaces.length == 1) {
      Option(bp.spaces(station.space-1).container.length) == station.container_step.lastOption
    }
    if (station.incontainer && bp.spaces.length > 0 && bp.spaces.length != 1) {
      Option(bp.spaces(station.space-1).container.length) == station.container_step.lastOption
    } 
    if (station.inexpands) {
      Option(bp.spaces(station.space-1).expands.length) == station.expand_step.lastOption
    } else {
      false
    }
  }
  
}

object NISygnalHandler {
  def toStationLogger(bp:BProcess,
                      sygnal: String) = bp.station.station_logger.log(BPStationLoggerResult(bp.station, sygnal, bp.station.state_represent))

  def push(bp:BProcess, elem: ProcElems, syginfo:String, space_type: Option[String] = None) {
    syginfo match {
      case "elem_invoked" => {
        bp.nimarker.elem_invoked
        toStationLogger(bp, "elem_invoked")
        // TODO: Logger
      }
      case "sp_elem_invoked" => {
        bp.nimarker.sp_elem_invoked(space_type.get)
        toStationLogger(bp, "sp_elem_invoked")
      }
      case "pause" => {
        bp.station.update_paused(true)
        toStationLogger(bp, "pause")
      }
    }
  }
}

object SessionStateLogger {
  /* 
  case class SessionStateLog(var id: Option[Int], 
  state_id: Int, 
  on: Boolean, 
  on_rate: Int, 
  reason: String,
  created_at:   Option[org.joda.time.DateTime] = None, 
  updated_at:   Option[org.joda.time.DateTime] = None) 
  */


  // BPLogger.sessionStateLog(result: SessionStateLog)
  var handler:() => Boolean = () => {
    true
  }
  def setHandler(fn: () => Boolean) = {
    handler = fn
  }
}