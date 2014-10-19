package actors

import akka.actor._
import controllers.MindFields
import play.api.libs.json._
import play.api.mvc.WebSocket.FrameFormatter
import julienrf.variants.Variants

object DocEventActor {

  import models.DocumentResults

  def props(out: ActorRef) = Props(new DocEventActor(out))

  /**
   * DocEvent the given values.
   */
  case class DocEvent(values: Seq[Int])

  object DocEvent {
    implicit val DocEventFormat = Json.format[DocEvent]
    implicit val DocEventFrameFormatter = FrameFormatter.jsonFrame[DocEvent]
  }

  /**
   * The result of summing the values
   */
  //implicit val DocElemsFormat = Variants.format[models.DocElems]

  //implicit val DocElemsFrameFormatter = FrameFormatter.jsonFrame[models.DocElems]
  case class DocEventResult(event: String, objects: List[String] = List())

  object DocEventResult {

    implicit val DocEventResultFormat = Json.format[DocEventResult]
    implicit val DocEventResultFrameFormatter = FrameFormatter.jsonFrame[DocEventResult]
  }
}

/**
 * An actor that sums sequences of numbers
 */
class DocEventActor(out: ActorRef) extends Actor {

  import DocEventActor._

  override def postStop() = {
    println("close")
    println(out)
    controllers.DocController.buffer -= controllers.DocController.buffer.last// out
    println
    //out.close()
  }

  def receive = {
    case msg: String =>  out ! DocEventResult(event = msg, objects = MindFields.test.elements.map(el => el.getClass.getSimpleName).toList)
    case "init" => out ! DocEventResult(event = "init", objects = MindFields.test.elements.map(el => el.getClass.getSimpleName).toList)
    case "update" => {
      controllers.DocController.buffer.foreach(a => a ! DocEventResult(event = "update", objects = MindFields.test.elements.map(el => el.getClass.getSimpleName).toList))
    }
    case DocEvent(values) => {
      //out ! DocEventResult(values.fold(0)(_ + _ + 100))
      out ! "xx"
      sender() ! "init"
      sender() ! "update"
      println(controllers.DocController.buffer.length)
      out ! DocEventResult("update", List("Doc", "Event"))
      //controllers.DocController.buffer.foreach(a => a ! DocEventResult(14, 88))
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
    case _ => DocEventResult("update", List("shiw", "zxcs"))
  }

}