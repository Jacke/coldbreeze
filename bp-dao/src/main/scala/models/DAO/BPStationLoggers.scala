package models.DAO


import models.DAO.driver.MyPostgresDriver.api._
import com.github.nscala_time.time.Imports._
import com.github.tototoshi.slick.PostgresJodaSupport._
import slick.model.ForeignKeyAction
import models.DAO.BPDAO._
import models.DAO.resources.BusinessDTO._
import com.github.tminglei.slickpg.composite._
import models.DAO.conversion.{DatabaseCred, Implicits}
import main.scala.bprocesses._

class BPStationLoggers(tag: Tag) extends Table[BPStationLoggerDTO](tag, "bpstation_loggers") {
  def id      = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def station = column[Int]("station_id")
  def process = column[Int]("process_id")
  def sygnal  = column[String]("sygnal")
  def date    = column[org.joda.time.DateTime]("date")

  def state   = column[Boolean]("state")
  def step    = column[Int]("step")
  def space   = column[Int]("space")
  def container_step = column[List[Int]]("container_step")
  def expand_step    = column[List[Int]]("expand_step")
  def spaces_ids     = column[List[Int]]("spaces_ids")
  def started        = column[Boolean]("started")
  def finished       = column[Boolean]("finished")
  def inspace        = column[Boolean]("inspace")
  def incontainer    = column[Boolean]("incontainer")
  def inexpands      = column[Boolean]("inexpands")
  def paused         = column[Boolean]("paused")


  def * = (id.?,
    station,
    process,
    sygnal,
    date,

    state,
    step,
    space,
    container_step,
    expand_step,
    spaces_ids,
    started,
    finished,
    inspace,
    incontainer,
    inexpands,
    paused) <> (BPStationLoggerDTO.tupled, BPStationLoggerDTO.unapply)

}

/*
  Case class
 */
case class BPStationLoggerDTO(
id: Option[Int],
station: Int,
process: Int,
sygnal: String,
date: org.joda.time.DateTime,
state:Boolean,
step:Int,
space:Int,
container_step: List[Int],
expand_step: List[Int],
spaces_ids: List[Int],
started: Boolean,
finished: Boolean,
inspace: Boolean,
incontainer: Boolean,
inexpands: Boolean,
paused: Boolean)

object BPStationLoggeDAOF {
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
  def awaitAndPrint[T](a: Awaitable[T])(implicit ec: ExecutionContext) = println(await(a))
  val bpstationloggers = TableQuery[BPStationLoggers]

  private def filterQuery(id: Int): Query[BPStationLoggers, BPStationLoggerDTO, Seq] =
    bpstationloggers.filter(_.id === id)
  private def filterQueryProcess(id: Int): Query[BPStationLoggers, BPStationLoggerDTO, Seq] =
    bpstationloggers.filter(_.process === id)
  private def areActiveForBPQuery(id: Int): Query[BPStationLoggers, BPStationLoggerDTO, Seq] =
    bpstationloggers.filter(st => st.process === id && st.finished === false)



  def from_origin_station(process_id: Int, station_id: Int, stlogger: BPStationLoggerResult):BPStationLoggerDTO = {
    val station = stlogger.state
    BPStationLoggerDTO(
        None,
        station_id,
        process_id,
        stlogger.sygnal,
        stlogger.date,

        station.state,
        station.step,
        station.space,
        station.container_step.toList,
        station.expand_step.toList,
        station.spaces_ids.toList,
        station.started,
        station.finished,
        station.inspace,
        station.incontainer,
        station.inexpands,
        station.paused)
  }
  //def to_origin_station(station: BPStationDTO1):BPStation = {

  //}

  def pull_object(s: BPStationLoggerDTO) = {
      await ( db.run( bpstationloggers returning bpstationloggers.map(_.id) += s ))
  }

  def findByBPId(id: Int) = {
    await ( db.run(filterQueryProcess(id).result) )
  }

  def update(id: Int, entity: BPStationLoggerDTO):Boolean = {
      findById(id) match {
      case Some(e) => {
        bpstationloggers.filter(_.id === id).update(entity.copy(id = Some(id)))
        true
      }
      case None => false
      }
  }
  def areActiveForBP(id: Int) = {
        await ( db.run(areActiveForBPQuery(id).result) )
  }
  def findById(id: Int):Option[BPStationLoggerDTO] = {
    await ( db.run(filterQuery(id).result.headOption) )
  }
  def haltUpdate(id: Int):Boolean = {

      findById(id) match {
      case Some(e) => {
        bpstationloggers.filter(_.id === id).update(e.copy(state = false, finished = true))
        true
      }
      case None => false
      }

  }


  val create: DBIO[Unit] = bpstationloggers.schema.create
  val drop: DBIO[Unit] = bpstationloggers.schema.drop

  def ddl_create = db.run(create)
  def ddl_drop = db.run(drop)

}
