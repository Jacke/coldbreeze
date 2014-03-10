/**
 *
 *
 */

package main.scala.simple_parts.process
import main.scala.bprocesses.BProcess
import main.scala.bprocesses.InvokeTracer
import main.scala.utils.links.LinkSearcher
import scala.util.Try
import main.scala.utils.ElementTracer
import main.scala.utils.SpaceControl

class Brick(id: Int,
  title: String, 
  desc: String, 
  values: CompositeValues,
  bprocess: BProcess,
  b_type: String, 
  b_title: String, 
  order: Int, 
  val space: Option[Space], 
  val space_role: String
  ) extends ProcElems with SpaceControl {

  ElementTracer.register[Brick]("Brick", "Default brick", "Default brick for taking Tests")

  override def toString = s"Brick:"
  def invoke {
    println("invoked brick")
  }
  def getSpace = {
    proc.getSpaceByOrder(order).head
  }
  def getSpaces = {
    proc.getSpaceByOrder(order)
  }
  

}

