/**
 *
 *
 */

package main.scala.simple_parts.context
//import main.scala.InvokeTracer
/**
 * @author Sobolev
 */
/**
 * TODO Refactor that constructor to traits
 */
/**
 * ***
 * class Brick(br_type: String, mean: Unit, value: Unit, in: Unit, out: Unit) extends ProcElems {
 *
 * override def toString = s"Brick: $mean"
 * def invoke {
 * InvokeTracer.runner.get.logger.log("invoked brick")
 * }
 * def linked_to = BLinkDispatch(this)
 *
 * }
 * class Result extends ProcElems {
 * lazy val obj = BLinkDispatch.from(this)
 * def invoke() {
 * InvokeTracer.runner.get.logger.log("Result:" + obj)
 * }
 * override def toString = s"Result $obj"
 * }
 *
 * class Note(note: String) extends ProcElems {
 * def invoke {
 * println(s"boom $note")
 * }
 * override def toString = s"'$note'"
 * }
 *
 * class Checker {}
 *
 */
