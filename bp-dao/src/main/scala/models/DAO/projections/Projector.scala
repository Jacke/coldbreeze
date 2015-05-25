package models.DAO.projections

import main.scala.bprocesses.refs.UnitRefs.{UnitReactionRef, UnitSpaceElementRef, UnitSpaceRef}
import main.scala.simple_parts.process.Units.{ElemTopology, UnitElement}
import models.DAO.reflect._
import models.DAO._

/**
 * Created by Stanislav on 26.05.2015.
 */
object RefProjector extends FrontElemProjection {


  def in_front(k: Int, process: Int, business: Int, title: String, desc:String = ""):Option[RefResulted] = {
    models.DAO.reflect.RefDAO.get(k) match {
      case Some(ref) => {

        val idToRefId:Map[Int,Int] = frontElemsProjection(k, process, business, title, desc)


        // Space fetching
        val spaces:List[UnitSpaceRef] = SpaceReflectionDAO.findByElemRefs(ref_ids)
        val conv_spaces:Map[Int,Int] = spaces.map { space =>
          val brick_front_id = idToRefId.find(idmap => space.brick_front.get == idmap._1).get._2
          val sp = SpaceDCO.conv(space, business, process, index = last_index, brick_front_id)
          space.id.get -> BPSpaceDAO.pull_object(sp)
        }.toMap

        val sp_elems_refs:List[UnitSpaceElementRef] = SpaceElementReflectionDAO.findByElemRefs(conv_spaces.keys.toList)
        val conv_sp_elems:Map[Int, Int] =  sp_elems_refs.map { spelem =>
          val spel = SpaceElemDCO.conv2(spelem, business, process, space_own = None, space_owned = conv_spaces(spelem.ref_space_owned))
          spelem.id.get -> SpaceElemDAO.pull_object(spel)
        }.toMap
        /**
         * TODO:
         * Deep nesting
         **/


        // State, switcher, reaction
        val states = BPStateRefDAO.findByRef(k)
        val switcher = SwitcherRefDAO.findByRef(k)
        val reactions:List[UnitReactionRef] = ReactionRefDAO.findByRef(k)
        val reaction_state_out = ReactionStateOutRefDAO.findByReactionRefs(reactions.map(_.id.get))

        val stateIdToRefId:Map[Int, Int] = ((idToRefId.map { m =>
          states.filter(pred => pred.front_elem_id == Some(m._1)).map { el =>
            el.id.get -> BPStateDAO.pull_object(el.reflect(process, front_elem_id = Some(m._2), space_elem_id = None, space_id = None))
          }

        }) ++ (conv_spaces.map { m =>
          states.filter(pred => pred.space_id == Some(m._1)).map { el =>
            el.id.get -> BPStateDAO.pull_object(el.reflect(process, space_id = Some(m._2), space_elem_id = None, front_elem_id = None))
          }
        }) ++ (conv_sp_elems.map { m =>

          states.filter(pred => pred.space_elem_id == Some(m._1)).map { el =>
            el.id.get -> BPStateDAO.pull_object(el.reflect(process, space_elem_id = Some(m._2), space_id = None, front_elem_id = None))
          }
        })).flatten.toMap


        val switcherIdToRefId:Map[Int, Int] = stateIdToRefId.map( m =>
          switcher.filter(pred => pred.state_ref == m._1).map( sw =>
            sw.id.get -> SwitcherDAO.pull_object(sw.reflect(process, m._2, session = None))
          )).flatten.toMap


        val topos = ReflectElemTopologDAO.findByRef(k)
        def isIdDefined(id: Int, scope: String):Boolean = {
          scope match {
            case "space" => topos.find(t => t.space_elem_id == Some(id)).isDefined
            case "front" => topos.find(t => t.front_elem_id == Some(id)).isDefined
            case _ => false
          }
        }//.filter(idd => isIdDefined(idd._1, "front"))
        val topoElem = idToRefId.map(idd =>
            topos.find(t => t.front_elem_id == Some(idd._1)).get.id.get -> makeTopolog(process,
              front_elem_id = Some(idd._2),
              space_elem_id=None)
          )
        //.filter(idd => isIdDefined(idd._1, "space"))
        val topoSpaceElem = conv_sp_elems.map(idd =>
          topos.find(t => t.space_elem_id == Some(idd._1)).get.id.get -> makeTopolog(process,
            space_elem_id = Some(idd._2),
            front_elem_id=None)
        )
        // TOPOLOGY MAKING
        val reactionsIdToRefId:Map[Int, Int] = (topoElem.map ( m =>
          reactions.filter(pred => pred.element == m._1).map ( react =>
            react.id.get -> ReactionDAO.pull_object(react.reflect(process, m._2, from_state = None)) // TODO: Make that work from state
          )
        ).flatten ++
          topoSpaceElem.map ( m =>
            reactions.filter(pred => pred.element == m._1).map ( react =>
              react.id.get -> ReactionDAO.pull_object(react.reflect(process, m._2, from_state = None)) // TODO: Make that work from state
            )
          ).flatten
          ).toMap

        val reaction_state_outIdToRefId:Map[Int, Int] = reactionsIdToRefId.map { m =>
          reaction_state_out.filter(pred => pred.reaction == m._1).map { out =>
            out.id.get -> ReactionStateOutDAO.pull_object(out.reflect(state_ref = stateIdToRefId.find(s => s._1 == out.state_ref).get._2, reaction = m._2))
          }
        }.flatten.toMap


        Some(RefResulted(
          proc_elems = idToRefId.values.toList,
          space_elems = conv_sp_elems.values.toList,
          spaces = conv_spaces.values.toList,
          states = stateIdToRefId.values.toList,
          switches = switcherIdToRefId.values.toList,
          reactions = reactionsIdToRefId.values.toList,
          reaction_state_outs = reaction_state_outIdToRefId.values.toList
        ))
      }

      case _ => None
    }
  }
  def in_nested(k: Int, process: Int, business: Int, space_id: Int, title: String, desc:String = ""):Option[RefResulted] = {
    models.DAO.reflect.RefDAO.get(k) match {
      case Some(ref) => {
        val last_order = SpaceElemDAO.lastOrderOfBP(process, space_id)
        val last_index = BPSpaceDAO.lastIndexOfSpace(process)
        //val elements = SpaceElementReflectionDAO.retrive(k, business, process, space_own = None, ref_space_owned = space_id)
        val elements:List[UnitElement] = ProcElemReflectionDAO.retrive(k, business, process)
        val ref_ids = elements.map(_.id.get)
        val all_orders = Range(last_order, last_order + elements.length).toList
        val first_order = all_orders.head

        val idToRefId:Map[Int,Int] = elements.zip(all_orders).map {
          el =>
            val el2 = if(el._2 == first_order) ProcElemDCO.conv_nested(el._1.copy(title = title, desc = desc, order = el._2), space_own = None, space_owned = space_id) else ProcElemDCO.conv_nested(el._1.copy(order = el._2), space_own = None, space_owned = space_id)
            el._1.id.get -> SpaceElemDAO.pull_object(el2)

        }.toMap


        val spaces:List[UnitSpaceRef] = SpaceReflectionDAO.findByElemRefs(ref_ids)
        val conv_spaces:Map[Int,Int] = spaces.map { space =>
          val brick_front_id = idToRefId.find(idmap => space.brick_front.get == idmap._1).get._2
          val sp = SpaceDCO.conv(space, business, process, index = last_index, brick_front_id)
          space.id.get -> BPSpaceDAO.pull_object(sp)
        }.toMap

        val sp_elems_refs:List[UnitSpaceElementRef] = SpaceElementReflectionDAO.findByElemRefs(conv_spaces.keys.toList)
        val conv_sp_elems:Map[Int, Int] =  sp_elems_refs.map { spelem =>
          val spel = SpaceElemDCO.conv2(spelem, business, process, space_own = None, space_owned = conv_spaces(spelem.ref_space_owned))
          spelem.id.get -> SpaceElemDAO.pull_object(spel)
        }.toMap



        // State, switcher, reaction
        val states = BPStateRefDAO.findByRef(k)
        val switcher = SwitcherRefDAO.findByRef(k)
        val reactions:List[UnitReactionRef] = ReactionRefDAO.findByRef(k)
        val reaction_state_out = ReactionStateOutRefDAO.findByReactionRefs(reactions.map(_.id.get))

        val stateIdToRefId:Map[Int, Int] = ((idToRefId.map { m =>
          states.filter(pred => pred.front_elem_id == Some(m._1)).map { el =>
            el.id.get -> BPStateDAO.pull_object(el.reflect(process, front_elem_id = None, space_elem_id = Some(m._2), space_id = None))
          }

        }) ++ (conv_spaces.map { m =>
          states.filter(pred => pred.space_id == Some(m._1)).map { el =>
            el.id.get -> BPStateDAO.pull_object(el.reflect(process, space_id = Some(m._2), space_elem_id = None, front_elem_id = None))
          }
        }) ++ (conv_sp_elems.map { m =>

          states.filter(pred => pred.space_elem_id == Some(m._1)).map { el =>
            el.id.get -> BPStateDAO.pull_object(el.reflect(process, space_elem_id = Some(m._2), space_id = None, front_elem_id = None))
          }
        })).flatten.toMap

        val switcherIdToRefId:Map[Int, Int] = stateIdToRefId.map(m =>
          switcher.filter(pred => pred.state_ref == m._1).map(sw =>
            sw.id.get -> SwitcherDAO.pull_object(sw.reflect(process, m._2, session = None)))).flatten.toMap

        val topos = ReflectElemTopologDAO.findByRef(k)
        val topoElem = idToRefId.map(idd =>
          topos.find(t => t.front_elem_id == Some(idd._1)).get.id.get -> makeTopolog(process, space_elem_id = Some(idd._2), front_elem_id=None))
        val topoSpaceElem = conv_sp_elems.map(idd =>
          topos.find(t => t.space_elem_id == Some(idd._1)).get.id.get -> makeTopolog(process, space_elem_id = Some(idd._2), front_elem_id=None))
        // TOPOLOGY MAKING
        val reactionsIdToRefId:Map[Int, Int] = (topoElem.map (m =>
          reactions.filter(pred => pred.element == m._1).map (react =>
            react.id.get -> ReactionDAO.pull_object(react.reflect(process, m._2, from_state = None)) // TODO: Make that work from state
          )
        ).flatten ++
          topoSpaceElem.map (m =>
            reactions.filter(pred => pred.element == m._1).map (react =>
              react.id.get -> ReactionDAO.pull_object(react.reflect(process, m._2, from_state = None)) // TODO: Make that work from state
            )
          ).flatten
          ).toMap


        val reaction_state_outIdToRefId:Map[Int, Int] = reactionsIdToRefId.map { m =>
          reaction_state_out.filter(pred => pred.reaction == m._1).map { out =>
            out.id.get -> ReactionStateOutDAO.pull_object(out.reflect(state_ref = stateIdToRefId.find(s => s._1 == out.state_ref).get._2, reaction = m._2))
          }
        }.flatten.toMap // PROBLEM


        Some(RefResulted(
          proc_elems = idToRefId.values.toList,
          space_elems = conv_sp_elems.values.toList,
          spaces = conv_spaces.values.toList,
          states = stateIdToRefId.values.toList,
          switches = switcherIdToRefId.values.toList,
          reactions = reactionsIdToRefId.values.toList,
          reaction_state_outs = reaction_state_outIdToRefId.values.toList
        ))

      }


      case _ => None
    }
  }

