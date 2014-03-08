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

case class CompositeValues((String, String, Int, Int, Boolean, Boolean))