package us.ority.min.actions.tester
import us.ority.min.actions._
import main.scala.bprocesses._
import main.scala.utils._
import scala.collection.mutable.ListBuffer
import main.scala.simple_parts.process._
import main.scala.resources.scopes._

object ActionTester {
  def apply(
    action: UnitReaction, 
    middlewares: Seq[Middleware],
    strategies: Seq[Strategy],
    strategyInputs: Seq[StrategyInputUnit]=Seq(),
    strategyBases: Seq[StrategyBaseUnit]=Seq(),
    strategyOutputs: Seq[StrategyOutputUnit]=Seq()
    ) = {
  // generate test process
  val testProcess = getProcess()
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
  val mws = middlewares.filter(t => t.reaction == action.id.get)
  mws.map { middleware =>
    strategies.map { strategy => 
      strategyInputs.filter { t => 
        t.strategy == strategy.id.get }.map { t => 
          strategy.pushToStrategyInputUnit( t )
        }
      strategyBases.filter { t => 
        t.strategy == strategy.id.get }.map { t => 
          strategy.pushToStrategyBaseUnit( t )
        }
      strategyOutputs.filter { t => 
        t.strategy == strategy.id.get }.map { t => 
          strategy.pushToStrategyOutputUnit( t )
        }

      middleware.pushToStrategies(strategy)
    }
  }
  action.middlewares = mws.to[scala.collection.mutable.ListBuffer]


  // add element to process
    val el = new Block(id = 1,
    title = "Test", 
    desc = "", 
    values = None,
    bprocess = testProcess,
    b_type = "b_type", 
    type_title = "type_title",
    order = 1)
    testProcess.addElementUpFront(el)

  // execute action
    action.execute(testProcess, Some( el ) )
  // retrive action result
    true
  }


  def getProcess():BProcess = {
     new BProcess(new Managment)
  }
}