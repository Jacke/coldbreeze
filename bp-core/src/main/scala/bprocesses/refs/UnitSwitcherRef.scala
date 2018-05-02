package main.scala.bprocesses.refs

import main.scala.bprocesses._
import main.scala.utils._
import com.github.nscala_time.time.Imports._

import main.scala.simple_parts.process._

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