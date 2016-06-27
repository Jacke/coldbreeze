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
import main.scala.utils.Space
import main.scala.bprocesses._
import main.scala.bprocesses.BProcess

class Brick(val id: Int,
            title: String,
            desc: String,
            val values: Option[CompositeValues],
            val bprocess: BProcess,
            b_type: String,
            type_title: String,
            var order: Int,
            val space_parent: Option[Space] = None,
            val space_role: String = "",
            val space_parent_id: Option[Int] = None
             ) extends ProcElems {

  override def toString = s"Brick:"
  def invoke {
    bprocess.marker.moveToSpace
    println("bprocess.marker.moveToSpace")
    bprocess.marker.moveUpFront
    println("bprocess.marker.moveUpFront")
  }
  //def getSpace(obj: Brick, space_role: String):Option[Space] = {
  //  bprocess.spaces.find(space => (space.searchObj(obj, space_role) != None))
  //}
  def getSpace(brick: Brick):Option[Space] = {
    bprocess.spaces.find(space => (space.brick_owner == brick))
  }
  def getSpaces(brick: Brick):Array[Space] = {
    bprocess.spaces.filter(space => (space.brick_owner == brick))
    //bprocess.spaces.map(space => space.searchObj(this, space_role))
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
                  override val values: Option[CompositeValues],
                  override val bprocess: BProcess,
                  b_type: String,
                  type_title: String,
                  order: Int,
                  override val space_parent: Option[Space] = None,
                  override val space_role: String = "",
                  override val space_parent_id: Option[Int] = None
                   ) extends Brick(id,
  title,
  desc,
  values,
  bprocess,
  b_type,
  type_title,
  order,
  space_parent,
  space_role,
  space_parent_id
) {

  override def toString = s"Brick:"
  override def invoke {
    import main.scala.simple_parts.process.data.Constant
    println("move to space2")

    bprocess.marker.moveToSpace
    println("bprocess.marker.moveToSpace********")
    println(getSpace(this).get.expands.length)
    bprocess.marker.moveToExpand



    getSpace(this).get.updateElem(getSpace(this).get.expands(0), new Constant[Boolean](1, false, bprocess,1))

    bprocess.marker.toLogger(
      bprocess.marker.station.bp,
      BPLoggerResult
        (new Constant[Boolean](1, false, bprocess,1),
            order = 1,
            space = Option(getSpace(this).get.index),
            composite=None,
            station = bprocess.marker.toStation(bprocess.marker.station.bp),
            invoked = true,
            expanded = true,
            container = false)
    )
    getSpace(this).get.updateElem(getSpace(this).get.expands(1), new Constant[Boolean](1, false, bprocess,1))
    /**
     * TODO: Move in Invoke file Temp solution
     */
    bprocess.marker.toLogger(
      bprocess.marker.station.bp,
      BPLoggerResult
        (new Constant[Boolean](1, false, bprocess,1),
            order = 1,
            space = Option(getSpace(this).get.index),
            composite=None,
            station = bprocess.marker.toStation(bprocess.marker.station.bp),
            invoked = true,
            expanded = true,
            container = false)
    )
    getSpace(this).get.updateElem(getSpace(this).get.expands(2), new Constant[Boolean](1, false, bprocess,1))
    /**
     * TODO: Move in Invoke file Temp solution
     */
    bprocess.marker.toLogger(
      bprocess.marker.station.bp,
      BPLoggerResult
        (new Constant[Boolean](1, false, bprocess,1),
            order = 1,
            space = Option(getSpace(this).get.index),
            composite=None,
            station = bprocess.marker.toStation(bprocess.marker.station.bp),
            invoked = true,
            expanded = true,
            container = false)
    )

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
                     override val title: String,
                     desc: String,
                     override val values: Option[CompositeValues],
                     override val bprocess: BProcess,
                     b_type: String,
                     type_title: String,
                     order: Int,
                     override val space_parent: Option[Space] = None,
                     override val space_role: String = "",
                     override val space_parent_id: Option[Int] = None
                      ) extends Brick(id,
  title,
  desc,
  values,
  bprocess,
  b_type,
  type_title,
  order,
  space_parent,
  space_role,
  space_parent_id
) {

  override def toString = s"Brick:"
  override def invoke {
    println("RUNNING" +
      "CONTAINER" +
      "SPACE")

    bprocess.marker.moveToSpaceByIndx(getSpace(this).get.index, getSpace(this).get.id)//.moveToSpace

    //println("bprocess.marker.moveToSpace")
    bprocess.marker.moveToContainer
    println("run container")
    //bprocess.marker.runContainer(getSpace(this).get, 0)//bprocess.station.contStepVal)
    println(bprocess.station.represent)
    

    //bprocess.marker.moveUpFront


    //println("bprocess.marker.moveUpFront")
  }


  override def init {
    brick_space
  }
  override def brick_space {
    bprocess.spaces = bprocess.spaces :+ Space.apply(1, this, is_subbricks = false, is_container = true)
  }
}
