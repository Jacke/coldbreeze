package main.scala.simple_parts.process

import main.scala.utils.Space
/**
 * @author Sobolev
 *
 */
trait ProcElems {
  val id: Int
  val space_id: Option[Space] = None
  val temp = false
  val refresh = false
  var order: Int

  def invoke()
  def init() = {
    println(this)
  }
}

case class CompositeValues(a_string: String = "", b_string: String = "", a_int: Int = 0, b_int: Int = 0, a_bool: Boolean = false, b_bool: Boolean = false)