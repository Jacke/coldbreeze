package main.scala.simple_parts.process

import main.scala.bprocesses._
import main.scala.utils._
import com.github.nscala_time.time.Imports._
import scala.collection.mutable.ListBuffer
import us.ority.min.actions._


// BASE
case class StrategyBaseUnit(
  val id: Option[Long],
  strategy: Long,
  key: String,
  baseType: String,
  valueType: String,
  valueContent: String,
  validationScheme: Option[String] = None,
  validationPattern: Option[String] = None,
  created_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now),
  updated_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now))

