/**
 *
 *
 */
package main.scala.simple_parts.process

import scala.collection.mutable._
import main.scala.simple_parts.process._
import main.scala.bprocesses.InvokeTracer
import main.scala.utils.ElementTracer
import main.scala.utils.Space
import main.scala.bprocesses._

/**
 * @author Sobolev
 */

class Block(val id: Int,
  override val title: String, 
  desc: String, 
  val values: Option[CompositeValues],
  val bprocess: BProcess,
  b_type: String, 
  type_title: String,
  var order: Int,
  val space_parent: Option[Space] = None,
  val space_role: Option[String] = None
  ) extends ProcElems {



  override def toString = s"Block: $title"

  override def invoke {
      println(">>>>>>>>>>>>")
    println("invoked block")
  }


}
