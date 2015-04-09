package main.scala.bprocesses

import main.scala.bprocesses.{BPStationState, BPStationLogger}
import com.github.nscala_time.time.Imports._
import scala.collection.mutable.ListBuffer  
import main.scala.simple_parts.process.Units._
  
case class BPSessionState(
  var id:Option[Int], 
  process:      Int,
  session:      Int,
  title:        String, 
  var opposite: String = "",
  process_state:Boolean = false,
  var on: Boolean = false,
  var on_rate: Int = 0,
  front_elem_id:Option[Int],
  space_elem_id:Option[Int],
  space_id:Option[Int],
  origin_state: Option[Int] = None,
  created_at:   Option[org.joda.time.DateTime] = None, 
  updated_at:   Option[org.joda.time.DateTime] = None, 
  lang:         String = "en") {
  
     /**
      * Opposition of state
      */
     if (opposite == "") { 
       lang match {
         case "en" => opposite = "un" + title // title = confirmed opposite = unconfirmed
         case _ => opposite = "--" + title    // title = confirmed opposite = --confirmed
       }
     }
  var switchers:ListBuffer[UnitSwitcher] = ListBuffer()
}

case class BPState(
  var id:Option[Int], 
  process:      Int,
  title:        String, 
  var opposite: String = "",
  process_state:Boolean = false,
  var on: Boolean = false,
  var on_rate: Int = 0,
  front_elem_id:Option[Int],
  space_elem_id:Option[Int],
  space_id:Option[Int],
  created_at:   Option[org.joda.time.DateTime] = None, 
  updated_at:   Option[org.joda.time.DateTime] = None, 
  lang:         String = "en") {
  
     /**
      * Opposition of state
      */
     if (opposite == "") { 
       lang match {
         case "en" => opposite = "un" + title // title = confirmed opposite = unconfirmed
         case _ => opposite = "--" + title    // title = confirmed opposite = --confirmed
       }
     }

  var switchers:ListBuffer[UnitSwitcher] = ListBuffer()     
  
}

case class SessionStateLog(var id: Option[Int], 
  state_id: Int, 
  on: Boolean, 
  on_rate: Int, 
  reason: String,
  created_at:   Option[org.joda.time.DateTime] = None, 
  updated_at:   Option[org.joda.time.DateTime] = None) 