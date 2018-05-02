 package main.scala.bprocesses.refs

import main.scala.bprocesses._
import main.scala.utils._
import com.github.nscala_time.time.Imports._

import main.scala.simple_parts.process._

 case class UnitReactionStateOutRef(id: Option[Int],
  state_ref: Int,
  reaction: Int,
  on:Boolean = false,
  on_rate: Int = 0,
  is_input:Boolean = false,
  created_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now),
  updated_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now)
  ) {
  def reflect(state_ref: Int, reaction: Int):UnitReactionStateOut = {
    UnitReactionStateOut(None,
                        state_ref,
                        reaction,
                        on,
                        on_rate,
                        is_input,
                        created_at,
                        updated_at)
  }
}