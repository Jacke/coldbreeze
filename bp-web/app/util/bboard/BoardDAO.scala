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

object BoardDAO {
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

def findOrCreateBoard(launch_id: Int, element_id: Option[Int], userId: String)(connection: BBoardWrapperConnection): Future[Option[Board]] = {
    val empty:Option[Board] = None
     val holder = Try(WS.url
    (s"http://${connection.host}:${connection.port}/board/findOrCreate?launch_id=${launch_id}&element_id=${element_id.getOrElse("")}&userId=${userId}")
    .get().map { response =>
        val res = response.json.as[Board]
        println(response.json)
        Some(res) //.copy(boards =          res.boards.filter(b => b.onBusiness(biz)))
     }.recover{ case c => {
      println(c)
      empty 
      }
      })
        .getOrElse(Future.successful(empty))
     holder  
}

def getWarpBoardByLaunch(launch_id: Int, biz: String = "")(connection: BBoardWrapperConnection):Future[BoardContainer] = {
    val empty:BoardContainer = BoardContainer(boards = List(),entities = List(), slats = List())
     val holder = Try(WS.url(s"http://${connection.host}:${connection.port}/api/v1/board/launch/${launch_id}").get().map { response =>
        val res = response.json.as[BoardContainer]
        println(response.json)
        res //.copy(boards =          res.boards.filter(b => b.onBusiness(biz)))
     }.recover{ case c => {
      println(c)
      empty 
      }
      })
        .getOrElse(Future.successful(empty))
     holder   
} 

def getBoardByResource(resource_id: Int, biz: String)(connection: BBoardWrapperConnection):Future[BoardContainer] = {
  	val empty:BoardContainer = BoardContainer(boards = List(),entities = List(), slats = List())
  	 val holder = Try(WS.url(s"http://${connection.host}:${connection.port}/api/v1/board").get().map { response =>
        val res = response.json.as[BoardContainer]
//        println(response.json)
        res //.copy(boards =         	res.boards.filter(b => b.onBusiness(biz)))
     }.recover{ case c => {
     	println(c)
     	empty 
     	}
     	})
        .getOrElse(Future.successful(empty))
     holder   
}

def addBoardForResource(board: Board)(connection: BBoardWrapperConnection):Future[String] = {
     val data = Json.toJson(board)
     val holder = Try(
              WS.url(s"http://${connection.host}:${connection.port}/api/v1/boards/create").post(data).map { response =>
        val res = response.json
        println(res)
        res.toString
        }.recover{ case _ => "" })
        .getOrElse(Future.successful("false"))
     holder   
}


/**
 * Filters
 */
def isOnBoardByResources(board: Board, resource_ids: List[Int]):Boolean = {
  board.meta.find(m => m.key == "resource_id" && resource_ids.map(_.toString).contains(m.value)).isDefined 
}

def isOnBoardByResource(board: Board, resource_id: Int):Boolean = {
  board.meta.find(m => m.key == "resource_id" && m.value == resource_id.toString).isDefined 
}  
	
}
