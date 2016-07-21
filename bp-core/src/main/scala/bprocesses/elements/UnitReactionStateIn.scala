package main.scala.simple_parts.process

import main.scala.bprocesses._
import main.scala.utils._
import com.github.nscala_time.time.Imports._
import scala.collection.mutable.ListBuffer
import us.ority.min.actions._


 case class UnitReactionStateIn(id: Option[Int],
  state_ref: Int,
  reaction: Int,
  on:Boolean = false,
  on_rate: Int = 0,
  created_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now),
  updated_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now)
)