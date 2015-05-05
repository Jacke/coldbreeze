package bprocesses
import main.scala.simple_parts.process._
import main.scala.simple_parts.process.Units._
import main.scala.bprocesses._
import main.scala.utils._
import com.github.nscala_time.time.Imports._
import scala.collection.mutable.ListBuffer  
object ReactionExecutor {
	def execute(process: BProcess, reaction: UnitReaction) {
      /**
       * TODO: Add logic and expressions execution
       */
      // find element by topolog
      val topo = process.topology.find(topo => topo.id == Some(reaction.element))
      if (topo.isDefined) {
      val element = retriveElementByTopo(topo.get, process)
        reaction.reaction_state_outs.foreach { out => 
          element.session_states.find(st => st.origin_state.getOrElse(0) == out.state_ref) match {
            case Some(state) => {
              // update state with
              state.on = out.on
              state.on_rate = out.on_rate
            }
            case _ => {
              println("not found")
            }
          }
        }
      }

    def retriveElementByTopo(topo: ElemTopology, bp: BProcess):ProcElems = {
      if (topo.front_elem_id.isDefined) {
        bp.variety.find(el => topo.front_elem_id.get == el.id).get
      } else {
        bp.spacesElements.find(el => topo.space_elem_id.get == el.id).get
      }
    }

	}
}