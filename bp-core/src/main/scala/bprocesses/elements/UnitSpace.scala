package main.scala.simple_parts.process

import main.scala.bprocesses._
import main.scala.utils._
import com.github.nscala_time.time.Imports._
import scala.collection.mutable.ListBuffer
import us.ority.min.actions._


case class UnitSpace(
  id: Option[Int],
                      bprocess: Int,
                      index:Int,
                      container:Boolean,
                      subbrick:Boolean,
                      brick_front:Option[Int]=None,
                      brick_nested:Option[Int]=None,
                      nestingLevel: Int = 1,
created_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now),
updated_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now)
 )