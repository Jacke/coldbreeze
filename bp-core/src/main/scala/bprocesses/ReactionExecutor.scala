package bprocesses
import main.scala.simple_parts.process._
import main.scala.simple_parts.process.Units._
import main.scala.bprocesses._
import main.scala.utils._
import com.github.nscala_time.time.Imports._
import scala.collection.mutable.ListBuffer  
import com.typesafe.scalalogging.Logger
import org.slf4j.LoggerFactory

object ReactionExecutor {

  val appLogger = Logger(LoggerFactory.getLogger("ReactionExecutor"))
  def toApplogger(msg: Any, log_type: String = "info") = {
      log_type match {
        case "debug" => appLogger.info(msg.toString)
        case "info" => appLogger.info(msg.toString)
        case "error" => appLogger.info(msg.toString)
      }
  }
  /**
   * Temp help
   * 1. Check inputs
   * 2. Decide strategy
   * 3. Push that to queue
   * Delayed job:
   * 4. Change state
   * 5. Resume process launch
   */
  def executeWithMiddleware(process: BProcess, reaction: UnitReaction) {
      toApplogger(s"Found ${reaction.middlewares.length} middlewares for ${reaction.title} action")
      val middleware = reaction.middlewares.head

      //    * 1. Check inputs
      val stateInputs = reaction.reaction_state_ins
      val dataInputs  = reaction.reaction_data_ins
      // MinorityJobOp("TURNON_STATE", 1, "100")
      // MinorityJobOp("RESUME_LAUNCH", 1)


  }

	def execute(process: BProcess, reaction: UnitReaction) {
      /**
       * TODO: Add logic and expressions execution
       */
      // find element by topolog
      val topo = process.topology.find(topo => topo.id == Some(reaction.element))
      if (topo.isDefined) {
      val element = retriveElementByTopo(topo.get, process)
      toApplogger(s"Found ${reaction.reaction_state_outs.length} state outs for ${reaction.title} action")
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
  }

  def retriveElementByTopo(topo: ElemTopology, bp: BProcess):ProcElems = {
    topo.front_elem_id match {
      case Some(elem_id) => bp.variety.find(el => elem_id == el.id).get
      case None => bp.spacesElements.find(el => topo.space_elem_id.getOrElse(-1) == el.id).get
    }
  }

}