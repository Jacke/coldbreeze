package models.DAO.projections.ref

import main.scala.bprocesses.refs.BPStateRef
import main.scala.bprocesses.refs.UnitRefs.{UnitReactionStateOutRef, UnitSwitcherRef, UnitReactionRef, UnitSpaceRef}
import main.scala.simple_parts.process.Units.UnitElement
import models.DAO._
import models.DAO.reflect._



case class SwitcherProjectionContainer(switcher_ids: Map[Int,Int], switchers: List[UnitSwitcherRef])
trait SwitcherProjection {
  def switcherProjection(k: Int, process: Int, business: Int, title: String, desc: String = "", stateIdToRefId: Map[Int,Int]):SwitcherProjectionContainer = {
    val switchers:List[UnitSwitcherRef] = SwitcherRefDAO.findByRef(k)
    val switcherIdToRefId:Map[Int, Int] = stateIdToRefId.map( m =>
      switchers.filter(pred => pred.state_ref == m._1).map( sw =>
        sw.id.get -> SwitcherDAO.pull_object(sw.reflect(process, m._2, session = None))
      )).flatten.toMap
    SwitcherProjectionContainer(switcherIdToRefId, switchers)
  }
}

case class StateProjectionContainer(states_ids: Map[Int,Int], state_refs: List[BPStateRef])
trait StateProjection {

  def statesProjection(k: Int, process: Int,
                       business: Int, title: String,
                       desc: String = "",
                       idToRefId:     Map[Int, Int],
                       conv_spaces:   Map[Int, Int],
                       conv_sp_elems: Map[Int, Int],
                       scope: String = "front"): StateProjectionContainer = {
    val states:List[BPStateRef] = BPStateRefDAO.findByRef(k)

    val stateIdToRefId:Map[Int, Int] = ((idToRefId.map { m =>
      states.filter(pred => pred.front_elem_id == Some(m._1)).map { el =>
        el.id.get -> BPStateDAO.pull_object(el.reflect(process, front_elem_id = forFront(Some(m._2), scope), space_elem_id = forNested(Some(m._2), scope), space_id = None))
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

    StateProjectionContainer(states_ids = stateIdToRefId, state_refs = states)
  }

  /**
   * Helpers for scope definition
   * @param value
   * @param scope
   * @return id of element, either space_elem_id either front_elem_id
   */
  def forFront(value: Option[Int], scope: String):Option[Int] = {
    scope match {
      case "front" => value
      case "nested" => None
    }
  }
  def forNested(value: Option[Int], scope: String):Option[Int] = {
    scope match {
      case "front" => None
      case "nested" => value
    }
  }
}

case class ReactionProjectionContainer(reaction_ids: Map[Int,Int], reactions:List[UnitReactionRef])
trait ReactionProjection {
  def reactionsProjection(k: Int, process: Int, business: Int,
                          title: String, desc:String = "",
                           topoElem:      Map[Int, Int],
                           topoSpaceElem: Map[Int, Int]): ReactionProjectionContainer  = {

    val reactions:List[UnitReactionRef] = ReactionRefDAO.findByRef(k)
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

    ReactionProjectionContainer(reactionsIdToRefId, reactions)

  }
}

case class ReactionStateOutProjectionContainer(outs_ids: Map[Int,Int], outs: List[UnitReactionStateOutRef])
trait ReactionStateOutProjection {
  def reactionStateOutsProjection(k: Int,process: Int,
                                  business:Int,title:String,
                                  desc:String = "",
                                  reaction_ref: List[UnitReactionRef],
                                  reactionsIdToRefId: Map[Int,Int],
                                  stateIdToRefId:Map[Int,Int] ): ReactionStateOutProjectionContainer = {
    val reaction_state_out:List[UnitReactionStateOutRef] = ReactionStateOutRefDAO.findByReactionRefs(reaction_ref.map(_.id.get))
    val reaction_state_outIdToRefId:Map[Int, Int] = reactionsIdToRefId.map { m =>
      reaction_state_out.filter(pred => pred.reaction == m._1).map { out =>
        out.id.get -> ReactionStateOutDAO.pull_object(out.reflect(state_ref = stateIdToRefId.find(s => s._1 == out.state_ref).get._2, reaction = m._2))
      }
    }.flatten.toMap // TODO: Problem???
    ReactionStateOutProjectionContainer(reaction_state_outIdToRefId, reaction_state_out)
  }
}