package controllers

import models.DAO.resources.{BusinessDAO, BusinessDTO}
import models.DAO._

import play.api._
import play.api.mvc._
import play.twirl.api.Html

//{Action, Controller}
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
import service.DemoUser
import securesocial.core._
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

case class RefElemContainer(title: String, desc: String = "", business: Int, process: Int, ref: Int, space_id: Option[Int]= None)


case class ReactionCollection(reaction: UnitReaction,
reaction_state_outs: List[UnitReactionStateOut])
case class ElementTopology(topo_id: Int, element_id: Int, element_title: String)

class BusinessProcessController(override implicit val env: RuntimeEnvironment[DemoUser]) extends Controller with securesocial.core.SecureSocial[DemoUser] {

  implicit val CompositeVReads = Json.reads[CompositeValues]
  implicit val CompositeVWrites = Json.format[CompositeValues]
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

  implicit val RefElemContainerReads = Json.reads[RefElemContainer]
  implicit val RefElemContainerWrites = Json.format[RefElemContainer]
  implicit val RefResultedReads = Json.reads[models.DAO.reflect.RefResulted]
  implicit val RefResultedWrites = Json.format[models.DAO.reflect.RefResulted]

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
implicit val ReactionCollectionReads = Json.reads[ReactionCollection]
implicit val ReactionCollectionWrites = Json.format[ReactionCollection]
implicit val ElementTopologyReads = Json.reads[ElementTopology]
implicit val ElementTopologyWrites = Json.format[ElementTopology]

  def bprocess = SecuredAction { implicit request =>
    val bprocess = BPDAO.getAll // TODO: Not safe
    val user_services = BusinessServiceDAO.getByMaster(request.user.main.email.getOrElse("")).map(_.id)
    // TODO: Add for actor, if they assigned to process
    
    if (request.user.isEmployee) { 
       // Employee assigned process
       val acts = ActPermissionDAO.getByUID(request.user.main.email.get)
       val bpIds = ActPermissionDAO.getByUIDprocIDS(request.user.main.email.get)
       val procOut = bprocess.filter(bp => bpIds.contains(bp.id.get)) 
       Ok(Json.toJson( procOut ))
    } else { 
      // Primary manager processes
      val procOut = bprocess.filter(bp => user_services.contains(Some(bp.service))) 
      Ok(Json.toJson( procOut ))
    }

  }



  def copy(bpId: Int, orig_title: String) = SecuredAction { implicit request => 
     val cloned:Int = cloner.util.ProcessCloner.clone(bpId, orig_title) 
     cloned match {
       case -1 => BadRequest(Json.toJson(Map("error" -> "Cannot copy process")))
       case id:Int => Ok(Json.toJson(id)) 
     }
  }




  private def haltActiveStations(bpId: Int) = {
    BPDAO.get(bpId) match {
      case Some(bprocess) => {
       BPStationDAO.haltByBPId(bpId)
       }
      case _ => false
    }
  }

  def embed() = {
    ???
  }

