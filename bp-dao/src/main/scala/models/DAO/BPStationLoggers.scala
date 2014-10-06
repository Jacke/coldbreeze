package models.DAO


import models.DAO.driver.MyPostgresDriver1.simple._
import scala.slick.model.ForeignKeyAction
import models.DAO.BPDAO._
import models.DAO.resources.BusinessDTO._
import com.github.tminglei.slickpg.composite._
import models.DAO.conversion.{DatabaseCred, Implicits}
import main.scala.bprocesses._

class BPStationLoggers(tag: Tag) extends Table[BPStationLoggerDTO](tag, "bpstation_loggers") {
  def id = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def station = column[Int]("station_id")
  def process = column[Int]("process_id")
  def sygnal = column[String]("sygnal")
  def date = column[org.joda.time.DateTime]("date")

  def state = column[Boolean]("state")
  def step = column[Int]("step")
  def space = column[Int]("space")
  def container_step = column[List[Int]]("container_step")
  def expand_step = column[List[Int]]("expand_step")
  def spaces_ids = column[List[Int]]("spaces_ids")
  def started = column[Boolean]("started")
  def finished = column[Boolean]("finished")
  def inspace = column[Boolean]("inspace")
  def incontainer = column[Boolean]("incontainer")
  def inexpands = column[Boolean]("inexpands")
  def paused = column[Boolean]("paused")


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



object BPStationLoggeDAO {
  import models.DAO.BPDAO.bprocesses
  import main.scala.bprocesses.BPStation

  import DatabaseCred.database

  val bpstationloggers = TableQuery[BPStationLoggers]

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

  def pull_object(s: BPStationLoggerDTO) = database withSession {
    implicit session ⇒
      bpstationloggers returning bpstationloggers.map(_.id) += s //BPStationDTO.unapply(s).get
  }

  def findByBPId(id: Int) = {
    database withSession { implicit session =>
     val q3 = for { st ← bpstationloggers if st.process === id } yield st// <> (BPStationDTO.tupled, BPStationDTO.unapply _)

      q3.list 
    }
  }
  def getAll = database withSession {
    implicit session ⇒ // TODO: s.service === 1 CHANGE DAT
      val q3 = for { s ← bpstationloggers } yield s
      q3.list.sortBy(_.id)
    //suppliers foreach {
    //  case (id, title, address, city, state, zip) ⇒
    //    Supplier(id, title, address, city, state, zip)
    //}
  }
def update(id: Int, entity: BPStationLoggerDTO):Boolean = {
    database withSession { implicit session =>
      findById(id) match {
      case Some(e) => {

        bpstationloggers.filter(_.id === id).update(entity.copy(id = Some(id)))
        true
      }
      case None => false
      }
    }
  }
  def areActiveForBP(id: Int) = {
     database withSession { implicit session =>
        val q3 = for { st ← bpstationloggers 
          if st.process === id 
          if st.finished === false
          } yield st

        q3.list
     }
  }
  def findById(id: Int):Option[BPStationLoggerDTO] = {
    database withSession {
    implicit session =>
      val q3 = for { s <- bpstationloggers if s.id === id } yield s

      q3.list.headOption //.map(Supplier.tupled(_))
    }
  }
  def haltUpdate(id: Int):Boolean = {
    database withSession { implicit session =>
      findById(id) match {
      case Some(e) => {
        bpstationloggers.filter(_.id === id).update(e.copy(state = false, finished = true))
        true
      }
      case None => false
      }
    }
  }
  def ddl_create = {
    database withSession {
      implicit session =>
        bpstationloggers.ddl.create
    }
  }

}