package main.scala.bprocesses

import main.scala.simple_parts.process._

/**
 * BPLogger
 */

class BPLogger {
  var logs: Array[BPLoggerResult] = Array.empty
  def log(result: BPLoggerResult) = {
    logs = logs :+ result
  }
}
class BPErrorCatcher(bp: BProcess) {
  var errors: Array[BPError] = Array.empty
  def reg(error: BPError) { 
    errors = errors :+ error 
    bp.station.state = false
  }
  def flush = errors = Array.empty
}
case class BPError(el: ProcElems, error_type: String, desc: String)

case class BPLoggerResult(
  element: ProcElems, 
  invoked: Boolean, 
  expanded: Boolean, 
  order: Int, 
  space: Int, 
  station: BPStation)