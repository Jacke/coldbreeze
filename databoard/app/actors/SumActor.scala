package actors

import akka.actor._
import play.api.libs.json._
import play.api.mvc.WebSocket.FrameFormatter


object MyWebSocketActor {
  def props(out: ActorRef) = Props(new MyWebSocketActor(out))
}

class MyWebSocketActor(out: ActorRef) extends Actor {
  def receive = {
    case msg: String =>
      out ! (s"{'sum': 100, 'color': '$msg'}")
  }
}


object SumActor {

  def props(out: ActorRef) = Props(new SumActor(out))

  /**
   * Sum the given values.
   */
  case class Sum(values: Seq[Int])

  object Sum {
    implicit val sumFormat = Json.format[Sum]
    implicit val sumFrameFormatter = FrameFormatter.jsonFrame[Sum]
  }

  /**
   * The result of summing the values
   */
  case class SumResult(sum: Int, color: Int = SumResult.color_rand)

  object SumResult {
    import scala.util.Random
    def color_rand = {
       Random.nextInt(100)
    }
    implicit val sumResultFormat = Json.format[SumResult]
    implicit val sumResultFrameFormatter = FrameFormatter.jsonFrame[SumResult]
  }
}

/**
 * An actor that sums sequences of numbers
 */
class SumActor(out: ActorRef) extends Actor {

  import SumActor._

  override def postStop() = {
    println("close")
    println(out)
    println
    //out.close()
  }

  def receive = {
    case Sum(values) => {
      out ! SumResult(values.fold(0)(_ + _ + 100))
      /*
      for( a <- 1 to 10){
         out ! SumResult(values.fold(0)(_ + _))
      Thread.sleep(100)
      out ! SumResult(values.fold(0)(_ + _))
      Thread.sleep(100)
      out ! SumResult(values.fold(0)(_ + _))
      Thread.sleep(100)
      out ! SumResult(values.fold(0)(_ + _ + 100))
      }*/
      
    }
  }

}