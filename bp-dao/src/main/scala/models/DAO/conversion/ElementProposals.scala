package models.DAO.conversion


import main.scala.bprocesses.refs._
import main.scala.bprocesses._
import models.DAO._
import models.DAO.reflect._
import main.scala.bprocesses.refs.UnitRefs._
import main.scala.simple_parts.process.Units._
/**
 * Any kind of
 * process elements
 **/
object ElementProposals {
  
def dropRefElements() = {
      // PH
      RefDAO.deleteByTitle("Placeholder")
      // CF
      RefDAO.deleteByTitle("Confirmation")
      // CN
      RefDAO.deleteByTitle("Container")
}


def addRefElements() = {
/**
*******************************
******************************** * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
*******************************
**/    	
// PH
val ph_ref = RefDAO.pull_object(Ref(None, 
	"Placeholder", "", 
	Some("Element used for fill the hole betwen other elements. When it's launch, nothing happens and it will be skipped.")))


val ph_el = ProcElemReflectionDAO.pull_object(UnitElementRef(id = None,
                        reflection = ph_ref,
                        title = "Placeholder",
                        desc = "",
                        b_type = "block",
                        type_title = "placeholder",
                        space_own = None,
                        order = 1,
created_at = None,
updated_at = None) )

val ph_topo = makeTopolog(ref = ph_ref, 
	front_elem_id = Some(ph_el), 
	space_elem_id = None)

val ph_el_state = BPStateRefDAO.pull_object(BPStateRef(
  None, 
  reflection = ph_ref,
  title = "invoked", 
  neutral = "uninvoked",
  process_state = false,
  on= false,
  on_rate = 0,
  front_elem_id = Some(ph_el),
  space_elem_id = None,
  space_id = None,
    middle = "invoking",
  middleable = true,
  created_at = Some(org.joda.time.DateTime.now),
  updated_at = Some(org.joda.time.DateTime.now)
  ))

/*
reflection, 
title, 
neutral,
process_state,
on,
on_rate,
front_elem_id,
space_elem_id,
space_elem_id,
created_at, updated_at, 
lang,
middle,
middleable*/



SwitcherRefDAO.pull_object(UnitSwitcherRef(None,
reflection = ph_ref,
switch_type = "n", 
priority = 2,                            
state_ref = ph_el_state,
fn = "inc",
target = "step",
override_group = 0))





/**
*******************************
******************************** * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
*******************************
*/
// CF
val cf_ref = RefDAO.pull_object(Ref(None, 
	"Confirmation", "", 
	Some("Element used for confirming action. When it's launch, and it's not confirmed, process will be paused until confirmed reaction was executed.")))


val cf_el_id = ProcElemReflectionDAO.pull_object(UnitElementRef(None,
                        reflection = cf_ref,
                        title = "Confirmation",
                        desc = "",
                        b_type = "block",
                        type_title = "confirm",
                        space_own = None,
                        order = 1) )
val cf_elem_topo = makeTopolog(ref = cf_ref, 
	front_elem_id = Some(cf_el_id), 
	space_elem_id = None)

val cf_el_state_id_inv = BPStateRefDAO.pull_object(BPStateRef(
  None, 
  reflection = cf_ref,
  title = "invoked", 
    middle = "invoking",
  middleable = true,
  neutral=  "uninvoked",
  process_state= false,
  on= false,
  on_rate = 0,
  front_elem_id = Some(cf_el_id),
  space_elem_id = None,
  space_id = None))
val cf_el_state_id_cf = BPStateRefDAO.pull_object(BPStateRef(
  None, 
  reflection = cf_ref,
  title = "confirmed", 
  middle = "confirming",
  middleable = true,
  neutral=  "unconfirmed",
  process_state= false,
  on= false,
  on_rate = 0,
  front_elem_id = Some(cf_el_id),
  space_elem_id = None,
  space_id = None))

val first_sw = SwitcherRefDAO.pull_object(UnitSwitcherRef(None,
reflection = cf_ref,
switch_type = "p", 
priority= 2,                            
state_ref = cf_el_state_id_inv,
fn = "paused",
target = "process",
override_group = 1))
val second_sw = SwitcherRefDAO.pull_object(UnitSwitcherRef(None,
reflection = cf_ref,
switch_type = "n", 
priority= 2,                            
state_ref = cf_el_state_id_cf,
fn = "inc",
target = "step",
override_group = 1))

val cf_reaction = ReactionRefDAO.pull_object(UnitReactionRef(
    None,
    reflection = cf_ref,
    autostart = false, 
    title = "Confirm",
    element = cf_elem_topo,
    from_state = None))


val cf_reaction_out = ReactionStateOutRefDAO.pull_object(UnitReactionStateOutRef(None,
  state_ref = cf_el_state_id_cf,
  reaction = cf_reaction,
  on = true,
  on_rate = 100
  ))


}








/**
*******************************
******************************** * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
*******************************
*/
// CN
 val cn_ref = RefDAO.pull_object(Ref(None, 
	"Container", "", 
	Some("Element used for storing other elements by decomposing hard action to easy one. May have containers too inside.")))


val cn_elem_id = ProcElemReflectionDAO.pull_object(UnitElementRef(None,
                        reflection = cn_ref,
                        title = "Container",
                        desc = "",
                        b_type = "brick",
                        type_title = "container_brick",
                        space_own = None,
                        order = 1) )

makeTopolog(ref = cn_ref, 
	front_elem_id = Some(cn_elem_id), 
	space_elem_id = None)

val cn_el_state_id_inv = BPStateRefDAO.pull_object(BPStateRef(
  None, 
  reflection = cn_ref,
  title = "invoked", 
    middle = "invoking",
  middleable = true,
  neutral=  "uninvoked",
  process_state= false,
  on= false,
  on_rate = 0,
  front_elem_id = Some(cn_elem_id),
  space_elem_id = None,
  space_id = None))


val cn_first_sw = SwitcherRefDAO.pull_object(UnitSwitcherRef(None,
reflection = cn_ref,
switch_type = "inn", 
priority= 2,                            
state_ref = cn_el_state_id_inv,
fn = "inn",
target = "space",
override_group = 0))

val cn_space = SpaceReflectionDAO.pull_object(UnitSpaceRef(
   None, 
   reflection = cn_ref,
    index = 1, 
    container = true, 
    subbrick = false, 
    brick_front = Some(cn_elem_id),
    brick_nested = None, 
    nestingLevel = 1
 ))
val cn_space_state = BPStateRefDAO.pull_object(BPStateRef(
  None, 
  reflection = cn_ref,
  title = "lap", 
  neutral=  "",
  process_state= false,
  on= false,
  on_rate = 0,
  front_elem_id = None,
  space_elem_id = None,
  space_id = Some(cn_space)))
val cn_space_sw = SwitcherRefDAO.pull_object(UnitSwitcherRef(None,
reflection = cn_ref,
switch_type = "outn", 
priority= 2,                            
state_ref = cn_space_state,
fn = "outn",
target = "space",
override_group = 0))



/*
SpaceElementReflectionDAO.pull_object(UnitSpaceElementRef(
   id: Option[Int],
    reflection: Int,
                        title:String,
                        desc:String,
                        b_type:String,
                        type_title:String,
                        space_own:Option[Int],
                        ref_space_owned: Int,
                        space_role:Option[String],
                        order:Int,
created_at:Option[org.joda.time.DateTime] = None,
updated_at:Option[org.joda.time.DateTime] = None
 ))*/









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

}