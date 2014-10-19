package controllers

import play.api.mvc._
import play.api.Play.current
import actors._
import akka.actor._


import scala.concurrent.Future
import scala.collection.mutable.ListBuffer

object DocController extends Controller {
  val buffer:ListBuffer[ActorRef] = ListBuffer.empty[ActorRef]

  def socket1(password: String) = { 
    val filled = WebSocket.tryAcceptWithActor[DocEventActor.DocEvent, DocEventActor.DocEventResult] { request =>
    Future.successful(
      if (password == "secret") {
        val actor = DocEventActor.props(_)
        Right(actor)

      } else {
        Left(Forbidden)
      }
    )
 }
 println(filled)
 filled
 
 }
 def socket(password: String) = WebSocket.acceptWithActor[DocEventActor.DocEvent, DocEventActor.DocEventResult] { request => out =>
    val filled = DocEventActor.props(out)
    println(filled)
    println(out)
    buffer += out
    filled
  }
  
}