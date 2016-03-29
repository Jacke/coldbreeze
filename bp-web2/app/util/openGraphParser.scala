package util
import com.typesafe.jse._
import com.typesafe.jse.Engine.JsExecutionResult
import java.io.File
import scala.collection.immutable
import akka.pattern.ask
import akka.util.Timeout
import akka.actor.{ActorRef, ActorSystem}
import scala.concurrent.Await
import java.util.concurrent.TimeUnit

object openGraphParser {
def withActorSystem[T](block: ActorSystem => T): T = {
    val system = ActorSystem()
    try block(system) finally {
      system.shutdown()
      system.awaitTermination()
    }
  }

  def withEngine[T](block: ActorRef => T): T = withActorSystem { system =>
    val engine = system.actorOf(Trireme.props(), "trireme-spec")
    block(engine)
  }
  def withNodeEngine[T](block: ActorRef => T): T = withActorSystem { system =>
    val engine = system.actorOf(Node.props(), "trireme-spec")
    block(engine)
  }  



def parse(url: String) = {	
	withEngine {
        engine =>
          val f = new File("metaTagParse.js")
          implicit val timeout = Timeout(20000L, TimeUnit.MILLISECONDS)

          val futureResult = (engine ? Engine.ExecuteJs(f, immutable.Seq(url), timeout.duration)).mapTo[JsExecutionResult]
          val result = Await.result(futureResult, timeout.duration)
          println(new String(result.output.toArray, "UTF-8"))//new String(result.output.toArray, "UTF-8").trim must_== "999"
          println("error"); println(new String(result.error.toArray, "UTF-8"))//new String(result.error.toArray, "UTF-8").trim must_== ""
      }
    println("with node") 
	withNodeEngine {
		engine =>
          val f = new File("metaTagParse.js")
          implicit val timeout = Timeout(20000L, TimeUnit.MILLISECONDS)

          val futureResult = (engine ? Engine.ExecuteJs(f, immutable.Seq(url), timeout.duration)).mapTo[JsExecutionResult]
          val result = Await.result(futureResult, timeout.duration)
          println(new String(result.output.toArray, "UTF-8"))//new String(result.output.toArray, "UTF-8").trim must_== "999"
          println("error"); println(new String(result.error.toArray, "UTF-8"))//new String(result.error.toArray, "UTF-8").trim must_== ""
	}
}

}