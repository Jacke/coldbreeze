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
            dataInputs: List[UnitReactionDataIn] = List()):Option[StrategyResult] = {

    middleware.ident match {
      case "Delaying" => {
        middleware.strategies match {
          case MutableList(head, _*) => Some( 
              DelayMiddleware.execute(parts, head, StrategyArgument()) 
            )
          case _ if middleware.strategies.length < 1 => Some( 
              DelayMiddleware.execute(parts, 
                            middleware.nullStrategy.asStrategy, 
                            StrategyArgument()) 
            )
        }
      }
      case "RestMiddleware" => {
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
}
