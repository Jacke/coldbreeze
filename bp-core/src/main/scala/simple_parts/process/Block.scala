/**
 *
 *
 */
package main.scala.simple_parts.process

import scala.collection.mutable._
import main.scala.simple_parts.process._
import main.scala.bprocesses.InvokeTracer

/**
 * @author Sobolev
 */

class Block(
  title: String, 
  desc: String, 
  bprocess: BProcess,
  b_type: String, 
  b_title: String, 
  order: Int, 
  val space: Option[Space], 
  val space_role: String
  ) extends ProcElems {

  override def toString = s"Block: $title"

  override def invoke {
    println("invoked block")
  }

  def expand(obj: ProcElems) = {
    if (expander) {
      // Change element
      // Change link of that element
    }
  }
}

