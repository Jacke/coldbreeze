package models.DAO.projections.ref

import main.scala.bprocesses.refs.BPStateRef
import main.scala.bprocesses.refs._
import main.scala.simple_parts.process._
import models.DAO._
import models.DAO.reflect._
import scala.concurrent.ExecutionContext.Implicits.global
import scala.concurrent.duration.Duration
import scala.concurrent.{ExecutionContext, Awaitable, Await, Future}
import scala.util.Try
import us.ority.min.actions._
import main.scala.bprocesses.refs._
import main.scala.simple_parts.process._



trait ActionIternalProjectionF {


  def projectReactionComponents(
    reaction_container: ReactionProjectionContainer,
    refActionContainer: List[RefActionContainer] = List() ):Future[ActionInternalContainer] = {

      /*
      action_id: Int,
      middleware_id: Long,
      strategy_id: Long,
      bases: List[BaseContainer] = List()

      BaseContainer:
        base_id: Long,
        base_req_type: String = "string",
        base_content_string: String = "",
        base_content_number: Long = 0L,
        base_content_boolean: Boolean = false

      case class ReactionProjectionContainer(reaction_ids: Map[Int,Int], reactions:List[UnitReactionRef])
      found   : List[scala.concurrent.Future
      [Option[scala.concurrent.Future[scala.concurrent.Future[
      Option[scala.concurrent.Future[List[scala.concurrent.Future[
      Option[scala.concurrent.Future[Long]]]]]]]]]]]

      found   : List[scala.concurrent.Future[Option[scala.concurrent.Future[scala.concurrent.Future[Option[scala.concurrent.Future[List[scala.concurrent.Future[Option[scala.concurrent.Future[Long]]]]]]]]]]]


      */
    val components:List[scala.concurrent.Future[Option[ActionInternalContainer]]] =
      refActionContainer.map { reactionComp =>
        reaction_container.reaction_ids.get(reactionComp.action_id) match {
          case Some(trueActionId) => {
              prepareMiddleware(reactionComp, trueActionId)
          }
          case _ => Future.successful(None)
        }
      }

      scala.concurrent.Future.sequence( components ).map { components =>
        //components
        val componentsList:List[ActionInternalContainer] = components.flatten
        ActionInternalContainer(
          middleware = componentsList.map(c => c.middleware).flatten.toMap,
          strategy = componentsList.map(c => c.strategy).flatten.toMap,
          inputs = componentsList.map(c => c.inputs).flatten.toMap,
          bases = componentsList.map(c => c.bases).flatten.toMap,
          outputs = componentsList.map(c => c.outputs).flatten.toMap
        )
      }
}

case class ActionInternalContainer(
  middleware: Map[Long,Long] = Map(),
  strategy: Map[Long,Long] = Map(),
  inputs: Map[Long,Long] = Map(),
  bases: Map[Long, Long] = Map(),
  outputs: Map[Long,Long] = Map())

// Create middleware from ref
def prepareMiddleware(reactionComp: RefActionContainer, trueActionId: Int):Future[Option[ActionInternalContainer]] =  {
  MiddlewareRefsDAOF.get(reactionComp.middleware_id).flatMap { middlewareRefOpt =>
    middlewareRefOpt match {
      case Some(middlewareRef) => {
        MiddlewaresDAOF.pull(
          Middleware(
            None,
            middlewareRef.title,
            middlewareRef.ident,
            middlewareRef.ifaceIdent,
            trueActionId
          )
        ).flatMap { trueMiddlewareId =>
          val acn = ActionInternalContainer(middleware = Map(middlewareRef.id.get -> trueMiddlewareId))
          prepareStrategy(reactionComp, trueMiddlewareId, acn)
        }
      }
      case _ => Future.successful(None)
    }
  }
}

// Create strategy from ref
def prepareStrategy(reactionComp: RefActionContainer, 
        trueMiddlewareId: Long,
        acn: ActionInternalContainer):Future[Option[ActionInternalContainer]] = {
  StrategyRefsDAOF.get(reactionComp.strategy_id).flatMap { strategyRefOpt =>
    strategyRefOpt match {
      case Some(strategyRef) => {
          StrategiesDAOF.pull(
            Strategy(
              None, strategyRef.ident, trueMiddlewareId, strategyRef.isNullStrategy
            )
          ).flatMap { trueStrategyId =>
              val acnNew = acn.copy(strategy = Map(strategyRef.id.get -> trueStrategyId))
              prepareInputs(reactionComp, trueStrategyId, acnNew).flatMap { a =>
                prepareOutputs(reactionComp, trueStrategyId, a).flatMap { b =>
                  prepareBases(reactionComp, trueStrategyId, b).map { z =>
                    Some(z)
                  }
                }
              }
          }
      }
      case _ => Future.successful(None)
    }
  }
}


/*****
 * Action pipes
 */
def prepareBases(reactionComp: RefActionContainer, 
      trueStrategyId: Long,
      acn: ActionInternalContainer):Future[ActionInternalContainer] = {
  Future.sequence ( reactionComp.bases.map { base =>
    // Create bases from refs
    StrategyBaseRefsDAOF.get(base.base_id).flatMap { refOfBaseUnitOpt =>
      refOfBaseUnitOpt match {
        case Some(refOfBaseUnit) => {
        StrategyBasesDAOF.pull(
                   StrategyBaseUnit(None,
                   trueStrategyId,
                   refOfBaseUnit.key,
                   refOfBaseUnit.baseType,
                   refOfBaseUnit.valueType,
                   base.base_content_string,
                   validationScheme = Some( base.base_req_type ),
                   validationPattern = None)
        ).map { baseId =>
          Some( Map(refOfBaseUnit.id.get -> baseId) )
        }

        }
        case _ => Future.successful(None)
      }

    }
  } ).map { acList =>
    acn.copy(bases = acList.flatten.flatten.toMap)
  }
}

def prepareInputs(reactionComp: RefActionContainer, 
  trueStrategyId: Long,
  acn: ActionInternalContainer):Future[ActionInternalContainer] = {
    // Create bases from refs
    StrategyInputRefsDAOF.getByStrategy(trueStrategyId).flatMap { units =>
      val now = org.joda.time.DateTime.now()
      Future.sequence( units.map { unit =>
        StrategyInputsDAOF.pull(
          StrategyInputUnit(None,
            trueStrategyId,
            unit.op,
            unit.title,
            unit.desc,
            unit.ident,
            unit.targetType, Some(now), Some(now) )
          ).map { newId =>
            Map(unit.id.get -> newId)          
        }
      }).map { ac =>
        acn.copy(inputs = ac.reduce (_ ++ _))
      }
    }
}

def prepareOutputs(reactionComp: RefActionContainer, 
  trueStrategyId: Long,
  acn: ActionInternalContainer):Future[ActionInternalContainer] = {
    // Create bases from refs
    StrategyOutputRefsDAOF.getByStrategy(trueStrategyId).flatMap { units =>
         val now = org.joda.time.DateTime.now()
         Future.sequence( units.map { unit =>
           StrategyOutputsDAOF.pull(
             StrategyOutputUnit(None,
               trueStrategyId,
               unit.op,
               unit.title,
               unit.desc,
               unit.ident,
               unit.targetType, Some(now), Some(now) )
             ).map { newId =>
                Map(unit.id.get -> newId)          
              }
         }).map { ac =>
          acn.copy(outputs = ac.reduce (_ ++ _))
         }
    }
}

}
