package main.scala.simple_parts.process

import main.scala.bprocesses._
import main.scala.utils._
import com.github.nscala_time.time.Imports._
  
object Units {
 /*
 case class UnitElement(
  val id: Int,
  title: String, 
  desc: String, 
  val values: Option[CompositeValues],
  val bprocess: BProcess,
  b_type: String, 
  type_title: String,
  var order: Int,
  val space_parent: Option[Space] = None,
  val space_role: Option[String] = None
  ) extends ProcElems {
    def invoke():Unit = {  } 
  }*/
  
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
   val index: Int, 
   val brick_owner: Brick, 
   val id: Option[Int] = None
 )
 case class UnitState()
 case class UnitMarker()
 case class UnitSwitcher()
 case class UnitTransition()
 case class UnitModelOps()
 case class UnitReaction()
  
  
}