  private def makeTopolog(process: Int, front_elem_id: Option[Int], space_elem_id: Option[Int]):Int = {
    ElemTopologDAO.pull_object(ElemTopology(
      id = None,
      process,
      front_elem_id,
      space_elem_id,
      "",
      None))
  }
}


trait FrontElemProjection {

  def frontElemsProjection(k: Int, process: Int, business: Int, title: String, desc:String = ""): Map[Int, Int] = {
    val last_order = ProcElemDAO.lastOrderOfBP(process)
    val last_index = BPSpaceDAO.lastIndexOfSpace(process)

    val elements: List[UnitElement] = ProcElemReflectionDAO.retrive(k, business, process)
    val ref_ids = elements.map(_.id.get)
    val all_orders = Range(last_order, last_order + elements.length).toList
    val first_order = all_orders.head
    elements.zip(all_orders).map {
        el =>
        val el2 = if (el._2 == first_order) ProcElemDCO.conv(el._1.copy(title = title, desc = desc, order = el._2)) else ProcElemDCO.conv(el._1.copy(order = el._2))
        el._1.id.get -> ProcElemDAO.pull_object(el2)

    }.toMap
  }
}

trait SpaceProjection {
  def spacesProjection(k: Int, process: Int, business: Int, title: String, desc:String = ""): Map[Int, Int] = {

  }

}
trait SpaceElemProjection {
  def spaceElemsProjection(k: Int, process: Int, business: Int, title: String, desc:String = ""): Map[Int, Int] = {
  }
}
trait StateProjection {
  def statesProjection(k: Int, process: Int, business: Int, title: String, desc: String = ""): Map[Int, Int] = {
  }
}
trait ReactionProjection {
  def reactionsProjection(k: Int, process: Int, business: Int, title: String, desc:String = ""): Map[Int, Int]  = {

  }
}
trait ReactionStateOutProjection {
  def reactionStateOutsProjection(k: Int, process: Int, business: Int, title: String, desc:String = ""): Map[Int, Int] = {
  }
}