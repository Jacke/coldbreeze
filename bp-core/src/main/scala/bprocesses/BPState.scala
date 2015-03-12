package main.scala.bprocesses

import main.scala.bprocesses.{BPStationState, BPStationLogger}
import com.github.nscala_time.time.Imports._

  
case class BPState(
  var id: Option[Int], 
  process: Int,
  session: Int,
  title:String, 
  var opposite:String = "",
  created_at:Option[org.joda.time.DateTime] = None, 
  updated_at:Option[org.joda.time.DateTime] = None) {
   if (opposite == "") {
     opposite = "un" + title // title = confirmed opposite = unconfirmed
   }
  
}