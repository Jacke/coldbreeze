package models.DAO

import main.scala.bprocesses.{ BProcess, BPLoggerResult }
import main.scala.simple_parts.process.ProcElems

import models.DAO.conversion.DatabaseCred
import models.DAO._
import models.DAO.conversion.DatabaseFuture._
import com.github.nscala_time.time.Imports._
import models.DAO.conversion.DatabaseCred.dbConfig.driver.api._
import com.github.tototoshi.slick.JdbcJodaSupport._


import models.DAO.ProcElemDAO._
import models.DAO.BPDAO._
import models.DAO.BPStationDAO._
import models.DAO.conversion.DatabaseCred
import models.DAO._
import models.DAO.sessions._
import builders._
import main.scala.bprocesses.BPSession

case class LaunchCounter(
  id: Option[Long],
  process: Int,
  count: Long = 1,
  created_at: Option[org.joda.time.DateTime],
  updated_at: Option[org.joda.time.DateTime]
)
class LaunchCounters(tag: Tag) extends Table[LaunchCounter](tag, "launch_counters") {
  def id = column[Long]("id", O.PrimaryKey, O.AutoInc)
  def process = column[Int]("process_id")
  def count = column[Long]("count")
  def created_at = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at = column[Option[org.joda.time.DateTime]]("updated_at")

  def * = (id.?, process, count, created_at, updated_at) <> (LaunchCounter.tupled, LaunchCounter.unapply)

  def bpFK = foreignKey("launch_counters_bprocess_fk", process, models.DAO.BPDAOF.bprocesses)(_.id, onDelete = ForeignKeyAction.Cascade)
}

import main.scala.utils.InputParamProc

object LaunchCounterDAO {
  import akka.actor.ActorSystem
  import slick.backend.{StaticDatabaseConfig, DatabaseConfig}

  import slick.jdbc.meta.MTable
  import scala.concurrent.ExecutionContext.Implicits.global
  import scala.concurrent.duration.Duration
  import scala.concurrent.{ExecutionContext, Awaitable, Await, Future}
  import scala.util.Try
  import slick.jdbc._

  //import dbConfig.driver.api._ //
  def await[T](a: Awaitable[T])(implicit ec: ExecutionContext) = Await.result(a, Duration.Inf)
  val launch_counters = TableQuery[LaunchCounters]
  private def filterQuery(id: Long): Query[LaunchCounters, LaunchCounter, Seq] =
    launch_counters.filter(_.id === id)
  private def filterQueryByIds(ids: List[Long]): Query[LaunchCounters, LaunchCounter, Seq] =
    launch_counters.filter(_.id inSetBind ids)
  private def filterByProcessQuery(id: Int): Query[LaunchCounters, LaunchCounter, Seq] =
    launch_counters.filter(_.process === id)
  private def filterByProcessesQuery(ids: List[Int]): Query[LaunchCounters, LaunchCounter, Seq] =
    launch_counters.filter(_.process inSetBind ids)
  def pull(s: LaunchCounter):Future[Long] = db.run(launch_counters returning launch_counters.map(_.id) += s)
  def update(id: Long, s: LaunchCounter) = {
    db.run(filterQuery(id).update(s.copy(id = Some(id), updated_at = Some(org.joda.time.DateTime.now()) )))
  }
  def getCountByProcess(process_id: Int):Future[Long] =
    db.run(filterByProcessQuery(process_id).result.headOption).map { cnOpt =>
      cnOpt match {
        case Some(cn) => cn.count
        case _ => 1L
      }
    }

  def invokeCounterForProcess(process_id: Int) = {
    db.run(filterByProcessQuery(process_id).result.headOption).map { cnOpt =>
      cnOpt match {
        case Some(cn) => {
          update(cn.id.get, cn.copy(count = cn.count+1 ))
        }
        case _ => {
          val date = Some(  org.joda.time.DateTime.now() )
          pull ( LaunchCounter(None, process_id, count = 1, date, date ) )
        }
      }
    }
  }

  val create: DBIO[Unit] = launch_counters.schema.create
  val drop: DBIO[Unit] = launch_counters.schema.drop

  def ddl_create = db.run(create)
  def ddl_drop = db.run(drop)
} // Future Impl
