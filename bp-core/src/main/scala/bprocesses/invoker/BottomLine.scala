package main.scala.bprocesses

import com.typesafe.scalalogging.Logger
import main.scala.simple_parts.process._
import main.scala.utils.Space
import org.slf4j.LoggerFactory
import main.scala.bprocesses._
import main.scala.simple_parts.process.Units._
/**
 * *
 * ** Grand invoking algorithm
 * ** © Stanislav @stanthoughts 2014-2015
 * *
 */

trait BottomLine extends StateLigher {

  val bp: BProcess
  def toLogger(bp: BProcess, result: BPLoggerResult)
  def toLoggerBefore(bp: BProcess, result: BPLoggerResult) = bp.logger.logBefore(result)
  def toStationLogger(sygnal: String) = bp.station.station_logger.log(BPStationLoggerResult(bp.station, sygnal, bp.station.state_represent))


  def bottomLineOperate(el: ProcElems) = {
    val reactions = collectReactions(el)
    applyReactions(el, reactions)
  	val switchers = collectSwitchers(el)
  	decision(switchers)
  }
/**
*
* Prepare for decision
*
**/

  def collectSwitchers(el: ProcElems) = {
    val switchers: List[UnitSwitcher] = el.session_states.filter(state => state.on == true).map(st => st.switchers).flatten.toList
    val switchers_priorities: List[Int] = switchers.map(_.priority)
    switchers
  }
  def collectReactions(el: ProcElems) = {
  	val reactions: List[UnitReaction] = el.reactions.toList
  	val auto_started_creations = reactions.filter(reaction => reaction.autostart == true)
  }
  def applyReactions(el: ProcElems, reactions: = List[UnitReaction]) = {
  		reactions.foreach(reaction => reaction.execute(bp))
  }
/**
*  TODO: Decision queue
*  two switcher for 2 action invoke first action, then second.
**/
/**
*  TODO: Add reaction autostart from ligthed state 
**/


/**
* Common bottom line
* for element
**/
def commonBottomLine(elem: ProcElems) = {
 toLoggerBefore(bp, BPLoggerResult(
        elem,
        composite = bp.copyCV(elem.values),
        order     = elem.order,
        space     = None,
        station   = toStation(bp),
        invoked   = true,
        expanded  = false,
        container = false)
      )

      NInvoker.toApplogger("Switchers:")
      elem.session_states.foreach { state => 
        NInvoker.toApplogger(state.title + " " + state.switchers.length.toString)
        state.switchers.foreach(sw => NInvoker.toApplogger(sw.toString))
       }
      NInvoker.toApplogger("**** RUN" + elem.toString + " ****")

      toStationLogger("prepareinvoking")
      lightElem(elem = elem, state = "initiated")

   
      lightElem(elem = elem, state = "invoked")
      toStationLogger("invoked")
      NInvoker.toApplogger(elem.getClass)
      toLogger(bp, BPLoggerResult(
                                  elem,
                                  composite = bp.copyCV(elem.values),
                                  order     = elem.order,
                                  space     = None,
                                  station   = toStation(bp),
                                  invoked   = true,
                                  expanded  = false,
                                  container = false))
  if (!station.paused) {
    lightElem(elem = elem, state = "finished")
    // DEPRECATED WITH : lightElem(elem = elem, state = "invoked")
    //toStation(bp).update_step(station.step + 1)
  }
  // Sygnal step inc elem invoked
}







/**
*
* Desicion making about marker movement
*
**/
  def decision(switchers: List[UnitSwitcher]) = {

    switchers.foreach { switcher =>
 		applySwitcher(switcher)
    }

    def applySwitcher(switcher: UnitSwitcher) {
    	/*
    	switcher.switch_type match {
        	case "n" => {
        		bp.station.applySwitcher(switcher.fn, switcher.target)
        	} /* For next */
        	case "p" => { 
        		bp.station.applySwitcher(switcher.fn, switcher.target)
        	} /* For pause */
        	case "play" => {
        		bp.station.applySwitcher(switcher.fn, switcher.target)
        	}
        	case "stp" => {
        		bp.station.applySwitcher(switcher.fn, switcher.target)
        	}
        	case "in" => {
        		bp.station.applySwitcher(switcher.fn, switcher.target)
        	} /* For in */
        	case "out" => {
        		bp.station.applySwitcher(switcher.fn, switcher.target)
        	} /* For out */
        	case "inn" => {
        		bp.station.applySwitcher(switcher.fn, switcher.target)
        	} /* For in next */
        	case "outn" => {
        		bp.station.applySwitcher(switcher.fn, switcher.target)
        	} /* For out next */        	
        	case _ => 
        } */       

        bp.station.applySwitcher(switcher.fn, switcher.target, switcher.switch_type)
    }
    println(bp.nimarker)
    println(bp.station)
  }
}
