package us.ority.min.actions.middlewares.rest
import main.scala.bprocesses._
import main.scala.utils._
import com.github.nscala_time.time.Imports._
import scala.collection.mutable._  
import main.scala.simple_parts.process._
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
import main.scala.simple_parts.process._
import main.scala.simple_parts.process._
import main.scala.simple_parts.process._
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


import scala.concurrent.ExecutionContext.Implicits.global
import scala.concurrent.duration.Duration
import scala.concurrent.{ExecutionContext, Awaitable, Await, Future}
import scala.collection.mutable._
import us.ority.min.actions._
import play.api.libs.json._

object GETStrategy {
  val DEFAULT_URL = "https://api.ipify.org?format=json"

import play.api.libs.ws.ahc.AhcWSClient
import akka.stream.ActorMaterializer
import akka.actor.ActorSystem

implicit val system = ActorSystem()
implicit val materializer = ActorMaterializer()
val client = AhcWSClient()


  def await[T](a: Awaitable[T])(implicit ec: ExecutionContext) = Await.result(a, Duration.Inf)
  def awaitAndPrint[T](a: Awaitable[T])(implicit ec: ExecutionContext) = println(await(a))


    def execute(arguments: StrategyArguments, 
                parts: ActionParts):ActionAct = {
      println("GETStrategy Strategy executed")
      val url:String = arguments.takeArg("URL", StrategyArgument(argString=DEFAULT_URL)).argString
      val headersJson = arguments.takeArgs("header")
      val headers:Seq[(String, String)] = headersJson.map(_.argString).map { hJson => 
        println(hJson)
        // {"key":"key354","value":"value3443","$$hashKey":"object:702"}
        val j = Json.parse(hJson).as[JsObject]
        val k = (j \ "key").as[String]
        val v = (j \ "value").as[String] 
        println(k)
        println(v)
        (k -> v) 
      } ++ Seq( ("Content-Type" -> "application/json") )
      headers.foreach(println)

      val res = await( client.url(url).withHeaders(headers: _*).get() )
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
        act
      }
    }
  }

  object POSTStrategy {
    def execute(argument: StrategyArguments, 
                parts: ActionParts):ActionAct = {
      println("POSTStrategy executed")
      parts.process.getActs(parts.action.id.get).head
    }   
  }