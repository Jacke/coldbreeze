package main.scala.simple_parts.context
import main.scala.maps.Frame
import main.scala.simple_parts.process._

/**
 * @author Sobolev
 *
 */
trait CtxElems {
  def invoke
  def fromReq(f: Frame, input: Array[ProcElems] = Array.empty)
  val isRequestable = false
}