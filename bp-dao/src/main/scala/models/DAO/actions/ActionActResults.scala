package models.DAO

import us.ority.min.actions._
import main.scala.bprocesses.{ BProcess, BPLoggerResult }
import main.scala.simple_parts.process.ProcElems

import models.DAO.conversion.DatabaseCred
import models.DAO._
import models.DAO.conversion.DatabaseFuture._
import com.github.nscala_time.time.Imports._
import models.DAO.conversion.DatabaseCred.dbConfig.driver.api._
import com.github.tototoshi.slick.PostgresJodaSupport._


import models.DAO.ProcElemDAO._
import models.DAO.BPDAO._
import models.DAO.BPStationDAO._
import models.DAO.conversion.DatabaseCred
import models.DAO._
import models.DAO.sessions._
import builders._
import main.scala.bprocesses.BPSession
import main.scala.simple_parts.process._


class ActionActResults(tag: Tag) extends Table[ActionResult](tag, "action_act_results") {
  def id          = column[Long]("id", O.PrimaryKey, O.AutoInc)
  def in          = column[Boolean]("in")
  def out         = column[Boolean]("out")
  def base        = column[Boolean]("base")
  def content     = column[String]("content")
  def act         = column[Long]("act_id")

  def created_at  = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at  = column[Option[org.joda.time.DateTime]]("updated_at")

  def act_FK = foreignKey("act_reaction_fk", act, models.DAO.ActionActsDAOF.action_acts)(_.id, onDelete = ForeignKeyAction.Cascade)

  def * = (id.?,
           in,
           out,
           base,
           content,
           act,
           created_at, updated_at) <> (ActionResult.tupled, ActionResult.unapply)
}

object ActionActResultsDAOF {
  import akka.actor.ActorSystem
  import slick.backend.{StaticDatabaseConfig, DatabaseConfig}
  //import slick.driver.JdbcProfile
  //import slick.driver.PostgresDriver.api._
  import slick.jdbc.meta.MTable
  import scala.concurrent.ExecutionContext.Implicits.global
  import scala.concurrent.duration.Duration
  import scala.concurrent.{ExecutionContext, Awaitable, Await, Future}
  import scala.util.Try

  def await[T](a: Awaitable[T])(implicit ec: ExecutionContext) = Await.result(a, Duration.Inf)
  
  val action_act_results = TableQuery[ActionActResults]


  val create: DBIO[Unit] = action_act_results.schema.create
  val drop: DBIO[Unit] = action_act_results.schema.drop
  def get(id: Long) = db.run(filterQuery(id).result.headOption)

  def getsByAct(ids: Seq[Long]) = db.run(filterQuerysByAct(ids).result)

  def pull(s: ActionResult):Future[Long] = db.run(action_act_results returning action_act_results.map(_.id) += s)

  def ddl_create = db.run(create)
  def ddl_drop = db.run(drop)



  private def filterQuery(id: Long): Query[ActionActResults, ActionResult, Seq] =
    action_act_results.filter(_.id === id)
  private def filterQuerysByAct(ids: Seq[Long]): Query[ActionActResults, ActionResult, Seq] =
    action_act_results.filter(_.act inSetBind ids)


}

