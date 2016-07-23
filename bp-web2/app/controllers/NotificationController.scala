package controllers
import scala.util.{Try, Success, Failure}

import models.{AccountsDAO, User, Page}
import com.mohiva.play.silhouette.api.{ Environment, LogoutEvent, Silhouette }
import com.mohiva.play.silhouette.impl.authenticators.CookieAuthenticator
import com.mohiva.play.silhouette.impl.providers.SocialProviderRegistry
import forms._
import models.User2
import play.api.i18n.MessagesApi
import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits.global
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
//import play.modules.mailer._
import scala.util.{Try, Success, Failure}

import play.api.mvc._
import com.mohiva.play.silhouette.api.{ Environment, LogoutEvent, Silhouette }
import com.mohiva.play.silhouette.impl.authenticators.CookieAuthenticator
import com.mohiva.play.silhouette.impl.providers.SocialProviderRegistry
import forms._
import models.User2
import play.api.i18n.MessagesApi
import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits.global

import javax.inject.Inject

import com.mohiva.play.silhouette.api.{ Environment, LogoutEvent, Silhouette }
import com.mohiva.play.silhouette.impl.authenticators.CookieAuthenticator
import com.mohiva.play.silhouette.impl.providers.SocialProviderRegistry
import forms._
import models.User2
import play.api.i18n.MessagesApi
import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits.global

import play.api.mvc.{ Action, RequestHeader }


class NotificationController @Inject() (
  val messagesApi: MessagesApi,
  val env: Environment[User2, CookieAuthenticator],
  socialProviderRegistry: SocialProviderRegistry)(implicit val mat: akka.stream.Materializer) 
  extends Silhouette[User2, CookieAuthenticator] {
    implicit val sumFormat                    = Json.format[SumActor.Sum]
    implicit val sumFrameFormatter            = FrameFormatter.jsonFrame[SumActor.Sum]
    implicit val sumResultFormat              = Json.format[SumActor.SumResult]
    implicit val sumResultFrameFormatter      = FrameFormatter.jsonFrame[SumActor.SumResult]
    implicit val HistMessageFormat            = Json.format[HistMessage]
    implicit val HistMessageFrameFormatter    = FrameFormatter.jsonFrame[HistMessage]

    implicit val ResourceUpdateFormat =  Json.format[ResourceUpdate]
    implicit val ResourceUpdateFrameFormatter =  FrameFormatter.jsonFrame[ResourceUpdate]

    implicit val LaunchLockFormat            = Json.format[LaunchLock]
    implicit val LaunchLockFrameFormatter    = FrameFormatter.jsonFrame[LaunchLock]
    implicit val PopupRequestFormat           = Json.format[PopupRequest]
    implicit val PopupRequestFrameFormatter   = FrameFormatter.jsonFrame[PopupRequest]
  // val auth = UserService.find(authenticator.get.identityId)
  // auth.get.identityId.userId

def socket = WebSocket.tryAcceptWithActor[JsValue, JsValue] { request => //[SumActor.Sum, SumActor.SumResult] { request =>
/*
      implicit val req: RequestHeader = request
      val user:Future[Option[service.DemoUser]] = env.authenticatorService.fromRequest.map {
         case Some(authenticator) if authenticator.isValid => {
           Some(authenticator.user)
       }
      case _ => {
        None
      }
    }
    var cred:Option[service.DemoUser] = Await.result(user, Duration(5000, MILLISECONDS))
    cred match {
      case Some(userid) => {
        //Future.successful(Right(SumActor.props(_, Some(userid))))
        Future.successful(Right(UserActor.props(userid.main.userId)))
      }
      case None =>
    }

    */

        implicit val req = Request(request, AnyContentAsEmpty)
        SecuredRequestHandler { securedRequest =>
          Future.successful(HandlerResult(Ok, Some(securedRequest.identity)))
        }.map {
          case HandlerResult(r, Some(user)) => Right(UserActor.props(user.email.getOrElse("")) _)
          case HandlerResult(r, None) => Left(r)
        }

//    Future.successful(Left(Forbidden))
}
def popup(emails_hash: String, target: String) = Action { request =>
          request.body.asJson.map { json =>
          val placeResult = json.validate[PopupRequest]
          placeResult.fold(
            errors => {
              println(JsError.toJson(errors))
              //BadRequest(Json.obj("status" ->"KO", "message" -> JsError.toJson(errors)))
            },
            place => {
              println(place)
              //Ok(Json.obj("status" ->"OK", "message" -> ("Place '"+place.name+"' saved.") ))
            }
          )
          }
         val emails = emails_hash.split(",").toList

         emails.foreach { email =>
          BoardActor() ! StatusCheck
          BoardActor() ! PopupMessage( target, email )
          }

    /*
    val email = Email(
        subject = "Test mail",
        from = EmailAddress("Minority app", "a@minorityapp.com"),
        text = "<b>text</b>",
        htmlText = "htmlText").to("Erik Westra TO", "iamjacke@gmail.com")

    Mailer.sendEmail(email)
    val result:Try[Unit] = Mailer.sendEmail(email)

    result match {
        case Success(_) => { println("success sended") }
            //mail sent successfully
        case Failure(SendEmailException(email, cause)) =>
            //failed to send email, cause provides more information
        case Failure(SendEmailTransportCloseException(None, cause)) =>
            //failed to close the connection, no email was sent
        case Failure(SendEmailTransportCloseException(Some(Success(_)), cause)) =>
            //failed to close the connection, the email was sent
        case Failure(SendEmailTransportCloseException(Some(Failure(SendEmailException(email, cause1))), cause2)) =>
            //failed to close the connection, the email was not sent
      }
    */
  Ok("sended")
}

def notify_test(msg: String) = SecuredAction { implicit request =>
          val system = SumActor.system
          /* SumActor.actors.foreach { actor =>
            val actor = system.actorOf(Props[SumActor])
            actor ! Msg(msg)
          }
          */
          BoardActor() ! StatusCheck
          BoardActor() ! Message(request.identity.emailFilled, msg )
          Ok("sended")
    }
import play.api.libs.concurrent.Execution.Implicits._

case class Item(value: String = "test")
/*
class ItemRequest[A](val item: Item, request: SecuredRequest[A, env.U]) extends WrappedRequest[A](request) {
  def username = request.identity
}
def UserItemAction = new ActionRefiner[SecuredRequest[A, env.U], ItemRequest] {
    def find() = {
      val l = new Item()
      println(l)
      Some(l)
    }
    def refine[A,U](input: SecuredRequest[A, env.U]) = Future.successful {
    // => user
    // => manager
    // => rights
    find()
      .map(new ItemRequest(_, input))
      .toRight(NotFound(views.html.custom.msg404("", input)))

  }
}

def tagItem = (SecuredAction andThen UserItemAction) { request =>
    //request.item.addTag(tag)
    Ok("User " + request.identityname.toString + " tagged ")
}
*/




}



