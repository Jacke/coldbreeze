package main.scala.bprocesses

import com.typesafe.scalalogging.Logger
import main.scala.simple_parts.process._
import main.scala.utils.Space
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
  def toStation(bp: BProcess): BPStation
  def toLoggerBefore(bp: BProcess, result: BPLoggerResult)
  def toStationLogger(sygnal: String): Array[BPStationLoggerResult]
  def haltProcess(state: String, rate:Int = 0, reason: String = "flow")

  def bottomLineOperate(el: ProcElems) = {
    val reactions = collectReactions(el)
    applyReactions(el, reactions)
  	val switchers = collectSwitchers(el)
  	decision(switchers, el)
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
  	reactions
  }
  def applyReactions(el: ProcElems, reactions: List[UnitReaction]) = {
  		reactions.foreach(reaction => reaction.execute(bp, Some( el ) ))
  }
/**
*  TODO: Decision queue
*  two switcher for 2 action invoke first action, then second.
**/
/**
*  TODO: Add reaction autostart from ligthed state 
**/


/**
*
* Common bottom line
* for element
**/
def commonBottomLine(elem: ProcElems) = { // Collision fixes
  if (elem.states.length < 1) {
    elem.bprocess.station.update_state(false)
  } else {
 toLoggerBefore(bp, BPLoggerResult(
        elem,
        composite = None,
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
                                  composite = None,
                                  order     = elem.order,
                                  space     = None,
                                  station   = toStation(bp),
                                  invoked   = true,
                                  expanded  = false,
                                  container = false))
  if (!bp.station.paused) {
    lightElem(elem = elem, state = "finished")

    // \|/ DEPRECATED WITH : lightElem(elem = elem, state = "invoked")
    //toStation(bp).update_step(station.step + 1)
  }
  // Sygnal step inc elem invoked
  }
}
def commonSpaceBottomLine(space: Space) = {
  /*
  toLoggerBefore(bp, BPLoggerResult(

    elem,
    composite = None,
    order     = elem.order,
    space     = None,
    station   = toStation(bp),
    invoked   = true,
    expanded  = false,
    container = false)
  )
*/

  NInvoker.toApplogger("Switchers:")
  space.session_states.foreach { state =>
    NInvoker.toApplogger(state.title + " " + state.switchers.length.toString)
    state.switchers.foreach(sw => NInvoker.toApplogger(sw.toString))
  }
  NInvoker.toApplogger("**** SPACE RUN" + space.toString + " ****")

  toStationLogger("prepareinvoking")
  lightSpace(space = space, state = "lap")

/*
  lightElem(elem = elem, state = "invoked")
  toStationLogger("invoked")
  NInvoker.toApplogger(elem.getClass)
  toLogger(bp, BPLoggerResult(
    elem,
    composite = None,
    order     = elem.order,
    space     = None,
    station   = toStation(bp),
    invoked   = true,
    expanded  = false,
    container = false))
  if (!bp.station.paused) {
    lightElem(elem = elem, state = "finished")

    // \|/ DEPRECATED WITH : lightElem(elem = elem, state = "invoked")
    //toStation(bp).update_step(station.step + 1)
  }
  // Sygnal step inc elem invoked
*/
}






/**
*
* Desicion making about marker movement
*
**/
  def decision(switchers: List[UnitSwitcher], el: ProcElems) = {
    println("decision making")
    println(s"founded ${switchers.length} switchers, applying")

    switchers.foreach { switcher =>
      println(s"""applying switcher, 
                ${switcher.switch_type},
                ${switcher.fn},
                ${switcher.target}
                """)
 		  applySwitcher(switcher, el)
    }
    def applySwitcher(switcher: UnitSwitcher, el: ProcElems) {
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

        bp.station.applySwitcher(switcher.fn, switcher.target, switcher.switch_type, el)
    }
    println(bp.nimarker)

    println(bp.station)

  }
  def decisionForSpace(switchers: List[UnitSwitcher], space: Space):Unit = {
    switchers.foreach { switcher =>
      applySwitcher(switcher, space)
    }

    def applySwitcher(switcher: UnitSwitcher, space: Space): Unit = {
      bp.station.applySwitcherForSpace(switcher.fn, switcher.target, switcher.switch_type, space)
    }
  }

}
