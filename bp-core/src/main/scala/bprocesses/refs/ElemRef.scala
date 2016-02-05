package main.scala.bprocesses.refs

import main.scala.bprocesses._
import main.scala.utils._
import com.github.nscala_time.time.Imports._
  
import main.scala.simple_parts.process.Units._  
  
object UnitRefs {

  
 case class UnitElementRef(id: Option[Int],
                        reflection: Int,
                        title:String,
                        desc:String,
                        b_type:String,
                        type_title:String,
                        space_own:Option[Int],
                        order:Int,
created_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now),
updated_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now)) { 
   def reflect(business:Int, process: Int, space_own:Option[Int] = None):UnitElement = { 
       UnitElement(id, 
title, 
desc, 
business, 
process, 
b_type, 
type_title, 
space_own,
order,
created_at,
updated_at)  

   } 
}
   
 case class UnitSpaceRef(
   id: Option[Int], 
   reflection: Int,
    index:Int, 
    container:Boolean, 
    subbrick:Boolean, 
    brick_front:Option[Int]=None,
    brick_nested:Option[Int]=None, 
    nestingLevel: Int = 1,
    created_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now),
    updated_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now)
 ) { 
   def reflect(process: Int,
    brick_front:Option[Int]=None,
    brick_nested:Option[Int]=None):UnitSpace = { 
           UnitSpace(id, 
      process, 
      index,
      container, 
      subbrick, 
      brick_front,
      brick_nested, 
      nestingLevel,
      created_at,
      updated_at) 
} 

   
   
}
  
  
  
case class UnitSpaceElementRef(
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
created_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now),
updated_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now)
 ) { 
  def reflect(business:Int, process: Int,space_own:Option[Int], ref_space_owned: Int):UnitSpaceElement = { 
    UnitSpaceElement(id,
                        title,
                        desc,
                        business,
                        process,
                        b_type,
                        type_title,
                        space_own,
                        ref_space_owned,
                        space_role,
                        order,
created_at,
updated_at) 
  
} 

}
   
   
   
 case class UnitMarkerRef()


 object SwitcherConfiguration {
  val switcher_options: List[String] = List("n",
                                            "play",
                                            "p",
                                            "stp",
                                            "in",
                                            "out") 
  val switcher_cmd: List[String] = List("inc", "dec", "reset")
  val switcher_target: List[String] = List("step", "container_step", "space", "marker", "process")

  val switcher_desc: Map[String, String] = Map("n" -> "move on",
                                            "play" -> "resume process",
                                            "p" -> "pause process",
                                            "stp" -> "stop process",
                                            "inn" -> "move inside and continue",
                                            "outn" -> "move outside and continue")
}
   
 case class UnitSwitcherRef(id: Option[Int],
reflection: Int,
switch_type:String, 
priority: Int = 2,                            
state_ref:Int,
fn: String,
target: String,
override_group: Int = 0,
created_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now),
updated_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now)) { 

   def reflect(process: Int, state_ref: Int, session: Option[Int] = None):UnitSwitcher = {
     UnitSwitcher(None,
                  process,
                  switch_type, 
                  priority,                            
                  state_ref,
                  session_state_ref = session,  
                  fn,
                  target,           
                  override_group,               
                  created_at,
                  updated_at)
   }
}
   
   
 case class UnitTransitionRef()
 case class UnitModelOps()
 case class UnitReactionRef(
    id: Option[Int],
    reflection: Int,
    autostart:Boolean, 
    element: Int,
    from_state: Option[Int],  
    title: String,                          
    created_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now),
    updated_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now)) {

 def reflect(process: Int, element: Int, from_state: Option[Int]):UnitReaction = {
    UnitReaction(None,
                  process,
                  autostart,
                  element,
                  from_state,
                  title,
                  created_at,
                  updated_at)
  }
 }

 case class UnitReactionStateOutRef(id: Option[Int],
  state_ref: Int,
  reaction: Int,
  on:Boolean = false,
  on_rate: Int = 0,
  is_input:Boolean = false,
  created_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now),
  updated_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now)
  ) {
  def reflect(state_ref: Int, reaction: Int):UnitReactionStateOut = {
    UnitReactionStateOut(None,
                        state_ref,
                        reaction,
                        on,
                        on_rate,
                        is_input,
                        created_at,
                        updated_at)
  }
}



case class MiddlewareRef(
    id: Option[Long],
    ident: String,
    reflection: Int,
    reaction: Int,
    created_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now),
      updated_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now)    
  )
  
case class StrategyRef(val id: Option[Long],
        ident: String,
        reflection: Int,
        middleware: Long,
        created_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now),
        updated_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now)) {
}




  
}

