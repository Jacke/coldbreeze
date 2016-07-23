package us.ority.min.actions.middlewares
import bprocesses._
import main.scala.bprocesses._
import main.scala.utils._
import com.github.nscala_time.time.Imports._
import scala.collection.mutable._  
import main.scala.simple_parts.process._

import main.scala.simple_parts.process._
import main.scala.simple_parts.process._
import main.scala.bprocesses._
import main.scala.utils._
import us.ority.min.jobs._
import us.ority.min.actions._

object DelayMiddleware {

  def execute(
    parts: ActionParts, 
    s: Strategy, 
    strategyArgument: StrategyArgument,
  	stateInputs: List[UnitReactionStateIn] = List(), 
    dataInputs: List[UnitReactionDataIn] = List() ):ActionAct = {
    	s.ident match {
    		case "Duration" => { 
    			delayRequest(parts, org.joda.time.DateTime.now().plusSeconds(20).getMillis() )
    			DurationStrategy.execute( 
            parts, retriveDataForDelay(stategyTitle = "Duration", dataInputs) 
	    		)
    		}
    		case "scheduleDelayStrategy" => ScheduleStrategy.execute( 
          parts, retriveDataForDelay(stategyTitle = "scheduleDelayStrategy", dataInputs) )
    		case _ => NullStrategy.execute(parts, StrategyArgument() )
    	}
  }

  def retriveDataForDelay(stategyTitle: String, dataInputs: List[UnitReactionDataIn]):StrategyArgument = {
  	// Find input duration or schedule
  	// or
  	//StrategyArgument(argInt: Int = 0, argLong:Long = 0L, argString: String = "")
  	stategyTitle match {
  		case "Duration" => 
  			StrategyArgument(argLong = org.joda.time.DateTime.now().plusSeconds(20).getMillis())
		  case "scheduleDelayStrategy" => 
			  StrategyArgument(argLong = org.joda.time.DateTime.now().plusHours(1).getMillis())
  	}
  }

	object DurationStrategy {
		def execute(parts: ActionParts, argument: StrategyArgument):ActionAct = {
			println("DurationStrategy Strategy executed")
      parts.process.getActs(parts.action.id.get).head
			// put process in stack
			// resume after seconds
			// highlight default delayed state
		}
	}
	object NullStrategy {
		def execute(parts: ActionParts, argument: StrategyArgument):ActionAct = {
			println("NullStrategy executed")
      parts.process.getActs(parts.action.id.get).head
			// put process in stack
			// resume after seconds
			// highlight default delayed state
		}
	}



	object ScheduleStrategy {
		def execute(parts: ActionParts, argument: StrategyArgument):ActionAct = {
			println("ScheduleStrategy executed")
      parts.process.getActs(parts.action.id.get).head
		}		
	}



	def delayRequest(parts: ActionParts, time: Long) = {
		//delayRequest(
		//	el, time, fnState: Unit => Unit, fnProcResume: Unit => Unit 
		//)
		val op = MinorityJobOp(
								action=parts.action.title,
								objInt = parts.process.session_id,
								argument = ""
							)
		val job = MinorityJob(
					   id = None, 
                       owner = parts.action.id.get.toString, 
                       operations = List(op), 
                       scheduleMilis = Some(time)
		)
		MinorityJobs.addJob(job)
	}


}