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