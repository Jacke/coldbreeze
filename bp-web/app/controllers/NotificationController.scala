package controllers
import scala.util.{Try, Success, Failure}

import models.{AccountsDAO, User, Page}
import service.DemoUser
import securesocial.core._
import controllers.users._
import models.DAO.resources._
import models.DAO._
import decorators._
import play.api.mvc._
import play.api.Play.current
import scala.concurrent._
import scala.concurrent.duration._
import akka.actor._
import play.api.libs.json._
import play.api.mvc.WebSocket.FrameFormatter
import SumActor._
import SumActor.Sum._

object Subscribe
object StatusCheck


class NotificationController(override implicit val env: RuntimeEnvironment[DemoUser]) extends Controller with securesocial.core.SecureSocial[DemoUser] {
    implicit val sumFormat = Json.format[SumActor.Sum]
    implicit val sumFrameFormatter = FrameFormatter.jsonFrame[SumActor.Sum]
    implicit val sumResultFormat = Json.format[SumActor.SumResult]
    implicit val sumResultFrameFormatter = FrameFormatter.jsonFrame[SumActor.SumResult]

  // val auth = UserService.find(authenticator.get.identityId)
  // auth.get.identityId.userId

    def socket = WebSocket.tryAcceptWithActor[JsValue, JsValue] { request => //[SumActor.Sum, SumActor.SumResult] { request =>
      implicit val req: RequestHeader = request
      val user:Future[Option[service.DemoUser]] = env.authenticatorService.fromRequest.map {
         case Some(authenticator) if authenticator.isValid => { 
           Some(authenticator.user)
       }
      case _ => { 
        None
      }
    }
      //val cleanCred = SecureSocial.currentUser[DemoUser](request, env, env.executionContext).value
      var cred:Option[service.DemoUser] = Await.result(user, Duration(5000, MILLISECONDS))

      cred match {
        case Some(userid) => { 
          //Future.successful(Right(SumActor.props(_, Some(userid))))
          Future.successful(Right(UserActor.props(userid.main.userId)))
        }
        case None => Future.successful(Left(Forbidden))
      }
    }
    def notify_test(msg: String) = SecuredAction { implicit request =>
          val system = SumActor.system
          /* SumActor.actors.foreach { actor => 
            val actor = system.actorOf(Props[SumActor])
            actor ! Msg(msg)
          }
          */
          BoardActor() ! StatusCheck
          BoardActor() ! Message(request.user.main.userId, msg )
          Ok("sended")    
    }
}



object SumActor {
  val system = ActorSystem("hello-world")

  var actors:List[Props] = List()

  def props(out: ActorRef, user: Option[DemoUser]) = {
    val props = Props(new SumActor(out, user))
    val actor_prop = system.actorOf(props)
    //actors = actors ++ List(prop)
    props
  } 

  /**
   * Sum the given values.
   */
  case class Sum(values: Seq[Int])
  case class Msg(msg: String)

  object Sum {
    implicit val sumFormat = Json.format[Sum]
    implicit val sumFrameFormatter = FrameFormatter.jsonFrame[Sum]
    implicit val MsgFormat = Json.format[Msg]
    implicit val MsgFrameFormatter = FrameFormatter.jsonFrame[Msg]    
  }

  /**
   * The result of summing the values
   */
  case class SumResult(sum: Int, color: Int = SumResult.color_rand, user: Option[String])
  case class MsgResult(msg: String)

  object SumResult {
    import scala.util.Random
    def color_rand = {
       Random.nextInt(100)
    }
    implicit val sumResultFormat = Json.format[SumResult]
    implicit val sumResultFrameFormatter = FrameFormatter.jsonFrame[SumResult]
    implicit val MsgResultFormat = Json.format[MsgResult]
    implicit val MsgResultFrameFormatter = FrameFormatter.jsonFrame[MsgResult]

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
    case Msg(msg) => {
      out ! MsgResult(msg)
    }
  }
}





/***
 * User actor
 */
import akka.actor.Actor
import akka.actor.ActorLogging
import akka.event.LoggingReceive
import play.api.libs.json.JsValue
import play.api.libs.json.Json
import akka.actor.ActorRef
import akka.actor.Props
import scala.xml.Utility

class UserActor(uid: String, board: ActorRef, out: ActorRef) extends Actor with ActorLogging {
  override def preStart() = {
    board ! Subscribe
  }
  def receive = LoggingReceive {
    case Message(muid, s) if sender == board =>
      val js = Json.obj("type" -> "message", "uid" -> muid, "msg" -> s)
      println("msg")
      println(js)
      out ! js
    case js: JsValue =>
      (js \ "msg").validate[String] map { Utility.escape(_) } foreach { board ! Message(uid, _ ) }
    case other =>
      log.error("unhandled: " + other)
  }
}

object UserActor {
  def props(uid: String)(out: ActorRef) = Props(new UserActor(uid, BoardActor(), out))
}


/***
 * Notification board
 */
import akka.actor.Actor
import akka.actor.ActorLogging
import akka.event.LoggingReceive
import akka.actor.ActorRef
import akka.actor.Terminated
import play.libs.Akka
import akka.actor.Props

class BoardActor extends Actor with ActorLogging {
  var users = Set[ActorRef]()

  def receive = LoggingReceive {
    case m: Message =>
      users foreach { _ ! m }
    case Subscribe =>
      users += sender
      context watch sender
    case StatusCheck => {
      println(users.size)
    }
    case Terminated(user) => {
      println(user + " are terminated")
      users -= user
    }
  }
}

object BoardActor {
  lazy val board = Akka.system().actorOf(Props[BoardActor])
  def apply() = board
}

case class Message(uuid: String, s: String)
