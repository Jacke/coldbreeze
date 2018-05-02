package main.scala.simple_parts.process

import main.scala.bprocesses._
import main.scala.utils._
import com.github.nscala_time.time.Imports._
import scala.collection.mutable.ListBuffer
import us.ority.min.actions._




case class ElemTopology(id: Option[Int],
  process: Int,
  front_elem_id: Option[Int],
  space_elem_id: Option[Int],
  hash: String = "",
  created_at: Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now),
  updated_at: Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now),
  space_id: Option[Int] = None)