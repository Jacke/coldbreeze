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
  //def getSpace(obj: Brick, space_role: String):Option[Space] = {
  //  bprocess.spaces.find(space => (space.searchObj(obj, space_role) != None))
  //}
  def getSpace(brick: Brick):Option[Space] = {
    bprocess.spaces.find(space => (space.brick == brick))
  }
  def getSpaces = {
    bprocess.spaces.map(space => space.searchObj(this, space_role))
  }
  
  override def init {
    brick_space
  }
  def brick_space {
    bprocess.spaces = bprocess.spaces :+ Space.apply(1, this, is_subbricks = false, is_container = false)
  }
}


class ExpandBrick(override val id: Int,
            title: String,
            desc: String,
            values: CompositeValues,
            bprocess: BProcess,
            b_type: String,
            b_title: String,
            order: Int,
            override val space: Option[Space] = None,
            override val space_role: String = ""
             ) extends Brick(id,
                             title,
                             desc,
                             values,
                             bprocess,
                             b_type,
                             b_title,
                             order,
                             space,
                             space_role
                            ) with SpaceControl {

  override def toString = s"Brick:"
  override def invoke {
    import main.scala.simple_parts.process.data.Constant
    println("move to space2")

    bprocess.marker.moveToSpace
    println("bprocess.marker.moveToSpace********")
    println(getSpace(this).get.expands.length)
    bprocess.marker.moveToExpand
    getSpace(this).get.updateElem(getSpace(this).get.expands(0), new Constant[Boolean](1, false))
    getSpace(this).get.updateElem(getSpace(this).get.expands(1), new Constant[Boolean](1, false))
    getSpace(this).get.updateElem(getSpace(this).get.expands(2), new Constant[Boolean](1, false))

    bprocess.marker.moveUpFront
    println("bprocess.marker.moveUpFront")
  }


  override def init {
    brick_space
  }
  override def brick_space {
    bprocess.spaces = bprocess.spaces :+ Space.apply(2, this, is_subbricks = false, is_container = false, is_expander = true)
  }
}
class ContainerBrick(override val id: Int,
            title: String,
            desc: String,
            values: CompositeValues,
            bprocess: BProcess,
            b_type: String,
            b_title: String,
            order: Int,
            override val space: Option[Space] = None,
            override val space_role: String = ""
           ) extends Brick(id,
                           title,
                           desc,
                           values,
                           bprocess,
                           b_type,
                           b_title,
                           order,
                           space,
                           space_role
                          ) with SpaceControl {

  override def toString = s"Brick:"
  override def invoke {
    println("RUNNING" +
      "CONTAINER" +
      "SPACE")

    bprocess.marker.moveToSpace
    //println("bprocess.marker.moveToSpace")
    bprocess.marker.moveToContainer
    bprocess.marker.runContainer(getSpace(this).get)
    //println("bprocess.station.represent")
    bprocess.marker.moveUpFront
    //println("bprocess.marker.moveUpFront")
  }


  override def init {
    brick_space
  }
  override def brick_space {
    bprocess.spaces = bprocess.spaces :+ Space.apply(1, this, is_subbricks = false, is_container = true)
  }
}
