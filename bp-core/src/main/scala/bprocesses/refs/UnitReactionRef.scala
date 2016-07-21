package main.scala.bprocesses.refs

import main.scala.bprocesses._
import main.scala.utils._
import com.github.nscala_time.time.Imports._

import main.scala.simple_parts.process._

 case class UnitReactionRef(
    id: Option[Int],
    reflection: Int,
    autostart:Boolean,
    element: Int,
    from_state: Option[Int],
    title: String,
    created_at:Option[org.joda.time.DateTime] = None,
    updated_at:Option[org.joda.time.DateTime] = None) {

 def reflect(process: Int, element: Int, from_state: Option[Int]):UnitReaction = {
    UnitReaction(None,
                  process,
                  autostart,
                  element,
                  from_state,
                  title,
                  created_at,
                  updated_at)
  }
 }
