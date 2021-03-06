package main.scala.bprocesses

import main.scala.bprocesses._
import main.scala.simple_parts.process.ProcElems
import org.joda.time.DateTime

class BPStationLogger {
  var logs: Array[BPStationLoggerResult] = Array.empty[BPStationLoggerResult]
  def log(result: BPStationLoggerResult): Array[BPStationLoggerResult] = {
    logs = logs :+ result
    logs
  }

  /**
   * Logs for sessions, when state is changed
   */
  var session_state_logs: Array[SessionStateLog] = Array.empty[SessionStateLog]
  def sessionStateLog(result: SessionStateLog) = {
    session_state_logs = session_state_logs :+ result
  }

}
case class BPStationLoggerResult(
                           station: BPStation,
                           sygnal: String,
                           state: BPStationState,

                           date: org.joda.time.DateTime = DateTime.now)

case class BPStationState(state:Boolean = true,
                          step:Int = 0,
                          space:Int = 0,
                          container_step:Array[Int] = Array.empty[Int],
                          expand_step:Array[Int] = Array.empty[Int],
                          spaces_ids: Array[Int] = Array.empty[Int],
                          container_state:Array[Boolean] = Array.empty[Boolean],
                          expand_state:Array[Boolean] = Array.empty[Boolean],
                          started: Boolean = false,
                          finished: Boolean = false,
                          inspace: Boolean = false,
                          incontainer: Boolean = false,
                          inexpands: Boolean = false,
                          paused: Boolean = false)