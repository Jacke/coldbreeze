package main.scala.simple_parts.process

import main.scala.utils.Space
/**
 * @author Sobolev
 *
 */
trait ProcElems {
  val id: Int
  val space_id: Option[Space] = None
  def invoke()
  def init() = {
    println(this)
  }
}

case class CompositeValues(a_string: String, b_string: String, a_int: Int, b_int: Int, a_bool: Boolean, b_bool: Boolean)