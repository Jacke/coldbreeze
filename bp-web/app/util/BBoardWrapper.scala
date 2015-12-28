package minority.utils
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

case class BBoardWrapperConnection(host: String = "localhost", port: String = "9001")
case class BoardContainer(boards: List[Board], entities:List[Entity], slats:List[Slat])
case class ResourceEntitySelector(resource: ResourceDTO, entities: List[Entity])
case class SlatSelector(entities_ids: List[String])


case object PingMessage
case class PongMessage(state:Boolean)
case object StartMessage
case object StopMessage
case object StateMessage

class BBoardPing(pong: ActorRef) extends Actor {
  var count = 0
  var state = false
  def incrementAndPrint { count += 1; println("ping") }
  def receive = {
    case StartMessage =>
        //incrementAndPrint
        pong ! PingMessage
    case x:PongMessage => 
        //incrementAndPrint
        //if (count > 99) {
        //  sender ! StopMessage
       // //  println("ping stopped")
       //   context.stop(self)
       // } else {
          state = x.state
          sender ! PingMessage
        //}
    case StateMessage => sender ! state
  }
}
 
class BBoardPong(connection: BBoardWrapperConnection) extends Actor {
  def receive = {
    case PingMessage =>
        println("  pong")
        sender ! Await.result(ping(), Duration(10000, MILLISECONDS))
    case StopMessage =>
        println("pong stopped")
        context.stop(self)
  }
  def ping():Future[PongMessage] = {
    Try(WS.url(s"http://${connection.host}:${connection.port}/api/v1/ping").get().map(response =>
        PongMessage(response.body == "{'status': 'ok'}") ).recover{   case _ => PongMessage(false) })
        .getOrElse(Future.successful(PongMessage(false)))
  }
}


class BBoardWrapper(connection: BBoardWrapperConnection) {
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

  def ping():Future[Boolean] = {
    Try(WS.url(s"http://${connection.host}:${connection.port}/api/v1/ping").get().map(response =>
        response.body == "{'status': 'ok'}").recover{ 	case _ => false })
        .getOrElse(Future.successful(false))
  }
  val system = ActorSystem("PingPongSystem")
  val pongg = system.actorOf(Props(new BBoardPong(connection)), name = "pongg")
  val pingg = system.actorOf(Props(new BBoardPing(pongg)), name = "pingg")

implicit val timeout = Timeout(5 seconds)

