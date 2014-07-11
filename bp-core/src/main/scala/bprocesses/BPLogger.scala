package main.scala.bprocesses

import main.scala.simple_parts.process._
import com.github.nscala_time.time.Imports._
import scala.collection.immutable.TreeMap

/**
 * BPLogger
 */
case class BPLoggerResult(
                           val element: ProcElems,
                           composite: Option[CompositeValues],
                           order: Int,
                           space: Option[Int],
                           station: BPStation,
                           invoked: Boolean = false,
                           expanded: Boolean = false,
                           container: Boolean = false,
                           date: org.joda.time.DateTime = DateTime.now,
                           var step: Int = 0) extends BPLoggerUtil {
  step = log_step_inc(element.bprocess, element)
}
trait BPLoggerUtil {
  val space: Option[Int]
  def log_step_inc(bp: BProcess, el: ProcElems):Int =
      if (this.space.isDefined && el.space_id.isDefined) {
          val elemLogs = bp.logger.logs.filter(log => log.space.isDefined && log.space == Some(el.space_id.get.index)).sortBy(_.step)

        if (elemLogs.length < 1)
          1
        else
          elemLogs.last.step + 1
      }
      else {
        val elemLogs = bp.logger.logs.sortBy(_.step)
        if (elemLogs.length < 1)
          1
        else
          elemLogs.last.step + 1
    }
}

class BPLogger {
  /**
   * Logs after computation
   */
  var logs: Array[BPLoggerResult] = Array.empty[BPLoggerResult]
  /**
   * Logs before computation
   */
  var logs_before: Array[BPLoggerResult] = Array.empty[BPLoggerResult]

  def logBefore(result: BPLoggerResult) = {
    logs_before = logs_before :+ result
  }
  def log(result: BPLoggerResult) = {
    logs = logs :+ result
  }

  /**
   * Return map of steps and 2 BPLoggerResults(before and after computation)
   * @return Map [Step, List(BPLoggerResultBefore, BPLoggerResultAfter)
   */
  def beforeAfter:Map[Int, List[BPLoggerResult]] = {
    val before = logs_before map { l => (l.step, l) } toMap
    val after = logs map { l => (l.step, l) } toMap
    val merged = before.toSeq ++ after.toSeq

    val grouped = merged.groupBy(_._1)
    val cleaned = grouped.mapValues(_.map(_._2).toList)
    val sortedMap = TreeMap(cleaned.toSeq:_*)
    sortedMap
  }

  def isInvoked(el: ProcElems):Boolean = {
    logs.find(log => log.order == el.order).get.invoked
  }
  def isExpanded(el: ProcElems):Boolean = {
    logs.find(log => log.order == el.order && log.invoked == false).get.expanded
  }
  def valChanged(el: ProcElems):Boolean = {
    val target = logs.find(log => log.element == el)
    if (target.isDefined) {
      el.values != target.get.composite
    } else false
  }

  /**
   * ProcElems that are changed own CV
   * @param el
   * @return
   */
  def valChanger(el: ProcElems):CompositeValues = {
    val target = logs.find(log => log.element == el)
    target.get.composite.get
  }

  def updateExpChecker(el: ProcElems):Boolean = {
   logs.find(log => log.order == el.order && log.space.getOrElse(0) == el.space_id.get.index && log.expanded && log.invoked).isDefined
  }
}





class BottomLine(bp: BProcess) {
  var errors: Array[BPError] = Array.empty
  var req_link: Array[ReqLink] = Array.empty

  def reg_req_link(el: ProcElems, q: Int) = {
    req_link = req_link :+ ReqLink(el, q)
  }

  def soft_reg(error: BPError) {
    errors = errors :+ error
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
