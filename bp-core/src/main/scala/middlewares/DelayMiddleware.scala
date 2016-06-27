package us.ority.min.actions
import bprocesses._
import main.scala.bprocesses._
import main.scala.utils._
import com.github.nscala_time.time.Imports._
import scala.collection.mutable._  
import main.scala.simple_parts.process.Units._

import main.scala.simple_parts.process._
import main.scala.simple_parts.process.Units._
import main.scala.bprocesses._
import main.scala.utils._
import us.ority.min.jobs._

object DelayMiddleware {

    def execute(parts: ActionParts, s: Strategy, strategyArgument: StrategyArgument,
    	stateInputs:List[UnitReactionStateIn] = List(), dataInputs: List[UnitReactionDataIn] = List()
    	):StrategyResult = {
    	s.ident match {
    		case "Duration" => { 
    			delayRequest(parts, org.joda.time.DateTime.now().plusSeconds(20).getMillis() )

    			DurationStrategy.execute( 
	    			retriveDataForDelay(stategyTitle = "Duration", dataInputs) 
	    		)
    		}
    		case "scheduleDelayStrategy" => ScheduleStrategy.execute( 
    			retriveDataForDelay(stategyTitle = "scheduleDelayStrategy", dataInputs) )
    		case _ =>						NullStrategy.execute( StrategyArgument() )
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
		def execute(argument: StrategyArgument):StrategyResult = {
			println("DurationStrategy Strategy executed")
			StrategyResult("DurationStrategy", true)
			// put process in stack
			// resume after seconds
			// highlight default delayed state
		}
	}
	object NullStrategy {
		def execute(argument: StrategyArgument):StrategyResult = {
			println("NullStrategy executed")
			StrategyResult("NullStrategy", true)
			// put process in stack
			// resume after seconds
			// highlight default delayed state
		}
	}



	object ScheduleStrategy {
		def execute(argument: StrategyArgument):StrategyResult = {
			println("ScheduleStrategy executed")
			StrategyResult("ScheduleStrategy", true)
		}		
	}



	def delayRequest(parts: ActionParts, time: Long) {
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