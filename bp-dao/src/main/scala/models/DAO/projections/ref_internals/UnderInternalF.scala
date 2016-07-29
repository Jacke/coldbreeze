package models.DAO.projections.ref

import main.scala.bprocesses.refs.BPStateRef
import main.scala.bprocesses.refs._
import main.scala.simple_parts.process._
import models.DAO._
import models.DAO.reflect._
import scala.concurrent.ExecutionContext.Implicits.global
import scala.concurrent.duration.Duration
import scala.concurrent.{ExecutionContext, Awaitable, Await, Future}
import scala.util.Try
case class SwitcherProjectionContainer(switcher_ids: Map[Int,Int], 
  switchers: List[UnitSwitcherRef])
case class StateProjectionContainer(states_ids: Map[Int,Int], 
  state_refs: List[BPStateRef])
case class ReactionProjectionContainer(reaction_ids: Map[Int,Int], 
  reactions:List[UnitReactionRef])
case class ReactionStateOutProjectionContainer(outs_ids: Map[Int,Int], 
  outs: List[UnitReactionStateOutRef])


trait SwitcherProjectionF {
  def switcherProjection(k: Int,
                        process: Int,
                        business: Int,
                        title: String,
                        desc: String = "",
                        stateIdToRefId: Map[Int,Int]): Future[SwitcherProjectionContainer] = {
    val switchersF: Future[Seq[UnitSwitcherRef]] = SwitcherRefDAOF.findByRef(k)
    switchersF.map { switchers =>
        val switcherIdToRefId:Map[Int, Int] = stateIdToRefId.map( m =>
          switchers.toList.filter(pred => pred.state_ref == m._1).map( sw =>
            sw.id.get -> SwitcherDAOF.await( SwitcherDAOF.pull(sw.reflect(process, m._2, session = None)) ) 
          )).flatten.toMap
        SwitcherProjectionContainer(switcherIdToRefId, switchers.toList)
      }
    }
}

trait StateProjectionF {
  def statesProjection(k: Int, process: Int,
                       business: Int, title: String,
                       desc: String = "",
                       idToRefId:     Map[Int, Int],
                       conv_spaces:   Map[Int, Int],
                       conv_sp_elems: Map[Int, Int],
                       scope: String = "front"): Future[StateProjectionContainer] = {
    val statesF: Future[Seq[BPStateRef]] = BPStateRefDAOF.findByRef(k)
    statesF.map { states =>
      val stateIdToRefId:Map[Int, Int] = ((idToRefId.map { m =>
        states.toList.filter(pred => pred.front_elem_id == Some(m._1)).map { el =>
          el.id.get -> SwitcherDAOF.await( BPStateDAOF.pull(el.reflect(process, front_elem_id = forFront(Some(m._2), scope), space_elem_id = forNested(Some(m._2), scope), space_id = None))
       )  }

      }) ++ (conv_spaces.map { m =>
        states.toList.filter(pred => pred.space_id == Some(m._1)).map { el =>
          el.id.get -> SwitcherDAOF.await( BPStateDAOF.pull(el.reflect(process, space_id = Some(m._2), space_elem_id = None, front_elem_id = None)) )
        }
      }) ++ (conv_sp_elems.map { m =>
        states.toList.filter(pred => pred.space_elem_id == Some(m._1)).map { el =>
          el.id.get -> SwitcherDAOF.await( BPStateDAOF.pull(el.reflect(process, space_elem_id = Some(m._2), space_id = None, front_elem_id = None)) )
        }
      })).flatten.toMap
      StateProjectionContainer(states_ids = stateIdToRefId, state_refs = states.toList)
    }
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

trait ReactionProjectionF {
  def reactionsProjection(k: Int, process: Int, business: Int,
                          title: String, desc:String = "",
                           topoElem:      Map[Int, Int],
                           topoSpaceElem: Map[Int, Int]): Future[ReactionProjectionContainer]  = {

    val reactionsF:Future[Seq[UnitReactionRef]] = ReactionRefDAOF.findByRef(k)
    reactionsF.map { reactions =>
      val reactionsIdToRefId:Map[Int, Int] = (topoElem.map ( m =>
        reactions.toList.filter(pred => pred.element == m._1).map ( react =>
          react.id.get -> SwitcherDAOF.await( ReactionDAOF.pull(react.reflect(process, m._2, from_state = None))  )// TODO: Make that work from state
        )
      ).flatten ++
        topoSpaceElem.map ( m =>
          reactions.toList.filter(pred => pred.element == m._1).map ( react =>
            react.id.get -> SwitcherDAOF.await( ReactionDAOF.pull(react.reflect(process, m._2, from_state = None)) ) // TODO: Make that work from state
          )
        ).flatten
        ).toMap
      ReactionProjectionContainer(reactionsIdToRefId, reactions.toList)
    }
  }
}

trait ReactionStateOutProjectionF {
  def reactionStateOutsProjection(k: Int,process: Int,
                                  business:Int,title:String,
                                  desc:String = "",
                                  reaction_ref: List[UnitReactionRef],
                                  reactionsIdToRefId: Map[Int,Int],
                                  stateIdToRefId:Map[Int,Int] ): Future[ReactionStateOutProjectionContainer] = {
    val reaction_state_outF:Future[Seq[UnitReactionStateOutRef]] =
            ReactionStateOutRefDAOF.findByReactionRefs(reaction_ref.map(_.id.get))
    reaction_state_outF.map { reaction_state_out =>
      val reaction_state_outIdToRefId:Map[Int, Int] = reactionsIdToRefId.map { m =>
        reaction_state_out.toList.filter(pred => pred.reaction == m._1).map { out =>
          out.id.get -> SwitcherDAOF.await( ReactionStateOutDAOF.pull(out.reflect(state_ref = stateIdToRefId.find(s => s._1 == out.state_ref).get._2,
                                                                    reaction = m._2)) )
        }
      }.flatten.toMap // TODO: Problem???
      ReactionStateOutProjectionContainer(reaction_state_outIdToRefId, reaction_state_out.toList)
    }
  }
}
