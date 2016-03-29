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
    bboard.BoardDAO.findOrCreateBoard(launch_id, element_id, userId)(connection)
  }
  def getWarpBoardByLaunch(launch_id: Int, biz: String = ""):Future[BoardContainer] = {
    bboard.BoardDAO.getBoardByResource(launch_id, biz)(connection)
  } 
  def getBoardByResource(resource_id: Int, biz: String):Future[BoardContainer] = {
  	bboard.BoardDAO.getBoardByResource(resource_id,biz)(connection)
  }
  def addBoardForResource(board: Board):Future[String] = {
    bboard.BoardDAO.addBoardForResource(board)(connection) 
  }


  def isOnBoardByResources(board: Board, resource_ids: List[Int]):Boolean = {
    board.meta.find(m => m.key == "resource_id" && resource_ids.map(_.toString).contains(m.value)).isDefined 
  }

  def isOnBoardByResource(board: Board, resource_id: Int):Boolean = {
    board.meta.find(m => m.key == "resource_id" && m.value == resource_id.toString).isDefined 
  }  




  def getEntityByResources(resources: List[ResourceDTO]):Future[List[ResourceEntitySelector]] = {
    bboard.EntityDAO.getEntityByResources(resources)(connection)  
 
  }
  def getEntityByResource(resource: ResourceDTO):Future[List[ResourceEntitySelector]] = {
    bboard.EntityDAO.getEntityByResource(resource)(connection)  
 
  }  
  def getEntityByResourceId(resource_id: Int):Future[List[Entity]] = {
    bboard.EntityDAO.getEntityByResourceId(resource_id)(connection)  
  }  
  def getEntitiesByBoard(board_id: String, resource_id: Int = 0, biz: String = "") = {
    bboard.EntityDAO.getEntitiesByBoard(board_id, resource_id, biz)(connection)  
  }
  def getEntityById(entity_id: String):Future[Option[Entity]] = {
    bboard.EntityDAO.getEntityById(entity_id)(connection)  
  }
  def getSlatById(slat_id: String):Future[Option[Slat]] = {
    bboard.SlatDAO.getSlatById(slat_id)(connection) 
  }  
  // GET     /api/v1/entities/slats
  def getSlatByEntitiesIds(entities_ids: List[String]):Future[List[Slat]] = {
    bboard.SlatDAO.getSlatByEntitiesIds(entities_ids)(connection) 
  }    
/*-------------------------------------------
 * Create
 --------------------------------------------*/  
  def addEntityByResource(resource_id: Int, entity: Entity):Future[String] = {
    bboard.EntityDAO.addEntityByResource(resource_id, entity)(connection)  
  }
  def addSlatByEntity(entity_id: String, slat: Slat):Future[String] = {
    bboard.SlatDAO.addSlatByEntity(entity_id, slat)(connection) 
  }
/*-------------------------------------------
 * Remove
 --------------------------------------------*/  
  def updateEntity(entity_id: String, entity: Entity):Future[String] = {
     bboard.EntityDAO.updateEntity(entity_id, entity)(connection)  
  }
  def updateSlatByEntity(entity_id: String, slat_id: String, slat: Slat):Future[String] = {
    bboard.SlatDAO.updateSlatByEntity(entity_id, slat_id, slat)(connection) 
  }
  // /api/v1/slat/:slat_id/fill
  def fillSlat(slat_id: String, sval: String):Future[String] = {
    bboard.SlatDAO.fillSlat(slat_id, sval)(connection)  
  }  
  // /api/v1/slat/:slat_id/refill
  def refillSlat(slat_id: String, sval: String):Future[String] = {
    bboard.SlatDAO.refillSlat(slat_id, sval)(connection)  
  }
/*-------------------------------------------
 * Remove
 --------------------------------------------*/
  def removeEntityByBoard(board_id: String, entity_id: String):Future[String] = {
    bboard.EntityDAO.removeEntityByBoard(board_id, entity_id)(connection)  
  }
  def removeEntityById(entity_id: String):Future[String] = {
    bboard.EntityDAO.removeEntityById(entity_id)(connection)  
  }  
  def removeSlatById(slat_id: String):Future[String] = {
   bboard.SlatDAO.removeSlatById(slat_id)(connection)  
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