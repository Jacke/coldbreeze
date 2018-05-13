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


object EntityDAO {
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


 def getEntityByResources(resources: List[ResourceDTO])(connection: BBoardWrapperConnection):Future[List[ResourceEntitySelector]] = {
    val resource_ids = resources.map(_.id.get)
    val empty = List.empty[ResourceEntitySelector]
     val holder = Try(WS.url(s"http://${connection.host}:${connection.port}/api/v1/board").get().map { response =>
        val ponse = response.json.as[BoardContainer]
        // ResourceEntitySelector(resource: ResourceDTO, entities: List[Entity])
        //println(response.json)
        resources.map { resource =>
          val resource_id = resource.id.get
          val board_ids:List[String] = ponse.boards//.map(cn => cn.boards)
                          .filter(board => isOnBoardByResource(board, resource_id))
                          .map(b => b.id.get.toString)
          //println("boards_ids")
          //board_ids.foreach(println)

          val entities:List[Entity] = ponse.entities.filter(entity => board_ids.contains(entity.boardId.toString))
          ResourceEntitySelector(resource, entities = entities)
        }
     }.recover{ case c => {
      println(c)
      empty
      }
      })
        .getOrElse(Future.successful(empty))
     holder
  }
  def getEntityByResource(resource: ResourceDTO)(connection: BBoardWrapperConnection):Future[List[ResourceEntitySelector]] = {
    val resource_ids = List()//resources.map(_.id.get)
    val empty = List.empty[ResourceEntitySelector]
     val holder = Try(WS.url(s"http://${connection.host}:${connection.port}/api/v1/board").get().map { response =>
        val ponse = response.json.as[BoardContainer]
        // ResourceEntitySelector(resource: ResourceDTO, entities: List[Entity])
        //println(response.json)
          val resource_id = resource.id.get
          val board_ids:List[String] = ponse.boards//.map(cn => cn.boards)
                          .filter(board => isOnBoardByResource(board, resource_id))
                          .map(b => b.id.get.toString)
          //println("boards_ids")
          //board_ids.foreach(println)

          val entities:List[Entity] = ponse.entities.filter(entity => board_ids.contains(entity.boardId.toString))
          List(ResourceEntitySelector(resource, entities = entities))

     }.recover{ case c => {
      println(c)
      empty
      }
      })
        .getOrElse(Future.successful(empty))
     holder
  }
  def getEntityByResourceId(resource_id: Int)(connection: BBoardWrapperConnection):Future[List[Entity]] = {
    val empty = List.empty[Entity]
     val holder = Try(WS.url(s"http://${connection.host}:${connection.port}/api/v1/board").get().map { response =>
        val ponse = response.json.as[BoardContainer]
        // ResourceEntitySelector(resource: ResourceDTO, entities: List[Entity])
        //println(response.json)
          val board_ids:List[String] = ponse.boards//.map(cn => cn.boards)
                          .filter(board => isOnBoardByResource(board, resource_id))
                          .map(b => b.id.get.toString)
          //println("boards_ids")
          //board_ids.foreach(println)
          val entities:List[Entity] = ponse.entities.filter(entity => board_ids.contains(entity.boardId.toString))
          entities
     }.recover{ case c => {
      println(c)
      empty
      }
      })
        .getOrElse(Future.successful(empty))
     holder
  }




  def getEntitiesByBoard(board_id: String, resource_id: Int = 0, biz: String = "")(connection: BBoardWrapperConnection) = {
    val empty:BoardContainer = BoardContainer(boards = List(),entities = List(), slats = List())
     val holder = Try(WS.url(s"http://${connection.host}:${connection.port}/api/v1/board").get().map { response =>
        val res = response.json.as[BoardContainer]
        res.copy(boards = res.boards.filter(_.id == board_id), entities = res.entities.filter(entity =>
            entity.boardId.toString == board_id
          ))
        //println(response.json)
        res //.copy(boards =          res.boards.filter(b => b.onBusiness(biz)))
     }.recover{ case c => {
      println(c)
      empty
      }
      })
        .getOrElse(Future.successful(empty))
     holder
  }

  def getEntityById(entity_id: String)(connection: BBoardWrapperConnection):Future[Option[Entity]] = {
    val empty:Option[Entity] = None //BoardContainer(boards = List(),entities = List(), slats = List())
     val holder = Try(WS.url(s"http://${connection.host}:${connection.port}/api/v1/board").get().map { response =>
        val res = response.json.as[BoardContainer]
        println(response.json)
        res.copy(entities = res.entities.filter(entity =>
            entity.getId == entity_id
          )).entities.headOption
     }.recover{ case c => {
      println(c)
      empty
      }
      })
        .getOrElse(Future.successful(empty))
     holder
  }

   def addEntityByResource(resource_id: Int, entity: Entity)(connection: BBoardWrapperConnection):Future[String] = {
     val data = Json.toJson(entity)
     val boardId: String = entity.boardId.toString
     println("UPDATE ENTITY")
     println(s"boardId: ${entity.boardId} entity: ${entity.toString} ")
     println(data)
     val holder = Try(
      WS.url(s"http://${connection.host}:${connection.port}/api/v1/board/${boardId}/entities/create").post(data).map { response =>
        val res = response.json
        println(res)
        response.toString
        }.recover{ case e => {println("error");println( );println();println();println(e); "false" }})
        .getOrElse(Future.successful("false"))
      holder
  }


  def updateEntity(entity_id: String, entity: Entity)(connection: BBoardWrapperConnection):Future[String] = {
     val data = Json.toJson(entity)
     println("UPDATE ENTITY")
     println(s"entity_id: $entity_id entity: ${entity.toString} ")
     println(data)
     val board_id: String = ""
     val holder = Try(
      WS.url(s"http://${connection.host}:${connection.port}/api/v1/b/${entity_id}/entity/${entity_id}/edit").post(data).map { response =>
        val res = response.json
        println(res)
        res.toString
        }.recover{ case e => {println("error");println( );println();println();println(e); "false" }})
        .getOrElse(Future.successful("false"))
      holder
  }



 def removeEntityByBoard(board_id: String, entity_id: String)(connection: BBoardWrapperConnection):Future[String] = {
     val board_id: String = ""
     val holder = Try(
      WS.url(s"http://${connection.host}:${connection.port}/api/v1/entity/${entity_id}/remove").post(Map("key" -> Seq("value"))).map { response =>
        val res = response.json
        println(res)
        res.toString
        }.recover{ case _ => "" })
        .getOrElse(Future.successful("false"))
     holder
  }
  def removeEntityById(entity_id: String)(connection: BBoardWrapperConnection):Future[String] = {
     val board_id: String = ""
     val holder = Try(
      WS.url(s"http://${connection.host}:${connection.port}/api/v1/entity/${entity_id}/remove").post(Map("key" -> Seq("value"))).map { response =>
        val res = response.json
        println(res)
        res.toString
        }.recover{ case _ => "" })
        .getOrElse(Future.successful("false"))
     holder
  }




  private def isOnBoardByResources(board: Board, resource_ids: List[Int]):Boolean = {
    board.meta.find(m => m.key == "resource_id" && resource_ids.map(_.toString).contains(m.value)).isDefined
  }

  private def isOnBoardByResource(board: Board, resource_id: Int):Boolean = {
    board.meta.find(m => m.key == "resource_id" && m.value == resource_id.toString).isDefined
  }




}
