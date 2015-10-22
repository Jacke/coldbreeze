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
import org.jboss.netty.buffer._
import org.joda.time.DateTime
import play.api.data._
import play.api.data.Forms._
import play.api.data.format.Formats._
import play.api.data.validation.Constraints._
import play.api.data.format._
import scala.concurrent._
import scala.concurrent.duration._
import views._
import models.User
import service.DemoUser
import scala.concurrent._
import scala.concurrent.duration._
import securesocial.core._
import models.DAO.BProcessDTO
import models.DAO.BPDAO
import models.DAO._
import models._
import models.DAO.resources._
import models.DAO.CompositeValues
import play.api.Play.current
import models.DAO.resources.web.BizFormDTO
import minority.utils._
import play.api.data.format.Formats._
import scala.util.{Success, Failure}
import scala.concurrent._
import scala.concurrent.duration._

case class ResourceContainer(resource: ResourceDTO, board_cn: List[BoardContainer])
case class ResourceFormContainer(
                                  resourceAddForm: Form[models.DAO.ResourceDTO] = ResourceForms.resourceForm, 
                                  boardForm: Form[Board] = ResourceForms.boardForm,
                                  entityForm: Form[Entity] = ResourceForms.entityForm, 
                                  slatForm: Form[Slat] = ResourceForms.slatForm)

object ResourceForms {
  implicit def OwnershipFormat: Formatter[Ownership] = new Formatter[Ownership] {
    def bind(key: String, data: Map[String, String]) = {
      Right(data.get(key).getOrElse("false")).right.flatMap {
        case "true" => Right(Ownership("","",""))
        case "false" => Right(Ownership("","",""))
        case _ => Left(Seq(FormError(key, "error.ownership", Nil)))
      }
    }
    def unbind(key: String, value: Ownership) = Map(key -> value.host)
  }
  val resourceForm = Form(
    mapping(
      "id" -> optional(number),
      "title" -> nonEmptyText,
      "business" -> default(number, 0),
      "created_at"-> optional(jodaDate),
      "updated_at"-> optional(jodaDate))(ResourceDTO.apply)(ResourceDTO.unapply))
  val boardForm = Form(
    mapping(
      "id" -> optional(of[String] verifying pattern(
        """[a-fA-F0-9]{24}""".r,
        "constraint.objectId",
        "error.objectId")),
      "title" -> nonEmptyText,
      "content" -> default(text, ""),
      "publisher" -> default(nonEmptyText, ""),
      "ownership" -> of[Ownership],
      "meta" -> list(
      mapping(
        "key" -> nonEmptyText,
        "value" -> nonEmptyText
      )(MetaVal.apply)(MetaVal.unapply)),
      "creationDate" -> optional(of[Long]),
      "updateDate" -> optional(of[Long])) { (id, title, content, publisher, ownership, meta, creationDate, updateDate) =>
        Board(
          None,
          title,
          content,
          publisher,
          ownership,
          meta,
          creationDate.map(new DateTime(_)),
          updateDate.map(new DateTime(_)))
      } { board =>
        Some(
          (None,
            board.title,
            board.content,
            board.publisher,
            board.ownership,
            board.meta,
            board.creationDate.map(_.getMillis),
            board.updateDate.map(_.getMillis)))
      })
  val entityForm = Form(
    mapping(
      "id" -> optional(of[String] verifying pattern(
        """[a-fA-F0-9]{24}""".r,
        "constraint.objectId",
        "error.objectId")),
      "title" -> nonEmptyText,
      "boardId" -> default(nonEmptyText, ""),
      "description" -> default(text, ""),
      "publisher" -> default(nonEmptyText, ""),
      "etype" -> nonEmptyText,
      "default" -> default(text, ""),
      "creationDate" -> optional(of[Long]),
      "updateDate" -> optional(of[Long])) { (id, title, boardId, description, publisher, etype, default, creationDate, updateDate) =>
        Entity(
          None,
          title,
          UUIDgen(boardId),
          description,
          publisher,
          etype,
          default,
          creationDate.map(new DateTime(_)),
          updateDate.map(new DateTime(_)))
      } { board =>
        Some(
          (None,
            board.title,
            board.boardId.toString,
            board.description,
            board.publisher,
            board.etype,
            board.default,
            board.creationDate.map(_.getMillis),
            board.updateDate.map(_.getMillis)))
      })
  val slatForm = Form(
    mapping(
      "id" -> optional(of[String] verifying pattern(
        """[a-fA-F0-9]{24}""".r,
        "constraint.objectId",
        "error.objectId")),
      "title" -> nonEmptyText,
      "boardId" -> default(nonEmptyText, ""),
      "entityId" -> default(nonEmptyText, ""),      
      "sval" -> nonEmptyText,
      "publisher" -> default(nonEmptyText, ""),
      "meta" -> default(nonEmptyText, ""),
      "creationDate" -> optional(of[Long]),
      "updateDate" -> optional(of[Long])) { (id, title, boardId, entityId, sval, publisher, meta, creationDate, updateDate) =>
        Slat(
          None,
          title,
          UUIDgen(boardId),
          UUIDgen(entityId),          
          sval,
          publisher,
          meta,
          creationDate.map(new DateTime(_)),
          updateDate.map(new DateTime(_)))
      } { board =>
        Some(
          (None,
            board.title,
            board.boardId.toString,
            board.entityId.toString,
            board.sval,
            board.publisher,
            board.meta,
            board.creationDate.map(_.getMillis),
            board.updateDate.map(_.getMillis)))
      })
  def UUIDgen(v: String):UUID = {
    v match {
      case "" => UUID.randomUUID()
      case c:String => UUID.fromString(c)
    }
  }
}
class DataController(override implicit val env: RuntimeEnvironment[DemoUser]) extends Controller with securesocial.core.SecureSocial[DemoUser] {
 

