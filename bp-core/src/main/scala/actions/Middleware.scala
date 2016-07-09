package us.ority.min.actions
import bprocesses._
import main.scala.bprocesses._
import main.scala.utils._
import com.github.nscala_time.time.Imports._
import scala.collection.mutable._
import main.scala.simple_parts.process.Units._

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
	/**** 
	 * Primary strategy execution
	 */

	def executeStrategy(parts: ActionParts,
						stateInputs:List[UnitReactionStateIn] = List(),
						dataInputs: List[UnitReactionDataIn] = List()):Option[StrategyResult] = {
		ident match {
			case "Delaying" => {
				strategies match {
					case MutableList(head, _*) => Some( 
						  DelayMiddleware.execute(parts, head, StrategyArgument()) 
						)
					case _ if strategies.length < 1 => Some( 
						  DelayMiddleware.execute(parts, 
						  						  nullStrategy.asStrategy, 
						  						  StrategyArgument()) 
						)
				}
			}
			case "RestMiddleware" => {
				strategies match {
					case MutableList(head, _*) => Some( 
						  RESTMiddleware.execute(parts, head) 
						)
					case _ if strategies.length < 1 => Some( 
						  RESTMiddleware.execute(parts, 
						  						  nullStrategy.asStrategy)
						)
				}				
			}
			case _ => None
		}
	}


}

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

	def executeStrategy(parts: ActionParts,
						stateInputs:List[UnitReactionStateIn] = List(),
						dataInputs: List[UnitReactionDataIn] = List()):Option[StrategyResult] = {
		ident match {
			case "delay" => {
				strategies match {
					case MutableList(head, _*) => Some( DelayMiddleware.execute(parts, head, StrategyArgument()) )
					case _ if strategies.length < 1 => Some( DelayMiddleware.execute(parts, nullStrategy.asStrategy, StrategyArgument()) )
				}

			}
			case _ => None
		}
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
