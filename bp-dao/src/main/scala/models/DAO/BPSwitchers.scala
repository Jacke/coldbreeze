package models.DAO

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

class BPSwitchers(tag: Tag) extends Table[UnitSwitcher](tag, "bpswitchers") {
  def id             = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def process        = column[Int]("bprocess_id")
  def switch_type    = column[String]("switch_type")
  def priority       = column[Int]("priority", O.Default(2))
  def state          = column[Int]("state_id")
  def session_state  = column[Option[Int]]("session_state", O.Default(None))
  def fn             = column[String]("fn")
  def target         = column[String]("target")
  def override_group = column[Int]("override_group", O.Default(0))

  def created_at  = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at  = column[Option[org.joda.time.DateTime]]("updated_at")

  def * =(id.?,
          process,
          switch_type,
          priority,
          state,
          session_state,
          fn,
          target,
          override_group,
          created_at, updated_at) <> (UnitSwitcher.tupled, UnitSwitcher.unapply)

def stateFK             = foreignKey("sw_statefk", state, models.DAO.BPStateDAOF.bpstates)(_.id, onDelete = ForeignKeyAction.Cascade)
def session_state_refFK = foreignKey("sw_session_state_fk", session_state, BPSessionStateDAOF.sessionstates)(_.id, onDelete = ForeignKeyAction.Cascade)

}

object SwitcherDAO {
  import akka.actor.ActorSystem
  import slick.backend.{StaticDatabaseConfig, DatabaseConfig}

  import slick.jdbc.meta.MTable
  import scala.concurrent.ExecutionContext.Implicits.global
  import scala.concurrent.duration.Duration
  import scala.concurrent.{ExecutionContext, Awaitable, Await, Future}
  import scala.util.Try



  import slick.jdbc._

  def await[T](a: Awaitable[T])(implicit ec: ExecutionContext) = Await.result(a, Duration.Inf)
  val switchers = TableQuery[BPSwitchers]


  private def filterQuery(id: Int): Query[BPSwitchers, UnitSwitcher, Seq] =
    switchers.filter(_.id === id)
  private def filterQueryProcesses(ids: List[Int]): Query[BPSwitchers, UnitSwitcher, Seq] =
    switchers.filter(_.process inSetBind ids)
  private def filterQueryProcess(id: Int): Query[BPSwitchers, UnitSwitcher, Seq] =
    switchers.filter(_.process === id)





  def pull_object(s: UnitSwitcher) = {
      await(db.run( switchers returning switchers.map(_.id) += s ) )
  }
  def get(k: Int):Option[UnitSwitcher] = {
    await(db.run(filterQuery(k).result.headOption) )
  }
  def findByBPId(id: Int) = {
    await(db.run(filterQueryProcess(id).result) ).toList
  }
  def update(id: Int, switcher: UnitSwitcher) = {
    val switcherToUpdate: UnitSwitcher = switcher.copy(Option(id))
    await( db.run( switchers.filter(_.id === id).update(switcherToUpdate) ) )
  }
  def delete(id: Int) = {
    await( db.run( switchers.filter(_.id === id).delete ))
  }


  val create: DBIO[Unit] = switchers.schema.create
  val drop: DBIO[Unit] = switchers.schema.drop

  def ddl_create = db.run(create)
  def ddl_drop = db.run(drop)

}
