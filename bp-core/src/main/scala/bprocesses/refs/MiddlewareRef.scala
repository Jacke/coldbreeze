package main.scala.bprocesses.refs

import main.scala.bprocesses._
import main.scala.utils._
import com.github.nscala_time.time.Imports._

import main.scala.simple_parts.process._


case class MiddlewareRef(
    id: Option[Long],
    title: String,
    ident: String,
    ifaceIdent: String,
    reflection: Int,
    reaction: Int,
    created_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now),
    updated_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now)
  )
