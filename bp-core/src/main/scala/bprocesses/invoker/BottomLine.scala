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

trait BottomLine {

  val bp: BProcess



/**
*
* Prepare for decision
*
**/

  def collectSwitchers(el: ProcElems) = {
    val switchers: List[UnitSwitcher] = el.session_states.filter(state => state.on == true).map(st => st.switchers).flatten.toList
    val switchers_priorities: List[Int] = switchers.map(_.priority)
    decision(switchers)
  }
  def collectReactions(el: ProcElems) = {
  	val reactions: List[UnitReaction] = el.reactions.toList
  	val auto_started_creations = reactions.filter(reaction => reaction.autostart == true)
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
    	switcher.switch_type match {
        	case "n" => {
        		bp.station.applySwitcher(switcher.fn, switcher.target)
        		} /* For next */
        	case "p" => println("pause");"pause"
        	case "play" => println("play");"play"
        	case "stp" => println("stop");"stop"
        	case "in" => {
        		bp.station.applySwitcher(switcher.fn, switcher.target)
        	} /* For in */
        	case "out" => {
        		bp.station.applySwitcher(switcher.fn, switcher.target)
        	} /* For out */
        	case _ => 
        } 
    }
    println(bp.nimarker)
    println(bp.station)
  }
}
