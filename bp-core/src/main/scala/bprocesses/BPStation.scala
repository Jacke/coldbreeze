package main.scala.bprocesses

class BPStation(val bp: BProcess) {
  /**
   * Mutable statuses of process
   */
  val logger = new BPLogger
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
  def isStopped:Boolean = !state

  def update_state(state: Boolean) = { this.state = state }
  def update_step(v: Int)          = { this.step  = v     }
  def update_space(v: Int)         = { this.space = v     }
  
  def update_container_step(v: Int) = this.container_step :+ v
  def update_expand_step(v: Int)    = this.expand_step    :+ v

  def flush_container_step()
  {
    if(!this.container_step.isEmpty){ this.container_step = this.container_step.init }
  }
  def flush_expand_step()
  {
   if(!this.expand_step.isEmpty)    { this.expand_step    = this.expand_step.init    }
  }

  def inSpace(v: Boolean)     = { this.inspace     = v }
  def inContainer(v: Boolean) = { this.incontainer = v }
  def inExpand(v: Boolean)    = { this.inexpands   = v }

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
      |container_step $container_step
      |expand_step    $expand_step
      |started        $started
      |finished       $finished
      |inspace        $inspace
      |incontainer    $incontainer
      |inexpands      $inexpands
      |paused         $paused
      |****************
    """.stripMargin
}