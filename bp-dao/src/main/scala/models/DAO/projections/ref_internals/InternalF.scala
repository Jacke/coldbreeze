package models.DAO.projections.ref

import main.scala.bprocesses.refs._
import main.scala.simple_parts.process._
import models.DAO._
import models.DAO.reflect._
import scala.concurrent.ExecutionContext.Implicits.global
import scala.concurrent.duration.Duration
import scala.concurrent.{ExecutionContext, Awaitable, Await, Future}
import scala.util.Try


trait FrontElemProjectionF {
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
                          space_id:Option[Int] = None): Future[ElemProjectionContainer] = {
    scope match {
      case "front" => {
        val last_order = ProcElemDAO.lastOrderOfBP(process)

        val elementsF: Future[Seq[UnitElement]] = ProcElemReflectionDAOF.retrive(k, business, process)
        elementsF.map { elements =>
          val all_orders = Range(last_order, last_order + elements.length).toList
          val first_order = all_orders.head
          ElemProjectionContainer(
            elements.zip(all_orders).map {
              el =>
                val el2 = if (el._2 == first_order) ProcElemDCO.conv(el._1.copy(title = title, desc = desc, order = el._2)) else ProcElemDCO.conv(el._1.copy(order = el._2))
                el._1.id.get -> ProcElemDAOF.await ( ProcElemDAOF.pull(el2) )
            }.toMap, last_order, elements.toList)
        }
      }
      case "nested" => {
        val elementsF: Future[Seq[UnitElement]] = ProcElemReflectionDAOF.retrive(k, business, process)
        elementsF.map { elements =>
          val ref_ids = elements.map(_.id.get)
          val last_order = SpaceElemDAO.lastOrderOfBP(process, space_id.get)
          val all_orders = Range(last_order, last_order + elements.length).toList
          val first_order = all_orders.head

          val idToRefId:Map[Int,Int] = elements.zip(all_orders).map {
            el =>
              val el2 = if(el._2 == first_order) ProcElemDCO.conv_nested(el._1.copy(title = title, desc = desc, order = el._2), space_own = None, space_owned = space_id.get) else ProcElemDCO.conv_nested(el._1.copy(order = el._2), space_own = None, space_owned = space_id.get)
              el._1.id.get -> ProcElemDAOF.await ( SpaceElemDAOF.pull(el2) )
          }.toMap
          ElemProjectionContainer(idToRefId, last_order, elements.toList)
        }
      }
    }
  }
}


trait SpaceProjectionF {

  def spacesProjection(k: Int,
                      process: Int,
                      business: Int,
                      title: String,
                      desc:String = "",
                      idToRefId: Map[Int,Int],
                      ref_ids: List[Int]): Future[SpaceProjectionContainer] = {
    val last_index = BPSpaceDAOF.lastIndexOfSpace(process)
    val spacesF: Future[Seq[UnitSpaceRef]] = SpaceReflectionDAOF.findByElemRefs(ref_ids)
    spacesF.map { spaces =>
      val conv_spaces:Map[Int,Int] = spaces.toList.map { space =>
        val brick_front_id = idToRefId.find(idmap => space.brick_front.get == idmap._1).get._2
        val sp = SpaceDCO.conv(space, business, process, index = last_index, brick_front_id)
        space.id.get -> ProcElemDAOF.await (  BPSpaceDAOF.pull(sp) )
      }.toMap
      SpaceProjectionContainer(conv_spaces, spaces.toList, last_index)
    }
  }
}


trait SpaceElemProjectionF {
  def spaceElemsProjection(k: Int,
                          process: Int,
                          business: Int,
                          title: String,
                          desc:String = "",
                          conv_spaces:Map[Int, Int]): Future[SpaceElemProjectionContainer] = {
    val sp_elems_refsF: Future[Seq[UnitSpaceElementRef]] = SpaceElementReflectionDAOF.findByElemRefs(conv_spaces.keys.toList)
    sp_elems_refsF.map { sp_elems_refs =>
      val conv_sp_elems:Map[Int, Int] =  sp_elems_refs.toList.map { spelem =>
        val spel = SpaceElemDCO.conv2(spelem, business, process, space_own = None, space_owned = conv_spaces(spelem.ref_space_owned))
        spelem.id.get -> ProcElemDAOF.await ( SpaceElemDAOF.pull(spel) )
      }.toMap

      SpaceElemProjectionContainer(conv_sp_elems, 0, sp_elems_refs.toList)
    }
  }
}
