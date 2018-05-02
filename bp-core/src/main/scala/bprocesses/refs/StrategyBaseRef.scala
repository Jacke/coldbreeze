package main.scala.bprocesses.refs

import main.scala.bprocesses._
import main.scala.utils._
import com.github.nscala_time.time.Imports._

import main.scala.simple_parts.process._

// BASE
case class StrategyBaseRef(
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
