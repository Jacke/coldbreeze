package main.scala.bprocesses

import com.typesafe.scalalogging.Logger
import main.scala.simple_parts.process._
import main.scala.utils.Space
import main.scala.bprocesses._
import main.scala.simple_parts.process.Units._
/*
	+----------+             +---------------+       +--------------------+
	|          |             |               |       |                    |
	| Init     +-------------+  Invoke       +--+NP+-+  Finish            |
	|          |             |austart|       |       | (invoke Not paused)|
	|          |             |       |       |       |                    |
	+----------+             +------+--------+       +----------+---------+
                                |                           |
                                |                           |
                                |                           |
                                |                           |
                                |                           |
                       +--------+-----------------+---------+
                       |                  |If all + then
                       |Common states     |goes to finished state
                       |                  |
                       +------------------+
*/
trait PredefSwitchersLighter extends InvokeLogger with InvokeElemDataLogger
with ActionAutostart {

val INIT_STATE = "initiated"
val INVOKE_STATE = "invoked"
val FINISH_STATE = "finished"
val CANCEL_STATE = "canceled"

val COMMON_STATES = List(
						INIT_STATE,
						INVOKE_STATE,
						FINISH_STATE,
						CANCEL_STATE
						)

def elementStartInvokationStage(bp: BProcess, elem: ProcElems) = {
	println(s" ")
	println(s"************************************************")
	println(s"elementStartInvokationStage for ${elem.title}")
	//elem.bprocess.station.update_state(false)

	pushToLoggerBefore(bp, BPLoggerResult(
        elem,
        composite = None,
        order     = elem.order,
        space     = None,
        station   = getStation(bp),
        invoked   = true,
        expanded  = false,
        container = false)
    )	
 	//printToConsoleElemData(elem)
	// REACTION TEST
	elem.reactions.foreach(r => println("reaction "+r.title+" "+r.autostart))
	println("AUTOSTART: "+elem.reactions.filter(r => r.autostart == true).length)
	// ELEMENT STATES
	elem.states.map { state =>
	  println("state: "+state.title + " "+state.switchers.length)
	}

 	/***************************************************************************************/
 	/***************************************************************************************/
 	/***************************************************************************************/
 	/* Main execution																	   *
 	 */
	// init state 				// invoking state  			 // finished/canceled state
    elemInitStage(bp, elem);    elemInvokingStage(bp, elem); elemFinishCancelStage(bp, elem)

	println(s" ")
	println(s"************************************************")
 	/***************************************************************************************/
 	/***************************************************************************************/
}


/***
 * Stages
 */
// 1) init stage
def elemInitStage(bp: BProcess, elem: ProcElems) = {
	if (!skipState(elem, INIT_STATE) && !stateValue(elem, INVOKE_STATE)) {
	  pushToStationLogger(bp,"initiating")
      elemNewLigher(bp, elem = elem, state = INIT_STATE)
	  pushToStationLogger(bp,"initiated")
	}
}

// 2) invoking stage   
def elemInvokingStage(bp: BProcess, elem: ProcElems) = {
	if (!skipState(elem, INVOKE_STATE)) {
      pushToStationLogger(bp,"invoking")
  	  // autostart run only once per 
  	  // full invokation element(therefore we use partial invokation rate)
  	  if (stateValueRate(elem, INVOKE_STATE) < 49) {
		  val autoStartActions = elem.reactions.filter(r => r.autostart == true)
	  	  val autoStartActionsResults = executeActions(bp, elem, autoStartActions.toList)
//	  	  bp.station.absoluteStepInc()
  	  }
  	  // partial invokation of element
  	  elemNewPartialLigher(bp, elem = elem, state = INVOKE_STATE, 50)
      // common states
      elemCommonStage(bp, elem)

	  if (!bp.station.paused) { // double check paused
	  	  elemNewLigher(bp, elem = elem, state = INVOKE_STATE)
	      pushToStationLogger(bp,"invoked")
	  }
    }
}

// 3) common stage executor 
def elemCommonStage(bp: BProcess, elem: ProcElems) = {
  // that will block execution when common states not complete
  // by lighting pause on launch   
  // check completing common states
  val commonStates = elem.session_states.filter(state =>
  	!COMMON_STATES.contains(state.title)
  )
  println("commonStates LENGTH:"+ commonStates.length)
  if (commonStates.length > 0) {
	  val commonComplete = commonStates.map(cs => cs.on).reduce(_&&_)
	  commonComplete match {
	  	case true =>
	  	case _ => {
		  // if they all completed then move to finished through main flow
		  println("otherwise pause launch")
		  bp.station.applySwitcher("paused", "process", "switch_type",elem)  		
	  	}
	  }
  }
}

def elemFinishCancelStage(bp: BProcess, elem: ProcElems) = {
  if (!bp.station.paused) { // double check paused
	if (!skipState(elem, FINISH_STATE) && !stateValue(elem, CANCEL_STATE) ) {
	  pushToStationLogger(bp,"finishing")
	  elemNewLigher(bp, elem = elem, state = FINISH_STATE)
	  pushToStationLogger(bp,"finished")
	  println("step increment 111111111111111>>>>>>>>>>>>>>")
      bp.station.applySwitcher("inc", "step", "switch_type",elem)
	}
	// Cancel only when cancel state exist and lighed
	if (!skipState(elem, CANCEL_STATE) && stateValue(elem, CANCEL_STATE)) {
	  pushToStationLogger(bp,"canceling")
	  elemNewLigher(bp, elem = elem, state = CANCEL_STATE)
	  pushToStationLogger(bp,"canceled")		
	  bp.station.applySwitcher("stoped", "process", "switch_type",elem)
	}
  }
}

/***
 * Element control methods
 */
 // state.on == false -> state.on == true
def elemNewLigher(bp: BProcess, elem: ProcElems, state: String) = {
	val rate: Int = 100 
	val reason: String = "flow"
	println(s"Light ${elem.title} with State ${state} to ${rate}") 
	elem.session_states.find(_.title == state) match {
		case Some(state) => {
			state.on = true
			state.on_rate = rate
			pushToSessionStateLog(bp, state.id.get, state.on, state.on_rate, reason)
		}
		case _ =>
	}
}
// state.on_rate == rate && state.on == false (rate)-> state.on_rate == rate && state.on == false
def elemNewPartialLigher(bp: BProcess, elem: ProcElems, state: String, rate: Int) = {
	val reason: String = "flow"
	println(s"Light ${elem.title} with State ${state} to ${rate}") 
	elem.session_states.find(st => (st.title == state && st.on_rate < rate) && (rate < 101) ) match {
		case Some(state) => {
			state.on = false
			state.on_rate = rate
			pushToSessionStateLog(bp, state.id.get, state.on, state.on_rate, reason)
		}
		case _ =>
	}
}

// get state value
def stateValue(elem: ProcElems, stateInitialId: String): Boolean = 
	elem.session_states.find(st => st.title == stateInitialId) match {
		case Some(state) => state.on
		case _ => false
	}
def stateValueRate(elem: ProcElems, stateInitialId: String): Int = 
	elem.session_states.find(st => st.title == stateInitialId) match {
		case Some(state) => state.on_rate
		case _ => 0
	}

// If state already lighed then we need to skip it
def skipState(elem: ProcElems, stateInitialId: String):Boolean = {
	val result = elem.session_states.find(st => st.title == stateInitialId) match {
		case Some(state) => state.on
		case _ => false
	}
	if (result) { println("skipState "+stateInitialId+" for elem: "+elem.title) }
	result
}


}

trait ActionAutostart {
	def executeActions(bp: BProcess, elem: ProcElems, actions: List[UnitReaction]) = {
		actions.map { action => 
			action.execute(bp, Some( elem) )
	    }
	}
}

trait CommonStateSwitcher {
	// confirmed state
}