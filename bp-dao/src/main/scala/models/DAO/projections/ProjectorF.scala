package models.DAO.projections

import main.scala.bprocesses.refs._
import main.scala.simple_parts.process._
import models.DAO.reflect._
import models.DAO._
import models.DAO.projections.ref._
import scala.concurrent.ExecutionContext.Implicits.global
import scala.concurrent.duration.Duration
import scala.concurrent.{ExecutionContext, Awaitable, Await, Future}
import scala.util.Try


object RefProjectorF extends FrontElemProjectionF
  with SpaceProjectionF
  with SpaceElemProjectionF
  with StateProjectionF
  with SwitcherProjectionF
  with ReactionProjectionF
  with ReactionStateOutProjectionF
  with ActionIternalProjectionF {

  def projecting(k: Int,
				process: Int,
				business: Int,
				title: String,
				desc: String = "",
				sc: String = "front",
				space_id: Option[Int] = None,
        refActionContainer: List[RefActionContainer] = List(),
        orderOpt: Option[Int] = None ):Future[Option[RefResulted]] = {

    models.DAO.reflect.RefDAOF.get(k).flatMap { refOpt =>
    refOpt match {
      case Some(ref) => {
        // Front fetching
        val front_containerF: Future[ElemProjectionContainer] =
        		frontElemsProjection(k, process, business, title, desc,sc, space_id, orderOpt)
		front_containerF.flatMap { front_container =>
		val idToRefId:Map[Int, Int] = front_container.elements
		val ref_ids:List[Int] = front_container.elem_ref.map(_.id.get)

        // Space fetching
        val space_containerF: Future[SpaceProjectionContainer] =
        		spacesProjection(k, process, business, title, desc, idToRefId, ref_ids)
		space_containerF.flatMap { space_container =>

		val conv_spaces:Map[Int, Int] = space_container.spaces_ids
		val space_refs:List[UnitSpaceRef] = space_container.spaces_refs
		val last_index:Int = space_container.last_index

        // Space elem fetching
        val space_elem_containerF: Future[SpaceElemProjectionContainer] =
    		spaceElemsProjection(k, process, business, title, desc, conv_spaces)

		space_elem_containerF.flatMap { space_elem_container =>
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
        val state_containerF: Future[StateProjectionContainer] =
        	statesProjection(k, process, business, title, desc,idToRefId, conv_spaces, conv_sp_elems, scope=sc)
        state_containerF.flatMap { state_container =>
        val stateIdToRefId = state_container.states_ids
        // Fetch switchers
        val switcher_containerF: Future[SwitcherProjectionContainer] =
        	switcherProjection(k, process, business, title, desc, stateIdToRefId)
        switcher_containerF.flatMap { switcher_container =>
        val switcherIdToRefId = switcher_container.switcher_ids



        // TOPOLOGY MAKING
        val toposF = ReflectElemTopologDAOF.findByRef(k)
        toposF.flatMap { topos =>
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
    		val reaction_containerF: Future[ReactionProjectionContainer] =
          reactionsProjection(k, process, business, title, desc, topoElem, topoSpaceElem)

    reaction_containerF.flatMap { reaction_container =>
		  val reactionsIdToRefId:Map[Int, Int] = reaction_container.reaction_ids
		  val reaction_ref:List[UnitReactionRef] = reaction_container.reactions
		  val reaction_sout_containerF: Future[ReactionStateOutProjectionContainer] =
        reactionStateOutsProjection(k,process,business,title,desc,reaction_ref,reactionsIdToRefId, stateIdToRefId)



      // Project middlewares and other stuff..
      val reactionCompnentsF = projectReactionComponents(reaction_container, refActionContainer )

      reactionCompnentsF.flatMap { reactionCompnents =>
  		reaction_sout_containerF.map { reaction_sout_container =>
  			val reaction_state_outIdToRefId = reaction_sout_container.outs_ids

          // Mapping ref action -> action
          reactionsIdToRefId.map { keyVal =>
          ReflectActionMappingsDAO.pull_object(
            ReflectedActionMap(id = None,
                              reflection = k,
                              ref_action = Some(keyVal._1),
                              element_action = keyVal._2,
                              created_at=Some(org.joda.time.DateTime.now()),
                              updated_at=Some(org.joda.time.DateTime.now())) )
            }

  	        Some(RefResulted(
              proc_elems = makeRefMapResult(idToRefId),
              space_elems = makeRefMapResult(conv_sp_elems),
              spaces = makeRefMapResult(conv_spaces),
              states = makeRefMapResult(stateIdToRefId),
              switches = makeRefMapResult(switcherIdToRefId),
              reactions = makeRefMapResult(reactionsIdToRefId),
              reaction_state_outs = makeRefMapResult(reaction_state_outIdToRefId),
              topoElem = makeRefMapResult(topoElem),
              topoSpaceElem = makeRefMapResult(topoSpaceElem),
              middlewares = makeRefMapResultLong(reactionCompnents.middleware),
              strategies = makeRefMapResultLong(reactionCompnents.strategy),
              inputs = makeRefMapResultLong(reactionCompnents.inputs),
              bases = makeRefMapResultLong(reactionCompnents.bases),
              outputs = makeRefMapResultLong(reactionCompnents.outputs)
  	        ))
      }
    }
    }

          }
	      }
		  }
		  }
	      }
	      }
	  }

      case _ => Future(None) // Ref not found
    }
  }
}

/***************************************************************************************
 *   Ref object id -> Object Id
 */
private def makeRefMapResult(values:Map[Int, Int]):List[RefMapResult] = {
  values.map { keyVal => RefMapResult(keyVal._1, keyVal._2, keyVal._1.toLong, keyVal._2.toLong) }.toList
}
private def makeRefMapResultLong(values:Map[Long, Long]):List[RefMapResult] = {
  values.map { keyVal => RefMapResult(-1,-1,keyVal._1,keyVal._2) }.toList
}

private def makeTopolog(process: Int, front_elem_id: Option[Int], space_elem_id: Option[Int]):Int = {
	//println(front_elem_id)
	ElemTopologDAOF.await(
		ElemTopologDAOF.pull_object(ElemTopology(
												  id = None,
												  process = process,
												  front_elem_id = front_elem_id,
												  space_elem_id = space_elem_id,
												  hash = "",
												  space_id = None))
	)
}

}
