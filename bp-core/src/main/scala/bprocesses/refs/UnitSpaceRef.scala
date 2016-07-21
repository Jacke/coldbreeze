package main.scala.bprocesses.refs

import main.scala.bprocesses._
import main.scala.utils._
import com.github.nscala_time.time.Imports._

import main.scala.simple_parts.process._

 case class UnitSpaceRef(
   id: Option[Int],
   reflection: Int,
    index:Int,
    container:Boolean,
    subbrick:Boolean,
    brick_front:Option[Int]=None,
    brick_nested:Option[Int]=None,
    nestingLevel: Int = 1,
    created_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now),
    updated_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now)
 ) {
   def reflect(process: Int,
    brick_front:Option[Int]=None,
    brick_nested:Option[Int]=None):UnitSpace = {
           UnitSpace(id,
      process,
      index,
      container,
      subbrick,
      brick_front,
      brick_nested,
      nestingLevel,
      created_at,
      updated_at)
}



}

