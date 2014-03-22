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
import main.scala.utils.Space
import main.scala.bprocesses._

class Brick(val id: Int,
  title: String, 
  desc: String, 
  values: CompositeValues,
  bprocess: BProcess,
  b_type: String, 
  b_title: String, 
  order: Int, 
  val space: Option[Space] = None,
  val space_role: String = ""
  ) extends ProcElems with SpaceControl {

  override def toString = s"Brick:"
  def invoke {
    println("move to space")

    bprocess.marker.moveToSpace
    println("bprocess.marker.moveToSpace")
    println(bprocess.station.represent)
    println("bprocess.station.represent")
    bprocess.marker.moveUpFront
    println("bprocess.marker.moveUpFront")
  }
  def getSpace = {
    bprocess.spaces.map(space => space.searchObj(this, space_role)).head
  }
  def getSpaces = {
    bprocess.spaces.map(space => space.searchObj(this, space_role))
  }
  
  override def init {
    brick_space
  }
  def brick_space {
    bprocess.spaces = bprocess.spaces :+ Space.apply(1, this, is_subbricks = false, is_container = true)
  }
}

