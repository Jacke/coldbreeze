package controllers
import java.util.UUID

import models.DAO.resources.{BusinessDAO, BusinessDTO}
import models.DAO._

import play.api._
import play.api.mvc._
import play.twirl.api.Html

import play.api.http.MimeTypes
import play.api.libs.json._
import play.api.cache._
import play.api.data._
import play.api.data.Forms._
import play.api.data.format.Formats
import play.api.data.format.Formatter
import play.api.data.FormError


import views._
import models.User
import service.DemoUser
import securesocial.core._
import models.DAO.BProcessDTO
import models.DAO.BPDAO
import models.DAO._
import models._
import models.DAO.resources._
import models.DAO.CompositeValues
import play.api.Play.current
import models.DAO.resources.web.BizFormDTO
import scala.concurrent.ExecutionContext.Implicits.global
import com.github.tototoshi.slick.JdbcJodaSupport._
import scala.concurrent.duration.Duration
import scala.concurrent.{ExecutionContext, Awaitable, Await, Future}
import minority.utils._
import play.api.cache._
import a.bug._

case class WarpRequest(body: String)
case class WarpObjRequest(obj_type: String, obj_title: String, obj_content: String)
case class WarpResult(board: Board, entities: List[Entity], slats: List[Slat])
case class WarpPayload(payload: List[WarpObjRequest])
class WarpController(override implicit val env: RuntimeEnvironment[DemoUser]) extends Controller with securesocial.core.SecureSocial[DemoUser] {
  implicit val WarpRequestReads = Json.reads[WarpRequest]
  implicit val WarpRequestWrites = Json.format[WarpRequest]
  implicit val WarpObjRequestReads = Json.reads[WarpObjRequest]
  implicit val WarpObjRequestWrites = Json.format[WarpObjRequest]
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
  implicit val WarpResultFormat = Json.format[WarpResult]
  implicit val WarpResultReaders = Json.reads[WarpResult]
  implicit val WarpPayloadtFormat = Json.format[WarpPayload]
  implicit val WarpPayloadReaders = Json.reads[WarpPayload]
 def toInt(s: String): Option[Int] = {
  try {
    Some(s.toInt)
  } catch {
    case e: Exception => None
  }
}
 def parseParam(stringAsInt: Option[String]):Option[Int] = {
 	stringAsInt match {
 		case Some(string) => {
 			toInt(string)
 		}
 		case _ => None
 	}
 } 
 def warpSend() = SecuredAction.async(BodyParsers.parse.json) { implicit request =>
		val warpResult = request.body.validate[WarpResult]


		 val business = request.user.businessFirst
		 warpResult.fold(
			 	errors => { Future( Ok(Json.obj("status" ->"BAD", "message" -> "error" ))) },
				e => { 
					
		val boardId = e.board.id
		val launchId = e.board.meta.find(meta => meta.key == "launch_id").map { m => m.value.toInt }.getOrElse(-1)
		val elementId = e.board.meta.find(meta => meta.key == "element_id").map { m => m.value.toInt }
		
		models.LaunchWarpDAOF.pull(
			LaunchWarpDTO(
			None,
			launch = launchId,
			launch_element = elementId,
			board = boardId.get.toString,
			created_at = Some(org.joda.time.DateTime.now()),
			updated_at = Some(org.joda.time.DateTime.now()))
			).map { result =>  
			    e.entities.map { entity => 
					wrapper.addEntityByResource(resource_id = -1, entity)
					val foundedSlats = e.slats.filter(slat => slat.entityId == entity.id.get)
					println("foundedSlats")
					println(foundedSlats.length)
					foundedSlats.map { slat =>

						wrapper.addSlatByEntity(entity.id.get.toString, slat)
					}

			    }
				Ok(Json.obj("status" ->"OK", "message" -> e ))		 }	

										

				}
				)
				
		
//*/ Future(Ok("ok"))
}
 def warpGenerate(launch_idOpt: Option[String], element_idOpt: Option[String]) = 
	 Cached2(req => "profile." + req.host, 1000 * 60) {      
		 SecuredAction.async(BodyParsers.parse.json) { implicit request =>
		  //val business = request.user.businessFirst
		  //val cred = models.AccountsDAO.fetchCredentials(request.user.main.email.get)
		  //val biz0 = fetchBiz(request.user.main.userId).get
		  //val biz = BizFormDTO(biz0.title, biz0.phone, biz0.website, biz0.country, biz0.city, biz0.address, biz0.nickname)
		  //var (isManager, isEmployee, lang) = AccountsDAO.getRolesAndLang(request.user.main.email.get, business).get
		val launch_id = parseParam(launch_idOpt)
		val element_id = parseParam(element_idOpt)
		println("launch_id")
		println(launch_idOpt)
		println(launch_id)
		println("element_id")
		println(element_id)
		println(element_idOpt)
		  val warpResult = request.body.validate[WarpPayload]
		  println(warpResult)
		  println(request.user.businessFirst)

		val warpResultOpt:Option[WarpRequest] = warpResult match {
			  case s: JsSuccess[WarpRequest] => Some(s.get)
		      case e: JsError => None
		}
		 val business = request.user.businessFirst
		 warpResult.fold(
			 	errors => { Future( Ok(Json.obj("status" ->"BAD", "message" -> "error" ))) 
			 	},
				e => { 
					val result = parseWarps(e.payload, s"${business}:${request.user.main.userId}",
											launch_id,element_id, business.toString)
					result.map { result =>
						Ok(Json.obj("status" ->"OK", "message" -> result ))						
					}
				}
				)
		   }
		 }
 def parseWarps(payload: List[WarpObjRequest], userId: String = "", 
 				launch_id: Option[Int], element_id: Option[Int], workbench_id: String = ""):Future[WarpResult] = {
	 	val entityId = Some(UUID.randomUUID())
		val metas = launch_id match {
			case Some(launch_id) => element_id match {
				case Some(element_id) => List(MetaVal(key = "element_id", value = element_id.toString), MetaVal(key = "launch_id", value = launch_id.toString))
				case _ => List(MetaVal(key = "launch_id", value = launch_id.toString))
			}
			case _ => List()
			}
	  val boardF = getBoard(launch_id.getOrElse(-1), element_id, userId) 
	  boardF.map { board => 
	    val boardId = board.get.id
	    val result = payload.map { load =>
	 		// obj_type: String, obj_title: String, obj_content: String
				/*
				val board =   Board(
				  	id = Some(boardId),
				  title = boardId.toString,
				  content = "",
				  publisher = userId,
				  ownership = Ownership(host = "min.ority.us", uid = userId),
				  meta = metas, None,None)
				*/
			WarpResult(
				board.get, List(
					Entity(
				  id = entityId,
				  title = load.obj_type,
				  boardId = boardId.get,
				  description = "",
				  publisher = userId,
				  etype = load.obj_type,
				  default = "",
				  meta = metas)),
				List(Slat(
				  id = Some(UUID.randomUUID()),
				  title = load.obj_title,
				  boardId = boardId.get,
				  entityId = entityId.get,  
				  sval = load.obj_content,
				  publisher = userId,
				  meta = metas
				))  
			)
	}
			val entities = result.map { result => result.entities }.flatten	
			val slats = result.map { result => result.slats }.flatten
			addWarpResultToBoard(entities, slats)

			WarpResult(result.map(_.board).headOption.getOrElse(Board(
																  	  id = boardId,
																	  title = boardId.toString,
																	  content = "",
																	  publisher = userId,
																	  ownership = Ownership(host = "min.ority.us", 
																	  						uid = userId, 	
																	  						group = workbench_id),
																	  meta = metas, None,None)), entities, slats)
	  }
}

def addWarpResultToBoard(entities: List[Entity], slats: List[Slat]) = {
	entities.map { entity =>
		wrapper.addEntityByResource(0, entity)
		println(">>>>>>>>>>>>>>>>>>>>>>>>>")
		println("slats")
		println(slats.length)
		println(">>>>>>>>>>>>>>>>>>>>>>>>>")
		slats.map { slat => //(slat => slat.entityId == entity.id.get.toString).map { slat =>
			println("addToSlat")
			println(slat)
			wrapper.addSlatByEntity(entity_id = entity.id.get.toString, slat = slat)
		}

	}

}


def parseWarp(body: String, userId: String = ""):WarpResult = {
  		val arrayOfElemenets = body.split("""<a[^>]*>([^<]+)</a>""")
  		arrayOfElemenets
  		//body.map(normalizePhoneNumber(_)).toString
val entityId = Some(UUID.randomUUID())
val boardId = UUID.randomUUID()
WarpResult(
  Board(
  	id = Some(boardId),
  title = boardId.toString,
  content = "",
  publisher = userId,
  ownership = Ownership(host = "min.ority.us", uid = userId),
  meta = List(), None,None)
	,List(
		Entity(
	  id = entityId,
	  title = "",
	  boardId = boardId,
	  description = "",
	  publisher = userId,
	  etype = "",
	  default = "",
	  meta = List.empty)),
	List(Slat(
	  id = Some(UUID.randomUUID()),
	  title = "",
	  boardId = boardId,
	  entityId = entityId.get,  
	  sval = body,
	  publisher = userId
	))  
)

}

def normalizePhoneNumber (number: String) = number match {
  case Link(x) => x.toString
  case Phone1(x,y,z) => (x,y,z)
  case Phone2(x,y,z) => (x,y,z)
}
val Link = """<a href="([^>]*)">[^<]+</a>""".r
val Phone1 = """\((\d{3})\)\s*(\d{3})-(\d{4})""".r
val Phone2 = """(\d{3})-(\d{3})-(\d{4})""".r



 
// Find or create board
// 
val wrapper = BBoardWrapper()
def getBoard(launch_id: Int, element_id: Option[Int], userId: String) = wrapper.findOrCreateBoard(launch_id,
 element_id, userId)





}