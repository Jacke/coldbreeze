package models.DAO.projections.ref

import main.scala.bprocesses.refs.BPStateRef
import main.scala.bprocesses.refs.UnitRefs.{UnitReactionStateOutRef, UnitSwitcherRef, UnitReactionRef, UnitSpaceRef}
import main.scala.simple_parts.process.Units.UnitElement
import models.DAO._
import models.DAO.reflect._
import scala.concurrent.ExecutionContext.Implicits.global
import scala.concurrent.duration.Duration
import scala.concurrent.{ExecutionContext, Awaitable, Await, Future}
import scala.util.Try
import us.ority.min.actions._
import main.scala.bprocesses.refs.UnitRefs._
import main.scala.simple_parts.process.Units._



trait ActionReplaceInternalF {


  def projectReactionComponents(reaction_container: ReactionProjectionContainer,
                                refActionContainer: List[RefActionContainer] = List() ):Future[List[Option[Long]]] = {

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
    val components:List[scala.concurrent.Future[Option[Long]]] =
      refActionContainer.map { reactionComp =>
        reaction_container.reaction_ids.get(reactionComp.action_id) match {
        case Some(trueActionId) => {
          // Create middleware from ref
          MiddlewareRefsDAOF.get(reactionComp.middleware_id).flatMap { middlewareRefOpt =>
            middlewareRefOpt match {
              case Some(middlewareRef) => {
                MiddlewaresDAOF.pull(
                  Middleware(
                    None,
                    middlewareRef.ident,
                    middlewareRef.ifaceIdent,
                    trueActionId
                  )
                ).flatMap { trueMiddlewareId =>
                  // Create strategy from ref
                  StrategyRefsDAOF.get(reactionComp.strategy_id).flatMap { strategyRefOpt =>
                    strategyRefOpt match {
                      case Some(strategyRef) => {
                          StrategiesDAOF.pull(
                            Strategy(
                              None, strategyRef.ident, trueMiddlewareId, strategyRef.isNullStrategy
                            )
                          ).flatMap { trueStrategyId =>
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
                                    None
                                  }

                                  }
                                  case _ => Future.successful(None)
                                }

                              }
                            } ).map { c =>
                              None
                            }


                            }
                      }
                      case _ => Future.successful(None)
                    }

                  }


                }
            }
            case _ => Future.successful(None)
          }
        }

        }
        case _ => Future.successful(None)

        }

      }


      scala.concurrent.Future.sequence( components )
      //components
}



}
