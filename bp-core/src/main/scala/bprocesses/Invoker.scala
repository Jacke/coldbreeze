package main.scala.bprocesses

import bprocesses.BPStationLoggerResult
import main.scala.simple_parts.process._
import main.scala.utils.Space
/***
 *** Grand invoking algorithm
 *** © Stanislav @stanthoughts 2014
 ***/

/**
 * Ivoking process by moving BPMarker
 */
class BPMarker(val bp: BProcess) extends Moves
with Sygnals
with Restrictors
with Determs 
{
  // Push Info
  var station = bp.station
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

object InvokeTracer {
  import main.scala.bprocesses.PullCustomException

  def run_proc(proc: BProcess) {
    if (proc.station.inspace) {
      proc.marker.start_from
    }

    if (!proc.station.isStarted) {
      proc.marker.start
    }
    else {
      proc.marker.start_from
    }
  }
}

trait Determs {
  var station:BPStation
  val bp:BProcess
  def toStation(bp: BProcess): BPStation 
  def move

  def start = {
    toStation(bp).update_started(true)
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
      toStation(bp).update_finished(true)
      println("end")
  }
}


trait Sygnals {
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
trait Moves {
  var station:BPStation
  val bp:BProcess
  def toStation(bp: BProcess): BPStation

  def toLogger(bp: BProcess, result: BPLoggerResult)
  def toLoggerBefore(bp: BProcess, result: BPLoggerResult) = bp.logger.logBefore(result)
  def toStationLogger(sygnal: String) = bp.station.station_logger.log(BPStationLoggerResult(bp.station, sygnal, bp.station.state_represent))

  def step_inc
  def endOrPause
  def isElementEnded:Boolean = station.step == bp.getElemsLength
  def blocator: Boolean
  def isSpaceEnded:Boolean

def move:Unit = {
    // ended?
    if ((!station.inspace && isElementEnded) || blocator || station.paused)
    {
      endOrPause
    }
    else 
    {
    if (station.inspace) {
      println(">>>>>>>>inspace")
      println(station.incontainer)
        if (bp.spaces.length < 1) {
          moveUpFront
          move
        } else
        if (isSpaceEnded) {
          println("spaceended")
          moveUpFrontSpace
        } else {
          println("spacenotended")
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

      /**
       * Front launch
       */
      val elem = bp.variety(toStation(bp).step)

      toLoggerBefore(bp, BPLoggerResult(
        elem,
        composite = bp.copyCV(elem.values),
        order     = elem.order,
        space     = None,
        station   = toStation(bp),
        invoked   = true,
        expanded  = false,
        container = false)
      )

      println("**** RUN" + elem.toString + " ****")
      front(elem)
      toLogger(bp, BPLoggerResult(
                                  elem,
                                  composite = bp.copyCV(elem.values),
                                  order     = elem.order,
                                  space     = None,
                                  station   = toStation(bp),
                                  invoked   = true,
                                  expanded  = false,
                                  container = false))

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
  def thru_container = runContainer(bp.spaces(station.space-1),station.contStepVal) // BUG
  def thru_expander  =  { }

 def runContainer(space: Space, con_step: Int) {
    println("move upfront")
    println("bp.spaces.indexOf(space)+1 == station.space")
    println(bp.spaces.indexOf(space)+1 == station.space)
    println("con_step")
    println(con_step)
    println(space.container.length)

    var counter = 0
    for (el ← space.container.drop(con_step)) {
      if (station.state) {

        if (bp.spaces.indexOf(space)+1 == station.space) {
          toLoggerBefore(station.bp, BPLoggerResult(el, order = counter + 1, space = space.id, composite=bp.copyCV(el.values), station = toStation(station.bp), invoked = true, expanded = false, container = true))
          println("Invoking the: " + el);
        station.change_container_step(station.container_step.last + 1)
        el.invoke
        // TODO: Elem invoked sygnal?

        toLogger(station.bp, BPLoggerResult(el, order = counter + 1, space = space.id, composite=bp.copyCV(el.values), station = toStation(station.bp), invoked = true, expanded = false, container = true))
        }
        println(station.step)
      } else {
        println(station.step + "state false")
      }
    }
    // Move upfront
    
    println("move upfront")
    println("bp.spaces.indexOf(space)+1 == station.space")
    println(bp.spaces.indexOf(space)+1 == station.space)
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
}


trait Restrictors {
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
    if (station.incontainer && bp.spaces.length > 0) {
      Option(bp.spaces(station.space-1).container.length) == station.container_step.lastOption
    } 
    if (station.inexpands) {
      Option(bp.spaces(station.space-1).expands.length) == station.expand_step.lastOption
    } else {
      false
    }
  }
  
}

object SygnalHandler {
  def toStationLogger(bp:BProcess,
                      sygnal: String) = bp.station.station_logger.log(BPStationLoggerResult(bp.station, sygnal, bp.station.state_represent))

  def push(bp:BProcess, elem: ProcElems, syginfo:String, space_type: Option[String] = None) {
    syginfo match {
      case "elem_invoked" => {
        bp.marker.elem_invoked
        toStationLogger(bp, "elem_invoked")
        // TODO: Logger
      }
      case "sp_elem_invoked" => {
        bp.marker.sp_elem_invoked(space_type.get)
        toStationLogger(bp, "sp_elem_invoked")
      }
      case "pause" => {
        bp.station.update_paused(true)
        toStationLogger(bp, "pause")
      }
    }
  }
}