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

case class BPLoggerResult(
  element: ProcElems, 
  invoked: Boolean, 
  expanded: Boolean, 
  order: Int, 
  space: Int, 
  station: BPStation)

class BPErrorCatcher(bp: BProcess) {
  var errors: Array[BPError] = Array.empty
  var req_link: Array[ReqLink] = Array.empty

  def reg_req_link(el: ProcElems, q: Int) = {
    req_link = req_link :+ ReqLink(el, q)
  }

  def reg(error: BPError) { 
    errors = errors :+ error 
    bp.station.state = false
  }
  def flush = errors = Array.empty


}
case class ReqLink(el: ProcElems, quantity: Int)
case class BPError(el: ProcElems, error_type: String, desc: String)