package models.DAO

import main.scala.bprocesses.{ BProcess, BPLoggerResult }
import main.scala.simple_parts.process.ProcElems

import models.DAO.conversion.DatabaseCred
import models.DAO._
import models.DAO.conversion.DatabaseFuture._
import com.github.nscala_time.time.Imports._
import models.DAO.conversion.DatabaseCred.dbConfig.driver.api._
import com.github.tototoshi.slick.PostgresJodaSupport._
import main.scala.bprocesses.{ BPState, BPSessionState }

import models.DAO.ProcElemDAO._
import models.DAO.BPDAO._
import models.DAO.BPStationDAO._
import models.DAO.conversion.DatabaseCred
import models.DAO._
import models.DAO.sessions._
import builders._
import main.scala.bprocesses.BPSession
import main.scala.simple_parts.process._

class BPStatesF(tag: Tag) extends Table[BPState](tag, "bpstates") {
  def id = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def process = column[Int]("process_id")
  def title = column[String]("title")
  def neutral = column[String]("neutral")
  def process_state = column[Boolean]("is_process_state", O.Default(false))
  def on = column[Boolean]("on", O.Default(false))
  def on_rate = column[Int]("on_rate", O.Default(0))

  def space_id = column[Option[Int]]("space_id")
  def front_elem_id = column[Option[Int]]("front_elem_id")
  def space_elem_id = column[Option[Int]]("space_elem_id")

  def created_at = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at = column[Option[org.joda.time.DateTime]]("updated_at")

  def middle = column[String]("middle", O.Default(""))
  def middleable = column[Boolean]("middleable", O.Default(false))
  def oposite = column[String]("oposite", O.Default(""))
  def opositable = column[Boolean]("opositable", O.Default(false))

  def lang = column[String]("lang", O.Default("en"))
  def * = (id.?, process, title, neutral,
    process_state,
    on, on_rate,
    front_elem_id,
    space_elem_id,
    space_id,
    created_at, updated_at, lang, middle, middleable, oposite, opositable) <> (BPState.tupled, BPState.unapply)

  def bpFK = foreignKey("state_bprocess_fk", process, models.DAO.BPDAOF.bprocesses)(_.id, onDelete = ForeignKeyAction.Cascade)
  def procelemFK = foreignKey("state_procelem_fk", front_elem_id, proc_elements)(_.id, onDelete = ForeignKeyAction.Cascade)
  def spaceelemFK = foreignKey("state_spaceelem_fk", space_elem_id, SpaceElemDAO.space_elements)(_.id, onDelete = ForeignKeyAction.Cascade)
  def spaceFK = foreignKey("state_space_fk", space_id, BPSpaceDAO.bpspaces)(_.id, onDelete = ForeignKeyAction.Cascade)

}

object BPStateDAOF {
  import akka.actor.ActorSystem
  import slick.backend.{ StaticDatabaseConfig, DatabaseConfig }
  //import slick.driver.JdbcProfile
  import slick.driver.PostgresDriver.api._
  import slick.jdbc.meta.MTable
  import scala.concurrent.ExecutionContext.Implicits.global
  import com.github.tototoshi.slick.PostgresJodaSupport._
  import scala.concurrent.duration.Duration
  import scala.concurrent.{ ExecutionContext, Awaitable, Await, Future }
  import scala.util.Try
  import models.DAO.conversion.DatabaseFuture._

  //import dbConfig.driver.api._ //
  def await[T](a: Awaitable[T])(implicit ec: ExecutionContext) = Await.result(a, Duration.Inf)
  
  val bpstates = TableQuery[BPStatesF]

  def pull(s: BPState): Future[Int] = db.run(bpstates returning bpstates.map(_.id) += s)

  private def filterQuery(id: Int): Query[BPStatesF, BPState, Seq] =
    bpstates.filter(_.id === id)
  private def filterQueryByProcess(id: Int): Query[BPStatesF, BPState, Seq] =
    bpstates.filter(_.process === id)

  private def filterQueryByProcesses(ids: List[Int]): Query[BPStatesF, BPState, Seq] =
    bpstates.filter(_.process inSetBind ids)


  def pull_object(s: BPState) = {
    await(pull(s) )
  }

  def findByBP(id: Int): List[BPState] = {
    await(db.run(filterQueryByProcess(id).result)).toList
  }
  def getByProcesses(processes: List[Int]) = {
    await(db.run(filterQueryByProcesses(processes).result)).toList
  }

  def findOrCreateForElem(k: List[BPState], front_elem_id: Option[Int], space_elem_id: Option[Int]): List[Int] = {
    val titles = k.map(state => state.title)
    var existed = await( db.run( bpstates.filter { s =>
      (s.title inSetBind titles) && (s.front_elem_id === front_elem_id) && (s.space_elem_id === space_elem_id)
    }.result ) )
    val filtereds = k.filter(state => !(existed.map(_.title).contains(state.title)))
    filtereds.map(filtered => pull_object(filtered))
  }

  def findOrCreateForSpace(k: List[BPState], space_id: Int): List[Int] = {
    val titles = k.map(state => state.title)
    var existed = await( db.run( bpstates.filter { s =>
      (s.title inSetBind titles) && (s.space_id === space_id)
    }.result ) )
    val filtereds = k.filter(state => !(existed.map(_.title).contains(state.title)))
    filtereds.map(filtered => pull_object(filtered))
  }

  def findOrCreateForProcess(k: List[BPState], process_id: Int): List[Int] = {
    val titles = k.map(state => state.title)
    var existed = await( db.run( bpstates.filter { s =>
      (s.title inSetBind titles) && (s.process === process_id) && (s.process_state === true)
    }.result ) )
    val filtereds = k.filter(state => !(existed.map(_.title).contains(state.title)))
    filtereds.map(filtered => pull_object(filtered))
  }






  def get(k: Int): Option[BPState] = {
    await( db.run(filterQuery(k).result.headOption) )
  }

  def update(id: Int, bpsession: BPState) = {
    val bpToUpdate: BPState = bpsession.copy(Option(id))
    db.run(bpstates.filter(_.id === id).update(bpToUpdate))
  }
  
  def delete(id: Int) = {
    db.run(bpstates.filter(_.id === id).delete)
  }

  val create: DBIO[Unit] = bpstates.schema.create
  val drop: DBIO[Unit] = bpstates.schema.drop

  def ddl_create = db.run(create)
  def ddl_drop = db.run(drop)

  def getAll = {
    db.run(bpstates.result)
  }

}
