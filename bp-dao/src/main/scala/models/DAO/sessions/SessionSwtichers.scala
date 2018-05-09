package models.DAO

import main.scala.bprocesses.{BProcess, BPLoggerResult}
import main.scala.simple_parts.process.ProcElems
import slick.driver.PostgresDriver.api._
import com.github.nscala_time.time.Imports._
import com.github.tototoshi.slick.PostgresJodaSupport._
//import com.github.tminglei.slickpg.date.PgDateJdbcTypes
import slick.model.ForeignKeyAction

import models.DAO.ProcElemDAO._
import models.DAO.BPDAO._
import models.DAO.BPStationDAO._
import models.DAO.conversion.DatabaseCred

import main.scala.simple_parts.process._

class SessionSwitchers(tag: Tag) extends Table[SessionUnitSwitcher](tag, "session_switchers") {
  def id             = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def process        = column[Int]("bprocess_id")
  def session        = column[Int]("session_id")
  def switch_type    = column[String]("switch_type")
  def priority       = column[Int]("priority", O.Default(2))
  def state_ref      = column[Int]("session_state_ref_id")
  def session_state  = column[Option[Int]]("session_state_id", O.Default(None))
  def fn             = column[String]("fn")
  def target         = column[String]("target")
  def override_group = column[Int]("override_group", O.Default(0))

  def created_at  = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at  = column[Option[org.joda.time.DateTime]]("updated_at")

  def * =(id.?,
          process,
          session,
          switch_type,
          priority,
          state_ref,
          session_state,
          fn,
          target,
          override_group,
          created_at, updated_at) <> (SessionUnitSwitcher.tupled, SessionUnitSwitcher.unapply)

def stateFK             = foreignKey("sw_statefk", state_ref, models.DAO.SessionInitialStateDAO.session_initial_states)(_.id, onDelete = ForeignKeyAction.Cascade)
def session_state_refFK = foreignKey("sw_session_state_fk", session_state, BPSessionStateDAOF.sessionstates)(_.id, onDelete = ForeignKeyAction.Cascade)
def sessionFK  = foreignKey("sw_s_sp_session_fk", session,  models.DAO.BPSessionDAOF.bpsessions)(_.id, onDelete = ForeignKeyAction.Cascade)

}

object SessionSwitcherDAOF {
  import akka.actor.ActorSystem


  import slick.backend.{StaticDatabaseConfig, DatabaseConfig}
  //import slick.driver.JdbcProfile
  import slick.driver.PostgresDriver.api._
  import slick.jdbc.meta.MTable
  import scala.concurrent.ExecutionContext.Implicits.global
  import com.github.tototoshi.slick.PostgresJodaSupport._
  import scala.concurrent.duration.Duration
  import scala.concurrent.{ExecutionContext, Awaitable, Await, Future}
  import scala.util.Try
  import models.DAO.conversion.DatabaseFuture._

  //import dbConfig.driver.api._ //
  def await[T](a: Awaitable[T])(implicit ec: ExecutionContext) = Await.result(a, Duration.Inf)
  
  val session_switchers = TableQuery[SessionSwitchers]

  private def filterQuery(id: Int): Query[SessionSwitchers, SessionUnitSwitcher, Seq] =
    session_switchers.filter(_.id === id)

}
object SessionSwitcherDAO {
  import akka.actor.ActorSystem


  import slick.backend.{StaticDatabaseConfig, DatabaseConfig}
  //import slick.driver.JdbcProfile
  import slick.driver.PostgresDriver.api._
  import slick.jdbc.meta.MTable
  import scala.concurrent.ExecutionContext.Implicits.global
  import com.github.tototoshi.slick.PostgresJodaSupport._
  import scala.concurrent.duration.Duration
  import scala.concurrent.{ExecutionContext, Awaitable, Await, Future}
  import scala.util.Try
  import models.DAO.conversion.DatabaseFuture._

  //import dbConfig.driver.api._ //
  def await[T](a: Awaitable[T])(implicit ec: ExecutionContext) = Await.result(a, Duration.Inf)
  
  val session_switchers = TableQuery[SessionSwitchers]

  private def filterQuery(id: Int): Query[SessionSwitchers, SessionUnitSwitcher, Seq] =
    session_switchers.filter(_.id === id)
  private def filterProcessQuery(id: Int): Query[SessionSwitchers, SessionUnitSwitcher, Seq] =
    session_switchers.filter(_.process === id)
  private def filterSessionQuery(id: Int): Query[SessionSwitchers, SessionUnitSwitcher, Seq] =
    session_switchers.filter(_.session === id)




  def pull_object(s: SessionUnitSwitcher) =   {
      await( db.run(session_switchers returning session_switchers.map(_.id) += s))
  }

  def get(k: Int):Option[SessionUnitSwitcher] =   {
      await(db.run(filterQuery(k).result.headOption))
  }

  def findByBPId(id: Int) = {
     await(db.run(filterProcessQuery(id).result)).toList
  }

  def findBySession(id: Int) = {
      await(db.run(filterSessionQuery(id).result)).toList
  }

  def update(id: Int, switcher: SessionUnitSwitcher) =   {
    val switcherToUpdate: SessionUnitSwitcher = switcher.copy(Option(id))
    await( db.run(session_switchers.filter(_.id === id).update(switcherToUpdate)))
  }

  def delete(id: Int) =   {
    await( db.run(session_switchers.filter(_.id === id).delete))
  }



  val create: DBIO[Unit] = session_switchers.schema.create
  val drop: DBIO[Unit] = session_switchers.schema.drop
  def ddl_create = db.run(create)
  def ddl_drop = db.run(drop)


}
