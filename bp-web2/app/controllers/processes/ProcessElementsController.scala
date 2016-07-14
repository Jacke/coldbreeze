package controllers

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
import play.api.Logger
import views._
import models.User

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
import models.DAO.resources._
import models.DAO.CompositeValues
import play.api.Play.current
import main.scala.bprocesses._
import main.scala.simple_parts.process.Units._
import models.DAO.reflect._
import models.DAO.conversion._
import cloner.util._
import scala.concurrent.ExecutionContext.Implicits.global
import scala.concurrent.duration.Duration
import scala.concurrent.{ExecutionContext, Awaitable, Await, Future}
import scala.util.Try
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
import models.DAO.reflect._

import us.ority.min.actions._
import main.scala.simple_parts.process.Units._

case class BaseNewValue(baseNewValue: String)

class ProcessElementsController @Inject() (
  val messagesApi: MessagesApi,
  val env: Environment[User2, CookieAuthenticator],
  socialProviderRegistry: SocialProviderRegistry)
  extends Silhouette[User2, CookieAuthenticator] {

implicit val BaseNewValueReads = Json.reads[BaseNewValue]
implicit val BaseNewValueWrites = Json.format[BaseNewValue]

  implicit val stationReads = Json.reads[BPStationDTO]
  implicit val stationWrites = Json.format[BPStationDTO]

  implicit val logReads = Json.reads[BPLoggerDTO]
  implicit val logWrites = Json.format[BPLoggerDTO]
  implicit val BPSpaceReads = Json.reads[BPSpaceDTO]
  implicit val BPSpaceWrites = Json.format[BPSpaceDTO]
  implicit val SpaceElementReads = Json.reads[SpaceElementDTO]
  implicit val SpaceElementWrites = Json.format[SpaceElementDTO]
  implicit val UndefElementReads = Json.reads[UndefElement]
  implicit val UndefElementWrites = Json.format[UndefElement]
  implicit val InputParamReads = Json.reads[InputParams]
  implicit val InputParamWrites = Json.format[InputParams]
  implicit val BProcessDTOReads = Json.reads[BProcessDTO]
  implicit val BProcessDTOWrites = Json.format[BProcessDTO]
  implicit val StationNoteReads = Json.reads[StationNoteMsg]
  implicit val StationNoteWrites = Json.format[StationNoteMsg]


  implicit val BaseContainerReads = Json.reads[BaseContainer]
  implicit val BaseContainerWrites = Json.format[BaseContainer]

  implicit val RefActionContainerReads = Json.reads[RefActionContainer]
  implicit val RefActionContainerWrites = Json.format[RefActionContainer]

  implicit val RefElemContainerReads = Json.reads[RefElemContainer]
  implicit val RefElemContainerWrites = Json.format[RefElemContainer]
  implicit val RefResultedReads = Json.reads[models.DAO.reflect.RefResulted]
  implicit val RefResultedWrites = Json.format[models.DAO.reflect.RefResulted]
  implicit val SessionElementsReads = Json.reads[SessionElements]
  implicit val SessionElementsFormat = Json.format[SessionElements]
  implicit val BPSessionStateReads = Json.reads[BPSessionState]
  implicit val BPSessionStateWrites = Json.format[BPSessionState]
  implicit val BPStateReads = Json.reads[BPState]
  implicit val BPStateWrites = Json.format[BPState]
  implicit val UnitSwitcherReads = Json.reads[UnitSwitcher]
  implicit val UnitSwitcherWrites = Json.format[UnitSwitcher]
  implicit val UnitReactionReads = Json.reads[UnitReaction]
  implicit val UnitReactionWrites = Json.format[UnitReaction]
  implicit val UnitReactionStateOutReads = Json.reads[UnitReactionStateOut]
  implicit val UnitReactionStateOutWrites = Json.format[UnitReactionStateOut]


  implicit val rMiddlewareReads = Json.reads[Middleware]
  implicit val rStrategyReads = Json.reads[Strategy]
  implicit val rStrategyBaseUnitReads = Json.reads[StrategyBaseUnit]
  implicit val rStrategyInputUnitReads = Json.reads[StrategyInputUnit]
  implicit val rStrategyOutputUnitReads = Json.reads[StrategyOutputUnit]
  implicit val wMiddlewareWrites = Json.format[Middleware]
  implicit val wStrategyWrites = Json.format[Strategy]
  implicit val wStrategyBaseUnitWrites = Json.format[StrategyBaseUnit]
  implicit val wStrategyInputUnitWrites = Json.format[StrategyInputUnit]
  implicit val wStrategyOutputUnitWrites = Json.format[StrategyOutputUnit]



  implicit val ReactionCollectionReads = Json.reads[ReactionCollection]
  implicit val ReactionCollectionWrites = Json.format[ReactionCollection]
  implicit val ElementTopologyReads = Json.reads[ElemTopology]
  implicit val ElementTopologyWrites = Json.format[ElemTopology]
  implicit val ElementTopologyWrapperReads = Json.reads[ElementTopologyWrapper]
  implicit val ElementTopologyWrapperWrites = Json.format[ElementTopologyWrapper]
  implicit val AllProcessElementsContainerReads = Json.reads[AllProcessElementsContainer]
  implicit val AllProcessElementsContainerWrites = Json.format[AllProcessElementsContainer]

  implicit val CachedRemovedResourceDTOReads = Json.reads[CachedRemovedResourceDTO]
  implicit val CachedRemovedResourceDTOWrites = Json.format[CachedRemovedResourceDTO]
  implicit val DeltasContainerReads = Json.reads[DeltasContainer]
  implicit val DeltasContainerWrites = Json.format[DeltasContainer]


// GET   /processes/elements/
def allElements(process_ids: List[Int]) = SecuredAction.async { implicit request =>
  val securedProcessIdsF = security.BRes.processesIdsIsOwnedByBiz(request.identity.businessFirst, process_ids)

  securedProcessIdsF.map { securedProcessIds =>
    val allElementCn = securedProcessIds.map { processId =>
      val topologs_dto = ElemTopologDAO.findByBP(processId)
      Logger.debug(s"topos quantity are $topologs_dto.length")
      val topologs:List[ElementTopologyWrapper] = topologs_dto.filter(topo => topo.front_elem_id.isDefined).map { topolog =>
          val element = ProcElemDAO.findById(topolog.front_elem_id.get).get
          ElementTopologyWrapper(topo_id = topolog.id.get, element_id = element.id.get, element_title = element.title, space_element = false)
      } ++ topologs_dto.filter(topo => topo.space_elem_id.isDefined).map { topolog =>
          val element = SpaceElemDAO.findById(topolog.space_elem_id.get).get
          ElementTopologyWrapper(topo_id = topolog.id.get, element_id = element.id.get, element_title = element.title, space_element = true)
      }
      val elements = ProcElemDAO.findByBPId(processId)
      
      val json = Json.toJson(AllProcessElementsContainer(processId = processId,
        elements = List(),
        spaces = BPSpaceDAOF.findByBPIdB(processId) ,
        space_elements = SpaceElemDAO.findByBPId(processId),
        element_topos = topologs_dto
      ))
      // replace elements with
      val elementsJson = decorateProcElementsWithExistedToposToJson(elements, topologs_dto)
      json.as[JsObject] ++ Json.obj("elements" -> elementsJson)
    }
    Ok(Json.toJson(allElementCn) )
  }
}

// GET   /processes/elements/cached
def allElementsCached(process_ids: List[Int],timestamp:String) = SecuredAction.async { implicit request =>

  val securedProcessIdsF = security.BRes.processesIdsIsOwnedByBiz(request.identity.businessFirst, process_ids)
  securedProcessIdsF.flatMap { securedProcessIds =>
    val elementsAllF = ProcElemDAOF.findByBPSId(securedProcessIds)
    val spacesAllF = BPSpaceDAOF.findByBPSId(securedProcessIds)
    val spaceElementsAllF = SpaceElemDAOF.findByBPSId(securedProcessIds)
    elementsAllF.flatMap { elementsAll =>
      spacesAllF.flatMap { spacesAll =>
        spaceElementsAllF.map { spaceElementsAll =>
          val allElementCn = securedProcessIds.map { processId =>
            val topologs_dto = ElemTopologDAO.findByBP(processId)
            val topologs:List[ElementTopologyWrapper] = topologs_dto.filter(topo => topo.front_elem_id.isDefined).map { topolog =>
                val element = ProcElemDAO.findById(topolog.front_elem_id.get).get
                ElementTopologyWrapper(topo_id = topolog.id.get, element_id = element.id.get, element_title = element.title, space_element = false)
            } ++ topologs_dto.filter(topo => topo.space_elem_id.isDefined).map { topolog =>
                val element = SpaceElemDAO.findById(topolog.space_elem_id.get).get
                ElementTopologyWrapper(topo_id = topolog.id.get, element_id = element.id.get, element_title = element.title, space_element = true)
            }


            AllProcessElementsContainer(processId = processId,
              elements = elementsAll.filter(c => c.bprocess == processId).toList,
              spaces = spacesAll.filter(c => c.bprocess == processId).toList,
              space_elements = spaceElementsAll.filter(c => c.bprocess == processId).toList,
              element_topos = topologs_dto
            )
          }
          Ok(Json.toJson(allElementCn) )

      }
    }
  }

  }
}


// /bprocess/:id/elements
def frontElems(id: Int) = SecuredAction { implicit request =>
    if (security.BRes.procIsOwnedByBiz(request.identity.businessFirst, id)) {
      val frontElements = ProcElemDAO.findByBPId(id)
      val frontElementsWithTopos = decorateProcElementsToJson(frontElements)
        Ok(Json.toJson( frontElementsWithTopos) )
    } else { Forbidden(Json.obj("status" -> "Access denied")) }
}




def show_elem_length(id: Int):Int = ProcElemDAO.findLengthByBPId(id)

// /bprocess/elems_length
def bpElemLength() = SecuredAction { implicit request =>
    val bps = BPDAOF.getAll // TODO: Weak perm
    val elms = ProcElemDAO.getAll
    val spelms = SpaceElemDAO.getAll
    def all_length(id: Int):Int = elms.filter(_.bprocess == id).length + spelms.filter(_.bprocess == id).length
    Ok(Json.toJson(
      Map(bps.map(bp => (bp.id.get.toString -> all_length(bp.id.get))) map {s => (s._1, s._2)} : _*)//show_elem_length(bp.id.get))) map {s => (s._1, s._2)} : _*)
      ))
}

// /bprocess/:id/spaces
def spaces(id: Int) = SecuredAction { implicit request =>
      if (security.BRes.procIsOwnedByBiz(request.identity.businessFirst, id)) {
            Ok(Json.toJson(BPSpaceDAOF.findByBPIdB(id)))
      } else { Forbidden(Json.obj("status" -> "Access denied")) }
}
// /bprocess/:id/space_elems
def spaceElems(id: Int) = SecuredAction { implicit request =>
    if (security.BRes.procIsOwnedByBiz(request.identity.businessFirst, id)) {
          Ok(Json.toJson(SpaceElemDAO.findByBPId(id)))
    } else { Forbidden(Json.obj("status" -> "Access denied")) }
}





val UndefElementForm = Form(
    mapping(
      "id" -> optional(number),
      "title" -> nonEmptyText,
      "desc" -> text,
      "business" -> number,
      "bprocess" -> number,
      "b_type" -> nonEmptyText,
      "type_title" -> nonEmptyText,
      "space_own" -> optional(number),
      "order" -> number,
      "created_at" -> optional(jodaDate),
      "updated_at" -> optional(jodaDate)
      )(UndefElement.apply)(UndefElement.unapply))
/*
id: Option[Int],
                      bprocess: Int,
                      index:Int,
                      container:Boolean,
                      subbrick:Boolean,
                      brick_front:Option[Int]=None,
                      brick_nested:Option[Int]=None,
                      nestingLevel: Int = 1
                      */
val BPSpaceForm = Form(
    mapping(
      "id" -> optional(number),
      "bprocess" -> number,
      "index" -> number,
      "container" -> boolean,
      "subbrick" -> boolean,
      "brick_front" -> optional(number),
      "brick_nested" -> optional(number),
      "nestingLevel" -> number,
      "created_at" -> optional(jodaDate),
      "updated_at" -> optional(jodaDate))(BPSpaceDTO.apply)(BPSpaceDTO.unapply))
/*
id: Option[Int],
                        title:String,
                        desc:String,
                        business:Int,
                        bprocess:Int,
                        b_type:String,
                        type_title:String,
                        space_own:Option[Int],
                        space_owned: Int,
                        space_role:Option[String],
                        order:Int,
                        comps: Option[List[CompositeValues]]
                        */
val SpaceElementForm = Form(
    mapping(
      "id" -> optional(number),
      "title" -> nonEmptyText,
      "desc" -> text,
      "business" -> number,
      "bprocess" -> number,
      "b_type" -> nonEmptyText,
      "type_title" -> nonEmptyText,
      "space_own" -> optional(number),
      "space_owned" -> number,
      "space_role" -> optional(text),
      "order" -> number,
      "created_at" -> optional(jodaDate),
      "updated_at" -> optional(jodaDate))(SpaceElementDTO.apply)(SpaceElementDTO.unapply))




def createFrontElem() = SecuredAction.async(BodyParsers.parse.json) { implicit request =>

request.body.validate[RefElemContainer].map {
  case entity => {
         if (security.BRes.procIsOwnedByBiz(request.identity.businessFirst, entity.process)) {
            RefDAOF.retriveAndCreateElement(refId = entity.ref,
                           process = entity.process,
                           business = entity.business,
                           in = "front",
                           title = entity.title,
                           desc = entity.desc,
                           space_id = None,
                           refActionContainer = entity.refActionContainer).map { retrived =>
                              retrived match {//ProcElemDAO.pull_object(entity) match {
                                case None =>  Ok(Json.toJson(
                                                            Map("failure" ->  s"Could not create front element ${entity.title}")))
                                case ref_resulted =>  {
                                  val element_result = ref_resulted
                                  val elem_id = element_result match {
                                    case Some(res) => res.proc_elems.headOption
                                    case _ => None
                                }
                              action(request.identity.emailFilled, process = Some(entity.process),
                                action = ProcHisCom.elementCreated,
                                what = Some(entity.title),
                                what_id = elem_id)
                              Ok(Json.toJson(Map("success" ->  Json.toJson(ref_resulted))))
                            }
                          }
          }
        } else { Future( Forbidden(Json.obj("status" -> "Access denied")) ) }
    }
    }.recoverTotal{
      e => Future( BadRequest(e.toString) )
    }
}
def createSpace() = SecuredAction(BodyParsers.parse.json) { implicit request =>
  val placeResult = request.body.validate[BPSpaceDTO]
   request.body.validate[BPSpaceDTO].map{
    case entity => {
            if (security.BRes.procIsOwnedByBiz(request.identity.businessFirst, entity.bprocess)) {
            BPSpaceDAOF.pull_object(entity) match {
              case -1 =>  Ok(Json.toJson(Map("failure" ->  s"Could not create space ${entity.index}")))
              case id =>  Ok(Json.toJson(Map("success" ->  id)))
            }
    } else { Forbidden(Json.obj("status" -> "Access denied")) }
    }
    }.recoverTotal{
      e => BadRequest("formWithErrors")
    }
}

def createSpaceElem() = SecuredAction.async(BodyParsers.parse.json) { implicit request =>
  val placeResult = request.body.validate[RefElemContainer]
    request.body.validate[RefElemContainer].map{
    case entity => Logger.debug(s"entity are $entity")
  }
  request.body.validate[RefElemContainer].map{
      case entity => {
            if (security.BRes.procIsOwnedByBiz(request.identity.businessFirst, entity.process)) {
                 RefDAOF.retriveAndCreateElement(refId = entity.ref,
                                 process = entity.process,
                                 business = entity.business,
                                 in = "nested",
                                 title = entity.title,
                                 desc = entity.desc,
                                 space_id = entity.space_id).map { retrived =>
                                retrived match { //SpaceElemDAO.pull_object(entity) match {
                                  case None =>  Ok(Json.toJson(Map("failure" ->  s"Could not create space element ${entity.title}")))
                                  case ref_resulted =>   {
                                    val element_result = ref_resulted
                                    val elem_id = element_result match {
                                      case Some(res) => res.space_elems.headOption
                                      case _ => None
                                    }
                                    action(request.identity.emailFilled, process = Some(entity.process),
                                      action = ProcHisCom.spaceElementCreated,
                                      what = Some(entity.title),
                                      what_id = elem_id)
                                    Ok(Json.toJson(Map("success" ->  Json.toJson(ref_resulted))))
                                  }
                                }
                  }
          } else { Future(Forbidden(Json.obj("status" -> "Access denied"))) }
      }
    }.recoverTotal{
      e => Future(BadRequest("formWithErrors"))
    }
}



/* Update */
def updateBase(bpId: Int, base_id: Long) = SecuredAction.async(BodyParsers.parse.json) { implicit request =>
  request.body.validate[BaseNewValue].map{
    case entity => {
          if (security.BRes.procIsOwnedByBiz(request.identity.businessFirst, bpId)) {
            StrategyBasesDAOF.updateValue(base_id, newValueContent = entity.baseNewValue).map { result =>
              Ok(Json.toJson(result) )
            }
          } else { Future.successful( Forbidden(Json.obj("status" -> "Access denied")) ) }
    }
    }.recoverTotal{
      e => Future.successful( BadRequest("formWithErrors") )
    }
}


/* Update */
def updateFrontElem(bpId: Int, elem_id: Int) = SecuredAction(BodyParsers.parse.json) { implicit request =>
  request.body.validate[UndefElement].map{
    case entity => {
          if (security.BRes.procIsOwnedByBiz(request.identity.businessFirst, entity.bprocess)) {
              ProcElemDAO.update(elem_id,entity) match {
                case -1   =>  Ok(Json.toJson(Map("failure" ->  s"Could not update front element ${entity.title}")))
                case _@id => {
                 action(request.identity.emailFilled, process = Some(entity.bprocess),
                  action = ProcHisCom.elementRenamed, what = Some(entity.title), what_id = Some(id))
                 Ok(Json.toJson(entity.id))
                }
              }
          } else { Forbidden(Json.obj("status" -> "Access denied")) }
    }
    }.recoverTotal{
      e => BadRequest("formWithErrors")
    }
}

def updateSpace(id: Int, space_id: Int) = SecuredAction(BodyParsers.parse.json) { implicit request =>
  request.body.validate[BPSpaceDTO].map{
    case entity => {
        if (security.BRes.procIsOwnedByBiz(request.identity.businessFirst, entity.bprocess)) {

           BPSpaceDAOF.await( BPSpaceDAOF.update(space_id,entity) ) match {
            case -1 =>  Ok(Json.toJson(Map("failure" ->  s"Could not update space ${entity.id}")))
            case _@x =>  Ok(Json.toJson(entity.id))
          }
        } else { Forbidden(Json.obj("status" -> "Access denied")) }
    }
    }.recoverTotal{
      e => BadRequest("formWithErrors")
    }
}
def updateSpaceElem(id: Int, spelem_id: Int) = SecuredAction(BodyParsers.parse.json) { implicit request =>
  request.body.validate[SpaceElementDTO].map{
    case entity => {
        if (security.BRes.procIsOwnedByBiz(request.identity.businessFirst, entity.bprocess)) {
             SpaceElemDAO.update(spelem_id,entity) match {
                case false =>  Ok(Json.toJson(Map("failure" ->  s"Could not update space element ${entity.title}")))
                case _ => {
                 action(request.identity.emailFilled, process = Some(entity.bprocess),
                  action = ProcHisCom.spaceElementRenamed, what = Some(entity.title), what_id = Some(id))

                 Ok(Json.toJson(entity.id))
                }
             }
        } else { Forbidden(Json.obj("status" -> "Access denied")) }
    }
  }.recoverTotal{
      e => BadRequest("formWithErrors")
    }
}

def moveUpFrontElem(bpId: Int, elem_id: Int) = SecuredAction(BodyParsers.parse.json) { implicit request =>
    if (security.BRes.procIsOwnedByBiz(request.identity.businessFirst, bpId)) {
          ProcElemDAO.moveUp(bpId, elem_id)
          action(request.identity.emailFilled, process = Some(bpId),
           action = ProcHisCom.elementMovedUp, what = Some(ProcHisCom.elementMovedUp), what_id = Some(elem_id))

          Ok(Json.toJson("moved"))
    } else { Forbidden(Json.obj("status" -> "Access denied")) }

}
def moveDownFrontElem(bpId: Int, elem_id: Int) = SecuredAction(BodyParsers.parse.json) { implicit request =>
    if (security.BRes.procIsOwnedByBiz(request.identity.businessFirst, bpId)) {
      ProcElemDAO.moveDown(bpId, elem_id)
      action(request.identity.emailFilled, process = Some(bpId),
        action = ProcHisCom.elementDown, what = Some(ProcHisCom.elementDown), what_id = Some(elem_id))

      Ok(Json.toJson("moved"))
    } else { Forbidden(Json.obj("status" -> "Access denied")) }
}
def moveUpSpaceElem(id: Int, spelem_id: Int, space_id: Int) = SecuredAction(BodyParsers.parse.json) { implicit request =>
    val process_id = id
    if (security.BRes.procIsOwnedByBiz(request.identity.businessFirst, process_id)) {
      SpaceElemDAO.moveUp(id, spelem_id, space_id)
      action(request.identity.emailFilled, process = Some(process_id),
        action = ProcHisCom.spaceElementMovedUp, what = Some(ProcHisCom.spaceElementMovedUp), what_id = Some(spelem_id))

      Ok(Json.toJson("moved"))
    } else { Forbidden(Json.obj("status" -> "Access denied")) }
}
def moveDownSpaceElem(id: Int, spelem_id: Int, space_id: Int) = SecuredAction(BodyParsers.parse.json) { implicit request =>
    val process_id = id
    if (security.BRes.procIsOwnedByBiz(request.identity.businessFirst, process_id)) {
      SpaceElemDAO.moveDown(id, spelem_id, space_id)
      action(request.identity.emailFilled, process = Some(process_id),
        action = ProcHisCom.spaceElementMovedDown, what = Some(ProcHisCom.spaceElementMovedDown), what_id = Some(spelem_id))

      Ok(Json.toJson("moved"))
    } else { Forbidden(Json.obj("status" -> "Access denied")) }
}





/* Delete */
def deleteFrontElem(bpID: Int, elem_id: Int) = SecuredAction { implicit request =>
    if (security.BRes.procIsOwnedByBiz(request.identity.businessFirst, bpID)) {
      val elem = ProcElemDAO.findById(elem_id).get

          ProcElemDAO.delete(elem_id) match {
            case 0 =>  Ok(Json.toJson(Map("failure" -> "Entity has Not been deleted")))
            case x =>  {
              deleteOwnedSpace(elem_id = Some(elem_id), spelem_id = None);
              action(request.identity.emailFilled, process = Some(bpID),
                action = ProcHisCom.elementDeleted, what = Some(elem.title), what_id = Some(elem_id))

              Ok(Json.toJson(Map("success" -> s"Entity has been deleted (deleted $x row(s))")))
            }
          }
     } else { Forbidden(Json.obj("status" -> "Access denied")) }
}
def deleteSpace(bpID: Int, space_id: Int) = SecuredAction { implicit request =>
    if (security.BRes.procIsOwnedByBiz(request.identity.businessFirst, bpID)) {

      BPSpaceDAOF.await( BPSpaceDAOF.delete(space_id) ) match {
        case 0 =>  Ok(Json.toJson(Map("failure" -> "Entity has Not been deleted")))
        case x =>  Ok(Json.toJson(Map("success" -> s"Entity has been deleted (deleted $x row(s))")))
      }
    } else { Forbidden(Json.obj("status" -> "Access denied")) }
}
def deleteSpaceElem(bpID: Int, spelem_id: Int) = SecuredAction { implicit request =>
    if (security.BRes.procIsOwnedByBiz(request.identity.businessFirst, bpID)) {
      val spelem = SpaceElemDAO.findById(spelem_id).get
      SpaceElemDAO.delete(spelem_id) match {
        case 0 =>  Ok(Json.toJson(Map("failure" -> "Entity has Not been deleted")))
        case x =>  {
          deleteOwnedSpace(elem_id = None, spelem_id = Some(spelem_id))
          action(request.identity.emailFilled, process = Some(bpID),
            action = ProcHisCom.spaceElementDeleted, what = Some(spelem.title), what_id = Some(spelem_id))

          Ok(Json.toJson(Map("success" -> s"Entity has been deleted (deleted $x row(s))")))
        }
      }
    } else { Forbidden(Json.obj("status" -> "Access denied")) }
}


/**
 * Element topology
 */

def element_topos(id: Int) = SecuredAction { implicit request =>
  if (security.BRes.procIsOwnedByBiz(request.identity.businessFirst, id)) {
      val topologs_dto = ElemTopologDAO.findByBP(id)
      Logger.debug(s"topos quantity are $topologs_dto.length")
      val topologs:List[ElementTopologyWrapper] = topologs_dto.filter(topo => topo.front_elem_id.isDefined).map { topolog =>
          val element = ProcElemDAO.findById(topolog.front_elem_id.get).get
          ElementTopologyWrapper(topo_id = topolog.id.get, element_id = element.id.get, element_title = element.title, space_element = false)
        } ++ topologs_dto.filter(topo => topo.space_elem_id.isDefined).map { topolog =>
          val element = SpaceElemDAO.findById(topolog.space_elem_id.get).get
          ElementTopologyWrapper(topo_id = topolog.id.get, element_id = element.id.get, element_title = element.title, space_element = true)
        }
      Ok(Json.toJson(topologs))
  } else { Forbidden(Json.obj("status" -> "Access denied")) }
}










/**
 * State, reactions, switchers
 **/
def state_index(BPid: Int) = SecuredAction { implicit request =>
  if (security.BRes.procIsOwnedByBiz(request.identity.businessFirst, BPid)) {
    Ok(Json.toJson(BPStateDAOF.findByBP(BPid)))
  } else { Forbidden(Json.obj("status" -> "Access denied")) }
}
def state_session_index(BPid: Int, session_id: Int) = SecuredAction { implicit request =>
  if (security.BRes.procIsOwnedByBiz(request.identity.businessFirst, BPid)) {
    Ok(Json.toJson( BPSessionStateDAOF.await( BPSessionStateDAOF.findByBPAndSession(BPid, session_id) ) ))
  } else { Forbidden(Json.obj("status" -> "Access denied")) }
}
def update_session_state(BPid: Int, session_id: Int, state_id: Int) = SecuredAction { implicit request =>
  if (security.BRes.procIsOwnedByBiz(request.identity.businessFirst, BPid)) {
    Ok(Json.toJson("Ok"))
  } else { Forbidden(Json.obj("status" -> "Access denied")) }
}
def delete_session_state(BPid: Int, session_id: Int, state_id: Int) = SecuredAction { implicit request =>
  if (security.BRes.procIsOwnedByBiz(request.identity.businessFirst, BPid)) {
    Ok(Json.toJson("Ok"))
  } else { Forbidden(Json.obj("status" -> "Access denied")) }
}
def update_state(BPid: Int, state_id: Int) = SecuredAction { implicit request =>
  if (security.BRes.procIsOwnedByBiz(request.identity.businessFirst, BPid)) {
    Ok(Json.toJson("Ok"))
  } else { Forbidden(Json.obj("status" -> "Access denied")) }
}
def delete_state(BPid: Int, state_id: Int) = SecuredAction { implicit request =>
  if (security.BRes.procIsOwnedByBiz(request.identity.businessFirst, BPid)) {
     Ok(Json.toJson("Ok"))
  } else { Forbidden(Json.obj("status" -> "Access denied")) }
}
def switches_index(BPid: Int) = SecuredAction { implicit request =>
  if (security.BRes.procIsOwnedByBiz(request.identity.businessFirst, BPid)) {
     Ok(Json.toJson(SwitcherDAO.findByBPId(BPid)))
  } else { Forbidden(Json.obj("status" -> "Access denied")) }

}
def update_switcher(id: Int) = SecuredAction { implicit request =>
  Ok(Json.toJson("Ok"))
}
def delete_switcher(id: Int) = SecuredAction { implicit request =>
  Ok(Json.toJson("Ok"))
}

// GET 			/bprocess/:BPid/reactions		      @controllers.ProcessElementsController.reactions_index(BPid: Int)
def reactions_index(BPid: Int) = SecuredAction { implicit request =>
  if (security.BRes.procIsOwnedByBiz(request.identity.businessFirst, BPid)) {
    Ok(Json.toJson(ReactionDAO.findByBP(BPid).map { react =>

       val act_ids = List(react.id.get) // react.map(c => c.id.get)
       val middlewares = MiddlewaresDAOF.await(MiddlewaresDAOF.findByReactions(act_ids) )
       val mids_ids = middlewares.map(c => c.id.get).toList
       val strategies = StrategiesDAOF.await(StrategiesDAOF.findByMiddlewares(mids_ids))
       val strat_ids = strategies.map(c => c.id.get).toList
       val strategy_bases = StrategyBasesDAOF.await( StrategyBasesDAOF.getByStrategies(strat_ids) )
       val strategy_inputs = StrategyInputsDAOF.await( StrategyInputsDAOF.getByStrategies(strat_ids) )
       val strategy_outputs = StrategyOutputsDAOF.await( StrategyOutputsDAOF.getByStrategies(strat_ids) )


      ReactionCollection(react,
        ReactionStateOutDAO.findByReaction(react.id.get),
        middlewares = middlewares,
        strategies = strategies,
        strategy_bases = strategy_bases,
        strategy_inputs = strategy_inputs,
        strategy_outputs = strategy_outputs)
       } ))
  } else { Forbidden(Json.obj("status" -> "Access denied")) }
}

def update_reaction(id: Int) = SecuredAction { implicit request =>
  Ok(Json.toJson("Ok"))
}
def delete_reaction(id: Int) = SecuredAction { implicit request =>
  Ok(Json.toJson("Ok"))
}








/*******************
 * Histories methods
 *******************/
import ProcHistoryDAO._


private def decorateProcElementsToJson(elements: List[UndefElement]) = {
  val elemIds:List[Int] = elements.map(_.id.get)
  val topos:List[ElemTopology] = ElemTopologDAO.findByFrontElements(elemIds)
  val elemJson = Json.toJson( elements )
  val elemJsonObj = elemJson.as[List[JsObject]]
  val objWithTopos = elemJsonObj.map { obj =>
    val elemId = (obj \ "id").validate[Int].get
    obj + ("topo_id" -> Json.toJson(topos.find(topo => topo.front_elem_id.get == elemId ).get  ))
  }
  objWithTopos
}

private def decorateProcElementsWithExistedToposToJson(elements: List[UndefElement], 
                                                       topos:List[ElemTopology]) = {
  val elemIds:List[Int] = elements.map(_.id.get)
  val elemJson = Json.toJson( elements )
  val elemJsonObj = elemJson.as[List[JsObject]]
  val objWithTopos = elemJsonObj.map { obj =>
    val elemId = (obj \ "id").validate[Int].get
    obj + ("topo_id" -> Json.toJson(topos.find(topo => topo.front_elem_id.get == elemId ).get  ))
  }
  objWithTopos
}

// ProcessHistoryDTO(var id: Option[Int],
// acc: String,
// process: Int,
// action: String,
// date: DateTime,
// what: Option[String] = None)
private def action(acc: String, process: Option[Int], action: String, what: Option[String]=None, what_id: Option[Int]=None) = {
  ProcHistoryDAOF.pull(ProcessHistoryDTO(
    None, acc, action, process, what, what_id, org.joda.time.DateTime.now() ))
}
private def haltActiveStations(BPid: Int) = {
    BPDAO.get(BPid) match {
      case Some(bprocess) => {
       BPStationDAO.haltByBPId(BPid)
       }
      case _ => false
    }
}

private def deleteOwnedSpace(elem_id:Option[Int],spelem_id:Option[Int]) {
  if (elem_id.isDefined) {
    BPSpaceDAOF.deleteOwnedSpace(elem_id,spelem_id)
  }
  if (spelem_id.isDefined) {
    BPSpaceDAOF.deleteOwnedSpace(elem_id,spelem_id)
  }
}


}
