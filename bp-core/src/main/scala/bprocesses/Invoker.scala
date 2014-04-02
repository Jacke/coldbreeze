package main.scala.bprocesses

import main.scala.simple_parts.process._
import main.scala.utils.Space

/**
 * Ivoking process by moving BPMarker
 */
class BPMarker(bp: BProcess) {
  // Push Info
  var station = bp.station
  def isInFront: Boolean = true// station.isInFront
  def toStation(bp: BProcess): BPStation = { bp.station }
  def toLogger(bp: BProcess, result: BPLoggerResult) = bp.logger.log(result)

  /**
   * Moving methods
   */
  def start = {
    // set initial value
    toStation(bp).update_started(true)
    move
  }
  def start_from
  {
    println("fff" + station.isStarted + station.finished)
    println("fff" + bp.station.isStarted)

    if(station.isStarted && !station.finished) {
      println("fff")
      station.update_paused(false)
      move
    }
    // Todo: start from space
    /**
     * inspace
     *   1 level
     * inspace * step.length > 1
     *   2 level
     */
  }
  def move:Unit = {
    if (station.step == bp.getElemsLength || blocator)
    { 
      end 
      true
    }
    else 
    { 
     // station
        val elem = bp.variety(toStation(bp).step)
        if (true){//elem.isFront) { 
          front(elem) 
        }

      toLogger(bp, BPLoggerResult(elem, order = 1, space = Option(0), station = toStation(bp), composite=Option(CompositeValues()), invoked = true, expanded = false, container = false))
      toStation(bp).update_step(station.step + 1)

      if (isInFront) { 
        println("station")
        println(station.isInFront)
        move 
        
      }
    }
  }
  def space_move = { // TODO: Space_move

  }
  def end = {
    // toStation end
    toStation(bp).update_finished(true)

    println("end")
  }
  // utils
  def blocator: Boolean = {
    station.state && !station.started && !station.isPaused
  }
  /**
   * Instruction execution
   */
  // Front Elements
  def front(b: ProcElems) = b.invoke


  def runContainer(space: Space) {
    var counter = 0
    for (b ← space.container) {
      if (station.state) {

        println("Invoking the: " + b);
        b.invoke
        toLogger(station.bp, BPLoggerResult(b, order = counter + 1, space = Option(space.index), composite=Option(CompositeValues()), station = toStation(station.bp), invoked = true, expanded = false, container = true))
        println(station.step)
        //proc.step = proc.step + 1;
      } else {
        println(station.step)
        //proc.status = "Paused"
      }
    }
  }

  /**
   * Space moving methods
   */
  def moveToSpace = { 
    station.update_space(station.space + 1)
    station.inSpace(true)

  }
  def moveToExpand = {
    station.inExpand(true)
    station.update_expand_step(0)
  }
  def moveToContainer = {
    station.inContainer(true)
    station.update_container_step(0)
  }
  // up
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
        station.update_space(station.space - 1) } 
      else 
      { 
        moveUpFrontSpace 
      }
  }
  def moveUpFrontSpace = {
    station.inSpace(true)

    station.inExpand(false)
    station.inContainer(false)
    
    station.flush_container_step
    station.flush_expand_step
  }
  // exec
  def invokeExpand = {
    bp.getSpaceByIndex(station.space).expands.map(ex => ex.invoke) // доделать.get
  }
  def invokeContainer = {
    bp.getSpaceByIndex(station.space).container.map(ex => ex.invoke)
  }

  //def space_step_inc = station.container_step expand_step
  def step_inc = station.update_step(station.step + 1)



}

object InvokeTracer {
  import main.scala.bprocesses.PullCustomException

  def run_proc(proc: BProcess) {
    if (proc.station.inspace) { // TODO: Run from inspace
      throw PullCustomException.create("bad things")
    }

    if (proc.station.isStarted) {
      proc.marker.start_from
    }
    else {
      proc.marker.start
    }
  }
}