  def show_bprocess(id: Int) = SecuredAction { implicit request =>
    BPDAO.get(id) match {
      case Some(bprocess) => Ok(Json.toJson(bprocess))
      case _ => BadRequest(Json.obj("status" -> "Not found"))
    }
  }



def create_bprocess = SecuredAction(BodyParsers.parse.json) { request =>
  val bpResult = request.body.validate[BProcessDTO]
    Logger.debug(s"trying create process with $bpResult")
    bpResult.fold(
    errors => {
       Logger.error(s"error with $bpResult")
      BadRequest(Json.obj("status" ->"KO", "message" -> JsError.toFlatJson(errors)))
    },
    bprocess => { 
      BPDAO.pull_object(bprocess) match {
        case id:Int => { 
          AutoTracer.defaultStatesForProcess(process_id = id)
          Ok(Json.obj("status" ->"OK", "message" -> ("Bprocess '"+bprocess.id+"' saved.") ))  
        }
        case -1 => BadRequest(Json.obj("status" -> "Cannot create process"))
      }
      
    }
  )
}
  def update_bprocess(id: Int) = SecuredAction(BodyParsers.parse.json) { implicit request =>
    val bpResult = request.body.validate[BProcessDTO]
  bpResult.fold(
    errors => {
      BadRequest(Json.obj("status" ->"KO", "message" -> JsError.toFlatJson(errors)))
    },
    bprocess => { 
      BPDAO.update(id, bprocess)
      Ok(Json.obj("status" ->"OK", "message" -> ("Bprocess '"+bprocess.title+"' saved.") ))  
    }
  )

  }
  def delete_bprocess(id: Int) = SecuredAction { implicit request => 
    Ok(Json.toJson(BPDAO.delete(id)))
  }


/* Index */
def frontElems(id: Int) = SecuredAction { implicit request =>

  Ok(Json.toJson(ProcElemDAO.findByBPId(id)))
}
def show_elem_length(id: Int):Int = { 
  ProcElemDAO.findLengthByBPId(id)
}
def bpElemLength() = SecuredAction { implicit request =>
  val bps = BPDAO.getAll // TODO: Weak perm
  val elms = ProcElemDAO.getAll
  val spelms = SpaceElemDAO.getAll
  def all_length(id: Int):Int = elms.filter(_.bprocess == id).length + spelms.filter(_.bprocess == id).length
  Ok(Json.toJson(
    Map(bps.map(bp => (bp.id.get.toString -> all_length(bp.id.get))) map {s => (s._1, s._2)} : _*)//show_elem_length(bp.id.get))) map {s => (s._1, s._2)} : _*)
    ))
}
def spaces(id: Int) = SecuredAction { implicit request =>
  Ok(Json.toJson(BPSpaceDAO.findByBPId(id)))
}
def spaceElems(id: Int) = SecuredAction { implicit request =>
  Ok(Json.toJson(SpaceElemDAO.findByBPId(id)))
}

/**
 * Forms
 */
 /*
 */

implicit val carFormat = new Formatter[CompositeValues] {
  def bind(key: String, data: Map[String, String]):Either[Seq[FormError], CompositeValues] = 
    data.get(key)
      // make sure the method returns an option of CompositeValues
      .flatMap(generateCV _)
      .toRight(Seq(FormError(key, "error.carNotFound", Nil)))

  def unbind(key: String, value: CompositeValues) = Map(key -> value.toString)
}

def generateCV(a: String):Some[CompositeValues] = {
  Some(CompositeValues())
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
      "comps" -> optional(list(of[CompositeValues])),
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
      "comps" -> optional(list(of[CompositeValues])),
      "created_at" -> optional(jodaDate),
      "updated_at" -> optional(jodaDate))(SpaceElementDTO.apply)(SpaceElementDTO.unapply))




def createFrontElem() = SecuredAction(BodyParsers.parse.json) { implicit request =>

  request.body.validate[RefElemContainer].map{ 
    case entity => haltActiveStations(entity.process); RefDAO.retrive(entity.ref, entity.process, entity.business, in = "front", entity.title, entity.desc, space_id = None) match {//ProcElemDAO.pull_object(entity) match {
            case None =>  Ok(Json.toJson(Map("failure" ->  s"Could not create front element ${entity.title}")))
            case id =>  { 
              Ok(Json.toJson(Map("success" ->  Json.toJson(id))))
            }
          }
    }.recoverTotal{
      e => BadRequest("formWithErrors")
    }
}
def createSpace() = SecuredAction(BodyParsers.parse.json) { implicit request =>
  val placeResult = request.body.validate[BPSpaceDTO]  
   request.body.validate[BPSpaceDTO].map{ 
    case entity => haltActiveStations(entity.bprocess);BPSpaceDAO.pull_object(entity) match {
            case -1 =>  Ok(Json.toJson(Map("failure" ->  s"Could not create space ${entity.index}")))
            case id =>  Ok(Json.toJson(Map("success" ->  id)))
          }
    }.recoverTotal{
      e => BadRequest("formWithErrors")
    }
}

