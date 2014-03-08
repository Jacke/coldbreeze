package service

import akka.actor.{ ActorLogging, ActorRef, Props }
import akka.io.IO
import scala.concurrent.duration.FiniteDuration
import spray.can.Http
import spray.http.MediaTypes._
import spray.json._
import spray.httpx.SprayJsonSupport._
import spray.routing.{ HttpService, HttpServiceActor, Route }
import spray.json.DefaultJsonProtocol._

case class MessagesList(title: String, container: List[Message])
case class Message(process: String, test: List[Int]) {
  // val typeof = getClass.toString
}
case class Supplier(var id: Option[Int], title: String, address: String, city: String, state: String, zip: String) {
  //def incid: Int = id + 1

}
case class SuppliersDTO(suppliers: List[Supplier])
object MessageJsonProtocol extends DefaultJsonProtocol {
  implicit val format = jsonFormat2(Message)
  implicit val msgformat = jsonFormat2(MessagesList)
  implicit val supformat = jsonFormat6(Supplier)
  implicit val suppsformat = jsonFormat1(SuppliersDTO)

}
//object MessagesListJsonProtocol extends DefaultJsonProtocol {
//  implicit val format = jsonFormat2(MessagesList.apply)
//}
//
/**
 * Spray service
 *   - a REST under `spray-json-message/`
 *   - a HTML under `spray-html/`
 */

/* ======================================================
   ======================================================
   ======================================================
   ======================================================
   ====================================================== */

object FirstExample {
  import scala.slick.driver.PostgresDriver.simple._
  val database = Database.forURL("jdbc:postgresql://localhost/bookstore", driver = "org.postgresql.Driver", user = "postgres", password = "12344321")

  class Suppliers(tag: Tag) extends Table[(Option[Int], String, String, String, String, String)](tag, "suppliers") {
    def id = column[Int]("SUP_ID", O.PrimaryKey, O.AutoInc) // This is the primary key column
    def name = column[String]("SUP_NAME")
    def street = column[String]("STREET")
    def city = column[String]("CITY")
    def state = column[String]("STATE")
    def zip = column[String]("ZIP")
    // Every table needs a * projection with the same type as the table's type parameter
    def * = (id.?, name, street, city, state, zip) //<> (Supplier.tupled, Supplier.unapply)

  }
  val suppliers = TableQuery[Suppliers]

  import scala.util.Try

  def pull_object(s: Supplier) = Try(database withSession {
    implicit session ⇒
      suppliers returning suppliers.map(_.id) += Supplier.unapply(s).get
  })

  def pull(id: Option[Int] = None, title: String, address: String, city: String, state: String, zip: String) = Try(database withSession {
    implicit session ⇒

      suppliers += (id, title, address, city, state, zip)
  }).isSuccess
  def get(k: Int) = database withSession {
    implicit session ⇒
      val q3 = for { s ← suppliers if s.id === k } yield s <> (Supplier.tupled, Supplier.unapply _)
      println(q3.selectStatement)
      println(q3.list)
      q3.list //.map(Supplier.tupled(_))
  }
  println(get(222))
  def getAll = database withSession {
    implicit session ⇒
      val q3 = for { s ← suppliers } yield s <> (Supplier.tupled, Supplier.unapply _)
      q3.list.sortBy(_.id)
    //suppliers foreach {
    //  case (id, title, address, city, state, zip) ⇒
    //    Supplier(id, title, address, city, state, zip)
    //}
  }

}
/* ======================================================
   ======================================================
   ======================================================
   ======================================================
   ====================================================== */

trait SprayService extends HttpService {
  import spray.http.StatusCodes.{ Created, BadRequest, NotFound, OK }
  //import MessagesListJsonProtocol._
  import MessageJsonProtocol._

  def adRoute: Route =
    path("checkin") {
      get {
        complete {
          //main.scala.Tryin1.context
          List(1, 2, 3)
          //MessagesList("fff", List(
          //  Message("Service managers", List(1, 2, 3, 4)), Message("Service 1", List(1, 2, 3, 4)))) //.toJson
          //List(1, 2, 3)
          //Message("Hello mama!")
        }
      }
    } ~
      path("process") {
        post(
          entity(as[Supplier]) {
            suplier ⇒
              {
                //suplier.toString
                ctx ⇒
                  val obj = FirstExample.pull_object(suplier)
                  if (obj.isSuccess) {
                    suplier.id = Option(obj.get)

                    ctx.complete(suplier)
                  } else {
                    ctx complete (BadRequest, obj.failed.toString)
                  }
                //handleRestMsg[Either[Long, ErrorMsg]](InsertReq(suplier)).onSuccess {
                //  case Left(id)     ⇒ ctx.complete(Created, IdRsp(id))
                //  case Right(error) ⇒ if (error.is404) ctx complete NotFound else ctx complete (BadRequest, error.content)
                //}
              }
          })
      } ~
      path("process") {
        get(
          complete(FirstExample.getAll))
      } ~
      path("process" / IntNumber)(id ⇒
        get(
          complete(
            FirstExample.get(id).head))) ~
      pathPrefix("process" / IntNumber) { id ⇒
        path("blocks") {
          get {
            complete("checker" + id)
          }
        } ~
          path("logs") {
            get {
              complete("logs" + id)
            }
          }
      } ~
      pathPrefix("api") {
        path("launch") {
          get {
            // logs in array
            complete("launch")
          }
        } /* ~
          post {
            entity(as[Message]) { message ⇒
              complete {
                log.debug("User '{}' has posted '{}'", user.username, message.text)
                context.children foreach (_ ! message)
                StatusCodes.NoContent
              }
            }
            // invoke 
          }*/
      }

  //path("order" / IntNumber)(id =>
  //  get(
  //    complete(
  //      "Received GET request for order " + id 
  //    )
  //  ) ~
  //  put(
  //    complete(
  //      "Received PUT request for order " + id
  //    )
  //  )
  //)
  path("foo") {
    parameters('color, 'count.as[Int]) { (color, count) ⇒
      complete(s"The color is '$color' and you have $count of it.")
    }
  }

  //path("spray-html") {
  //  get {
  //    respondWithMediaType(`text/html`) {
  //      complete {
  //        <html>
  //          <body>
  //            <h1>Hello papa!</h1>
  //          </body>
  //        </html>
  //      }
  //    }
  //  }
  //}
}
