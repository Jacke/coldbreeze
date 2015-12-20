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
case class WarpResult(entities: List[Entity], slats: List[Slat])
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
 def warpGenerate() =  	Cached2(req => "profile." + req.host, 1000 * 60) {      
 SecuredAction.async(BodyParsers.parse.json) { implicit request =>
  //val business = request.user.businessFirst
  //val cred = models.AccountsDAO.fetchCredentials(request.user.main.email.get)
  //val biz0 = fetchBiz(request.user.main.userId).get
  //val biz = BizFormDTO(biz0.title, biz0.phone, biz0.website, biz0.country, biz0.city, biz0.address, biz0.nickname)
  //var (isManager, isEmployee, lang) = AccountsDAO.getRolesAndLang(request.user.main.email.get, business).get
  val warpResult = request.body.validate[WarpPayload]
  println(warpResult)
  println(request.user.businessFirst)
val warpResultOpt:Option[WarpRequest] = warpResult match {
	  case s: JsSuccess[WarpRequest] => Some(s.get)
      case e: JsError => None
}
 warpResult.fold(
	 	errors => { Future( Ok(Json.obj("status" ->"BAD", "message" -> "error" ))) 
	 	},
		e => { 
			Future( Ok(Json.obj("status" ->"OK", "message" -> parseWarps(e.payload, request.user.main.userId) )))
		}
		)
   }
 }
 def parseWarps(payload: List[WarpObjRequest], userId: String = ""):WarpResult = {
 	val result = payload.map { load =>
 		// obj_type: String, obj_title: String, obj_content: String
	 	val entityId = Some(UUID.randomUUID())
		val boardId = UUID.randomUUID()
		WarpResult(
	List(
		Entity(
	  id = entityId,
	  title = load.obj_title,
	  boardId = boardId,
	  description = "",
	  publisher = userId,
	  etype = load.obj_type,
	  default = "",
	  meta = List.empty)),
	List(Slat(
	  id = Some(UUID.randomUUID()),
	  title = load.obj_title,
	  boardId = boardId,
	  entityId = entityId.get,  
	  sval = load.obj_content,
	  publisher = userId
	))  
)}
		val entities = result.map { result => result.entities }.flatten	
		val slats = result.map { result => result.slats }.flatten
		WarpResult(entities, slats)
 }
  def parseWarp(body: String, userId: String = ""):WarpResult = {
  		val arrayOfElemenets = body.split("""<a[^>]*>([^<]+)</a>""")
  		arrayOfElemenets
  		//body.map(normalizePhoneNumber(_)).toString
val entityId = Some(UUID.randomUUID())
val boardId = UUID.randomUUID()
WarpResult(
	List(
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



 

}