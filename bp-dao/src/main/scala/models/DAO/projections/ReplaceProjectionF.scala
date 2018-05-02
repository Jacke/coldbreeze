package models.DAO.projections

import main.scala.bprocesses.refs._
import main.scala.simple_parts.process._
import models.DAO.reflect._
import models.DAO._
import models.DAO.projections.ref._
import scala.concurrent.ExecutionContext.Implicits.global
import scala.concurrent.duration.Duration
import scala.concurrent.{ExecutionContext, Awaitable, Await, Future}
import scala.util.Try


object ReplaceProjectionF extends ActionIternalProjectionF {

  def projecting(k: Int,
				process: Int,
				business: Int,
				title: String,
				desc: String = "",
				sc: String = "front",
				space_id: Option[Int] = None,
        refActionContainer: List[RefActionContainer] = List() ):Future[Option[RefResulted]] = {
          /*
              Replace existed middleware
              Replace existed strategy
              Replace existed pipes
           */

          Future.successful(None)

}


def projectingStrategy(refStrategyId: Long,
                      elementTopoId: Int,
                      trueMiddlewareId: Long,
                      refActionContainer: RefActionContainer ):Future[Option[RefResulted]] = {

val acn = ActionInternalContainer(
  middleware = Map(),
  strategy = Map(),
  inputs = Map(),
  bases = Map(),
  outputs = Map())

val strategyResult: Future[Option[ActionInternalContainer]] = 
  prepareStrategy(refActionContainer, 
                  trueMiddlewareId,
                  acn)

  strategyResult.map { reactionCompnentsOpt =>
    val reactionCompnents:ActionInternalContainer = reactionCompnentsOpt.getOrElse(ActionInternalContainer() )
    Some(RefResulted(
      strategies = makeRefMapResultLong(reactionCompnents.strategy),
      inputs = makeRefMapResultLong(reactionCompnents.inputs),
      bases = makeRefMapResultLong(reactionCompnents.bases),
      outputs = makeRefMapResultLong(reactionCompnents.outputs)
    ))
  }
}

private def makeRefMapResultLong(values:Map[Long, Long]):List[RefMapResult] = {
  values.map { keyVal => RefMapResult(-1,-1,keyVal._1,keyVal._2) }.toList
}


}
