package main.scala.bprocesses.refs

import main.scala.bprocesses.{BPStationState, BPStationLogger}
import com.github.nscala_time.time.Imports._
import main.scala.bprocesses._
  
case class BPStateRef(
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
  
    def reflect(process: Int, front_elem_id:Option[Int],
  space_elem_id:Option[Int], space_id: Option[Int]):BPState = { 
    
      BPState(None, 
  process,
  title, 
  opposite,
  process_state,
  on,
  on_rate,
  front_elem_id,
  space_elem_id,
  space_id,
  created_at, 
  updated_at, 
  lang)
    
    }

  def session_reflect(process: Int, session: Int, front_elem_id:Option[Int],
  space_elem_id:Option[Int], space_id: Option[Int]):BPSessionState = { 
    BPSessionState(None, 
  process,
  session,                   
  title, 
  opposite,
  process_state,
  on,
  on_rate,
  front_elem_id,
  space_elem_id,
  space_id,
  origin_state = None,
  created_at, 
  updated_at, 
  lang)
  
  }
  
}