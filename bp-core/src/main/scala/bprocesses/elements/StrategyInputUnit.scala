package main.scala.simple_parts.process

import main.scala.bprocesses._
import main.scala.utils._
import com.github.nscala_time.time.Imports._
import scala.collection.mutable.ListBuffer
import us.ority.min.actions._


// INPUT
case class StrategyInputUnit(
  val id: Option[Long],
  strategy: Long,
  op: String,
  title: String,
  desc: Option[String],
  ident: String,
  targetType: String,
  created_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now),
  updated_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now))
