package main.scala.bprocesses

import main.scala.simple_parts.process._
import com.github.nscala_time.time.Imports._

/**
 * BPLogger
 */
case class BPLoggerResult(
                           element: ProcElems,
                           composite: Option[CompositeValues],
                           order: Int,
                           space: Option[Int],
                           station: BPStation,
                           invoked: Boolean = false,
                           expanded: Boolean = false,
                           container: Boolean = false,
                           date: org.joda.time.DateTime = DateTime.now)
class BPLogger {
  var logs: Array[BPLoggerResult] = Array.empty
  def log(result: BPLoggerResult) = {
    //Thread.sleep(1000)
    logs = logs :+ result
  }
  def isInvoked(el: ProcElems):Boolean = {
    logs.find(log => log.order == el.order).get.invoked
  }
  def valChanged(el: ProcElems) = {
    val target = logs.find(log => log.order == el.order)
    if (target.isDefined) {
      el.values == target.get.composite
    }
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
