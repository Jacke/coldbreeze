package main.scala.bprocesses



import com.typesafe.scalalogging.Logger
import main.scala.simple_parts.process._
import main.scala.utils.Space
import org.slf4j.LoggerFactory
import main.scala.bprocesses._
import main.scala.simple_parts.process.Units._
/****
 *** Grand invoking algorithm
 *** © Stanislav @stanthoughts 2014-2015
 ***/

trait StateLigher extends BottomLine {
	val bp: BProcess

	def lightElem(elem: ProcElems, state: String, rate: Int = 100):Unit = {
		elem.session_states.find(_.title == state) match {
			case Some(state) => {
				state.on = true
				state.on_rate = 100
				decision(switchers = state.switchers.toList)
			}
			case _ =>
		}
	}
	def haltElem(elem: ProcElems, state: String, rate: Int = 0):Unit = {
		elem.session_states.find(_.title == state) match {
			case Some(state) => {
				state.on = false
				state.on_rate = rate
			}
			case _ =>
		}
	}
	def lightProcess(state: String, rate: Int = 100):Unit = { 
		bp.session_states.find(_.title == state) match {
			case Some(state) => {
				state.on = true
				state.on_rate = rate
			}
			case _ =>
		}
	}
	def haltProcess(state: String, rate:Int = 0):Unit = { 
		bp.session_states.find(_.title == state) match {
			case Some(state) => {
				state.on = false
				state.on_rate = rate
			}
			case _ =>
		}
	}
}