package main.scala.bprocesses

import com.typesafe.scalalogging.Logger
import main.scala.simple_parts.process._
import main.scala.utils.Space
import org.slf4j.LoggerFactory
import main.scala.bprocesses._
import main.scala.simple_parts.process._
/****
 *** Rude State Machine
 *** © Stanislav iamjacke@gmail.com 2014-2015
 ***/

trait StateLigher extends SpaceStateLigher {
	val bp: BProcess
	def decision(switchers: List[UnitSwitcher], el: ProcElems)
  def decisionForSpace(switchers: List[UnitSwitcher], space: Space):Unit

  def lightSpace(space: Space, state: String, rate: Int = 100, reason: String = "flow"):Unit = {
    space.session_states.find(_.title == state) match {
      case Some(state) => {
        state.on = true
        state.on_rate = rate
        /**
         * Existed switcher for Some(state) scope.
         *****
         * Some(state) scope is scope for launching of common states (initiate, invoke, finish)
         *****
         */
        val existed_switchers = state.switchers.toList.map(_.id)
        /**
         * Find switcher override from all states of element
         * We have common state with switcher e.g. pause
         * We find same override group switcher e.g. next and we dont execute pause, we execute next switcher, because it's overriden
         *
         * !existed_switchers.contains(sw.id) check for switcher, that doesnt exist in Some(state) scope.
         *
         *****
         * Some(state) scope is scope for launching of common states (initiate, invoke, finish)
         *****
         */
        val override_group = space.session_states
          .filter(_.on == true)
          .map(_.switchers.toList)
          .flatten
          .find(sw => sw.override_group != 0 && Some(sw.state_ref) != state.origin_state && !existed_switchers.contains(sw.id)) match {
          case Some(overriding) => overriding.state_ref
          case _ => 0
        }
        /**
         * Ovveride group is state id that may used for overriding
         */
        val on_state:Option[BPSessionState] = space.session_states.find { st =>
          st.on == true && st.title != state.title && (override_group != 0 && Some(override_group) == st.origin_state)
        }


        /**
         * If we find ovveride group we ovveride it in value `on_state`
         * If dont, we run common state as allways
         */
        NInvoker.toApplogger("Override switcher is")
        NInvoker.toApplogger(on_state)
        NInvoker.toApplogger("//END")

        on_state match {
          case Some(x) => decisionForSpace(switchers = x.switchers.toList, space)
          case _ => decisionForSpace(switchers = state.switchers.toList, space)
        }
        makeSessionStateLog(state.id.get, state.on, state.on_rate, reason)
      }
      case _ =>

    }
  }

	def lightElem(elem: ProcElems, state: String, rate: Int = 100, reason: String = "flow"):Unit = {

      println("StateLigher:: lightElem called")     
      println(s"Light ${elem.title} with State ${state} to ${rate}") 
  		elem.session_states.find(_.title == state) match {
  			case Some(state) => {
  				state.on = true
  				state.on_rate = rate

        /**
         * Existed switcher for Some(state) scope.
         *****
         * Some(state) scope is scope for launching of common states (initiate, invoke, finish)
         *****
         */
        val existed_switchers = state.switchers.toList.map(_.id)
        /**
         * Find switcher override from all states of element
         * We have common state with switcher e.g. pause
         * We find same override group switcher e.g. next and we dont execute pause, we execute next switcher, because it's overriden
         *
         * !existed_switchers.contains(sw.id) check for switcher, that doesnt exist in Some(state) scope.
         *
         *****
         * Some(state) scope is scope for launching of common states (initiate, invoke, finish)
         *****
         */
		val override_group = elem.session_states
          .filter(_.on == true)
          .map(_.switchers.toList)
          .flatten
          .find(sw => sw.override_group != 0 && Some(sw.state_ref) != state.origin_state && !existed_switchers.contains(sw.id)) match {
          case Some(overriding) => overriding.state_ref
          case _ => 0
        }
        /**
         * Ovveride group is state id that may used for overriding
         */
				val on_state:Option[BPSessionState] = elem.session_states.find { st => 
					st.on == true && st.title != state.title && (override_group != 0 && Some(override_group) == st.origin_state)
        }


        /**
         * If we find ovveride group we ovveride it in value `on_state`
         * If dont, we run common state as allways
         */
        NInvoker.toApplogger("Override switcher is")
        NInvoker.toApplogger(on_state)
        NInvoker.toApplogger("//END")

				on_state match {
				  case Some(x) => decision(switchers = x.switchers.toList, elem)
				  case _ => decision(switchers = state.switchers.toList, elem)
				}
				makeSessionStateLog(state.id.get, state.on, state.on_rate, reason)
			}
			case _ =>
		}
	}
	def haltElem(elem: ProcElems, state: String, rate: Int = 0, reason: String = "flow"):Unit = {
		elem.session_states.find(_.title == state) match {
			case Some(state) => {
				state.on = false
				state.on_rate = rate
				makeSessionStateLog(state.id.get, state.on, state.on_rate, reason)
			}
			case _ =>
		}
	}
	def lightProcess(state: String, rate: Int = 100, reason: String = "flow"):Unit = { 
		bp.session_states.find(_.title == state) match {
			case Some(state) => {
				state.on = true
				state.on_rate = rate
				makeSessionStateLog(state.id.get, state.on, state.on_rate, reason)
			}
			case _ =>
		}
	}
	def haltProcess(state: String, rate:Int = 0, reason: String = "flow"):Unit = { 
		bp.session_states.find(_.title == state) match {
			case Some(state) => {
				state.on = false
				state.on_rate = rate
				makeSessionStateLog(state.id.get, state.on, state.on_rate, reason)
			}
			case _ =>
		}
	}

	/**
	* Session state log
	**/
	/**
	case class SessionStateLog(var id: Option[Int], 
	  state_id: Int, 
	  on: Boolean, 
	  on_rate: Int, 
	  reason: String,
	  created_at:   Option[org.joda.time.DateTime] = None, 
	  updated_at:   Option[org.joda.time.DateTime] = None) 
	**/
	

	def makeSessionStateLog(state_id: Int, on: Boolean, on_rate: Int, reason: String) { 
		val result:SessionStateLog = SessionStateLog(None, bp.session_id, state_id, on, on_rate, reason, created_at = Some(org.joda.time.DateTime.now), updated_at = Some(org.joda.time.DateTime.now)) 
		bp.station.station_logger.sessionStateLog(result)
	}
	
}

trait SpaceStateLigher {

}