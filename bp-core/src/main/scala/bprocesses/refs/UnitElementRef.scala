 package main.scala.bprocesses.refs

import main.scala.bprocesses._
import main.scala.utils._
import com.github.nscala_time.time.Imports._

import main.scala.simple_parts.process._

 case class UnitElementRef(id: Option[Int],
                        reflection: Int,
                        title:String,
                        desc:String,
                        b_type:String,
                        type_title:String,
                        space_own:Option[Int],
                        order:Int,
created_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now),
updated_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now)) {
   def reflect(business:Int, process: Int, space_own:Option[Int] = None):UnitElement = {
       UnitElement(id,
title,
desc,
business,
process,
b_type,
type_title,
space_own,
order,
created_at,
updated_at)

   }
}

