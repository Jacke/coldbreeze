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
import scala.concurrent.ExecutionContext.Implicits.global
import scala.concurrent.duration.Duration
import scala.concurrent.{ExecutionContext, Awaitable, Await, Future}
import scala.collection.mutable._



object RESTMiddleware {
  val DEFAULT_URL = "https://api.ipify.org?format=json"

  val config = new NingAsyncHttpClientConfigBuilder(WSClientConfig()).build
  val builder = new AsyncHttpClientConfig.Builder(config)
  val client = new NingWSClient(builder.build)
  def await[T](a: Awaitable[T])(implicit ec: ExecutionContext) = Await.result(a, Duration.Inf)
  def awaitAndPrint[T](a: Awaitable[T])(implicit ec: ExecutionContext) = println(await(a))


    def execute(parts: ActionParts, s: Strategy,
        stateInputs:List[UnitReactionStateIn] = List(), dataInputs: List[UnitReactionDataIn] = List()
        ):StrategyResult = {
        parts.process.addAct(ActionAct(
          id = None,
          uid = java.util.UUID.randomUUID.toString,
          session = parts.process.session_id,
          reaction = parts.action.id.getOrElse(-1),
          Some( org.joda.time.DateTime.now() ),
          Some( org.joda.time.DateTime.now() )
        ))
        println("RESTMiddleware BASE"+ s.strategyBaseUnit.length)
        s.ident match {
            case "GETStrategy" => GETStrategy.execute( retriveDataForDelay(stategyTitle = "GETStrategy", 
                                                                      dataInputs,
                                                                      s.strategyBaseUnit), parts )
            case "POSTStrategy" => POSTStrategy.execute( retriveDataForDelay(stategyTitle = "POSTStrategy", 
                                                                      dataInputs,
                                                                      s.strategyBaseUnit), parts )
            case _ => NullStrategy.execute(parts = parts)
        }
    }


    def retriveDataForDelay(stategyTitle: String, 
                            dataInputs: List[UnitReactionDataIn],
                            bases: MutableList[StrategyBaseUnit]=MutableList()):Seq[StrategyArgument] = {
    	// Find input duration or schedule
    	// or
    	//StrategyArgument(argInt: Int = 0, argLong:Long = 0L, argString: String = "")
        val urlBase = bases.find(b => b.key == "URL") match {
            case Some(u) => u.valueContent
            case _ => DEFAULT_URL
        }
    	stategyTitle match {
    		case "GETStrategy" => 
    			Seq(StrategyArgument(argString = urlBase, argKey="URL") )
			case "POSTStrategy" => 
				Seq(StrategyArgument(argString = urlBase, argKey="URL") )
    	}
    }

	object GETStrategy {
		def execute(argument: Seq[StrategyArgument], parts: ActionParts):StrategyResult = {
			println("GETStrategy Strategy executed")
            val url:String = argument.find(c => c.argKey == "URL") match {
                case Some(arg) => arg.argString
                case _ => DEFAULT_URL
            }
            val res = await( client.url(url).withHeaders("Content-Type" -> "application/xml").get() )
            parts.process.getActs(parts.action.id.get).headOption match {
              case Some(act) => {
                val status = ActionStatus(id = None,
                            content = "Request called",
                            act = 0L,
                            Some( org.joda.time.DateTime.now() ),
                            Some( org.joda.time.DateTime.now() ) )
                val actResult = ActionResult(
                            id = None,
                            in = false,
                            out = true,
                            base = false,
                            content = res.body,
                            act = 0L,
                            Some( org.joda.time.DateTime.now() ),
                            Some( org.joda.time.DateTime.now() ))                
                act.makeStatus(status)
                act.makeResult(actResult)
              }
            }
            println("API Strategy "+res.body)

			StrategyResult("DurationStrategy", true)
		}
	}
	object POSTStrategy {
		def execute(argument: Seq[StrategyArgument], parts: ActionParts):StrategyResult = {
			println("POSTStrategy executed")
			StrategyResult("ScheduleStrategy", true)
		}		
	}
	object NullStrategy {
		def execute(argument: Seq[StrategyArgument]=Seq(), parts: ActionParts):StrategyResult = {
			println("NullStrategy executed")
      val url = DEFAULT_URL
      val res = await( client.url(url).withHeaders("Content-Type" -> "application/xml").get() )
      parts.process.getActs(parts.action.id.get).headOption match {
        case Some(act) => {
          val status = ActionStatus(id = None,
                      content = "Request called",
                      act = 0L,
                      Some( org.joda.time.DateTime.now() ),
                      Some( org.joda.time.DateTime.now() ) )
          val actResult = ActionResult(
                      id = None,
                      in = false,
                      out = true,
                      base = false,
                      content = res.body,
                      act = 0L,
                      Some( org.joda.time.DateTime.now() ),
                      Some( org.joda.time.DateTime.now() ))                
          act.makeStatus(status)
          act.makeResult(actResult)
        }
      }            
      println("API Strategy "+res.body)
			StrategyResult("NullStrategy", true)
		}
	}

}


