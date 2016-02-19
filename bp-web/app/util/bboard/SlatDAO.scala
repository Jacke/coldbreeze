package bboard
import minority.utils._
import play.api.Play.current
import play.api.libs.ws._
import play.api.libs.ws.ning.NingAsyncHttpClientConfigBuilder
import scala.concurrent.Future
import java.util.UUID
import scala.concurrent._
import scala.concurrent.duration._
import org.jboss.netty.buffer._
import org.joda.time.DateTime
import play.api.data._
import play.api.data.Forms._
import play.api.data.format.Formats._
import play.api.data.validation.Constraints._
import play.api.data.format._
import play.api.libs.concurrent.Execution.Implicits.defaultContext
import play.api.libs.json._
import play.api.Play.current
import scala.util.{Success, Failure}
import scala.util.Try
import models.DAO._
import models._
import models.DAO.resources._
import akka.actor._
import akka.actor._
import akka.pattern.ask
import akka.util.Timeout
import com.typesafe.scalalogging.Logger
import org.slf4j.LoggerFactory

    

object SlatDAO {
  import play.api.libs.json.Json
  implicit val ResourceDTOReaders = Json.reads[ResourceDTO]
  implicit val ResourceDTOFormat = Json.format[ResourceDTO]
  implicit val MetaValFormat = Json.format[MetaVal]
  implicit val MetaValReader = Json.reads[MetaVal]
  implicit val personHandler = Json.reads[Ownership]
  implicit val jsonOwnershipFormat = Json.format[Ownership]
  implicit val jsonBoardFormat = Json.format[Board]
  implicit val jsonBoardReaders = Json.reads[Board]
  implicit val EntityFormat = Json.format[Entity]
  implicit val EntityReaders = Json.reads[Entity]
  implicit val SlatFormat = Json.format[Slat]
  implicit val SlatReaders = Json.reads[Slat]
  implicit val BoardContainerReaders = Json.reads[BoardContainer]
  implicit val BoardContainerFormat = Json.format[BoardContainer]
  implicit val ResourceEntitySelectorFormat = Json.format[ResourceEntitySelector]
  implicit val ResourceEntitySelectorReaders = Json.reads[ResourceEntitySelector]
  implicit val SlatSelectorFormat = Json.format[SlatSelector]
  implicit val SlatSelectorReaders = Json.reads[SlatSelector]
  
  val appLogger = Logger(LoggerFactory.getLogger("bboard"))
  def toApplogger(msg: Any, log_type: String = "info") = {
      log_type match {
        case "debug" => appLogger.info(msg.toString)
        case "info" => appLogger.info(msg.toString)
        case "error" => appLogger.info(msg.toString)
      }
  }

 def getSlatById(slat_id: String)(connection: BBoardWrapperConnection):Future[Option[Slat]] = {
    val empty:Option[Slat] = None //BoardContainer(boards = List(),entities = List(), slats = List())
     val holder = Try(WS.url(s"http://${connection.host}:${connection.port}/api/v1/board").get().map { response =>
        val res = response.json.as[BoardContainer]
        println(response.json)
        res.copy(slats = res.slats.filter(slat =>
            slat.getId == slat_id
          )).slats.headOption
     }.recover{ case c => {
      println(c)
      empty 
      }
      })
        .getOrElse(Future.successful(empty))
     holder   
  }  

 def getSlatByEntitiesIds(entities_ids: List[String])(connection: BBoardWrapperConnection):Future[List[Slat]] = {
    val empty:List[Slat] = List() 
    val data = Json.toJson(SlatSelector(entities_ids))
       val holder = Try(WS.url(s"http://${connection.host}:${connection.port}/api/v1/entities/slats").post(data).map { response =>
       val res = response.json.as[List[Slat]]
       println(response.json)
       res
     }.recover{ case c => {
      println(c)
      empty 
      }
      })
        .getOrElse(Future.successful(empty))
     holder   
  }    

  def addSlatByEntity(entity_id: String, slat: Slat)(connection: BBoardWrapperConnection):Future[String] = {
     val data = Json.toJson(slat)
     // find entity, find board id of that entity
     val board_id: String = ""
     val holder = Try(
      WS.url(s"http://${connection.host}:${connection.port}/api/v1/entity/${entity_id}/slats/create").post(data).map { response =>
        val res = response.json
        println(res)
        res.toString
        }.recover{ case e => {println("error");println( );println();println();println(e); "false" }})
        .getOrElse(Future.successful("false"))
      holder  
  }



 def updateSlatByEntity(entity_id: String, slat_id: String, slat: Slat)(connection: BBoardWrapperConnection):Future[String] = {
     val data = Json.toJson(slat)
     println("UPDATE ENTITY")
     println(s"entity_id: $entity_id slat_id: ${slat_id} entity: ${slat.toString} ")
     println(data)

     val board_id: String = ""
     val holder = Try(
     WS.url(s"http://${connection.host}:${connection.port}/api/v1/ent/${entity_id}/slat/${slat_id}/edit").post(data)
      .map { response =>
        val res = response.json
        println(res)
        res.toString
        }.recover{ case e => {println("error");println( );println();println();println(e); "false" }})
        .getOrElse(Future.successful("false"))
      holder  
  }
  // /api/v1/slat/:slat_id/fill
  def fillSlat(slat_id: String, sval: String)(connection: BBoardWrapperConnection):Future[String] = {
     val data = Json.toJson(sval)
     println("FILL SLAT")
     println(data)
     val holder = Try(
     WS.url(s"http://${connection.host}:${connection.port}/api/v1/slat/${slat_id}/fill").post(data)
      .map { response =>
        val res = response.json
        println(res)
        res.toString
        }.recover{ case e => {println("error");println( );println();println();println(e); "false" }})
        .getOrElse(Future.successful("false"))
      holder  
  }  
  // /api/v1/slat/:slat_id/refill
  def refillSlat(slat_id: String, sval: String)(connection: BBoardWrapperConnection):Future[String] = {
     val data = Json.toJson(sval)
     println("REFILL SLAT")
     println(data)
     val holder = Try(
     WS.url(s"http://${connection.host}:${connection.port}/api/v1/slat/${slat_id}/refill").post(data)
      .map { response =>
        val res = response.json
        println(res)
        res.toString
        }.recover{ case e => {println("error");println( );println();println();println(e); "false" }})
        .getOrElse(Future.successful("false"))
      holder  
  }

def removeSlatById(slat_id: String)(connection: BBoardWrapperConnection):Future[String] = {
     println("REMOVE SLAT")
     println(s"slat_id: $slat_id ")    
     val holder = Try(
      WS.url(s"http://${connection.host}:${connection.port}/api/v1/slat/${slat_id}/remove").post(Map("key" -> Seq("value"))).map { response =>
        val res = response
        println(res)
        res.toString
        }.recover{ case e => {println("error");println( );println();println();println(e); "false" }})
        .getOrElse(Future.successful("false"))
     holder
  }
	
}
