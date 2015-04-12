package main.scala.simple_parts.process

import main.scala.bprocesses._
import main.scala.utils._
import com.github.nscala_time.time.Imports._
import scala.collection.mutable.ListBuffer  

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
created_at:Option[org.joda.time.DateTime] = None,
updated_at:Option[org.joda.time.DateTime] = None) extends ProcElems {


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
created_at:Option[org.joda.time.DateTime] = None,
updated_at:Option[org.joda.time.DateTime] = None
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
created_at:Option[org.joda.time.DateTime] = None,
updated_at:Option[org.joda.time.DateTime] = None) 
   
 case class UnitSpace(
  id: Option[Int], 
                      bprocess: Int, 
                      index:Int, 
                      container:Boolean, 
                      subbrick:Boolean, 
                      brick_front:Option[Int]=None,
                      brick_nested:Option[Int]=None, 
                      nestingLevel: Int = 1,
created_at:Option[org.joda.time.DateTime] = None,
updated_at:Option[org.joda.time.DateTime] = None
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
created_at:Option[org.joda.time.DateTime] = None,
updated_at:Option[org.joda.time.DateTime] = None) {

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
created_at:Option[org.joda.time.DateTime] = None,
updated_at:Option[org.joda.time.DateTime] = None
)
   
 case class UnitTransition()
 case class UnitModelOps()
 case class UnitReaction(id: Option[Int],
bprocess:Int,
autostart:Boolean, 
element: Int,
from_state: Option[Int],                            
created_at:Option[org.joda.time.DateTime] = None,
updated_at:Option[org.joda.time.DateTime] = None) {
    var reaction_state_outs:ListBuffer[UnitReactionStateOut] = ListBuffer() 
    
    def execute(bp: BProcess) {
      /**
       * TODO: Add logic and expressions execution
       */
      // find element by topolog
      val element = 
      reaction_state_outs.foreach { out => 
        element.session_states.find(st => st.id.getOrElse(0) == out.state_ref) match {
          case Some(state) => {
            // update state with
            state.on = out.on
            state.on_rate = out.on_rate
          }
        }
      }
    }
 } 

 case class UnitReactionStateOut(id: Option[Int],
  state_ref: Int,
  reaction: Int,
  on:Boolean = false,
  on_rate: Int = 0,
  created_at:Option[org.joda.time.DateTime] = None,
updated_at:Option[org.joda.time.DateTime] = None
  )
  
}