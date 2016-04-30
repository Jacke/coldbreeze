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
import com.mohiva.play.silhouette.api.{ Environment, LogoutEvent, Silhouette }
import com.mohiva.play.silhouette.impl.authenticators.CookieAuthenticator
import com.mohiva.play.silhouette.impl.providers.SocialProviderRegistry
import forms._
import models.User2
import play.api.i18n.MessagesApi
import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits.global
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
case class ResourceAttributeContainer(resource: ResourceDTO, attribute: Entity)

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
      "meta" -> list(
      mapping(
        "key" -> nonEmptyText,
        "value" -> nonEmptyText
      )(MetaVal.apply)(MetaVal.unapply)),
      "creationDate" -> optional(of[Long]),
      "updateDate" -> optional(of[Long])) { (id, title, boardId, description, publisher, etype, default, meta, creationDate, updateDate) =>
        Entity(
          None,
          title,
          UUIDgen(boardId),
          description,
          publisher,
          etype,
          default,
          meta,
          creationDate.map(new DateTime(_)),
          updateDate.map(new DateTime(_)))
      } { entity =>
        Some(
          (None,
            entity.title,
            entity.boardId.toString,
            entity.description,
            entity.publisher,
            entity.etype,
            entity.default,
            entity.meta,
            entity.creationDate.map(_.getMillis),
            entity.updateDate.map(_.getMillis)))
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
      "meta" -> list(
      mapping(
        "key" -> nonEmptyText,
        "value" -> nonEmptyText
      )(MetaVal.apply)(MetaVal.unapply)),
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
import javax.inject.Inject

import com.mohiva.play.silhouette.api.{ Environment, LogoutEvent, Silhouette }
import com.mohiva.play.silhouette.impl.authenticators.CookieAuthenticator
import com.mohiva.play.silhouette.impl.providers.SocialProviderRegistry
import forms._
import models.User2
import play.api.i18n.MessagesApi
import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits.global

import play.api.mvc.{ Action, RequestHeader }
class DataController @Inject() (
  val messagesApi: MessagesApi,
  val env: Environment[User2, CookieAuthenticator],
  socialProviderRegistry: SocialProviderRegistry)
  extends Silhouette[User2, CookieAuthenticator] {

  implicit val MetaValFormat = Json.format[MetaVal]
  implicit val MetaValReader = Json.reads[MetaVal]
  implicit val SlatFormat = Json.format[Slat]
  implicit val SlatReaders = Json.reads[Slat]
  implicit val EntityFormat = Json.format[Entity]
  implicit val EntityReaders = Json.reads[Entity]
  implicit val ResourceDTOReaders = Json.reads[ResourceDTO]
  implicit val ResourceDTOFormat = Json.format[ResourceDTO]
  implicit val ResourceAttributeContainerFormat = Json.format[ResourceAttributeContainer]
  implicit val ResourceAttributeContainerReaders = Json.reads[ResourceAttributeContainer]

 val Home = Redirect(routes.DataController.index())
 val waitSeconds = 100000




def testResourceContainerList(res: ResourceDTO, boardCN:BoardContainer):List[ResourceContainer] =
    List(ResourceContainer(res, List(boardCN)))


//GET      /data                @controllers.DataController.index()
def index() = SecuredAction.async { implicit request =>
    if (request.identity.businessFirst < 1) {
      Future(Redirect(controllers.routes.SettingController.workbench()))
    } else {

      var (isManager, isEmployee, lang) = AccountsDAO.getRolesAndLang(request.identity.emailFilled).get
      val bboardPing:Future[Boolean] = minority.utils.BBoardWrapper().ping()
      val resources = ResourceDAO.findByBusinessId(request.identity.businessFirst)
      val boards_cn: Future[BoardContainer] = minority.utils.BBoardWrapper().getBoardByResource(0,
                                                                    request.identity.businessFirst.toString)
   // boards_cn onComplete {
   //   case Success(bcn) =>
   //     val actual_boards_cn = bcn
   //     val resources_cn = resources.map(r => testResourceContainerList(r, actual_boards_cn)).flatten
   //       Ok(views.html.data.index(request.identity, isManager, ResourceForms.resourceForm, resources_cn))
   //   case Failure(failure) =>
   // //       Ok(views.html.data.index(request.identity, isManager, ResourceForms.resourceForm, testResourceContainerList()))
   // }
      for {
        ping <- bboardPing
        actual_boards_cn <- boards_cn
      } yield {
         val filteredBoards = resources.map(r => testResourceContainerList(r, actual_boards_cn)).flatten

         Ok(views.html.data.index(request.identity, isManager, ResourceFormContainer(), filteredBoards,
                  ResourceFormContainer().entityForm,
                  ping
         ))
      }
    }
}



/***************************
 * Resources
 ****************************/
//POST     /data/resources          @controllers.DataController.create_resource()
def create_resource() = SecuredAction { implicit request =>
  	var (isManager, isEmployee, lang) = AccountsDAO.getRolesAndLang(request.identity.emailFilled).get
    val business = request.identity.businessFirst
    if (request.identity.businessFirst < 1) {
      Redirect(controllers.routes.SettingController.workbench())
    } else {

    ResourceForms.resourceForm.bindFromRequest.fold(
      formWithErrors => {
        println(formWithErrors)
        Redirect(controllers.routes.DataController.index())
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
}

//POST     /api/v1/data/resources             @controllers.DataController.api_create_resource()
def api_create_resource() = SecuredAction(BodyParsers.parse.json) { implicit request =>
    var (isManager, isEmployee, lang) = AccountsDAO.getRolesAndLang(request.identity.emailFilled).get
    val business = request.identity.businessFirst
    if (request.identity.businessFirst < 1) {
      Redirect(controllers.routes.SettingController.workbench())
    } else {
    val selected = request.body.validate[ResourceAttributeContainer]
        selected.fold(
        errors => {
           Logger.error(s"error with $selected")
           BadRequest(Json.obj("status" ->"KO", "message" -> JsError.toJson(errors)))
        },
        entity => {
          println(entity)
          val resource_id = ResourceDAO.pull_object(entity.resource.copy(business = business))
          val future = createDefaultBoardsForRes(entity.resource.copy(business = business, id = Some(resource_id)))
          // attribute
          println(entity.attribute)
          // val boardId
          /*
          */
          Await.result(future, Duration(waitSeconds, MILLISECONDS)) match {
            case message => {
               val parsedMessage = Json.parse(message)
               val boardId = parsedMessage \ "message"
               if (boardId.toString.length > 10) { // valid id

                val future = minority.utils.BBoardWrapper()
                      .addEntityByResource(resource_id = resource_id,
                                           entity.attribute.copy(boardId = UUID.fromString(boardId.toString)))

                Await.result(future, Duration(waitSeconds, MILLISECONDS)) match {
                  case _ => Home
                }
               } else {
                  Ok(message)
               }
            }
          }

        }
      )
    }
}

//PUT      /data/resource/:id         @controllers.DataController.update_resource(id: Int)
def update_resource(id: Int) = SecuredAction { implicit request =>
	var (isManager, isEmployee, lang) = AccountsDAO.getRolesAndLang(request.identity.emailFilled).get
  ResourceForms.resourceForm.bindFromRequest.fold(
      formWithErrors => {
        println(formWithErrors)
        Home
        },
      entity => {
          ResourceDAO.get(id) match {
          case Some(res) => {
            if (request.identity.businessFirst == res.business) {
              ResourceDAO.update(id, entity.copy(id = res.id))
            }
            Home
          }
          case _ => Home
        }
      })
}
def delete_resource(id: Int) = SecuredAction { implicit request =>
	var (isManager, isEmployee, lang) = AccountsDAO.getRolesAndLang(request.identity.emailFilled).get
  ResourceDAO.get(id) match {
    case Some(res) => {
      if (request.identity.businessFirst == res.business) {
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
    var (isManager, isEmployee, lang) = AccountsDAO.getRolesAndLang(request.identity.emailFilled).get
    Ok(views.html.data.editEntity(None, ResourceFormContainer().entityForm, request.identity, Some(boardId), Some(resourceId) ))
}
def create_entity(boardId: String) = SecuredAction { implicit request =>
    var (isManager, isEmployee, lang) = AccountsDAO.getRolesAndLang(request.identity.emailFilled).get
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
    var (isManager, isEmployee, lang) = AccountsDAO.getRolesAndLang(request.identity.emailFilled).get
    val entity = minority.utils.BBoardWrapper().getEntityById(entity_id = id)
    Await.result(entity, Duration(waitSeconds, MILLISECONDS)) match {
      case Some(en) =>   Ok(views.html.data.editEntity(Some(id), ResourceFormContainer().entityForm.fill(en), request.identity, None ))
      case _ =>   Ok(views.html.data.editEntity(Some(id), ResourceFormContainer().entityForm, request.identity, None ))
    }
}
def update_entity(id: String) = SecuredAction { implicit request =>
    var (isManager, isEmployee, lang) = AccountsDAO.getRolesAndLang(request.identity.emailFilled).get
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
  	var (isManager, isEmployee, lang) = AccountsDAO.getRolesAndLang(request.identity.emailFilled).get
    Await.result(minority.utils.BBoardWrapper().removeEntityByBoard("", entity_id = id), Duration(waitSeconds, MILLISECONDS)) match {
      case _ => Home
    }
}
/**
 * Slats
 */
def create_slat_form(eid: String) = SecuredAction.async { implicit request =>
    var (isManager, isEmployee, lang) = AccountsDAO.getRolesAndLang(request.identity.emailFilled).get
    minority.utils.BBoardWrapper().getEntityById(entity_id = eid).map { pi =>
      pi match {
      case Some(e) => Ok(views.html.data.editSlat(eid, eid, None, ResourceFormContainer().slatForm, request.identity, Some(e) ))
      case _ => Home
      }
    }
}
def create_slat(eid: String) = SecuredAction { implicit request =>
    var (isManager, isEmployee, lang) = AccountsDAO.getRolesAndLang(request.identity.emailFilled).get
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
    var (isManager, isEmployee, lang) = AccountsDAO.getRolesAndLang(request.identity.emailFilled).get
    val entity = minority.utils.BBoardWrapper().getSlatById(slat_id = id)
    Await.result(entity, Duration(waitSeconds, MILLISECONDS)) match {
      case Some(sl) =>   Ok(views.html.data.editSlat(eid, eid, Some(id), ResourceFormContainer().slatForm.fill(sl), request.identity ))
      case _ =>   Ok(views.html.data.editSlat(eid, eid, Some(id), ResourceFormContainer().slatForm, request.identity ))
    }
}
def update_slat(eid: String, id: String) = SecuredAction { implicit request =>
    var (isManager, isEmployee, lang) = AccountsDAO.getRolesAndLang(request.identity.emailFilled).get
    ResourceForms.slatForm.bindFromRequest.fold(
      formWithErrors => {
        println(formWithErrors)
        Home
        },
      entity => {
          minority.utils.BBoardWrapper().updateSlatByEntity(entity_id = eid, slat_id = id, slat = entity) match {
          //case Some(res) => {
          //  if (request.identity.businessFirst == res.business) {
          //    ResourceDAO.update(id, entity.copy(id = res.id))
          //  }
          //  Home
          //}
          case _ => Home
        }
      })
}
def delete_slat(id: String) = SecuredAction { implicit request =>
    var (isManager, isEmployee, lang) = AccountsDAO.getRolesAndLang(request.identity.emailFilled).get
    Await.result(minority.utils.BBoardWrapper().removeSlatById(id), Duration(waitSeconds, MILLISECONDS)) match {
      case _ => Home
    }
}





def fill_slat(entityId: String, launchId: Int, resourceId: Int) = SecuredAction.async(BodyParsers.parse.json) { implicit request =>
    val selected = request.body.validate[Slat]
    selected.fold(
    errors => {
       Logger.error(s"error with $selected")
       Future.successful(BadRequest(Json.obj("status" ->"KO", "message" -> JsError.toJson(errors))) )
    },
    slat => {
    val existedMeta = slat.meta.filter(m => m.key == "elementId")
    val metaString = List(MetaVal("launchId", s"$launchId"), MetaVal("resourceId", s"$resourceId")) ++ existedMeta
    var (isManager, isEmployee, lang) = AccountsDAO.getRolesAndLang(request.identity.emailFilled).get
    minority.utils.BBoardWrapper().addSlatByEntity(entity_id = entityId,
             slat.copy(title = slat.title.replaceAll("[ \f\t\\v]+$",""), entityId = UUID.fromString(entityId),
              meta = metaString)).map { c =>
            Ok(c)
        }

    })

}
def refill_slat(entityId: String, launchId: Int, resourceId: Int, slatId: String) = SecuredAction.async(BodyParsers.parse.json) { implicit request =>
    val selected = request.body.validate[Slat]
    selected.fold(
    errors => {
       Logger.error(s"error with $selected")
       Future.successful(BadRequest(Json.obj("status" ->"KO", "message" -> JsError.toJson(errors))) )
    },
    slat => {
    val existedMeta = slat.meta.filter(m => m.key == "elementId")
    val metaString = List(MetaVal("launchId", s"$launchId"), MetaVal("resourceId", s"$resourceId")) ++ existedMeta
    var (isManager, isEmployee, lang) = AccountsDAO.getRolesAndLang(request.identity.emailFilled).get
          // updateSlatByEntity(entity_id: String, slat_id: String, slat: Slat)
    minority.utils.BBoardWrapper().updateSlatByEntity(entity_id = entityId,
            slat_id = slatId,
             slat.copy(title = slat.title.replaceAll("[ \f\t\\v]+$",""),
                       entityId = UUID.fromString(entityId),
                       meta = metaString, sval = slat.sval)).map { c =>
           Ok(c)
        }

    })

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
