package main.scala.bprocesses

import main.scala.bprocesses._
import com.github.nscala_time.time.Imports._
import scala.collection.mutable.ListBuffer  
import main.scala.simple_parts.process._

case class SessionElements(s_front_elem_id: Option[Int] = None,
  s_space_id:      Option[Int] = None,
  s_space_elem_id: Option[Int] = None)

case class BPSessionState(
  var id:                Option[Int], 
  process:               Int,
  session:               Int,
  title:                 String, 
  var neutral:           String = "",
  process_state:         Boolean = false,
  var on:                Boolean = false,
  var on_rate:           Int = 0,
  front_elem_id:         Option[Int],
  space_elem_id:         Option[Int],
  space_id:              Option[Int],
  origin_state:          Option[Int] = None,
  created_at:            Option[org.joda.time.DateTime] = None, 
  updated_at:            Option[org.joda.time.DateTime] = None, 
  lang:                  String = "en",
  middle:                String = "",
  middleable:            Boolean = false,
  oposite:               String = "",
  opositable:            Boolean = false,
  session_elements:      Option[SessionElements] = None) {
  
     /**
      * Opposition of state
      */
     if (neutral == "") { 
       lang match {
         case "en" => neutral = "un" + title // title = confirmed neutral = unconfirmed
         case _ => neutral = "--" + title    // title = confirmed neutral = --confirmed
       }
     }
     def isInMiddle(): Boolean = {
      on_rate > 0
     }
  var switchers:ListBuffer[UnitSwitcher] = ListBuffer()
}

case class BPState(
  var id:Option[Int], 
  process:      Int,
  title:        String, 
  var neutral: String = "",
  process_state:Boolean = false,
  var on: Boolean = false,
  var on_rate: Int = 0,
  front_elem_id:Option[Int],
  space_elem_id:Option[Int],
  space_id:Option[Int],
  created_at:   Option[org.joda.time.DateTime] = None, 
  updated_at:   Option[org.joda.time.DateTime] = None, 
  lang:         String = "en",
  middle: String = "",
  middleable: Boolean = false,
  oposite: String = "",
  opositable: Boolean = false) {
  
     /**
      * Opposition of state
      */
     if (neutral == "") { 
       lang match {
         case "en" => neutral = "un" + title // title = confirmed neutral = unconfirmed
         case _ => neutral = "--" + title    // title = confirmed neutral = --confirmed
       }
     }
     def isInMiddle(): Boolean = {
      on_rate > 0
     }
  var switchers:ListBuffer[UnitSwitcher] = ListBuffer()     
  
}



case class SessionInitialState(
  var id:Option[Int], 
  process:      Int,
  session:      Int,
  title:        String, 
  var neutral: String = "",
  process_state:Boolean = false,
  var on: Boolean = false,
  var on_rate: Int = 0,
  front_elem_id:Option[Int],
  space_elem_id:Option[Int],
  space_id:Option[Int],
  created_at:   Option[org.joda.time.DateTime] = None, 
  updated_at:   Option[org.joda.time.DateTime] = None, 
  lang:         String = "en",
  middle: String = "",
  middleable: Boolean = false,
  oposite: String = "",
  opositable: Boolean = false) {
  
     /**
      * Opposition of state
      */
     if (neutral == "") { 
       lang match {
         case "en" => neutral = "un" + title // title = confirmed neutral = unconfirmed
         case _ => neutral = "--" + title    // title = confirmed neutral = --confirmed
       }
     }
     def isInMiddle(): Boolean = {
      on_rate > 0
     }
  var switchers:ListBuffer[UnitSwitcher] = ListBuffer()     
  
}

case class SessionStateLog(var id: Option[Int], 
  session_id: Int,
  state_id: Int, 
  on: Boolean, 
  on_rate: Int, 
  reason: String,
  created_at:   Option[org.joda.time.DateTime] = None, 
  updated_at:   Option[org.joda.time.DateTime] = None) 