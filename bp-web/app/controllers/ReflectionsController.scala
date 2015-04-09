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
import main.scala.bprocesses.BPSession 
 
import models.DAO.reflect._  
import main.scala.bprocesses.refs.UnitRefs._
import main.scala.bprocesses.refs.{BPStateRef} 
import models.DAO.conversion._

class ReflectionsController(override implicit val env: RuntimeEnvironment[DemoUser]) extends Controller with securesocial.core.SecureSocial[DemoUser] {
  // case classes
/*
Ref
UnitElementRef
UnitSpaceRef
UnitSpaceElementRef
BPStateRef
UnitSwitcherRef
*/
case class RefContainer(ref: Ref, 
unitelement:List[UnitElementRef],
unitspace:List[UnitSpaceRef],
unitspaceelement:List[UnitSpaceElementRef],
topology: List[RefElemTopology],
bpstate:List[BPStateRef],
unitswitcher:List[UnitSwitcherRef],
reactions: List[UnitReactionRef],
reaction_state_outs: List[UnitReactionStateOutRef],
reaction_cn: List[ReactionContainer]
	)

case class ReactionContainer(reaction: UnitReactionRef,
reaction_state_outs: List[UnitReactionStateOutRef])

implicit val RefReads = Json.reads[Ref]
implicit val RefWrites = Json.format[Ref]
implicit val UnitElementRefReads = Json.reads[UnitElementRef]
implicit val UnitElementRefWrites = Json.format[UnitElementRef]
implicit val UnitSpaceRefReads = Json.reads[UnitSpaceRef]
implicit val UnitSpaceRefWrites = Json.format[UnitSpaceRef]
implicit val UnitSpaceElementRefReads = Json.reads[UnitSpaceElementRef]
implicit val UnitSpaceElementRefWrites = Json.format[UnitSpaceElementRef]
implicit val BPStateRefReads = Json.reads[BPStateRef]
implicit val BPStateRefWrites = Json.format[BPStateRef]
implicit val UnitSwitcherRefReads = Json.reads[UnitSwitcherRef]
implicit val UnitSwitcherRefWrites = Json.format[UnitSwitcherRef]
implicit val RefElemTopologyReads = Json.reads[RefElemTopology]
implicit val RefElemTopologyWrites = Json.format[RefElemTopology]

implicit val UnitReactionRefReads = Json.reads[UnitReactionRef]
implicit val UnitReactionRefWrites = Json.format[UnitReactionRef]
implicit val UnitReactionStateOutRefReads = Json.reads[UnitReactionStateOutRef]
implicit val UnitReactionStateOutRefWrites = Json.format[UnitReactionStateOutRef]



implicit val ReactionContainerReads = Json.reads[ReactionContainer]
implicit val ReactionContainerWrites = Json.format[ReactionContainer]

implicit val RefContainerReads = Json.reads[RefContainer]
implicit val RefContainerWrites = Json.format[RefContainer]

def index() = SecuredAction { implicit request => 
	val refs = RefDAO.getAll
  val refs_collected = refs.map { ref =>
      val reactions = ReactionRefDAO.findByRef(ref.id.get)
      val reaction_outs = ReactionStateOutRefDAO.findByReactionRefs(reactions.map(_.id.get))
      RefContainer(ref,
        ProcElemReflectionDAO.findByRef(ref.id.get),
        SpaceReflectionDAO.findByRef(ref.id.get),
        SpaceElementReflectionDAO.findByRef(ref.id.get),
        ReflectElemTopologDAO.findByRef(ref.id.get),
        BPStateRefDAO.findByRef(ref.id.get),
        SwitcherRefDAO.findByRef(ref.id.get),
        reactions,
      reaction_outs,
      reactions.map( re => ReactionContainer(re, reaction_outs.filter(out => out.reaction == re.id.get )))
)

  }

  Ok(Json.toJson(refs_collected))
}

/***
 * Create
 */
def create() = SecuredAction(BodyParsers.parse.json) { implicit request =>
  request.body.validate[Ref].map{ 
    case entity => RefDAO.pull_object(entity) match {
            case -1 =>  Ok(Json.toJson(Map("failure" ->  s"Could not create ref ${entity.title}")))
            case id =>  { 
              Ok(Json.toJson(Map("success" ->  id)))
            }
          }
    }.recoverTotal{
      e => BadRequest("formWithErrors")
    }
}


def elem_create(id: Int) = SecuredAction(BodyParsers.parse.json) { implicit request =>


  request.body.validate[UnitElementRef].map{ 
    case entity => ProcElemReflectionDAO.pull_object(entity.copy(order = ProcElemReflectionDAO.lastOrderOfRef(entity.reflection))) match {
            case -1 =>  Ok(Json.toJson(Map("failure" ->  s"Could not create front element ${entity.title}")))
            case id =>  { 
              println(id)
              makeTopolog(entity.reflection, Some(id), None)
            
              AutoTracer.defaultStatesForRefElem(entity.reflection, front_elem_id = Some(id), space_elem_id = None)
              Ok(Json.toJson(Map("success" ->  id)))
            }
          }
    }.recoverTotal{
      e => BadRequest("formWithErrors")
    }
}



def space_create(id: Int) = SecuredAction(BodyParsers.parse.json) { implicit request =>
  println(request.body.validate[UnitSpaceRef])
  println
  val placeResult = request.body.validate[UnitSpaceRef]  
   request.body.validate[UnitSpaceRef].map{ 
    case entity => SpaceReflectionDAO.pull_object(entity.copy(index = SpaceReflectionDAO.lastIndexOfSpace(entity.reflection))) match {
            case -1 =>  Ok(Json.toJson(Map("failure" ->  s"Could not create space ${entity.index}")))
            case id =>  { 
              
                AutoTracer.defaultStatesForSpace(ref_id = entity.reflection, space_id = Some(id))
              Ok(Json.toJson(Map("success" ->  id)))
            }
          }
    }.recoverTotal{
      e => BadRequest("formWithErrors")
    }
}
def spaceelems_create(id: Int) = SecuredAction(BodyParsers.parse.json) { implicit request =>

  val placeResult = request.body.validate[UnitSpaceElementRef]  
  request.body.validate[UnitSpaceElementRef].map{ 
    case entity => println(entity)
  }
  request.body.validate[UnitSpaceElementRef].map{ 
    case entity => SpaceElementReflectionDAO.pull_object(entity.copy(
                                                        order = SpaceElementReflectionDAO.lastOrderOfSpace(entity.reflection, entity.ref_space_owned))) match {
            case -1 =>  Ok(Json.toJson(Map("failure" ->  s"Could not create space element ${entity.title}")))
            case id =>  { 
              makeTopolog(entity.reflection, None, Some(id))
              AutoTracer.defaultStatesForRefElem(entity.reflection, front_elem_id = None, space_elem_id = Some(id))
                                                
              
              Ok(Json.toJson(Map("success" ->  id)))

            }
          }
    }.recoverTotal{
      e => BadRequest("formWithErrors")
    }
}



def state_create(id: Int) = SecuredAction(BodyParsers.parse.json) { implicit request =>
  request.body.validate[BPStateRef].map{ 
    case entity => BPStateRefDAO.pull_object(entity) match {
            case -1 =>  Ok(Json.toJson(Map("failure" ->  s"Could not create ref ${entity.title}")))
            case id =>  { 
              Ok(Json.toJson(Map("success" ->  id)))
            }
          }
    }.recoverTotal{
      e => BadRequest("formWithErrors")
    }
}
def switche_create(id: Int) = SecuredAction(BodyParsers.parse.json) { implicit request =>
  request.body.validate[UnitSwitcherRef].map{ 
    case entity => SwitcherRefDAO.pull_object(entity) match {
            case -1 =>  Ok(Json.toJson(Map("failure" ->  s"Could not create ref ${entity.switch_type}")))
            case id =>  { 
              Ok(Json.toJson(Map("success" ->  id)))
            }
          }
    }.recoverTotal{
      e => BadRequest("formWithErrors")
    }
}
def reaction_create(id: Int) = SecuredAction(BodyParsers.parse.json) { implicit request =>
  request.body.validate[ReactionContainer].map{ 
    case entity => ReactionRefDAO.pull_object(entity.reaction) match {
            case -1 =>  Ok(Json.toJson(Map("failure" ->  s"Could not create ref ${entity.reaction.element}")))
            case id =>  { 
              entity.reaction_state_outs.foreach(out => ReactionStateOutRefDAO.pull_object(out)) 
              Ok(Json.toJson(Map("success" ->  id)))
            }
          }
    }.recoverTotal{
      e => BadRequest("formWithErrors")
    }
}


/***
 * Update
 */
def update(id: Int) = SecuredAction(BodyParsers.parse.json) { implicit request =>
  request.body.validate[Ref].map{ 
    case entity => RefDAO.update(id,entity) match {
            case -1 =>  Ok(Json.toJson(Map("failure" ->  s"Could not update ref ${entity.title}")))
            case _ =>  Ok(Json.toJson(entity.id))
          }
    }.recoverTotal{
      e => BadRequest("formWithErrors")
    }
}
def elem_update(elem_id: Int) = SecuredAction(BodyParsers.parse.json) { implicit request =>
  request.body.validate[UnitElementRef].map{ 
    case entity => ProcElemReflectionDAO.update(elem_id,entity) match {
            case false =>  Ok(Json.toJson(Map("failure" ->  s"Could not update front element ${entity.title}")))
            case _ =>  Ok(Json.toJson(entity.id))
          }
    }.recoverTotal{
      e => BadRequest("formWithErrors")
    }
}

def space_update(space_id: Int) = SecuredAction(BodyParsers.parse.json) { implicit request =>
  request.body.validate[UnitSpaceRef].map{ 
    case entity => SpaceReflectionDAO.update(space_id,entity) match {
            case false =>  Ok(Json.toJson(Map("failure" ->  s"Could not update space ${entity.id}")))
            case _ =>  Ok(Json.toJson(entity.id))
          }
    }.recoverTotal{
      e => BadRequest("formWithErrors")
    }
}

def spaceelems_update(spelem_id: Int) = SecuredAction(BodyParsers.parse.json) { implicit request =>
  request.body.validate[UnitSpaceElementRef].map{ 
    case entity => SpaceElementReflectionDAO.update(spelem_id,entity) match {
            case false =>  Ok(Json.toJson(Map("failure" ->  s"Could not update space element ${entity.title}")))
            case _ =>  Ok(Json.toJson(entity.id))
          }
    }.recoverTotal{
      e => BadRequest("formWithErrors")
    }

}

def moveUpFrontElem(bpId: Int, elem_id: Int) = SecuredAction(BodyParsers.parse.json) { implicit request =>
  ProcElemReflectionDAO.moveUp(bpId, elem_id)
  Ok(Json.toJson("moved"))
}
def moveDownFrontElem(bpId: Int, elem_id: Int) = SecuredAction(BodyParsers.parse.json) { implicit request =>
  ProcElemReflectionDAO.moveDown(bpId, elem_id)
  Ok(Json.toJson("moved"))
}
def moveUpSpaceElem(id: Int, spelem_id: Int, space_id: Int) = SecuredAction(BodyParsers.parse.json) { implicit request =>
    SpaceElementReflectionDAO.moveUp(id, spelem_id, space_id)
  Ok(Json.toJson("moved"))
}
def moveDownSpaceElem(id: Int, spelem_id: Int, space_id: Int) = SecuredAction(BodyParsers.parse.json) { implicit request =>
    SpaceElementReflectionDAO.moveDown(id, spelem_id, space_id)
  Ok(Json.toJson("moved"))
}



// Misc
def state_update(state_id: Int) = SecuredAction(BodyParsers.parse.json) { implicit request =>
  request.body.validate[BPStateRef].map{ 
    case entity => BPStateRefDAO.update(state_id,entity) match {
            case -1 =>  Ok(Json.toJson(Map("failure" ->  s"Could not update space element ${entity.title}")))
            case _ =>  Ok(Json.toJson(entity.id))
          }
    }.recoverTotal{
      e => BadRequest("formWithErrors")
    }

}


def switche_update(switch_id: Int) = SecuredAction(BodyParsers.parse.json) { implicit request =>
  request.body.validate[UnitSwitcherRef].map{ 
    case entity => SwitcherRefDAO.update(switch_id,entity) match {
            case -1 =>  Ok(Json.toJson(Map("failure" ->  s"Could not update  ${entity.switch_type}")))
            case _ =>  Ok(Json.toJson(entity.id))
          }
    }.recoverTotal{
      e => BadRequest("formWithErrors")
    }
}


def reaction_update(reaction_id: Int) = SecuredAction(BodyParsers.parse.json) { implicit request =>
  request.body.validate[ReactionContainer].map{ 
    case entity => ReactionRefDAO.update(reaction_id,entity.reaction) match { // ReactionRefDAO ReactionStateOutRefDAO

            case -1 =>  Ok(Json.toJson(Map("failure" ->  s"Could not update reaction ${entity.reaction.element}")))
            case _ =>  { val out_ids = ReactionStateOutRefDAO.findByReactionRef(reaction_id).map(_.id.get)
                         out_ids.foreach { id => 
                            println(id)
                            entity.reaction_state_outs.find(_.id == id) match {
                              case Some(state_out) => ReactionStateOutRefDAO.update(id, state_out)
                            }
                          }
                             Ok(Json.toJson(entity.reaction.id)) 
                        }
          }
    }.recoverTotal{
      e => BadRequest("formWithErrors")
    }

}
  



/***
 * Delete
 */
def delete(id: Int) = SecuredAction { implicit request =>
    RefDAO.delete(id) match {
        case 0 =>  Ok(Json.toJson(Map("failure" -> "Entity has Not been deleted")))
        case x =>  Ok(Json.toJson(Map("success" -> s"Entity has been deleted (deleted $x row(s))")))
      }
}
def elem_delete(elem_id: Int) = SecuredAction { implicit request =>
    ProcElemReflectionDAO.delete(elem_id) match {
        case 0 =>  Ok(Json.toJson(Map("failure" -> "Entity has Not been deleted")))
        case x =>  Ok(Json.toJson(Map("success" -> s"Entity has been deleted (deleted $x row(s))")))
      }
}

def space_delete(space_id: Int) = SecuredAction { implicit request =>
    SpaceReflectionDAO.delete(space_id) match {
        case 0 =>  Ok(Json.toJson(Map("failure" -> "Entity has Not been deleted")))
        case x =>  Ok(Json.toJson(Map("success" -> s"Entity has been deleted (deleted $x row(s))")))
      }
}

def spaceelems_delete(spelem_id: Int) = SecuredAction { implicit request =>
    SpaceElementReflectionDAO.delete(spelem_id) match {
        case 0 =>  Ok(Json.toJson(Map("failure" -> "Entity has Not been deleted")))
        case x =>  Ok(Json.toJson(Map("success" -> s"Entity has been deleted (deleted $x row(s))")))
      }
}

def state_delete(state_id: Int) = SecuredAction { implicit request =>
    BPStateRefDAO.delete(state_id) match {
        case 0 =>  Ok(Json.toJson(Map("failure" -> "Entity has Not been deleted")))
        case x =>  Ok(Json.toJson(Map("success" -> s"Entity has been deleted (deleted $x row(s))")))
      }
}


def switche_delete(switch_id: Int) = SecuredAction { implicit request =>
    SwitcherRefDAO.delete(switch_id) match {
        case 0 =>  Ok(Json.toJson(Map("failure" -> "Entity has Not been deleted")))
        case x =>  Ok(Json.toJson(Map("success" -> s"Entity has been deleted (deleted $x row(s))")))
      }
}

def reaction_delete(reaction_id: Int) = SecuredAction { implicit request =>
    ReactionRefDAO.delete(reaction_id) match {
        case 0 =>  Ok(Json.toJson(Map("failure" -> "Entity has Not been deleted")))
        case x =>  Ok(Json.toJson(Map("success" -> s"Entity has been deleted (deleted $x row(s))")))
      }
}



private def makeTopolog(ref: Int, 
	front_elem_id: Option[Int], 
	space_elem_id: Option[Int]):Int = {
    ReflectElemTopologDAO.pull_object(RefElemTopology(None, 
  ref, 
  front_elem_id, 
  space_elem_id, 
  "", 
  None))
}
private def autoTracing() = {
	// TODO: State, switchers
}

}

