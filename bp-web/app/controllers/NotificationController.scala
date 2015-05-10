package controllers

import models.{AccountsDAO, User, Page}
import service.DemoUser
import securesocial.core._
import controllers.users._
import models.DAO.resources._
import models.DAO._
import decorators._
import play.api.mvc._
import play.api.Play.current
import scala.concurrent.Future
import akka.actor._
import play.api.libs.json._
import play.api.mvc.WebSocket.FrameFormatter
import SumActor._
import SumActor.Sum._

class NotificationController(override implicit val env: RuntimeEnvironment[DemoUser]) extends Controller with securesocial.core.SecureSocial[DemoUser] {
    implicit val sumFormat = Json.format[SumActor.Sum]
    implicit val sumFrameFormatter = FrameFormatter.jsonFrame[SumActor.Sum]
    implicit val sumResultFormat = Json.format[SumActor.SumResult]
    implicit val sumResultFrameFormatter = FrameFormatter.jsonFrame[SumActor.SumResult]

    def socket = WebSocket.tryAcceptWithActor[SumActor.Sum, SumActor.SumResult] { request =>
    println(request)
    val cred:Option[DemoUser] = SecureSocial.currentUser[DemoUser](request, env, env.executionContext).value.get.get
    cred match {
      case Some(userid) => Future.successful(Right(SumActor.props(_, Some(userid))))
      case None => Future.successful(Left(Forbidden))
    }

  }

}

object SumActor {

  def props(out: ActorRef, user: Option[DemoUser]) = {
    println(user)
    Props(new SumActor(out, user))
  } 

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
  case class SumResult(sum: Int, color: Int = SumResult.color_rand, user: Option[String])

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
class SumActor(out: ActorRef, user: Option[DemoUser]) extends Actor {

  import SumActor._


  override def postStop() = {
    println("close")
    println(out)
    println
    //out.close()
  }

  def receive = {
    case Sum(values) => {
      out ! SumResult(values.fold(0)(_ + _ + 100), color = SumResult.color_rand, user.get.main.email)
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