package main.scala.bprocesses

import main.scala.simple_parts.process._
import java.util.{Date, Calendar}

/**
 * BPLogger
 */
case class BPLoggerResult(
                           element: ProcElems,
                           order: Int,
                           space: Int,
                           station: BPStation,
                           invoked: Boolean = false,
                           expanded: Boolean = false,
                           date: Date = Calendar.getInstance().getTime())
class BPLogger {
  var logs: Array[BPLoggerResult] = Array.empty
  def log(result: BPLoggerResult) = {
    //Thread.sleep(1000)
    logs = logs :+ result
  }
}



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

class ScalaCustomException(msg: String) extends RuntimeException(msg)

object PullCustomException {
  def create(msg: String) : ScalaCustomException = new ScalaCustomException(msg)
  //def create(msg: String, cause: Throwable) = new ScalaCustomException(msg).initCause(cause)
}
