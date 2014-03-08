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

class Brick(
  title: String, 
  desc: String, 
  bprocess: BProcess,
  b_type: String, 
  b_title: String, 
  order: Int, 
  val space: Option[Space], 
  val space_role: String
  ) extends ProcElems {
  
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

