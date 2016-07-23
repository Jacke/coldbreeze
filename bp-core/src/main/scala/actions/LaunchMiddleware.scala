package us.ority.min.actions
import bprocesses._
import main.scala.bprocesses._
import main.scala.utils._
import com.github.nscala_time.time.Imports._
import scala.collection.mutable._
import main.scala.simple_parts.process._
import us.ority.min.actions.middlewares._
/******************************************************************
 * Session Units
 * Used only in CONVERSION BETWEN PLAIN
 * DO NOT USE IN REGULAR INVOKATION!!!!!! ONLY FOR CONVERSION!!!
 *****************************************************************/


case class LaunchMiddleware(
    id: Option[Long],
    session: Int,
    title: String,
    ident: String,
    ifaceIdent: String,
    reaction: Int = -1,
    created_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now),
    updated_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now)
  ) {

  var strategies:MutableList[Strategy] = MutableList()
  val nullStrategy = new NullStrategy()

  def pushToStrategies(s: Strategy) = {
    strategies += s
  }

}

