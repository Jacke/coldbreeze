package core.test


import org.specs2.mutable._

import main.scala.bprocesses._
import main.scala.simple_parts.process._
import main.scala.simple_parts.process.control._
import main.scala.simple_parts.process.data._
import main.scala.utils._
import main.scala.resources.scopes._
import us.ority.min.actions._
import main.scala.simple_parts.process._

import main.scala.bprocesses.links._

import com.typesafe.scalalogging.Logger
import org.slf4j.LoggerFactory

class ActionExecuteTestSpec extends Specification {
      "Create delaymiddleware" in {
      
  // build action with action components
   val action = UnitReaction(id = Some(0),
                bprocess = 0,
                autostart = false,
                element = 0,
                from_state = None,
                title = "testAction")

// Middlewares
// Delaying::com.minorityapp.core
// RestMiddleware::RestMiddleware 

  val middlewares = Seq(Middleware(
                            id = Some(-1L),
                            title = "Rest Middleware",
                            ident = "RestMiddleware",
                            ifaceIdent = "RestMiddleware",
                            reaction = 0
                          ) )

  val strategies = Seq(Strategy(id = Some(0L),
                    ident = "GETStrategy",
                    middleware = -1L,
                    isNullStrategy = false) )

  val strategyInputs = Seq( StrategyInputUnit(
    id = Some(0L),
    strategy = 0L,
    op = "",
    title = "",
    desc = None,
    ident = "",
    targetType = ""
    ))

  val strategyBases = Seq( StrategyBaseUnit(
    id = Some(0L),
    strategy = 0L,
    key = "URL",
    baseType = "url",
    valueType = "url",
    valueContent = "http://httpbin.org/headers",
    validationScheme = Some("url"),
    validationPattern = None
    ))


  val strategyOutputs = Seq( StrategyOutputUnit(
    id = Some(0L),
    strategy = 0L,
    op = "",
    title = "",
    desc = None,
    ident = "",
    targetType = ""
    ))


        us.ority.min.actions.tester.ActionTester(
          action,
          middlewares,
          strategies,
          strategyInputs,
          strategyBases,
          strategyOutputs
        )
      }

}
