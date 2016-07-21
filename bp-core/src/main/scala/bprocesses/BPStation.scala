package main.scala.bprocesses

import main.scala.simple_parts.process._
import main.scala.utils.Space
import main.scala.bprocesses._
import main.scala.simple_parts.process._

class BPStation(val bp: BProcess) {
  /**
   * Mutable statuses of process
   */
  val logger = new BPLogger
  val station_logger = new BPStationLogger

  var state = true
  var step = 0
  var space = 0
  // Step for space nesting
  var spaces_ids = Array.empty[Int]
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

  var created_at:Option[org.joda.time.DateTime] = None
  var updated_at:Option[org.joda.time.DateTime] = None

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
  // Spaces_ids manipulations
  def add_space_id(id: Int)        = { this.spaces_ids = this.spaces_ids   :+ id}
  def del_space_id(id: Int)        = { this.spaces_ids = this.spaces_ids   diff Array(id) }

  def update_container_step(v: Int)       = this.container_step = this.container_step   :+ v
  def update_container_state(v: Boolean)  = this.container_state = this.container_state  :+ v
  def change_container_step(v: Int)       = this.container_step(this.container_step.length-1) = v
  def update_expand_step(v: Int)          = this.expand_step = this.expand_step      :+ v
  def change_expand_step(v: Int)          = this.expand_step(this.expand_step.length-1) =  v
  def update_expand_state(v: Boolean)     = this.expand_state = this.expand_state     :+ v

  def absoluteStepInc() = {
    if (inspace) {
      change_container_step(container_step.last + 1)
    }
    if (isInFront) {
      update_step(step + 1)
    }
  }

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
                        new_spaces_ids:Array[Int],
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
                        spaces_ids = new_spaces_ids
                        started = new_started
                        finished = new_finished
                        inspace = new_inspace
                        incontainer = new_incontainer
                        inexpands = new_inexpands
                        paused = new_paused
  }

  def moveUpFront = {
      if (    (container_step.length < 2 || container_step.isEmpty)
                                                 &&
              (expand_step.length < 2    || expand_step.isEmpty))
      {
        inExpand(false)
        inContainer(false)
        inSpace(false)
        flush_container_step
        flush_expand_step

        flush_container_state
        flush_expand_state

        update_space(space - 1)
        del_space_id(spaces_ids.last) }
      else
      {
        moveUpFrontSpace
      }

  }
  def moveUpFrontSpace = {
    inSpace(true)

    flush_container_state
    flush_expand_state
    if (current_expand_state) {
    inExpand(true)
    } else {
    inExpand(false)
    }
    if (current_container_state) {
    inContainer(true)
    } else {
      inContainer(false)
    }

    flush_container_step
    flush_expand_step


    del_space_id(spaces_ids.last)
    update_space(space - 1)

  }
  def getSpace(brick: ProcElems):Option[Space] = {
    bp.spaces.find(space => (space.brick_owner == brick))
  }


  def applySwitcher(fn: String, target: String, switch_type: String, el: ProcElems, selector:String = "") = { // TODO: Selector
    /*
          case "n" => {
                  bp.station.applySwitcher(switcher.fn, switcher.target)
                } /* For next */
          case "p" => {
            bp.station.applySwitcher(switcher.fn, switcher.target)
          } /* For pause */
          case "play" => {
            bp.station.applySwitcher(switcher.fn, switcher.target)
          }
          case "stp" => {
            bp.station.applySwitcher(switcher.fn, switcher.target)
          }
          case "in" => {
            bp.station.applySwitcher(switcher.fn, switcher.target)
          } /* For in */
          case "out" => {
            bp.station.applySwitcher(switcher.fn, switcher.target)
          } /* For out */
          case "inn" => {
            bp.station.applySwitcher(switcher.fn, switcher.target)
          } /* For in next */
          case "outn" => {
            bp.station.applySwitcher(switcher.fn, switcher.target)
          } /* For out next */
          case _ =>
    */

    target match {
      case "step" => {
        fn match {
          case "inc" => {
            println("absoluteStepInc :: absoluteStepInc :: absoluteStepInc()")
            absoluteStepInc()
          }
          case "dec" => {
            if (inspace || container_state.length > 0) {change_container_step(container_step.last - 1)}
            if (!inspace) {update_step(step - 1)}
          }
          case "res" => {
            if (inspace || container_state.length > 0) {change_container_step(0)}
            if (!inspace) {update_step(0)}
          }
        }
      }
      case "process" => {
        fn match {
          case "paused" => {
            bp.station.update_paused(true)
          }
          case "stoped" => {
            bp.station.update_state(false)
          }
          case "resumed" => {
            bp.station.update_paused(false)
          }
        }
      }
      case "space" => {
        fn match {
          case "inn" => {
            // in
            val space:Option[Space] = getSpace(el)
            bp.marker.moveToSpaceByIndx(space.get.index, space.get.id)//.moveToSpace
            //println("bp.marker.moveToSpace")
            bp.marker.moveToContainer
            //bp.marker.runContainer(getSpace(this).get, 0)//bp.station.contStepVal)
            //println(bp.station.represent)
            absoluteStepInc()
          }
          case "outn" => {
            moveUpFront
            absoluteStepInc()
          }
        }

      }
    }
  }
  def applySwitcherForSpace(fn: String, target: String, switch_type: String, space: Space, selector:String = "") = {
    target match {
      case "step" => {
        fn match {
          case "inc" => {
            println("absoluteStepInc()")
            absoluteStepInc()
          }
          case "dec" => {
            if (inspace || container_state.length > 0) {change_container_step(container_step.last - 1)}
            if (!inspace) {update_step(step - 1)}
          }
          case "res" => {
            if (inspace || container_state.length > 0) {change_container_step(0)}
            if (!inspace) {update_step(0)}
          }
        }
      }
      case "process" => {
        fn match {
          case "paused" => {
            bp.station.update_paused(true)
          }
          case "stoped" => {
            bp.station.update_state(false)
          }
          case "resumed" => {
            bp.station.update_paused(false)
          }
        }
      }
      case "space" => {
        fn match {
          /*case "inn" => {
            // in
            val space:Option[Space] = getSpace(el)
            bp.marker.moveToSpaceByIndx(space.get.index, space.get.id)//.moveToSpace
            //println("bp.marker.moveToSpace")
            bp.marker.moveToContainer
            //bp.marker.runContainer(getSpace(this).get, 0)//bp.station.contStepVal)
            //println(bp.station.represent)
            absoluteStepInc()
          }*/
          case "outn" => {
            moveUpFront
            absoluteStepInc()
          }
        }

      }
    }

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
    spaces_ids = this.spaces_ids,
    container_state = this.container_state,
    expand_state = this.expand_state,
    started = this.started,
    finished = this.finished,
    inspace = this.inspace,
    incontainer = this.incontainer,
    inexpands = this.inexpands,
    paused = this.paused)
}
