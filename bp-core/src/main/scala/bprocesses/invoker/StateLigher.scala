package main.scala.bprocesses



import com.typesafe.scalalogging.Logger
import main.scala.simple_parts.process._
import main.scala.utils.Space
import org.slf4j.LoggerFactory
import main.scala.bprocesses._
import main.scala.simple_parts.process.Units._
/****
 *** Rude State Machine
 *** © Stanislav iamjacke@gmail.com 2014-2015
 ***/

trait StateLigher extends BottomLine {
	val bp: BProcess

	def lightElem(elem: ProcElems, state: String, rate: Int = 100, reason: String = "flow"):Unit = {
		elem.session_states.find(_.title == state) match {
			case Some(state) => {
				state.on = true
				state.on_rate = 100
				decision(switchers = state.switchers.toList)
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