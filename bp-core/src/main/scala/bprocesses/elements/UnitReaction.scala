package main.scala.simple_parts.process

import main.scala.bprocesses._
import main.scala.utils._
import com.github.nscala_time.time.Imports._
import scala.collection.mutable.ListBuffer
import us.ority.min.actions._


case class UnitReaction(
  id: Option[Int],
  bprocess:Int,
  autostart:Boolean,
  element: Int,
  from_state: Option[Int],
  title: String,
  created_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now),
  updated_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now)) {


    var middlewares:ListBuffer[Middleware]                   = ListBuffer()
    var reaction_state_ins:ListBuffer[UnitReactionStateIn]   = ListBuffer()
    var reaction_state_outs:ListBuffer[UnitReactionStateOut] = ListBuffer()


    var reaction_data_ins:ListBuffer[UnitReactionDataIn]     = ListBuffer()
    var reaction_data_outs:ListBuffer[UnitReactionDataOut]   = ListBuffer()

  /** 
    * Action exec [legacy execution and middleware execution]
    * @param process 
    * @param elemOpt 
    * @return actionResultOpt
    */
    def execute(process: BProcess, elemOpt: Option[ProcElems] = None):Option[ActionAct] = {
       bprocesses.ActionExecutor.execute(process, this)
       (middlewares.length > 0) match {
         case true => bprocesses.ActionExecutor.executeWithMiddleware(process, elemOpt, this)
         case _ => None
       }
    }
 }