def createSpaceElem() = SecuredAction(BodyParsers.parse.json) { implicit request =>
//RefDAO.retrive(k: Int, entity.bprocess, entity.business, in = "nested", entity.title, entity.desc, space_id: Option[Int] = None)
//models.DAO.reflect.RefResulted
  val placeResult = request.body.validate[RefElemContainer]  
    request.body.validate[RefElemContainer].map{ 
    case entity => println(entity)
  }
  request.body.validate[RefElemContainer].map{ 
    case entity => haltActiveStations(entity.process); RefDAO.retrive(entity.ref, entity.process, entity.business, in = "nested", entity.title, entity.desc, entity.space_id) match { //SpaceElemDAO.pull_object(entity) match {
            case None =>  Ok(Json.toJson(Map("failure" ->  s"Could not create space element ${entity.title}")))
            case id =>  Ok(Json.toJson(Map("success" ->  Json.toJson(id))))
          }
    }.recoverTotal{
      e => BadRequest("formWithErrors")
    }
}



/* Update */
def updateFrontElem(bpId: Int, elem_id: Int) = SecuredAction(BodyParsers.parse.json) { implicit request =>
  request.body.validate[UndefElement].map{ 
    case entity => ProcElemDAO.update(elem_id,entity) match {
            case false =>  Ok(Json.toJson(Map("failure" ->  s"Could not update front element ${entity.title}")))
            case _ =>  Ok(Json.toJson(entity.id))
          }
    }.recoverTotal{
      e => BadRequest("formWithErrors")
    }
}

def updateSpace(id: Int, space_id: Int) = SecuredAction(BodyParsers.parse.json) { implicit request =>
  request.body.validate[BPSpaceDTO].map{ 
    case entity => BPSpaceDAO.update(space_id,entity) match {
            case -1 =>  Ok(Json.toJson(Map("failure" ->  s"Could not update space ${entity.id}")))
            case _@x =>  Ok(Json.toJson(entity.id))
          }
    }.recoverTotal{
      e => BadRequest("formWithErrors")
    }
}
def updateSpaceElem(id: Int, spelem_id: Int) = SecuredAction(BodyParsers.parse.json) { implicit request =>
  request.body.validate[SpaceElementDTO].map{ 
    case entity => SpaceElemDAO.update(spelem_id,entity) match {
            case false =>  Ok(Json.toJson(Map("failure" ->  s"Could not update space element ${entity.title}")))
            case _ =>  Ok(Json.toJson(entity.id))
          }
    }.recoverTotal{
      e => BadRequest("formWithErrors")
    }

}
def moveUpFrontElem(bpId: Int, elem_id: Int) = SecuredAction(BodyParsers.parse.json) { implicit request =>
  ProcElemDAO.moveUp(bpId, elem_id)
  Ok(Json.toJson("moved"))
}
def moveDownFrontElem(bpId: Int, elem_id: Int) = SecuredAction(BodyParsers.parse.json) { implicit request =>
  ProcElemDAO.moveDown(bpId, elem_id)
  Ok(Json.toJson("moved"))
}
def moveUpSpaceElem(id: Int, spelem_id: Int, space_id: Int) = SecuredAction(BodyParsers.parse.json) { implicit request =>
    SpaceElemDAO.moveUp(id, spelem_id, space_id)
  Ok(Json.toJson("moved"))
}
def moveDownSpaceElem(id: Int, spelem_id: Int, space_id: Int) = SecuredAction(BodyParsers.parse.json) { implicit request =>
    SpaceElemDAO.moveDown(id, spelem_id, space_id)
  Ok(Json.toJson("moved"))
}





