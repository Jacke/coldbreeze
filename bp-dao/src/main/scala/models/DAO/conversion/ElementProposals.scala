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
	"Element used for fill the hole betwen other elements. When it's launch, nothing happens and it will be skipped."))


val ph_el = ProcElemReflectionDAO.pull_object(UnitElementRef(id = None,
                        reflection = ph_ref,
                        title = "PLACEHOLDER",
                        desc = "",
                        b_type = "block",
                        type_title = "placeholder",
                        space_own = None,
                        order = 1,
created_at = None,
updated_at = None) )

val ph_topo = makeTopolog(ref = ph_ref, 
	front_elem_id = ph_el, 
	space_elem_id = None)

val ph_el_state = BPStateRefDAO.pull_object(BPStateRef(
  None, 
  reflection = ph_el,
  title = "invoked", 
  opposite = "",
  process_state = false,
  on= false,
  on_rate = 0,
  front_elem_id = ph_el,
  space_elem_id = None,
  space_id = None))


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
**/
// CF
val cf_ref = RefDAO.pull_object(Ref(None, 
	"Confirmation", "", 
	"Element used for confirming action. When it's launch, and it's not confirmed, process will be paused until confirmed reaction was executed."))


val cf_el_id = ProcElemReflectionDAO.pull_object(UnitElementRef(id: Option[Int],
                        reflection: Int,
                        title:String,
                        desc:String,
                        b_type:String,
                        type_title:String,
                        space_own:Option[Int],
                        order:Int,
created_at:Option[org.joda.time.DateTime] = None,
updated_at:Option[org.joda.time.DateTime] = None) )
makeTopolog(ref = cf_ref, 
	front_elem_id = cf_el_id, 
	space_elem_id = None)
val cf_el_state_id = BPStateRefDAO.pull_object(BPStateRef(
  var id:Option[Int], 
  reflection:   Int,
  title:        String, 
  var opposite: String = "",
  process_state:Boolean = false,
  on:Boolean = false,
  on_rate: Int = 0,
  front_elem_id:Option[Int],
  space_elem_id:Option[Int],
  space_id: Option[Int],
  created_at:   Option[org.joda.time.DateTime] = None, 
  updated_at:   Option[org.joda.time.DateTime] = None, 
  lang:         String = "en"))
SwitcherRefDAO.pull_object(UnitSwitcherRef(id: Option[Int],
reflection: Int,
switch_type:String, 
priority: Int = 2,                            
state_ref:Int,
fn: String,
target: String,
override_group: Int = 0,
created_at:Option[org.joda.time.DateTime] = None,
updated_at:Option[org.joda.time.DateTime] = None))









/**
*******************************
******************************** * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
*******************************
**/
// CN
 val cn_ref = RefDAO.pull_object(Ref(None, 
	"Container", "", 
	"Element used for storing other elements by decomposing hard action to easy one. May have containers too inside."))


val cn_elem_id = ProcElemReflectionDAO.pull_object(UnitElementRef(id: Option[Int],
                        reflection: Int,
                        title:String,
                        desc:String,
                        b_type:String,
                        type_title:String,
                        space_own:Option[Int],
                        order:Int,
created_at:Option[org.joda.time.DateTime] = None,
updated_at:Option[org.joda.time.DateTime] = None) )

makeTopolog(ref = cn_ref, 
	front_elem_id = cn_elem_id, 
	space_elem_id = None)

BPStateRefDAO.pull_object(BPStateRef(
  var id:Option[Int], 
  reflection:   Int,
  title:        String, 
  var opposite: String = "",
  process_state:Boolean = false,
  on:Boolean = false,
  on_rate: Int = 0,
  front_elem_id:Option[Int],
  space_elem_id:Option[Int],
  space_id: Option[Int],
  created_at:   Option[org.joda.time.DateTime] = None, 
  updated_at:   Option[org.joda.time.DateTime] = None, 
  lang:         String = "en"))
SwitcherRefDAO.pull_object(UnitSwitcherRef(id: Option[Int],
reflection: Int,
switch_type:String, 
priority: Int = 2,                            
state_ref:Int,
fn: String,
target: String,
override_group: Int = 0,
created_at:Option[org.joda.time.DateTime] = None,
updated_at:Option[org.joda.time.DateTime] = None))

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
SpaceReflectionDAO.pull_object(UnitSpaceRef(
   id: Option[Int], 
   reflection: Int,
    index:Int, 
    container:Boolean, 
    subbrick:Boolean, 
    brick_front:Option[Int]=None,
    brick_nested:Option[Int]=None, 
    nestingLevel: Int = 1,
    created_at:Option[org.joda.time.DateTime] = None,
    updated_at:Option[org.joda.time.DateTime] = None
 ))


BPStateRefDAO.pull_object(BPStateRef(
  var id:Option[Int], 
  reflection:   Int,
  title:        String, 
  var opposite: String = "",
  process_state:Boolean = false,
  on:Boolean = false,
  on_rate: Int = 0,
  front_elem_id:Option[Int],
  space_elem_id:Option[Int],
  space_id: Option[Int],
  created_at:   Option[org.joda.time.DateTime] = None, 
  updated_at:   Option[org.joda.time.DateTime] = None, 
  lang:         String = "en"))


SwitcherRefDAO.pull_object(case class UnitSwitcherRef(id: Option[Int],
reflection: Int,
switch_type:String, 
priority: Int = 2,                            
state_ref:Int,
fn: String,
target: String,
override_group: Int = 0,
created_at:Option[org.joda.time.DateTime] = None,
updated_at:Option[org.joda.time.DateTime] = None))



ReactionRefDAO.pull_object(UnitReactionRef(
    id: Option[Int],
    reflection: Int,
    autostart:Boolean, 
    element: Int,
    from_state: Option[Int],                            
    created_at:Option[org.joda.time.DateTime] = None,
    updated_at:Option[org.joda.time.DateTime] = None))
ReactionStateOutRefDAO.pull_object(UnitReactionStateOutRef(id: Option[Int],
  state_ref: Int,
  reaction: Int,
  on:Boolean = false,
  on_rate: Int = 0,
  created_at:Option[org.joda.time.DateTime] = None,
updated_at:Option[org.joda.time.DateTime] = None
  ))
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

}