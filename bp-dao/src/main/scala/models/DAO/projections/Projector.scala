package models.DAO.projections

import main.scala.bprocesses.refs.UnitRefs.{UnitReactionRef, UnitSpaceElementRef, UnitSpaceRef}
import main.scala.simple_parts.process.Units.{ElemTopology, UnitElement}
import models.DAO.reflect._
import models.DAO._
import models.DAO.projections.ref._


object RefProjector extends FrontElemProjection
  with SpaceProjection
  with SpaceElemProjection
  with StateProjection
  with SwitcherProjection
  with ReactionProjection
  with ReactionStateOutProjection {


  def projecting(k: Int, process: Int, business: Int, title: String, desc:String = "", sc: String = "front", space_id: Option[Int] = None):Option[RefResulted] = {
    models.DAO.reflect.RefDAO.get(k) match {
      case Some(ref) => {

        // Front fetching
        val front_container:ElemProjectionContainer = frontElemsProjection(k, process, business, title, desc,sc,space_id)
          val idToRefId:Map[Int, Int] = front_container.elements
          val ref_ids:List[Int] = front_container.elem_ref.map(_.id.get)

        // Space fetching
        val space_container:SpaceProjectionContainer = spacesProjection(k, process, business, title, desc, idToRefId, ref_ids)
          val conv_spaces:Map[Int, Int] = space_container.spaces_ids
          val space_refs:List[UnitSpaceRef] = space_container.spaces_refs
          val last_index:Int = space_container.last_index

        // Space elem fetching
        val space_elem_container:SpaceElemProjectionContainer = spaceElemsProjection(k, process, business, title, desc,conv_spaces)
        val conv_sp_elems:Map[Int, Int] = space_elem_container.elements
        val sp_elems_refs:List[UnitSpaceElementRef] = space_elem_container.ref_ids
        /**
         * TODO:
         *   Deep nesting for:
         * -> ref brick
         *   -> space
         *     -> space brick
         *       -> space brick brick
         *       ...
         *
         *       Start with implementing Space elem projection
         **/


        // Fetch states
        val state_container = statesProjection(k, process, business, title, desc,idToRefId, conv_spaces, conv_sp_elems, scope=sc)
        val stateIdToRefId = state_container.states_ids

        // Fetch switchers
        val switcher_container:SwitcherProjectionContainer = switcherProjection(k, process, business, title, desc, stateIdToRefId)
        val switcherIdToRefId = switcher_container.switcher_ids



        // TOPOLOGY MAKING
        val topos = ReflectElemTopologDAO.findByRef(k)
        def onTopo(id: Int, scope: String):Option[Int] = {
          if (sc == scope && scope == "front")  { Some(id) } 
          else if (sc == scope && scope == "nested") { Some(id) } else { None }
        }

        val topoElem = idToRefId.map(idd =>
            topos.find(t => t.front_elem_id == Some(idd._1)).get.id.get -> makeTopolog(process,
              front_elem_id = onTopo(idd._2, "front"),
              space_elem_id=  onTopo(idd._2, "nested"))
          )
        val topoSpaceElem = conv_sp_elems.map(idd =>
          topos.find(t => t.space_elem_id == Some(idd._1)).get.id.get -> makeTopolog(process,
            space_elem_id = Some(idd._2),
            front_elem_id=None)
        )
        // TOPOLOGY MAKING

        val reaction_container = reactionsProjection(k, process, business, title, desc, topoElem, topoSpaceElem)
        val reactionsIdToRefId:Map[Int, Int] = reaction_container.reaction_ids
        val reaction_ref:List[UnitReactionRef] = reaction_container.reactions
        val reaction_sout_container = reactionStateOutsProjection(k,process,business,title,desc,reaction_ref,reactionsIdToRefId,stateIdToRefId)
        val reaction_state_outIdToRefId = reaction_sout_container.outs_ids



        Some(RefResulted(
          proc_elems = idToRefId.values.toList,
          space_elems = conv_sp_elems.values.toList,
          spaces = conv_spaces.values.toList,
          states = stateIdToRefId.values.toList,
          switches = switcherIdToRefId.values.toList,
          reactions = reactionsIdToRefId.values.toList,
          reaction_state_outs = reaction_state_outIdToRefId.values.toList,
          topoElem = topoElem.values.toList,
          topoSpaceElem = topoSpaceElem.values.toList
        ))
      }

      case _ => None // Ref not found
    }
  }
  private def makeTopolog(process: Int, front_elem_id: Option[Int], space_elem_id: Option[Int]):Int = {
    //println(front_elem_id)
    ElemTopologDAO.pull_object(ElemTopology(
      id = None,
      process = process,
      front_elem_id = front_elem_id,
      space_elem_id = space_elem_id,
      hash = "",
      space_id = None))
  }
}
