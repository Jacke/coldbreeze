package main.scala.bprocesses

class BPStation(val bp: BProcess) {
  /**
   * Mutable statuses of process
   */
  var state = true
  var step = 0
  var space = 0
  var container_step = Array.empty[Int]
  var expand_step = Array.empty[Int]
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

  def update_state(state: Boolean) = { this.state = state }
  def update_step(v: Int)          = { this.step  = v     }
  def update_space(v: Int)         = { this.space = v     }
  
  def update_container_step(v: Int) = this.container_step :+ v
  def update_expand_step(v: Int)    = this.expand_step    :+ v
  def flush_container_step()        = this.container_step = this.container_step.init
  def flush_expand_step()           = this.expand_step    = this.expand_step.init

  def inSpace(v: Boolean)     = { this.inspace     = v }
  def inContainer(v: Boolean) = { this.incontainer = v }
  def inExpand(v: Boolean)    = { this.inexpands   = v }

  def update_started(s: Boolean)  = this.started  = s
  def update_paused(p: Boolean)   = this.paused   = p
  def update_finished(f: Boolean) = this.finished = f
}