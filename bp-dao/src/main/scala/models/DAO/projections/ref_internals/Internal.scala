package models.DAO.projections.ref

import main.scala.bprocesses.refs.UnitRefs.{UnitSpaceElementRef, UnitSpaceRef}
import main.scala.simple_parts.process.Units.UnitElement
import models.DAO._
import models.DAO.reflect._
import scala.concurrent.ExecutionContext.Implicits.global
import scala.concurrent.duration.Duration
import scala.concurrent.{ExecutionContext, Awaitable, Await, Future}
import scala.util.Try

/**
 *
 * @param elements Map of Old id and New id for element
 * @param last_order Fetch order for front and space elements
 * @param elem_ref Id of referenced elements
 */
case class ElemProjectionContainer(elements: Map[Int, Int], last_order: Int, elem_ref: List[UnitElement])

trait FrontElemProjection {
  /**
   * @param k Ref id
   * @param process process id
   * @param business business id
   * @param title
   * @param desc
   * @param scope Front or Nested
   * @param space_id For nested scope
   * @return
   */
  def frontElemsProjection(k: Int,
                          process: Int,
                          business: Int,
                          title: String,
                          desc: String = "",
                          scope: String = "front",
                          space_id:Option[Int] = None): ElemProjectionContainer = {
    scope match {
      case "front" => {
        val last_order = ProcElemDAO.lastOrderOfBP(process)

        val elements: List[UnitElement] = ProcElemReflectionDAO.retrive(k, business, process)

        val all_orders = Range(last_order, last_order + elements.length).toList
        val first_order = all_orders.head
        ElemProjectionContainer(
          elements.zip(all_orders).map {
            el =>
              val el2 = if (el._2 == first_order) ProcElemDCO.conv(el._1.copy(title = title, desc = desc, order = el._2)) else ProcElemDCO.conv(el._1.copy(order = el._2))
              el._1.id.get -> ProcElemDAO.pull_object(el2)
          }.toMap, last_order, elements)
      }
      case "nested" => {
        val elements:List[UnitElement] = ProcElemReflectionDAO.retrive(k, business, process)
        val ref_ids = elements.map(_.id.get)
        val last_order = SpaceElemDAO.lastOrderOfBP(process, space_id.get)
        val all_orders = Range(last_order, last_order + elements.length).toList
        val first_order = all_orders.head

        val idToRefId:Map[Int,Int] = elements.zip(all_orders).map {
          el =>
            val el2 = if(el._2 == first_order) ProcElemDCO.conv_nested(el._1.copy(title = title, desc = desc, order = el._2), space_own = None, space_owned = space_id.get) else ProcElemDCO.conv_nested(el._1.copy(order = el._2), space_own = None, space_owned = space_id.get)
            el._1.id.get -> SpaceElemDAO.pull_object(el2)
        }.toMap
        ElemProjectionContainer(idToRefId, last_order, elements)
      }
    }
  }
}


/**
 * @param spaces_ids Map of Old id and New id for space
 * @param spaces_refs Existed reference for spaces
 * @param last_index Last index of space for current process
 */
case class SpaceProjectionContainer(spaces_ids: Map[Int,Int], spaces_refs: List[UnitSpaceRef], last_index: Int)

trait SpaceProjection {

  def spacesProjection(k: Int,
                      process: Int,
                      business: Int,
                      title: String,
                      desc:String = "",
                      idToRefId: Map[Int,Int],
                      ref_ids: List[Int]): SpaceProjectionContainer = {
    val last_index = BPSpaceDAOF.lastIndexOfSpace(process)
    val spaces: List[UnitSpaceRef] = SpaceReflectionDAO.findByElemRefs(ref_ids)
    val conv_spaces:Map[Int,Int] = spaces.map { space =>
      val brick_front_id = idToRefId.find(idmap => space.brick_front.get == idmap._1).get._2
      val sp = SpaceDCO.conv(space, business, process, index = last_index, brick_front_id)
      space.id.get -> BPSpaceDAOF.pull_object(sp)
    }.toMap
    SpaceProjectionContainer(conv_spaces, spaces, last_index)
  }

}


/**
 *
 * @param elements Map of Old id and New id for element
 * @param last_order Fetch order for front and space elements
 * @param ref_ids Id of referenced elements
 */
case class SpaceElemProjectionContainer(elements: Map[Int, Int], last_order: Int, ref_ids: List[UnitSpaceElementRef])
trait SpaceElemProjection {
  def spaceElemsProjection(k: Int,
                          process: Int,
                          business: Int,
                          title: String,
                          desc:String = "",
                          conv_spaces:Map[Int, Int]): SpaceElemProjectionContainer = {
    val sp_elems_refs: List[UnitSpaceElementRef] = SpaceElementReflectionDAO.findByElemRefs(conv_spaces.keys.toList)
    val conv_sp_elems:Map[Int, Int] =  sp_elems_refs.map { spelem =>
      val spel = SpaceElemDCO.conv2(spelem, business, process, space_own = None, space_owned = conv_spaces(spelem.ref_space_owned))
      spelem.id.get -> SpaceElemDAO.pull_object(spel)
    }.toMap

    SpaceElemProjectionContainer(conv_sp_elems, 0, sp_elems_refs)
  }
}
