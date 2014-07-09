package models

import scala.collection.mutable.ListBuffer

case class Document(elements: ListBuffer[DocElems]) {
  def last_order:Int = {
     if (elements.length > 0) {
      elements.sortWith(_.order > _.order).head.order 
     } else {
      0
     }
  }
}


trait DocElems {
  var order:Int = 0
  var orderY:Int = 0

}

  object DocumentResults {
    import main.scala.simple_parts.process._
    import akka.actor._
    import play.api.libs.json._
    import play.api.mvc.WebSocket.FrameFormatter

    //implicit val DocumentResultFormat = Json.format[Document]
    //implicit val DocumentResultFrameFormatter = FrameFormatter.jsonFrame[Document]
    implicit val CardFormat = Json.format[Card]
    implicit val CardrameFormatter = FrameFormatter.jsonFrame[Card]

    implicit val CompositeFormat = Json.format[CompositeValues]
    implicit val CompositeFrameFormatter = FrameFormatter.jsonFrame[CompositeValues]

    implicit val DataBlockFormat = Json.format[DataBlock]
    implicit val DataBlockFrameFormatter = FrameFormatter.jsonFrame[DataBlock]
    implicit val HeaderFormat = Json.format[Header]
    implicit val HeaderFrameFormatter = FrameFormatter.jsonFrame[Header]

  
}