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
import models.DAO._
class BusinessProcessController(override implicit val env: RuntimeEnvironment[DemoUser]) extends Controller with securesocial.core.SecureSocial[DemoUser] {
import play.api.Play.current


  def index() = Action(parse.json) { implicit request =>
    val businesses = BusinessDAO.getAll
    Ok(views.html.index11())

  }
  def create() = Action(parse.json) { implicit request =>
    // retrive BusinessDAO
    println("dao")
    Ok(views.html.index11())

  }
  def update() = Action(parse.json) { implicit request =>

    Ok(views.html.index11())

  }
  def destroy() = Action(parse.json) { implicit request =>

    Ok(views.html.index11())

  }


  import models.DAO.CompositeValues
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


/* Index */
def frontElems(id: Int) = Action { implicit request =>
  println(ProcElemDAO.findByBPId(id))
  Ok(Json.toJson(ProcElemDAO.findByBPId(id)))
}
def show_elem_length(id: Int):Int = { 
  ProcElemDAO.findLengthByBPId(id)
}
def bpElemLength() = Action { implicit request =>
  val bps = BPDAO.getAll // TODO: Weak perm
  Ok(Json.toJson(
    Map(bps.map(bp => (bp.id.get.toString -> 100)) map {s => (s._1, s._2)} : _*)//show_elem_length(bp.id.get))) map {s => (s._1, s._2)} : _*)
    ))
}
def spaces(id: Int) = Action { implicit request =>
  Ok(Json.toJson(BPSpaceDAO.findByBPId(id)))
}
def spaceElems(id: Int) = Action { implicit request =>
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




def createFrontElem(id: Int) = Action(BodyParsers.parse.json) { implicit request =>
  val placeResult = request.body.validate[UndefElement]  
     println(placeResult)
    println(request.body);  Ok("x")
  /*
  UndefElementForm.bindFromRequest.fold(
      formWithErrors => BadRequest("formWithErrors"),
      entity => {
          val elem_id = ProcElemDAO.pull_object(entity)
          Ok(Json.toJson(Map("success" -> s"Front element ${entity.title} has been created")))
      })   */
}
def createSpace(id: Int) = Action(BodyParsers.parse.json) { implicit request =>

  val placeResult = request.body.validate[BPSpaceDTO]  
   println(placeResult)
  println(request.body);  Ok("x")
/*
  BPSpaceForm.bindFromRequest.fold(
      formWithErrors => BadRequest("formWithErrors"),
      entity => {
          val elem_id = BPSpaceDAO.pull_object(entity)
          Ok(Json.toJson(Map("success" -> s"Space ${entity.id} has been created")))
      }) */
      
}
def createSpaceElem(id: Int) = Action(BodyParsers.parse.json) { implicit request =>

  val placeResult = request.body.validate[SpaceElementDTO]  
  println(placeResult)
  println(request.body);  Ok("x")
/*
  SpaceElementForm.bindFromRequest.fold(
      formWithErrors => BadRequest("formWithErrors"),
      entity => {
          val elem_id = SpaceElemDAO.pull_object(entity)
          Ok(Json.toJson(Map("success" -> s"Space element ${entity.title} has been created")))
      })
*/
}



/* Update */
def updateFrontElem(id: Int, elem_id: Int) = Action(BodyParsers.parse.json) { implicit request =>
  UndefElementForm.bindFromRequest.fold(
        formWithErrors => BadRequest("formWithErrors"),
        entity => {
          ProcElemDAO.update(id,entity) match {
            case false =>  Ok(Json.toJson(Map("failure" ->  s"Could not update front element ${entity.title}")))
            case _ =>  Ok(Json.toJson(Map("success" ->  s"Entity ${entity.title} has been updated")))
          }
        })
}
def updateSpace(id: Int, space_id: Int) = Action(BodyParsers.parse.json) { implicit request =>
  BPSpaceForm.bindFromRequest.fold(
        formWithErrors => BadRequest("formWithErrors"),
        entity => {
          BPSpaceDAO.update(id,entity) match {
            case 0 =>  Ok(Json.toJson(Map("failure" ->  s"Could not update space ${entity.id}")))
            case _ =>  Ok(Json.toJson(Map("success" ->  s"Entity ${entity.id} has been updated")))
          }
        })
}
def updateSpaceElem(id: Int, spelem_id: Int) = Action(BodyParsers.parse.json) { implicit request =>

    SpaceElementForm.bindFromRequest.fold(
        formWithErrors => BadRequest("formWithErrors"),
        entity => {
          SpaceElemDAO.update(id,entity) match {
            case false =>  Ok(Json.toJson(Map("failure" ->  s"Could not update space elem ${entity.title}")))
            case _ =>  Ok(Json.toJson(Map("success" ->  s"Entity ${entity.id} has been updated")))
          }
        })
}





/* Delete */
def deleteFrontElem(id: Int, elem_id: Int) = Action { implicit request =>
  ProcElemDAO.delete(id) match {
        case 0 =>  Ok(Json.toJson(Map("failure" -> "Entity has Not been deleted")))
        case x =>  Ok(Json.toJson(Map("success" -> s"Entity has been deleted (deleted $x row(s))")))
      }
}
def deleteSpace(id: Int, space_id: Int) = Action { implicit request =>
    BPSpaceDAO.delete(id) match {
        case 0 =>  Ok(Json.toJson(Map("failure" -> "Entity has Not been deleted")))
        case x =>  Ok(Json.toJson(Map("success" -> s"Entity has been deleted (deleted $x row(s))")))
      }
}
def deleteSpaceElem(id: Int, spelem_id: Int) = Action { implicit request =>
    SpaceElemDAO.delete(id) match {
        case 0 =>  Ok(Json.toJson(Map("failure" -> "Entity has Not been deleted")))
        case x =>  Ok(Json.toJson(Map("success" -> s"Entity has been deleted (deleted $x row(s))")))
      }
}



/** 
 * Process credentials
 */
 // /bprocess/:BPid/stations

def station_index(id: Int) = Action { implicit request => 
   val result = models.DAO.BPStationDAO.findByBPId(id) //BPStationDAO.findByBPId(id)
   Ok(Json.toJson(result))
}
def all_stations() = Action { implicit request =>
  Ok(Json.toJson(BPStationDAO.getAll))

}
// /bprocess/:id/station/:station_id  
def show_station(id: Int, station_id: Int) = Action { implicit request =>
  Ok(Json.toJson(
    BPStationDAO.findById(station_id)))
}
// /bprocess/:id/station/:station_id/halt  
def halt_station(id: Int, station_id: Int) = Action { implicit request =>
  Ok(Json.toJson(
    BPStationDAO.haltUpdate(station_id)))
}


// /bprocess/:id/logs  
def logs_index(id: Int) = Action { implicit request => 
  Ok(Json.toJson(BPLoggerDAO.findByBPId(id)))
}


  /**
   * Input calls
   */
  /**
   * Halt
   */
}
