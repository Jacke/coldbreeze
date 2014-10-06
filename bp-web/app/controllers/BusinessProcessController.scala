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



  def bprocess = SecuredAction { implicit request =>
    val bprocess = BPDAO.getAll
    val user_services = BusinessServiceDAO.getByMaster(request.user.main.email.getOrElse("")).map(_.id)
    println(user_services)
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
    var title = orig_title
    if (BPDAO.checkTitle(orig_title).isDefined) {
      title = orig_title + " Copy"
    } 
    BPDAO.get(bpId) match {
      case Some(bprocess) => {
        val newBpId = BPDAO.pull_object(bprocess.copy(id = None, title = title))
        val spaces = BPSpaceDAO.findByBPId(bpId)
        val space_elems = SpaceElemDAO.findByBPId(bpId)
        val proc_elems = ProcElemDAO.findByBPId(bpId)



        var new_proc_elems_ids = Map.empty[Int, Int]
        val new_proc_elems = proc_elems.foreach { proc_element =>
          new_proc_elems_ids = new_proc_elems_ids ++ Map(proc_element.id.get ->
           ProcElemDAO.pull_object(
            UndefElement(None,
                        proc_element.title,
                        proc_element.desc,
                        proc_element.business,
                        newBpId,
                        proc_element.b_type,
                        proc_element.type_title,
                        proc_element.space_own,
                        proc_element.order,
                        proc_element.comps)))
        }
        var new_space_elems_ids = Map.empty[Int, Int]
        val new_space_elems = space_elems.foreach { space_element => 
          new_space_elems_ids = new_space_elems_ids ++ Map(space_element.id.get ->
                        SpaceElemDAO.pull_object(
                            SpaceElementDTO(None,
                                        space_element.title,
                                        space_element.desc,
                                        space_element.business,
                                        newBpId,
                                        space_element.b_type,
                                        space_element.type_title,
                                        space_element.space_own,
                                        space_element.space_owned,
                                        space_element.space_role,
                                        space_element.order,
                                        space_element.comps)))
        }
        var new_spaces_ids = Map.empty[Int, Int]
        val nes_spaces = spaces.foreach { space => 
          new_spaces_ids = new_spaces_ids ++ Map(space.id.get ->
          BPSpaceDAO.pull_object(BPSpaceDTO(None, 
                      newBpId, 
                      space.index, 
                      space.container, 
                      space.subbrick, 
                      new_proc_elems_ids.get(space.brick_front.getOrElse(0)),
                      new_space_elems_ids.get(space.brick_nested.getOrElse(0)), 
                      space.nestingLevel))) 

        }
        // Update space_elem spaces
        println("new space elem ids" + new_space_elems_ids.values.toList)
        SpaceElemDAO.findByIds(new_space_elems_ids.values.toList).foreach { new_space_elem =>
          SpaceElemDAO.update(new_space_elem.id.get, new_space_elem.copy(space_owned = new_spaces_ids.get(new_space_elem.space_owned).get, 
                                                                         space_own = getSpaceOwn(new_space_elem.space_own, new_spaces_ids) ))

        }

        Ok(Json.toJson(newBpId)) 
 
      }
      case _ => BadRequest(Json.obj("status" -> "Not found"))
    }
  
  }
  // Space owned helper
  private def getSpaceOwn(z: Option[Int], new_spaces_ids: Map[Int, Int]) = {
     z match {
      case Some(owned_id) => new_spaces_ids.get(owned_id)
      case _ => None
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
  def observe() = {
    ???
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
  bpResult.fold(
    errors => {
      BadRequest(Json.obj("status" ->"KO", "message" -> JsError.toFlatJson(errors)))
    },
    bprocess => { 
      BPDAO.pull_object(bprocess)
      Ok(Json.obj("status" ->"OK", "message" -> ("Bprocess '"+bprocess.id+"' saved.") ))  
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
      "comps" -> optional(list(of[CompositeValues]))
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
      "nestingLevel" -> number)(BPSpaceDTO.apply)(BPSpaceDTO.unapply))
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
      "comps" -> optional(list(of[CompositeValues])))(SpaceElementDTO.apply)(SpaceElementDTO.unapply))




def createFrontElem() = SecuredAction(BodyParsers.parse.json) { implicit request =>


  request.body.validate[UndefElement].map{ 
    case entity => haltActiveStations(entity.bprocess); ProcElemDAO.pull_object(entity) match {
            case -1 =>  Ok(Json.toJson(Map("failure" ->  s"Could not update front element ${entity.title}")))
            case id =>  { 
              println(id)
              Ok(Json.toJson(Map("success" ->  id)))
            }
          }
    }.recoverTotal{
      e => BadRequest("formWithErrors")
    }
  /*
  UndefElementForm.bindFromRequest.fold(
      formWithErrors => BadRequest("formWithErrors"),
      entity => {
          val elem_id = ProcElemDAO.pull_object(entity)
          Ok(Json.toJson(Map("success" -> s"Front element ${entity.title} has been created")))
      })   */
}
def createSpace() = SecuredAction(BodyParsers.parse.json) { implicit request =>
  println(request.body.validate[BPSpaceDTO])
  println
  val placeResult = request.body.validate[BPSpaceDTO]  
   request.body.validate[BPSpaceDTO].map{ 
    case entity => haltActiveStations(entity.bprocess);BPSpaceDAO.pull_object(entity) match {
            case -1 =>  Ok(Json.toJson(Map("failure" ->  s"Could not update front element ${entity.index}")))
            case id =>  Ok(Json.toJson(Map("success" ->  id)))
          }
    }.recoverTotal{
      e => BadRequest("formWithErrors")
    }
}
def createSpaceElem() = SecuredAction(BodyParsers.parse.json) { implicit request =>

  val placeResult = request.body.validate[SpaceElementDTO]  
  println(placeResult)
  println(request.body)
    request.body.validate[SpaceElementDTO].map{ 
    case entity => println(entity)
  }
  request.body.validate[SpaceElementDTO].map{ 
    case entity => haltActiveStations(entity.bprocess);SpaceElemDAO.pull_object(entity) match {
            case -1 =>  Ok(Json.toJson(Map("failure" ->  s"Could not update front element ${entity.title}")))
            case id =>  Ok(Json.toJson(Map("success" ->  id)))
          }
    }.recoverTotal{
      e => BadRequest("formWithErrors")
    }
}



/* Update */
def updateFrontElem(bpId: Int, elem_id: Int) = SecuredAction(BodyParsers.parse.json) { implicit request =>
  println(request.body.validate[UndefElement])
  println
  //request.body.validate[UndefElement].map{ 
  //  case entity => { 
  //    println(entity)
  //    ProcElemDAO.update(elem_id,entity)
  //  }
  //}
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
  println(request.body.validate[BPSpaceDTO])
  println
  request.body.validate[BPSpaceDTO].map{ 
    case entity => BPSpaceDAO.update(space_id,entity) match {
            case -1 =>  Ok(Json.toJson(Map("failure" ->  s"Could not update front element ${entity.id}")))
            case _@x =>  Ok(Json.toJson(entity.id))
          }
    }.recoverTotal{
      e => BadRequest("formWithErrors")
    }
}
def updateSpaceElem(id: Int, spelem_id: Int) = SecuredAction(BodyParsers.parse.json) { implicit request =>
  request.body.validate[SpaceElementDTO].map{ 
    case entity => SpaceElemDAO.update(spelem_id,entity) match {
            case false =>  Ok(Json.toJson(Map("failure" ->  s"Could not update front element ${entity.title}")))
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
        case x =>  Ok(Json.toJson(Map("success" -> s"Entity has been deleted (deleted $x row(s))")))
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
        case x =>  Ok(Json.toJson(Map("success" -> s"Entity has been deleted (deleted $x row(s))")))
      }
}



/** 
 * Process credentials
 */
 // /bprocess/:BPid/stations

def station_index(id: Int) = SecuredAction { implicit request => 
   val result = models.DAO.BPStationDAO.findByBPId(id) //BPStationDAO.findByBPId(id)
   Ok(Json.toJson(result))
}
def all_stations() = SecuredAction { implicit request =>
  Ok(Json.toJson(BPStationDAO.getAll))

}
// /bprocess/:id/station/:station_id  
def show_station(id: Int, station_id: Int) = SecuredAction { implicit request =>
  Ok(Json.toJson(
    BPStationDAO.findById(station_id)))
}
// /bprocess/:id/station/:station_id/halt  
def halt_station(id: Int, station_id: Int) = SecuredAction { implicit request =>
  Ok(Json.toJson(
    BPStationDAO.haltUpdate(station_id)))
}


// /bprocess/:id/logs  
def logs_index(id: Int) = SecuredAction { implicit request => 
  Ok(Json.toJson(BPLoggerDAO.findByBPId(id)))
}







}