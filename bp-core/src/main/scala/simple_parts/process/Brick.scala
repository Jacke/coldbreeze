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
  val space: Option[Space], 
  val space_role: String
  ) extends ProcElems with SpaceControl {

  override def toString = s"Brick:"
  def invoke {
    println("invoked brick")
  }
  def getSpace = {
    bprocess.spaces.map(space => space.searchObj(this, space_role)).head
  }
  def getSpaces = {
    bprocess.spaces.map(space => space.searchObj(this, space_role))
  }
  

}

