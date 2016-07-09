package us.ority.min.actions
import main.scala.bprocesses._
import main.scala.utils._
import com.github.nscala_time.time.Imports._
import scala.collection.mutable._  
import main.scala.simple_parts.process.Units._
import play.api.libs.ws._
import play.api.libs.ws.ning.NingAsyncHttpClientConfigBuilder
import scala.concurrent.Future
import java.util.UUID
import scala.concurrent._
import scala.concurrent.duration._
import org.jboss.netty.buffer._
import org.joda.time.DateTime
import play.api.data._
import play.api.data.Forms._
import play.api.data.format.Formats._
import play.api.data.validation.Constraints._
import play.api.data.format._
import play.api.libs.concurrent.Execution.Implicits.defaultContext
import play.api.libs.json._
import play.api.Play.current
import scala.util.{Success, Failure}
import scala.util.Try
import play.api.libs.ws._
import play.api.libs.ws.ning._
import com.ning.http.client._

object RESTMiddleware {

  val config = new NingAsyncHttpClientConfigBuilder(WSClientConfig()).build
  val builder = new AsyncHttpClientConfig.Builder(config)
  val client = new NingWSClient(builder.build)
  

    def execute(s: Strategy, strategyArgument: StrategyArgument,
    	stateInputs:List[UnitReactionStateIn] = List(), dataInputs: List[UnitReactionDataIn] = List()
    	):StrategyResult = {
    	s.ident match {
    		case "durationDelayStrategy" => DurationStrategy.execute( retriveDataForDelay(stategyTitle = "durationDelayStrategy", 
    																  dataInputs) )
    		case "scheduleDelayStrategy" => ScheduleStrategy.execute( retriveDataForDelay(stategyTitle = "scheduleDelayStrategy", 
    																  dataInputs) )
    		case _ =>						NullStrategy.execute( StrategyArgument() )
    	}
    }

    def retriveDataForDelay(stategyTitle: String, dataInputs: List[UnitReactionDataIn]):StrategyArgument = {
    	// Find input duration or schedule
    	// or
    	//StrategyArgument(argInt: Int = 0, argLong:Long = 0L, argString: String = "")
    	stategyTitle match {
    		case "durationDelayStrategy" => 
    			StrategyArgument(argLong = org.joda.time.DateTime.now().plusSeconds(20).getMillis())
			case "scheduleDelayStrategy" => 
				StrategyArgument(argLong = org.joda.time.DateTime.now().plusHours(1).getMillis())
    	}
    }

	object DurationStrategy {
		def execute(argument: StrategyArgument):StrategyResult = {
			println("DurationStrategy Strategy executed")
			StrategyResult("DurationStrategy", true)
		}
	}
	object ScheduleStrategy {
		def execute(argument: StrategyArgument):StrategyResult = {
			println("ScheduleStrategy executed")
			StrategyResult("ScheduleStrategy", true)
		}		
	}
	object NullStrategy {
		def execute(argument: StrategyArgument):StrategyResult = {
			println("NullStrategy executed")
			StrategyResult("NullStrategy", true)
		}
	}

}


