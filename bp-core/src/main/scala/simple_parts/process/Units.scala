package main.scala.simple_parts.process

import main.scala.bprocesses._
import main.scala.utils._
import com.github.nscala_time.time.Imports._
import scala.collection.mutable.ListBuffer  
import us.ority.min.actions._


object Units {
 /*

 case class UnitElement(override val id: Option[Int],
                        override val title:String,
                        desc:String,
                        business:Int,
                        bprocess:Int,
                        b_type:String,
                        type_title:String,
                        space_own:Option[Int],
                        override val order:Int,
created_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now),
updated_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now)) extends ProcElems {


  def invoke {
    println("invoke confirm")
   
  }

}
  
case class UnitSpaceElement(
                        override val id: Option[Int],
                        override val title:String,
                        desc:String,
                        business:Int,
                        bprocess:Int,
                        b_type:String,
                        type_title:String,
                        space_own:Option[Int],
                        space_owned: Int,
                        space_role:Option[String],
                        override val order:Int,
created_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now),
updated_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now)
) extends ProcElems {


  def invoke {
    println("invoke confirm")
   
  }

}

*/
  
 case class UnitElement(id: Option[Int],
                        title:String,
                        desc:String,
                        business:Int,
                        bprocess:Int,
                        b_type:String,
                        type_title:String,
                        space_own:Option[Int],
                        order:Int,
created_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now),
updated_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now)) 
   
 case class UnitSpace(
  id: Option[Int], 
                      bprocess: Int, 
                      index:Int, 
                      container:Boolean, 
                      subbrick:Boolean, 
                      brick_front:Option[Int]=None,
                      brick_nested:Option[Int]=None, 
                      nestingLevel: Int = 1,
created_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now),
updated_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now)
 )
   
 case class UnitMarker()
 case class UnitSwitcher(id: Option[Int],
bprocess: Int,
switch_type:String, 
priority: Int = 2,                            
state_ref:Int,
session_state_ref: Option[Int] = None,                            
fn: String,
target: String,
override_group: Int = 0,
created_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now),
updated_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now)) {
}
  
case class UnitSpaceElement(
   id: Option[Int],
                        title:String,
                        desc:String,
                        business:Int,
                        bprocess:Int,
                        b_type:String,
                        type_title:String,
                        space_own:Option[Int],
                        ref_space_owned: Int,
                        space_role:Option[String],
                        order:Int,
created_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now),
updated_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now)
)
   
 case class UnitTransition()
 case class UnitModelOps()
 case class UnitReaction(id: Option[Int],
bprocess:Int,
autostart:Boolean, 
element: Int,
from_state: Option[Int], 
title: String,                           
created_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now),
updated_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now)) {


    var middlewares:ListBuffer[Middleware]                   = ListBuffer() 
    var reaction_state_ins:ListBuffer[UnitReactionStateIn]   = ListBuffer() 
    var reaction_state_outs:ListBuffer[UnitReactionStateOut] = ListBuffer() 


    var reaction_data_ins:ListBuffer[UnitReactionDataIn]     = ListBuffer() 
    var reaction_data_outs:ListBuffer[UnitReactionDataOut]   = ListBuffer() 

    def execute(process: BProcess) = {
       if (middlewares.length < 1) {
         bprocesses.ReactionExecutor.execute(process, this)
       } else {
         bprocesses.ReactionExecutor.executeWithMiddleware(process, this)
       }
    }
 } 



case class ElemTopology(id: Option[Int], 
  process: Int, 
  front_elem_id: Option[Int], 
  space_elem_id: Option[Int], 
  hash: String = "", 
  created_at: Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now),
  updated_at: Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now),
  space_id: Option[Int] = None)




 case class UnitReactionStateIn(id: Option[Int],
  state_ref: Int,
  reaction: Int,
  on:Boolean = false,
  on_rate: Int = 0,
  created_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now),
  updated_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now)
) 
 case class UnitReactionStateOut(id: Option[Int],
  state_ref: Int,
  reaction: Int,
  on:Boolean = false,
  on_rate: Int = 0,
  created_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now),
  updated_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now)
)

 case class UnitReactionDataIn(id: Option[Int],
  data_ref: String,
  reaction: Int,
  data_type:String,
  created_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now),
  updated_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now)
)
 case class UnitReactionDataOut(id: Option[Int],
  data_ref: String,
  reaction: Int,
  data_type:String,
  created_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now),
  updated_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now)
) 


/*********
 * Session Units
 */

case class SessionUnitSwitcher(id: Option[Int],
    bprocess: Int,
    session: Int,
    switch_type:String, 
    priority: Int = 2,                            
    state_ref:Int,
    session_state_ref: Option[Int] = None,                            
    fn: String,
    target: String,
    override_group: Int = 0,
    created_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now),
    updated_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now)) {
}
 
 case class SessionUnitReaction(id: Option[Int],
    bprocess:Int,
    session: Int,
    autostart:Boolean, 
    element: Int,
    from_state: Option[Int], 
    title: String,                           
    created_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now),
    updated_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now)) {

    var reaction_state_outs:ListBuffer[UnitReactionStateOut] = ListBuffer() 
    def execute(process: BProcess) {
       //bprocesses.ReactionExecutor.execute(process, this)
    }
 } 
case class SessionUnitReactionStateOut(id: Option[Int],
  state_ref: Int,
  reaction: Int,
  on:Boolean = false,
  on_rate: Int = 0,
  created_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now),
  updated_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now)
  )


case class SessionElemTopology(id: Option[Int], 
    process: Int, 
    session: Int,
    front_elem_id: Option[Int], 
    space_elem_id: Option[Int], 
    hash: String = "", 
    created_at: Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now),
    updated_at: Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now),
    space_id: Option[Int] = None)

}