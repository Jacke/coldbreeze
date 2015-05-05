package main.scala.bprocesses.refs

import main.scala.bprocesses.{BPStationState, BPStationLogger}
import com.github.nscala_time.time.Imports._
import main.scala.bprocesses._
  
case class BPStateRef(
  var id:Option[Int], 
  reflection:   Int,
  title:        String, 
  var neutral: String = "",
  process_state:Boolean = false,
  on:Boolean = false,
  on_rate: Int = 0,
  front_elem_id:Option[Int],
  space_elem_id:Option[Int],
  space_id: Option[Int],
  created_at:   Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now), 
  updated_at:   Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now), 
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
  
    def reflect(process: Int, front_elem_id:Option[Int],
  space_elem_id:Option[Int], space_id: Option[Int]):BPState = { 
    
      BPState(None, 
  process,
  title, 
  neutral,
  process_state,
  on,
  on_rate,
  front_elem_id,
  space_elem_id,
  space_id,
  created_at, 
  updated_at, 
  lang,
  middle,
middleable,
oposite,
opositable)
    
    }

  def session_reflect(process: Int, session: Int, front_elem_id:Option[Int],
  space_elem_id:Option[Int], space_id: Option[Int]):BPSessionState = { 
    BPSessionState(None, 
  process,
  session,                   
  title, 
  neutral,
  process_state,
  on,
  on_rate,
  front_elem_id,
  space_elem_id,
  space_id,
  origin_state = None,
  created_at, 
  updated_at, 
  lang,
  middle,
middleable,
oposite,
opositable)
  
  }
  
}