object SumActor {
  val system = ActorSystem("hello-world")

  var actors:List[Props] = List()

  def props(out: ActorRef, user: Option[Any]) = {
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
class SumActor(out: ActorRef, user: Option[Any]) extends Actor {
  import SumActor._
  override def postStop() = {
    println("close")
    println(out)
    println
    //out.close()
  }
  def receive = {
    case Sum(values) => {
      out ! SumResult(values.fold(0)(_ + _ + 100), color = SumResult.color_rand, Some("") )
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
    case PopupMessage(target, email) =>
      val js = Json.obj("type" -> "popup", "target" -> target)
      if (uid == email) { out ! js }

    case HistMessage(email, target, targetEmails) => {
      val js = Json.obj("type" -> "updates", "target" -> target)
      play.api.Logger.info(s"Process history update + $target")
      if (targetEmails.contains(email)) { out ! js }
    }
    case LaunchLock(email, target, launchId, targetEmails) => {
      val js = Json.obj("type" -> "launchLocker", "state" -> target, "launchId" -> launchId)
      play.api.Logger.info(s"Process history update + $target")
      if (targetEmails.contains(email)) { out ! js }
    }
    case ResourceUpdate(email, target, targetEmails) => {
      val js = Json.obj("type" -> "resourceUpdate")
      play.api.Logger.info(s"Process resource update")
      if (targetEmails.contains(email)) { out ! js }
    }

    case js: JsValue =>
      (js \ "msg").validate[String] map { Utility.escape(_) } foreach { board ! Message(uid, _ ) }
    case other =>
      log.error("unhandled: " + other)
  }
}

object UserActor {
  def props(uid: String)(out: ActorRef) = {
     play.api.Logger.info("notify conected: " + uid)
    Props(new UserActor(uid, BoardActor(), out))
  }
  def updateNotifiy(target: String, email: String) = {
    val targetEmails:List[String] = EmployeesBusinessDAO.getByUID(email) match {
      case Some(origin_biz) => { EmployeesBusinessDAO.getByBusiness(origin_biz._2).map(emp_biz =>
                                    EmployeeDAO.get(emp_biz._1)).flatten.map(emp => emp.uid)
                               }
      case _ => List()
    }
    BoardActor() ! HistMessage(email, target, targetEmails )
  }
  def updateLaunchLock(target: String, email: String, isLock:Boolean=false, launchId:Int=0) = {
    val targetEmails:List[String] = EmployeesBusinessDAO.getByUID(email) match {
      case Some(origin_biz) => { EmployeesBusinessDAO.getByBusiness(origin_biz._2).map(emp_biz =>
                                    EmployeeDAO.get(emp_biz._1)).flatten.map(emp => emp.uid)
                               }
      case _ => List()
    }
    var lockDef = "unlock"
    if (isLock) {
        lockDef = "lock"
    } else {
      lockDef = "unlock"
    }
    BoardActor() ! LaunchLock(email, lockDef, launchId, targetEmails )
   }

  def updateResource(target: String, email: String, isLock:Boolean=false) = {
     val targetEmails:List[String] = EmployeesBusinessDAO.getByUID(email) match {
       case Some(origin_biz) => { EmployeesBusinessDAO.getByBusiness(origin_biz._2).map(emp_biz =>
                                     EmployeeDAO.get(emp_biz._1)).flatten.map(emp => emp.uid)
                                }
       case _ => List()
     }
     var lockDef = "unlock"
     if (isLock) {
         lockDef = "lock"
     } else {
       lockDef = "unlock"
     }
     BoardActor() ! ResourceUpdate(email, lockDef, targetEmails )
  }


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
    case pm: PopupMessage =>
      users foreach { _ ! pm }
    case hm: HistMessage =>
      users foreach { _ ! hm }
    case launchEv: LaunchLock =>
      users foreach { _ ! launchEv }
    case resUpdate: ResourceUpdate =>
      users foreach { _ ! resUpdate }
    case Subscribe =>
      users += sender
      context watch sender
    case StatusCheck => println(users.size)
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

case class HistMessage(email: String, target: String, targetEmails: List[String])
case class LaunchLock(email: String, target: String, launchId:Int, targetEmails: List[String])
case class ResourceUpdate(email: String, target: String, targetEmails: List[String])

case class Message(uuid: String, s: String)
case class PopupMessage(target: String, email: String = "")
case class PopupRequest(target: String)
