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




def createFrontElem() = Action(BodyParsers.parse.json) { implicit request =>

  request.body.validate[UndefElement].map{ 
    case entity => ProcElemDAO.pull_object(entity) match {
            case -1 =>  Ok(Json.toJson(Map("failure" ->  s"Could not update front element ${entity.title}")))
            case _ =>  Ok(Json.toJson(_)))
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
def createSpace() = Action(BodyParsers.parse.json) { implicit request =>

  val placeResult = request.body.validate[BPSpaceDTO]  
   request.body.validate[BPSpaceDTO].map{ 
    case entity => BPSpaceDAO.pull_object(entity) match {
            case -1 =>  Ok(Json.toJson(Map("failure" ->  s"Could not update front element ${entity.index}")))
            case _ =>  Ok(Json.toJson(_))
          }
    }.recoverTotal{
      e => BadRequest("formWithErrors")
    }
}
def createSpaceElem() = Action(BodyParsers.parse.json) { implicit request =>

  val placeResult = request.body.validate[SpaceElementDTO]  
  println(placeResult)
  println(request.body)
    request.body.validate[SpaceElementDTO].map{ 
    case entity => println(entity)
  }
  request.body.validate[SpaceElementDTO].map{ 
    case entity => SpaceElemDAO.pull_object(entity) match {
            case -1 =>  Ok(Json.toJson(Map("failure" ->  s"Could not update front element ${entity.title}")))
            case _ =>  Ok(Json.toJson(_))
          }
    }.recoverTotal{
      e => BadRequest("formWithErrors")
    }
}



/* Update */
def updateFrontElem(bpId: Int, elem_id: Int) = Action(BodyParsers.parse.json) { implicit request =>
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
def updateSpace(id: Int, space_id: Int) = Action(BodyParsers.parse.json) { implicit request =>

  request.body.validate[BPSpaceDTO].map{ 
    case entity => BPSpaceDAO.update(space_id,entity) match {
            case -1 =>  Ok(Json.toJson(Map("failure" ->  s"Could not update front element ${entity.id}")))
            case _@x =>  Ok(Json.toJson(entity.id))
          }
    }.recoverTotal{
      e => BadRequest("formWithErrors")
    }
}
def updateSpaceElem(id: Int, spelem_id: Int) = Action(BodyParsers.parse.json) { implicit request =>
  request.body.validate[SpaceElementDTO].map{ 
    case entity => SpaceElemDAO.update(spelem_id,entity) match {
            case false =>  Ok(Json.toJson(Map("failure" ->  s"Could not update front element ${entity.title}")))
            case _ =>  Ok(Json.toJson(entity.id))
          }
    }.recoverTotal{
      e => BadRequest("formWithErrors")
    }

}





/* Delete */
def deleteFrontElem(bpID: Int, elem_id: Int) = Action { implicit request =>
  ProcElemDAO.delete(elem_id) match {
        case 0 =>  Ok(Json.toJson(Map("failure" -> "Entity has Not been deleted")))
        case x =>  Ok(Json.toJson(Map("success" -> s"Entity has been deleted (deleted $x row(s))")))
      }
}
def deleteSpace(bpID: Int, space_id: Int) = Action { implicit request =>
    println(bpID)
    BPSpaceDAO.delete(space_id) match {
        case 0 =>  Ok(Json.toJson(Map("failure" -> "Entity has Not been deleted")))
        case x =>  Ok(Json.toJson(Map("success" -> s"Entity has been deleted (deleted $x row(s))")))
      }
}
def deleteSpaceElem(bpID: Int, spelem_id: Int) = Action { implicit request =>
    println(bpID)
    SpaceElemDAO.delete(spelem_id) match {
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
   def invoke(bpID: Int)  = Action { implicit request =>
    service.RunnerWrapper.run(bpID) match {
      case Some(station_id) => Ok(Json.toJson(Map("success" -> station_id)))
      case _ => Ok(Json.toJson(Map("error" -> "Error output")))
    }
  }





  implicit val InputParamReads = Json.reads[InputParams]
  implicit val InputParamWrites = Json.format[InputParams]
  //implicit val ListInputParamReads = Json.reads[List[InputParams]]
  //implicit val ListInputParamWrites = Json.format[List[InputParams]]
  def invokeFrom(station_id: Int, bpID: Int) = Action(BodyParsers.parse.json) { implicit request =>
    val pmsResult = request.body.validate[List[InputParams]] 
    println(pmsResult)

    val genparams = pmsResult.map{ 
      case entity => entity.map (t => t.elem.get -> t.param) toMap
    }
    //.map (t => t.elem.get -> t.param) toMap
    /*
      Applying by this template ID     PARAM
      process.inputPmsApply(Map(30 -> "confirmed"))
    */ 
     
    service.RunnerWrapper.runFrom(station_id, bpID, genparams.get) match {
      case Some(station_id) => Ok(Json.toJson(Map("success" -> station_id)))
      case _ => Ok(Json.toJson(Map("error" -> "Error output")))
    }
  }




  def schemes(BPid: Int, station_id: Int) = Action { implicit request =>
    val logs = BPLoggerDAO.findByStation(station_id)
    val elem_logs_ids = logs.diff(List(logs.last)).filter(log => log.element.isDefined).map(_.element)
    val space_logs_ids = logs.diff(List(logs.last)).filter(log => log.space_elem.isDefined).map(_.space_elem)
    Ok(
      Json.toJson(
        Map("proc_elems" -> Json.toJson(ProcElemDAO.findByBPId(BPid).filter(elem => !elem_logs_ids.contains(elem.id)) ), 
            "space_elems" -> Json.toJson(SpaceElemDAO.findByBPId(BPid).filter(elem => !space_logs_ids.contains(elem.id)) ))
        )
      )
    
  }
  /**
   * Halt
   */
}

  case class InputParams(elem:Option[Int] = None,  
                         param:String, 
                         arguments:Option[List[String]] = None)