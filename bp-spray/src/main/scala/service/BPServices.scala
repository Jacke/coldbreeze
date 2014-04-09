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
import models.DAO.KeeprDAO
import models.DAO.BProcessDTO


import org.joda.time.{DateTimeZone, Instant}
import org.joda.time.format.ISODateTimeFormat
import org.joda.time.DateTime

import models.DAO._

import models.DAO.BPStationDTO1


trait BPServices extends HttpService {
  import main.scala.utils.ElementTracer
  import main.scala.utils.ElementRegistrator
  import main.scala.utils.Keepr
  import MessageJsonProtocol._

  def BPServiceRoute: Route =

  /**
   * Process service
   */
  path("bprocesses") {
    get(
      complete(BPDTO.getAll))
  } ~
  path("bprocesses") {
    post(
      entity(as[BProcessDTO]) {
        bprocess ⇒
        complete {
          //suplier.toString
          
            println(bprocess)
            //BPDTO.pull(None, bprocess.title, bprocess.business)
            BPDTO.pull_object(bprocess).toJson.toString
          //val obj = FirstExample.pull_object(suplier)
          //if (obj.isSuccess) {
          //  suplier.id = Option(obj.get)
          //
          //  ctx.complete(suplier)
          //} else {
          //  ctx complete (BadRequest, obj.failed.toString)
          //}
          //handleRestMsg[Either[Long, ErrorMsg]](InsertReq(suplier)).onSuccess {
          //  case Left(id)     ⇒ ctx.complete(Created, IdRsp(id))
          //  case Right(error) ⇒ if (error.is404) ctx complete NotFound else ctx complete (BadRequest, error.content)
          //}
        }
      })
  } ~
  path("bprocess_full" / IntNumber)(id ⇒
    get(
      complete(
          BPInfo(ProcElemCRUD.findByBPId(id), BPStationDTO.findByBPId(id), BPLoggerDTO.findByBPId(id))
        )
      )) ~
    pathPrefix("bprocess" / IntNumber) { id ⇒
      path("info") {
        get {
          complete(BPDTO.get(id))
        } ~
        put { 
              entity(as[BProcessDTO]){ bprocess ⇒
                complete(BPDTO.update(id, bprocess).toJson.toString)
              }
        } ~
        delete {
            complete(BPDTO.delete(id).toJson.toString)
        }
      } ~
      // Blocks
      path("elements") {
        get {
          complete(ProcElemCRUD.findByBPId(id))
        }
      } ~
      path("logs") {
        get {
          complete(BPLoggerDTO.findByBPId(id))
        }
      }
    } ~
    elemsRoute ~
    // Logs
    loggersRoute ~
    // Station
    stationsRoute ~
    // Input
    inputRoute ~
    path("bproc_elements") {
      get {
        complete {
            ElementRegistrator.apply
            ElementTracer.els.map(keepr => KeeprDAO.tupled(Keepr.unapply(keepr).get))

          }
        }
      }

  val elemsRoute:Route =
    path("block" / IntNumber) { id =>
      path("info") {
        get {
          complete(ProcElemCRUD.findById(id))
        }
      }
      path("order" / IntNumber) { orderNum =>
        post {
          complete(ProcElemCRUD.update_order(id, orderNum))
        }
      }
    }

  val loggersRoute:Route =
    path("logs" / IntNumber) { id ⇒
      get {
        complete(BPLoggerDTO.findByBPId(id))
      }
    } ~
    path("log" / IntNumber) { id =>
      get {
          complete(BPLoggerDTO.findById(id))
      }
    }

  val stationsRoute:Route =
  path("stations" / IntNumber) { id ⇒
    get {
      complete(BPStationDTO.findByBPId(id))
    }
  } ~
  path("station" / IntNumber) { id =>
    get {
        complete(BPStationDTO.findById(id))
    }
  }
  val inputRoute:Route =
    path("invoke") {
      post {
        /*formFields('color, 'age.as[Int]) { (color, age) =>
         complete {
         s"The color is '$color' and the age ten years ago was ${age - 10}"
         }
           //BPSerial.BPRun(id)
           //BPStationDTO.findByBPId(id).last

         }*/
        entity(as[InvokeRequest]) { request =>
          complete(request)

        }
      }
    }
}
