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


object ReplaceProjectionF extends ActionReplaceInternalF {

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

}
