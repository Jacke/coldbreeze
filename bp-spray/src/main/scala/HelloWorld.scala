package service

//import main.scala.process_parts._
//import main.scala.utils._
//import main.scala.MM._
import models.DAO._
import main.scala.utils._
import main.scala.bprocesses._
import main.scala.resources.scopes._


object BPServiceApp { //extends App {

   println("test")
   ElementRegistrator.apply
   // caster
   val process_dto = BPDTO.get(1)
   val target = ProcElemCRUD.findByBPId(1)
   println(target)
   
   val process = new BProcess(new Managment)

   val arrays = target.map(c => c.cast(process)).flatten.toArray
   println(arrays)
   process.push {
    arrays
   }   
   println(process.variety.length)

   InvokeTracer.run_proc(process)
   // save log & station
   println(process.station.represent)
   println(process.logger.logs.map(log => println(log.element.id)))
   //println(ElementTracer.findByInfo(target.head.b_type, target.head.type_title))

  // station -> stationdb
  val dbstation = BPStationDTO.from_origin_station(process.station, process_dto)
  println(dbstation)
  
  val station_id = BPStationDTO.pull_object(dbstation)
  println("station id" + station_id)

  // logger -> loggerdb
  val dblogger = BPLoggerDTO.from_origin_lgr(process.logger, process_dto, station_id)//, station:Int = 1)
  println(dblogger)
  dblogger.foreach(log => BPLoggerDTO.pull_object(log))


  // loggerdb -> logger(bp)
  val process1 = new BProcess(new Managment)
  process1.variety = process.variety
  println(process.logger.logs)
  println("process1.variety" + process1.variety.length)

  println("ssss"+process1.findObjectByOrder(1))
  println(process1.findObjectByOrder(3).get)
  println(process1.variety.map(elem => elem.order).last)
  println(process1.variety.find(elem => elem.order == 3))

  println(dblogger.get.map(log => println(log.order)))
  val logger_results = dblogger.get.map(log => BPLoggerResult(process1.findObjectByOrder(log.order).get, log.order, None, //log.space
     process1.station, log.invoked, log.expanded, log.container, new java.util.Date(log.date.getTime()))
) 
  println(logger_results)
  

  // stationdb -> station(bp)
  process1.station.update_variables(
                                dbstation.state,
                                dbstation.step,
                                dbstation.space,
                                dbstation.container_step.toArray,
                                dbstation.expand_step.toArray,
                                dbstation.started,
                                dbstation.finished,
                                dbstation.inspace,
                                dbstation.incontainer,
                                dbstation.inexpands,
                                dbstation.paused
                                )

println("is work?", process1.station.represent)

  // save to space

}
/*
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