  // start them going
  //pingg ! StartMessage  
  def newPing():Boolean = {

      pingg ! StartMessage  
      pingg ! StateMessage
      val future2: Future[Boolean] = ask(pingg, StateMessage).mapTo[Boolean]
      Await.result(future2, 1 second)      
  }
  def fetchCSRF():String = {  	
    val holder = Try(WS.url(s"http://${connection.host}:${connection.port}/signIn").withHeaders("PLAY_SESSION" -> 
  		"b7c227d8eab90572006fafbf7c653b4e1e0c9e3b-csrfToken=e683f6aa463a9c64d7a73f8e810087f275afe62d-1443650032796-9c1709c7fc0b0ca2b649d305").get().map(response =>
        "response").recover{ case _ => "" })
        .getOrElse(Future.successful("false"))
    ""
  }
  def auth(email: String, password: String) = {
  	val csrfToken:String = fetchCSRF()
	val data = Map(
	  "csrfToken" -> Seq(csrfToken),
	  "email" -> Seq("value2"),
	  "password" -> Seq("password")
	)
  	//val holder: Future[WSResponse] = WS.url(s"http://${connection.host}:${connection.port}/authenticate/credentials").post(data)
  	//val readyHolder = Await.result(holder, Duration(5000, MILLISECONDS))
  	//println(readyHolder.body)
  }
  def findOrCreateBoard(launch_id: Int, element_id: Option[Int], userId: String): Future[Option[Board]] = {
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
 
  def getWarpBoardByLaunch(launch_id: Int, biz: String = ""):Future[BoardContainer] = {
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
  def getBoardByResource(resource_id: Int, biz: String):Future[BoardContainer] = {
  	val empty:BoardContainer = BoardContainer(boards = List(),entities = List(), slats = List())
  	 val holder = Try(WS.url(s"http://${connection.host}:${connection.port}/api/v1/board").get().map { response =>
        val res = response.json.as[BoardContainer]
        println(response.json)
        res //.copy(boards =         	res.boards.filter(b => b.onBusiness(biz)))
     }.recover{ case c => {
     	println(c)
     	empty 
     	}
     	})
        .getOrElse(Future.successful(empty))
     holder   
  }
  def isOnBoardByResources(board: Board, resource_ids: List[Int]):Boolean = {
    board.meta.find(m => m.key == "resource_id" && resource_ids.map(_.toString).contains(m.value)).isDefined 
  }
  def isOnBoardByResource(board: Board, resource_id: Int):Boolean = {
    //println("isOnBoardByResource")
    //board.meta.foreach(println)
    //println(resource_id)
    //println( board.meta.find(m => m.key == "resource_id" && m.value == resource_id.toString).isDefined )    
    board.meta.find(m => m.key == "resource_id" && m.value == resource_id.toString).isDefined 
  }  
  def getEntityByResources(resources: List[ResourceDTO]):Future[List[ResourceEntitySelector]] = {
    val resource_ids = resources.map(_.id.get)
    val empty = List.empty[ResourceEntitySelector]
     val holder = Try(WS.url(s"http://${connection.host}:${connection.port}/api/v1/board").get().map { response =>
        val ponse = response.json.as[BoardContainer]
        // ResourceEntitySelector(resource: ResourceDTO, entities: List[Entity])
        println(response.json)
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
  def getEntityByResource(resource: ResourceDTO):Future[List[ResourceEntitySelector]] = {
    val resource_ids = List()//resources.map(_.id.get)
    val empty = List.empty[ResourceEntitySelector]
     val holder = Try(WS.url(s"http://${connection.host}:${connection.port}/api/v1/board").get().map { response =>
        val ponse = response.json.as[BoardContainer]
        // ResourceEntitySelector(resource: ResourceDTO, entities: List[Entity])
        println(response.json)
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
  def getEntityByResourceId(resource_id: Int):Future[List[Entity]] = {
    val empty = List.empty[Entity]
     val holder = Try(WS.url(s"http://${connection.host}:${connection.port}/api/v1/board").get().map { response =>
        val ponse = response.json.as[BoardContainer]
        // ResourceEntitySelector(resource: ResourceDTO, entities: List[Entity])
        println(response.json)
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

  def getEntitiesByBoard(board_id: String, resource_id: Int = 0, biz: String = "") = {
    val empty:BoardContainer = BoardContainer(boards = List(),entities = List(), slats = List())
     val holder = Try(WS.url(s"http://${connection.host}:${connection.port}/api/v1/board").get().map { response =>
        val res = response.json.as[BoardContainer]
        res.copy(boards = res.boards.filter(_.id == board_id), entities = res.entities.filter(entity =>
            entity.boardId.toString == board_id
          ))
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
  def getEntityById(entity_id: String):Future[Option[Entity]] = {
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
  def getSlatById(slat_id: String):Future[Option[Slat]] = {
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
  // GET     /api/v1/entities/slats
  def getSlatByEntitiesIds(entities_ids: List[String]):Future[List[Slat]] = {
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
/*-------------------------------------------
 * Create
 --------------------------------------------*/  
  def addBoardForResource(board: Board):Future[String] = {
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
  def addEntityByResource(resource_id: Int, entity: Entity):Future[String] = {
     val data = Json.toJson(entity)
     val boardId: String = entity.boardId.toString
     println("UPDATE ENTITY")
     println(s"boardId: ${entity.boardId} entity: ${entity.toString} ")
     println(data)
     val holder = Try(
      WS.url(s"http://${connection.host}:${connection.port}/api/v1/board/${boardId}/entities/create").post(data).map { response =>
        val res = response.json
        println(res)
        res.toString
        }.recover{ case e => {println("error");println( );println();println();println(e); "false" }})
        .getOrElse(Future.successful("false"))
      holder  
  }
  def addSlatByEntity(entity_id: String, slat: Slat):Future[String] = {
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
/*-------------------------------------------
 * Remove
 --------------------------------------------*/  
  def updateEntity(entity_id: String, entity: Entity):Future[String] = {
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
  def updateSlatByEntity(entity_id: String, slat_id: String, slat: Slat):Future[String] = {
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
  def fillSlat(slat_id: String, sval: String):Future[String] = {
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
  def refillSlat(slat_id: String, sval: String):Future[String] = {
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
/*-------------------------------------------
 * Remove
 --------------------------------------------*/
  def removeEntityByBoard(board_id: String, entity_id: String):Future[String] = {
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
  def removeSlatById(slat_id: String):Future[String] = {
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

object BBoardWrapper {
	lazy val connection = BBoardWrapperConnection("localhost", "9001")
	var wrapper:BBoardWrapper = null
	def apply():BBoardWrapper = {
		if (wrapper == null) {
		  new BBoardWrapper(connection)
	    } else { wrapper }
	}
}






case class Ownership(host: String, uid: String, group: String = "")
case class MetaVal(key: String, value: String)
case class Board(
  id: Option[UUID] = Some(UUID.randomUUID()),
  title: String,
  content: String,
  publisher: String,
  ownership: Ownership,
  meta: List[MetaVal] = List.empty,  
  creationDate: Option[DateTime],
  updateDate: Option[DateTime]) {
  
  def onBusiness(bid: String):Boolean = {
  	meta.filter(m => m.key == "business_id" && m.value == bid).length > 0
  }

  def getId:String = id match {
    case Some(uuid) => uuid.toString
    case _ => ""
  }
}

case class Entity(
  id: Option[UUID] = Some(UUID.randomUUID()),
  title: String,
  boardId: UUID,
  description: String,
  publisher: String,
  etype: String,
  default: String = "",
  meta: List[MetaVal] = List.empty,  
  creationDate: Option[DateTime] = None,
  updateDate: Option[DateTime] = None) {
    
  def getId:String = id match {
    case Some(uuid) => uuid.toString
    case _ => ""
  }
}

case class Slat(
  id: Option[UUID] = Some(UUID.randomUUID()),
  title: String,
  boardId: UUID,
  entityId: UUID,  
  sval: String,
  publisher: String,
  meta: List[MetaVal] = List.empty,  
  creationDate: Option[DateTime] = None,
  updateDate: Option[DateTime] = None) {
  
  def getId:String = id match {
    case Some(uuid) => uuid.toString
    case _ => ""
  }
}