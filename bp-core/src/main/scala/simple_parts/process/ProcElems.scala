package main.scala.simple_parts.process

/**
 * @author Sobolev
 *
 */
trait ProcElems {
  def invoke()
  def init() = {
    println(this)
  }
}

case class CompositeValues(a_string: String, b_string: String, a_int: Int, b_int: Int, a_bool: Boolean, b_bool: Boolean)