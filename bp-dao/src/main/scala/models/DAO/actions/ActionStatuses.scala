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


class ActionStatuses(tag: Tag) extends Table[ActionStatus](tag, "action_statuses") {
  def id          = column[Long]("id", O.PrimaryKey, O.AutoInc)
  def content     = column[String]("content")
  def act         = column[Long]("act_id")

  def created_at  = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at  = column[Option[org.joda.time.DateTime]]("updated_at")

  def act_FK = foreignKey("act_reaction_fk", act, models.DAO.ActionActsDAOF.action_acts)(_.id, onDelete = ForeignKeyAction.Cascade)

  def * = (id.?,
           content,
           act,
           created_at, updated_at) <> (ActionStatus.tupled, ActionStatus.unapply)
}

object ActionStatusesDAOF {
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
  def awaitAndPrint[T](a: Awaitable[T])(implicit ec: ExecutionContext) = println(await(a))
  val action_statuses = TableQuery[ActionStatuses]


  val create: DBIO[Unit] = action_statuses.schema.create
  val drop: DBIO[Unit] = action_statuses.schema.drop
  def get(id: Long) = db.run(filterQuery(id).result.headOption)

  def pull(s: ActionStatus):Future[Long] = db.run(action_statuses returning action_statuses.map(_.id) += s)

  def ddl_create = db.run(create)
  def ddl_drop = db.run(drop)

  def getsByAct(ids: Seq[Long]):Future[Seq[ActionStatus]] = 
    db.run(filterQuerysByAct(ids).result)

  def getByAct(id: Long):Future[Option[ActionStatus]] = 
    db.run(filterQuerysByAct(Seq(id)).result.headOption)

  private def filterQuerysByAct(ids: Seq[Long]): Query[ActionStatuses, ActionStatus, Seq] =
    action_statuses.filter(_.act inSetBind ids)


  private def filterQuery(id: Long): Query[ActionStatuses, ActionStatus, Seq] =
    action_statuses.filter(_.id === id)

}


