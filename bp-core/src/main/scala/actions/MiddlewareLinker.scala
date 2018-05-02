package us.ority.min.actions
import bprocesses._
import main.scala.bprocesses._
import main.scala.utils._
import com.github.nscala_time.time.Imports._
import scala.collection.mutable._
import main.scala.simple_parts.process._
import us.ority.min.actions.middlewares._

object MiddlewareLinker {
  def apply(parts: ActionParts,
            middleware: Middleware,
            stateInputs:List[UnitReactionStateIn] = List(),
            dataInputs: List[UnitReactionDataIn] = List()):Option[ActionAct] = {

    middleware.ident match {
      case "Delaying" => {
        pushAct(parts)
        middleware.strategies match {
          case MutableList(head, _*) => Some( 
              DelayMiddleware.execute(parts, head) 
            )
          case _ if middleware.strategies.length < 1 => Some( 
              DelayMiddleware.execute(parts, 
                            middleware.nullStrategy.asStrategy) 
            )
        }
      }
      case "RestMiddleware" => {
        pushAct(parts)
        middleware.strategies match {
          case MutableList(head, _*) => Some( 
              RESTMiddleware.execute(parts, head) 
            )
          case _ if middleware.strategies.length < 1 => Some( 
              RESTMiddleware.execute(parts, 
                            middleware.nullStrategy.asStrategy)
            )
        }       
      }
      case _ => None
    }    
  }

  def pushAct(parts: ActionParts) = 
        parts.process.addAct(ActionAct(
          id = None,
          uid = java.util.UUID.randomUUID.toString,
          session = parts.process.session_id,
          reaction = parts.action.id.getOrElse(-1),
          Some( org.joda.time.DateTime.now() ),
          Some( org.joda.time.DateTime.now() )
        ))
}
