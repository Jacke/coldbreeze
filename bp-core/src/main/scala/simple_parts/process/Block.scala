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

class Block(b_type: String, title: String, val expander: Boolean = false) extends ProcElems {

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

