package main.scala.bprocesses

import main.scala.bprocesses.{BPStationState, BPStationLogger}
import com.github.nscala_time.time.Imports._

  
case class BPSession(
  var id: Option[Int], 
  process: Int,
  created_at:Option[org.joda.time.DateTime] = None, 
  updated_at:Option[org.joda.time.DateTime] = None,
  active_listed: Boolean = true) {
  
  
}