package bprocesses
import main.scala.simple_parts.process._
import main.scala.simple_parts.process.Units._
import main.scala.bprocesses._
import main.scala.utils._
import com.github.nscala_time.time.Imports._
import scala.collection.mutable.ListBuffer  
import com.typesafe.scalalogging.Logger
import org.slf4j.LoggerFactory

case class ActionParts(
  process: BProcess,
  elem: ProcElems,
  action: UnitReaction
)

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
  def executeWithMiddleware(process: BProcess, elemOpt: Option[ProcElems], reaction: UnitReaction) {
      toApplogger(s"Found ${reaction.middlewares.length} middlewares for ${reaction.title} action")
      val middleware = reaction.middlewares.head

      val elem = elemOpt.get // MUST ALLWAYS BE VISIBLE

      //    * 1. Check inputs
      val stateInputs = reaction.reaction_state_ins
      val dataInputs  = reaction.reaction_data_ins
      // MinorityJobOp("TURNON_STATE", 1, "100")
      // MinorityJobOp("RESUME_LAUNCH", 1)
      /**
       * TODO: Add logic and expressions execution
       */


       // project middleware and its relatives 
       // invoke them
       println( middleware.executeStrategy(ActionParts(process, elem, reaction) ) )
  }

  def execute(process: BProcess, reaction: UnitReaction) = {
      val topo = retriveActionElementByTopology(process, reaction)
      if (topo.isDefined) {
        val element = retriveElementByTopo(topo.get, process)
        toApplogger(
s"""Found ${reaction.reaction_state_outs.length} state outs for ${reaction.title} action"""
        )
        plainOldAction(reaction, element)
      }
  }

  /**
   * Plain old action used for execution simple states
   * example: Confirm action -> will light confirmed state
   */
  def plainOldAction(reaction: UnitReaction, element: ProcElems) = {
    reaction.reaction_state_outs.foreach { out => 
      element.session_states.find(st => st.origin_state.getOrElse(0) == out.state_ref) match {
        case Some(state) => {
          // update state with
          println(s"execute state ${state.title} by ${out.on}")
          state.on = out.on
          state.on_rate = out.on_rate
        }
        case _ => {
          println("not found")
        }
      }
    }
  }


  // find element by topolog
  def retriveActionElementByTopology(process: BProcess, reaction: UnitReaction) = 
    process.topology.find(topo => topo.id == Some(reaction.element))

  def retriveElementByTopo(topo: ElemTopology, bp: BProcess):ProcElems = {
    topo.front_elem_id match {
      case Some(elem_id) => bp.variety.find(el => elem_id == el.id).get
      case None => bp.spacesElements.find(el => topo.space_elem_id.getOrElse(-1) == el.id).get
    }
  }

}