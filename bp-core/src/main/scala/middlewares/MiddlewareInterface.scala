package us.ority.min.actions.middlewares
import bprocesses._
import main.scala.bprocesses._
import main.scala.utils._
import com.github.nscala_time.time.Imports._
import scala.collection.mutable._  
import main.scala.simple_parts.process._

import main.scala.simple_parts.process._
import main.scala.simple_parts.process._
import main.scala.bprocesses._
import main.scala.utils._
import us.ority.min.jobs._
import us.ority.min.actions._

trait MiddlewareInterface {
/**
  * Primary method for middleware execution.
  * @param parts ActionParts
  * @param s Strategy
  * @param stateInputs
  * @param dataInputs 
  * @return ActionAct Result of completed execution.
  */
  def execute(
      parts: ActionParts, s: Strategy,
      stateInputs:List[UnitReactionStateIn] = List(), 
      dataInputs: List[UnitReactionDataIn] = List()
      ):ActionAct

    def retriveDataForDelay(
      stategyTitle: String, 
      dataInputs: List[UnitReactionDataIn],
      bases: MutableList[StrategyBaseUnit] = MutableList()):StrategyArguments
}