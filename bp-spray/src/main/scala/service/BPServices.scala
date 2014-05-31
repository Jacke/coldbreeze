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
import models.DAO.resources._

import models.DAO.BPStationDTO

import scala.concurrent.ExecutionContext
import scala.concurrent.ExecutionContext.Implicits.global
import scala.concurrent._

trait BPServices extends HttpService
 {
  //this: ECProvider =>

  //implicit val executionContext: ExecutionContext

  import main.scala.utils.ElementTracer
  import main.scala.utils.ElementRegistrator
  import main.scala.utils.Keepr
  import MessageJsonProtocol._


  import CustomAuthentication._

  def BPServiceRoute: Route =

  /**
   * Process service
   */
  path("register") {
    get
        complete {

          "Ok"
        }

  }/*
   ~
  path("auth") {
    post(
      entity(as[User]) {
        cred =>
        complete {
          CustomAuthentication.authController.user_profile(cred)
        }
        })
  } ~
  path("whoami") {
    
      authenticate(authenticateUser) { user =>
          complete {
            Map("name" -> user.email, "token" -> user.token.get).asInstanceOf[Map[String, String]].toJson.toString
          }
        }
     
    
  } ~
  path("bprocesses") {
    get(
      complete(BPDAO.getAll))
  } ~
  path("bprocesses") {
    post(
      entity(as[BProcessDTO]) {
        bprocess ⇒
        complete {
          //suplier.toString
          
            println(bprocess)
            //BPDTO.pull(None, bprocess.title, bprocess.business)
            BPDAO.pull_object(bprocess).toJson.toString
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
          BPInfo(ProcElemDAO.findByBPId(id), BPStationDAO.findByBPId(id), BPLoggerDAO.findByBPId(id))
        )
      )) ~
    pathPrefix("bprocess" / IntNumber) { id ⇒
      path("info") {
        get {
          complete(BPDAO.get(id))
        } ~
        put { 
              entity(as[BProcessDTO]){ bprocess ⇒
                complete(BPDAO.update(id, bprocess).toJson.toString)
              }
        } ~
        delete {
            complete(BPDAO.delete(id).toJson.toString)
        }
      } ~
      // Blocks
      path("elements") {
        get {
          complete(ProcElemDAO.findByBPId(id))
        }
      } ~
      path("logs") {
        get {
          complete(BPLoggerDAO.findByBPId(id))
        }
      } ~
      path("stations") {
        get {
          complete(BPStationDAO.findByBPId(id))
        }
      } ~ // Active
      path("active_stations") {
        get {
          complete(BPStationDAO.areActiveForBP(id))
        }
      } ~ // Last run
      path("last_run") {
        get {
          complete(BPLoggerDAO.lastRunOfBP(id) match {
            case Some(date) => date.toJson.toString
            case _ => "Not found"
            })
        }
      }
    } ~
    pathPrefix("businesses" / IntNumber){ id =>
       complete(ClientDAO.getBusiness(id))
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
          complete(ProcElemDAO.findById(id))
        }
      }
      path("order" / IntNumber) { orderNum =>
        post {
          complete(ProcElemDAO.update_order(id, orderNum))
        }
      }
    }

  val loggersRoute:Route =
    path("logs" / IntNumber) { id ⇒
      get {
        complete(BPLoggerDAO.findByBPId(id))
      }
    } ~
    path("log" / IntNumber) { id =>
      get {
          complete(BPLoggerDAO.findById(id))
      }
    }

  val stationsRoute:Route =
  path("stations" / IntNumber) { id ⇒
    get {
      complete(BPStationDAO.findByBPId(id))
    }
  } ~
  path("station" / IntNumber) { id =>
    get {
        complete(BPStationDAO.findById(id).get)
    }
  }
  val inputRoute:Route =
  // /bprocess/:id/request
    path("request") {
      get {
        complete("{station: null}")//(BPRequestScheme TODO)
      }
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

  /**
  ** Resources routes
  **/
  val businessesRoute:Route =
    path("businesses") {
      get {
        complete("businesses")
      }
    }
  val employeesRoute:Route =
    path("employees") {
      get {
        complete("employees")
      }
    }
  
  val clientsRoute:Route = 
    path("clients") {
      get {
        complete("clients")
      }
    }*/

}


