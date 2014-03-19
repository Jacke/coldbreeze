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

import models.DAO._

object MessageJsonProtocol extends DefaultJsonProtocol {
  implicit val format = jsonFormat2(Message)
  implicit val msgformat = jsonFormat2(MessagesList)
  implicit val supformat = jsonFormat3(BProcess)
  implicit val suppsformat = jsonFormat1(BProcessesDTO)

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


trait SprayService extends HttpService {
  import spray.http.StatusCodes.{ Created, BadRequest, NotFound, OK }
  //import MessagesListJsonProtocol._
  import MessageJsonProtocol._
  import main.scala.utils.ElementTracer

  def adRoute: Route =
    path("proc_elements") {
      get {
        complete {
          ElementTracer.els
        }
      }
    } ~
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
          entity(as[BProcess]) {
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
