package main.scala.simple_parts.process

import main.scala.bprocesses._
import main.scala.utils._
import com.github.nscala_time.time.Imports._
import scala.collection.mutable.ListBuffer
import us.ority.min.actions._
/******************************************************************
 * Session Units
 * Used only in CONVERSION BETWEN PLAIN
 * DO NOT USE IN REGULAR INVOKATION!!!!!! ONLY FOR CONVERSION!!!
 *****************************************************************/



 case class SessionUnitReaction(id: Option[Int],
    bprocess:Int,
    session: Int,
    autostart:Boolean,
    element: Int,
    from_state: Option[Int],
    title: String,
    created_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now),
    updated_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now)) {

    var reaction_state_outs:ListBuffer[UnitReactionStateOut] = ListBuffer()
    def execute(process: BProcess) {
       //bprocesses.ReactionExecutor.execute(process, this)
    }
 }