package main.scala

//import main.scala.process_parts._
//import main.scala.utils._
//import main.scala.MM._
/*
import akka.actor.ActorSystem
import scala.util.Properties.{ lineSeparator ⇒ newLine }

object BPServiceApp extends App {

  val system = ActorSystem("bp-service-system")

  val hostname = Settings(system).hostname
  val port = Settings(system).port
  val timeout = Settings(system).timeout
  system.actorOf(BPService.props(hostname, port, timeout), "bp-service")

  system.awaitTermination()
}
import akka.actor.{ ActorLogging, ActorRef, Props }
import akka.io.IO
import scala.concurrent.duration.{ DurationInt, FiniteDuration }
import spray.can.Http
import spray.http.StatusCodes
import spray.httpx.SprayJsonSupport
import spray.json.DefaultJsonProtocol
import spray.routing.{ HttpServiceActor, Route }
import spray.routing.authentication.BasicAuth

object BPService {

  object Message extends DefaultJsonProtocol {
    implicit val format = jsonFormat2(apply)
  }
  object Status extends DefaultJsonProtocol {
    implicit val format = jsonFormat2(apply)
  }
  type Result = String
  case class Message(username: String, text: String)
  case class Status(username: String, logs: List[Result])
  def props(hostname: String, port: Int, timeout: FiniteDuration): Props =
    Props(new BPService(hostname, port, timeout))
}

class BPService(hostname: String, port: Int, timeout: FiniteDuration) extends HttpServiceActor
    with ActorLogging with SprayJsonSupport {

  import BPService._
  import context.dispatcher

  import scala.concurrent.duration.FiniteDuration
  import spray.can.Http
  import spray.http.MediaTypes._

  IO(Http)(context.system) ! Http.Bind(self, hostname, port)

  override def receive: Receive =
    runRoute(apiRoute ~ staticRoute)

  def apiRoute: Route =
    // format: OFF
    authenticate(BasicAuth(UsernameEqualsPasswordAuthenticator, "Gabbler")) { user =>
      pathPrefix("api") {
        path("messages") {
          get {
            produce(instanceOf[Seq[Message]]) { completer => _ =>
              log.debug("User {} is asking for messages ...", user.username)
              log.debug(context.toString)
              log.debug(context.children.toString)
              log.debug(gabblerFor(user.username).toString)
              context.children foreach (_ ! Seq[Message](Message("sss", "aaazx"), Message("sss", "aaazsssx")))
              gabblerFor(user.username) ! completer
            }
          } ~
          post {
            entity(as[Message]) { message =>
              complete {
                log.debug("User '{}' has posted '{}'", user.username, message.text)
                context.children foreach (_ ! message)
                StatusCodes.NoContent
              }
            }
          }
        } ~
        path("tryin") {
          get {
            complete {
              log.debug("test")
              
              Status("jacke", Tryin1.logs.toList)
            }
          }
        } ~
        path("shutdown") {
          get {
            complete {
              val system = context.system
              system.scheduler.scheduleOnce(1 second)(system.shutdown())
              "Shutting down in 1 second ..."
            }
          }
        }
      }
    } // format: ON

  def staticRoute: Route =
    // format: OFF
    path("") {
      getFromResource("web/index.html")
    } ~
    path("spray-html") {
        get {
          respondWithMediaType(`text/html`) {
            complete {
              <html>
                <body>
                  <h1>Hello papsa!</h1>
                </body>
              </html>
            }
          }
        }
      } ~
    path("spray-test") {
        get {
          complete {
            "test test"
          }
        }
      } ~
    path("foo") {
      parameters('color, 'count.as[Int]) { (color, count) =>
        complete(s"The color is '$color' and you have $count of it.")
    }
    } ~
    getFromResourceDirectory("web") // format: ON

  def gabblerFor(username: String): ActorRef =
    context.child(username) getOrElse context.actorOf(BPService.props(Settings(BPServiceApp.system).hostname, Settings(BPServiceApp.system).port, Settings(BPServiceApp.system).timeout), username)
}

//
//object Main extends App {
//  Tryin1.apply
//
//  //  println(Calculator("5 * 10"))
//  //  println(Calculator("5 * 10").getClass)
//}
object Condtryin {

}
*/
/* ======================================================
   ======================================================
   ======================================================
   ======================================================
   ====================================================== */
    /*
object Tryin1 {
  import util.Random
  import scala.collection.mutable._

  def context {
    val Context = new StructContext("Accounting")
    Context.subject = List(new Subject("Make accounting"))
    Context.subject.head.subj_elems = ListBuffer(Left(new BProcess(List("Stan", "Will"))))
    Context.subject.head.subj_elems.head.left.get.push {
      ListBuffer[ProcElems](
        new Note("Test note"),
        new Constant[Int](1001),
        new Brick("fff", Unit, Unit, Unit, Unit),
        new Brick("sss", Unit, Unit, Unit, Unit),
        new Result,
        // is front? not evaled

        new Condition(true),
        new Dimension,
        new Dimension,
        new Constant[Int](42),
        new Note("Condition note"),
        new Stopper,
        new Brick("sss", Unit, Unit, Unit, Unit))
    }

    println(Context)
  }

  def apply {
    val proc = new BProcess(List("Stan", "Will"))
    proc.push {
      ListBuffer[ProcElems](
        new Note("Test note"),
        new Constant[Int](1001),
        new Brick("fff", Unit, Unit, Unit, Unit),
        new Brick("sss", Unit, Unit, Unit, Unit),
        new Result,
        // is front? not evaled

        new Condition(true),
        new Dimension,
        new Dimension,
        new Constant[Int](42),
        new Note("Condition note"),
        new Stopper,
        new Brick("sss", Unit, Unit, Unit, Unit))

    }
    // Const -> Result
    val link_check = new BLink(Option(proc.variety(1)), Option(proc.variety(4)))
    // ???                                                 
    new BLink(Option(proc.variety.last), Option(proc.variety.head))
    // Condition dims
    new BLink(Option(proc.variety(5)), Option(proc.variety(6)))
    // Block to Dims
    new BLink(Option(proc.variety(6)), Option(proc.variety(9)))
    new BLink(Option(proc.variety(6)), Option(proc.variety(10)))

    InvokeTracer.run_proc(proc)
    println(proc.state)
    println(proc.status)
    println("------------------->")
    println("links are:")
    println(BLink.relations)

    println("proc status:")
    println(proc.status)
    println(proc.step)
    //InvokeTracer.run_proc(proc)
    println("proc status:")
    println(proc.status)
    println(proc.step)

    println("link from to cheking:")
    println(link_check.from)
    println(link_check.to)
    println(proc.logger.logs)
    //println(proc.represent)
    println(BLinkDispatch.to(proc.variety(6)).map(_.get).to[ListBuffer])
    println(InvokeTracer.isFront(proc.variety(9)))
  }

} */