/* Delete */
def deleteFrontElem(bpID: Int, elem_id: Int) = SecuredAction { implicit request =>
  haltActiveStations(bpID);ProcElemDAO.delete(elem_id) match {
        case 0 =>  Ok(Json.toJson(Map("failure" -> "Entity has Not been deleted")))
        case x =>  deleteOwnedSpace(elem_id = Some(elem_id), spelem_id = None);Ok(Json.toJson(Map("success" -> s"Entity has been deleted (deleted $x row(s))")))
      }
}
def deleteSpace(bpID: Int, space_id: Int) = SecuredAction { implicit request =>
    haltActiveStations(bpID);BPSpaceDAO.delete(space_id) match {
        case 0 =>  Ok(Json.toJson(Map("failure" -> "Entity has Not been deleted")))
        case x =>  Ok(Json.toJson(Map("success" -> s"Entity has been deleted (deleted $x row(s))")))
      }
}
def deleteSpaceElem(bpID: Int, spelem_id: Int) = SecuredAction { implicit request =>
    haltActiveStations(bpID);SpaceElemDAO.delete(spelem_id) match {
        case 0 =>  Ok(Json.toJson(Map("failure" -> "Entity has Not been deleted")))
        case x =>  deleteOwnedSpace(elem_id = None, spelem_id = Some(spelem_id));Ok(Json.toJson(Map("success" -> s"Entity has been deleted (deleted $x row(s))")))
      }
}


/**
 * Element topology
 */

def element_topos(id: Int) = SecuredAction { implicit request => 
  val topologs_dto = ElemTopologDAO.findByBP(id)

  val topologs:List[ElementTopology] = topologs_dto.filter(topo => topo.front_elem_id.isDefined).map { topolog =>
      val element = ProcElemDAO.findById(topolog.front_elem_id.get).get
      ElementTopology(topo_id = topolog.id.get, element_id = element.id.get, element_title = element.title)
    } ++ topologs_dto.filter(topo => topo.space_elem_id.isDefined).map { topolog => 
      val element = SpaceElemDAO.findById(topolog.space_elem_id.get).get
      ElementTopology(topo_id = topolog.id.get, element_id = element.id.get, element_title = element.title)
    }
  
  Ok(Json.toJson(topologs))
}










/**
 * State, reactions, switchers
 **/
def state_index(BPid: Int) = SecuredAction { implicit request => 
  Ok(Json.toJson(BPStateDAO.findByBP(BPid)))
}
def state_session_index(BPid: Int, session_id: Int) = SecuredAction { implicit request => 
  Ok(Json.toJson(BPSessionStateDAO.findByBPAndSession(BPid, session_id)))
}
def update_session_state(BPid: Int, session_id: Int, state_id: Int) = SecuredAction { implicit request =>
  Ok(Json.toJson("Ok"))
}
def delete_session_state(BPid: Int, session_id: Int, state_id: Int) = SecuredAction { implicit request =>
  Ok(Json.toJson("Ok"))
}
def update_state(BPid: Int, state_id: Int) = SecuredAction { implicit request =>
  Ok(Json.toJson("Ok"))
}
def delete_state(BPid: Int, state_id: Int) = SecuredAction { implicit request =>
  Ok(Json.toJson("Ok"))
}
def switches_index(BPid: Int) = SecuredAction { implicit request => 
  Ok(Json.toJson(SwitcherDAO.findByBPId(BPid)))
}
def update_switcher(id: Int) = SecuredAction { implicit request => 
  Ok(Json.toJson("Ok"))
}
def delete_switcher(id: Int) = SecuredAction { implicit request => 
  Ok(Json.toJson("Ok"))
}
def reactions_index(BPid: Int) = SecuredAction { implicit request => 
  Ok(Json.toJson(ReactionDAO.findByBP(BPid).map(react => ReactionCollection(react, ReactionStateOutDAO
findByReaction(react.id.get)))))
}
def update_reaction(id: Int) = SecuredAction { implicit request => 
  Ok(Json.toJson("Ok"))
}
def delete_reaction(id: Int) = SecuredAction { implicit request => 
  Ok(Json.toJson("Ok"))
}















/*
  Histories methods
 */
import ProcHistoryDAO._

private def action(what: String) = {
  ???
}


private def deleteOwnedSpace(elem_id:Option[Int],spelem_id:Option[Int]) {
  if (elem_id.isDefined) {
    BPSpaceDAO.deleteOwnedSpace(elem_id,spelem_id)
  }
  if (spelem_id.isDefined) {
    BPSpaceDAO.deleteOwnedSpace(elem_id,spelem_id)
  }
}


}
