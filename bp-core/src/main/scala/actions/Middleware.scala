package us.ority.min.actions
import bprocesses._
import main.scala.bprocesses._
import main.scala.utils._
import com.github.nscala_time.time.Imports._
import scala.collection.mutable._
import main.scala.simple_parts.process._
import us.ority.min.actions.middlewares._

case class Middleware(
		id: Option[Long],
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

  /** 
    * Exec by strategy 
    * @param parts Action components with process
    * @param stateInputs
    * @param dataInputs
    * @return strategyResult
    */
	def executeStrategy(parts: ActionParts,
						stateInputs:List[UnitReactionStateIn] = List(),
						dataInputs: List[UnitReactionDataIn] = List()):Option[ActionAct] = {
    MiddlewareLinker(parts, this, stateInputs, dataInputs)
	}

}



/*
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
case class SessionUnitReactionStateOut(id: Option[Int],
  state_ref: Int,
  reaction: Int,
  on:Boolean = false,
  on_rate: Int = 0,
  created_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now),
  updated_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now)
  )

 */