 val Home = Redirect(routes.DataController.index())
 val waitSeconds = 100000
 def testResourceContainerList(res: ResourceDTO = ResourceDTO(None, "test", 0, None, None),
                               boardCN:BoardContainer = BoardContainer(boards = List(), 
                                                                       entities = List(), 
                                                                       slats = List())):List[ResourceContainer] =
    List(ResourceContainer(res, List(boardCN)))


 def index() = SecuredAction.async { implicit request =>
    var (isManager, isEmployee, lang) = AccountsDAO.getRolesAndLang(request.user.main.email.get).get
    val resources = ResourceDAO.findByBusinessId(request.user.businessFirst)
    val boards_cn: Future[BoardContainer] = minority.utils.BBoardWrapper().getBoardByResource(0, 
                                                                  request.user.businessFirst.toString)
   // boards_cn onComplete { 
   //   case Success(bcn) =>
   //     val actual_boards_cn = bcn
   //     val resources_cn = resources.map(r => testResourceContainerList(r, actual_boards_cn)).flatten
   //       Ok(views.html.data.index(request.user, isManager, ResourceForms.resourceForm, resources_cn))     
   //   case Failure(failure) =>
  // //       Ok(views.html.data.index(request.user, isManager, ResourceForms.resourceForm, testResourceContainerList()))     
   // }
     for {
        actual_boards_cn <- boards_cn
     } yield Ok(views.html.data.index(request.user, isManager, ResourceFormContainer(), resources.map(r => 
                testResourceContainerList(r, actual_boards_cn)).flatten))     


 }

/***************************
 * Resources
 ****************************/
def create_resource() = SecuredAction { implicit request => 
  	var (isManager, isEmployee, lang) = AccountsDAO.getRolesAndLang(request.user.main.email.get).get
    val business_request:Option[Tuple2[Int, Int]] = models.DAO.resources.EmployeesBusinessDAO.getByUID(request.user.main.email.get) 
    val business = business_request match {
      case Some(biz) => biz._2
      case _ => -1
    }        

    ResourceForms.resourceForm.bindFromRequest.fold(
      formWithErrors => { 
        println(formWithErrors)
        BadRequest(views.html.data.index(request.user, isManager, ResourceFormContainer(), testResourceContainerList() ))
        },
      entity => {
          println(entity)
          val resource_id = ResourceDAO.pull_object(entity.copy(business = business))
          val future = createDefaultBoardsForRes(entity.copy(business = business, id = Some(resource_id)))
          Await.result(future, Duration(waitSeconds, MILLISECONDS)) match {
            case _ => Home
          }
                  
      })
}

def update_resource(id: Int) = SecuredAction { implicit request => 
	var (isManager, isEmployee, lang) = AccountsDAO.getRolesAndLang(request.user.main.email.get).get
  ResourceForms.resourceForm.bindFromRequest.fold(
      formWithErrors => { 
        println(formWithErrors)
        Home
        },
      entity => {
          ResourceDAO.get(id) match {
          case Some(res) => {
            if (request.user.businessFirst == res.business) {
              ResourceDAO.update(id, entity.copy(id = res.id))
            }
            Home
          }
          case _ => Home
        }
      })
}
def delete_resource(id: Int) = SecuredAction { implicit request => 
	var (isManager, isEmployee, lang) = AccountsDAO.getRolesAndLang(request.user.main.email.get).get
  ResourceDAO.get(id) match {
    case Some(res) => {
      if (request.user.businessFirst == res.business) {
        ResourceDAO.delete(res.id.get)
      }
      Home
    }
    case _ => Home
  }
}


/****
 * Entities
 */
def create_entity_form(resourceId: Int, boardId: String) = SecuredAction { implicit request => 
    var (isManager, isEmployee, lang) = AccountsDAO.getRolesAndLang(request.user.main.email.get).get
    Ok(views.html.data.editEntity(None, ResourceFormContainer().entityForm, request.user, Some(boardId), Some(resourceId) ))
}
def create_entity(boardId: String) = SecuredAction { implicit request => 
    var (isManager, isEmployee, lang) = AccountsDAO.getRolesAndLang(request.user.main.email.get).get
    ResourceForms.entityForm.bindFromRequest.fold(
      formWithErrors => { 
        println("erorrs:")
        println(formWithErrors)
        Home
        },
      entity => {
          val future = minority.utils.BBoardWrapper()
                .addEntityByResource(resource_id = 0, 
                                     entity.copy(boardId = UUID.fromString(boardId))) 

          Await.result(future, Duration(waitSeconds, MILLISECONDS)) match {
            case _ => Home
          }                
      })
}
def update_entity_form(id: String) = SecuredAction { implicit request => 
    var (isManager, isEmployee, lang) = AccountsDAO.getRolesAndLang(request.user.main.email.get).get
    val entity = minority.utils.BBoardWrapper().getEntityById(entity_id = id)
    Await.result(entity, Duration(waitSeconds, MILLISECONDS)) match {
      case Some(en) =>   Ok(views.html.data.editEntity(Some(id), ResourceFormContainer().entityForm.fill(en), request.user, None ))
      case _ =>   Ok(views.html.data.editEntity(Some(id), ResourceFormContainer().entityForm, request.user, None ))
    }
}
def update_entity(id: String) = SecuredAction { implicit request => 
    var (isManager, isEmployee, lang) = AccountsDAO.getRolesAndLang(request.user.main.email.get).get
    ResourceForms.entityForm.bindFromRequest.fold(
      formWithErrors => { 
        println("erorrs:")
        println(formWithErrors)
        Home
        },
      entity => {
          minority.utils.BBoardWrapper().updateEntity(entity_id = id, entity = entity) match {
          case _ => Home
        }
      })
    Home
}
def delete_entity(id: String) = SecuredAction { implicit request => 
  	var (isManager, isEmployee, lang) = AccountsDAO.getRolesAndLang(request.user.main.email.get).get
    Await.result(minority.utils.BBoardWrapper().removeEntityByBoard("", entity_id = id), Duration(waitSeconds, MILLISECONDS)) match {
      case _ => Home
    } 
}
/**
 * Slats
 */
def create_slat_form(eid: String) = SecuredAction.async { implicit request => 
    var (isManager, isEmployee, lang) = AccountsDAO.getRolesAndLang(request.user.main.email.get).get
    minority.utils.BBoardWrapper().getEntityById(entity_id = eid).map { pi =>
      pi match {
      case Some(e) => Ok(views.html.data.editSlat(eid, eid, None, ResourceFormContainer().slatForm, request.user, Some(e) ))
      case _ => Home
      }
    }
}
def create_slat(eid: String) = SecuredAction { implicit request => 
    var (isManager, isEmployee, lang) = AccountsDAO.getRolesAndLang(request.user.main.email.get).get
    ResourceForms.slatForm.bindFromRequest.fold(
      formWithErrors => { 
        println("erorrs:")
        println(formWithErrors)
        Home
        },
      slat => {
          minority.utils.BBoardWrapper().addSlatByEntity(entity_id = eid, 
                        slat.copy(title = slat.title.replaceAll("[ \f\t\\v]+$",""), entityId = UUID.fromString(eid))) match {
          case _ => Home
        }
      })
}
def update_slat_form(eid: String, id: String) = SecuredAction { implicit request => 
    var (isManager, isEmployee, lang) = AccountsDAO.getRolesAndLang(request.user.main.email.get).get
    val entity = minority.utils.BBoardWrapper().getSlatById(slat_id = id)
    Await.result(entity, Duration(waitSeconds, MILLISECONDS)) match {
      case Some(sl) =>   Ok(views.html.data.editSlat(eid, eid, Some(id), ResourceFormContainer().slatForm.fill(sl), request.user ))
      case _ =>   Ok(views.html.data.editSlat(eid, eid, Some(id), ResourceFormContainer().slatForm, request.user ))
    }
}
def update_slat(eid: String, id: String) = SecuredAction { implicit request => 
    var (isManager, isEmployee, lang) = AccountsDAO.getRolesAndLang(request.user.main.email.get).get
    ResourceForms.slatForm.bindFromRequest.fold(
      formWithErrors => { 
        println(formWithErrors)
        Home
        },
      entity => {
          minority.utils.BBoardWrapper().updateSlatByEntity(entity_id = eid, slat_id = id, slat = entity) match {
          //case Some(res) => {
          //  if (request.user.businessFirst == res.business) {
          //    ResourceDAO.update(id, entity.copy(id = res.id))
          //  }
          //  Home
          //}
          case _ => Home
        }
      })
}
def delete_slat(id: String) = SecuredAction { implicit request => 
    var (isManager, isEmployee, lang) = AccountsDAO.getRolesAndLang(request.user.main.email.get).get
    Await.result(minority.utils.BBoardWrapper().removeSlatById(id), Duration(waitSeconds, MILLISECONDS)) match {
      case _ => Home
    }
}


/**
 * Board test
 */


def boardTest() = Action.async { implicit request =>
  val wrapper = minority.utils.BBoardWrapper.apply()
  wrapper.auth("email: String", "password: String")
  wrapper.getBoardByResource(0,"0")
  wrapper.ping().map {
      response =>
        Ok(response.toString)
    }.recover {
      case _ =>
        Ok("false")
    }
}





private def createDefaultBoardsForRes(res: ResourceDTO):Future[String] = {
    // Cost board
    val board = Board(id = Some(UUID.randomUUID()),
                        title = "Cost board",
                        content = s"Cost for test resource ${res.title}",
                        publisher = "",
                        ownership = Ownership(host = "", uid = "", group = ""),
                        meta = List(MetaVal("resource_id", s"${res.id.get}"),
                                    MetaVal("business_id", s"${res.business}")), None,None)
    minority.utils.BBoardWrapper().addBoardForResource(board)
}


}
