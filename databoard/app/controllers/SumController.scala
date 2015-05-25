package controllers


import play.api.mvc._
import play.api.Play.current
import scala.concurrent.Future
import akka.actor._
import play.api.libs.json._
import play.api.mvc.WebSocket.FrameFormatter
import play.api.mvc._
import play.api.Play.current
import actors._
import scala.concurrent.Future

class SumController extends Controller  {
   
  def socket(password: String) = WebSocket.tryAcceptWithActor[SumActor.Sum, SumActor.SumResult] { request =>
    Future.successful(
      if (password == "secret") {
        val actor = SumActor.props(_)
        Right(actor)

      } else {
        Left(Forbidden)
      }
    )
  }
  
}