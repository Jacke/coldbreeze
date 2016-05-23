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
import main.scala.bprocesses._
import main.scala.bprocesses._

class SessionInitialStates(tag: Tag) extends Table[SessionInitialState](tag, "session_initial_states") {
  def id            = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def process       = column[Int]("process_id")
  def session       = column[Int]("session_id")
  def title         = column[String]("title")
  def neutral       = column[String]("neutral")
  def process_state = column[Boolean]("is_process_state", O.Default(false))
  def on            = column[Boolean]("on", O.Default(false))
  def on_rate       = column[Int]("on_rate", O.Default(0))

  def space_id      = column[Option[Int]]("ses_space_id")
  def front_elem_id = column[Option[Int]]("ses_front_elem_id")
  def space_elem_id = column[Option[Int]]("ses_space_elem_id")


  def created_at = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at = column[Option[org.joda.time.DateTime]]("updated_at")


  def middle      = column[String]("middle", O.Default(""))
  def middleable  = column[Boolean]("middleable", O.Default(false))
  def oposite     = column[String]("oposite", O.Default(""))
  def opositable  = column[Boolean]("opositable", O.Default(false))

  def lang        = column[String]("lang", O.Default("en"))
  def * = (id.?, process,session, title, neutral,
                                          process_state,
                                          on, on_rate,
                                          front_elem_id,
                                          space_elem_id,
                                          space_id,
           created_at, updated_at, lang, middle, middleable, oposite, opositable) <> (SessionInitialState.tupled, SessionInitialState.unapply)

  def bpFK        = foreignKey("ses_init_state_bprocess_fk", process, models.DAO.BPDAOF.bprocesses)(_.id, onDelete = ForeignKeyAction.Cascade)
  def procelemFK  = foreignKey("ses_init_state_procelem_fk", front_elem_id, models.DAO.sessions.SessionProcElementDAO.session_proc_elements)(_.id, onDelete = ForeignKeyAction.Cascade)
  def spaceelemFK = foreignKey("ses_init_state_spaceelem_fk", space_elem_id, models.DAO.sessions.SessionSpaceElemDAO.space_elements)(_.id, onDelete = ForeignKeyAction.Cascade)
  def spaceFK     = foreignKey("ses_init_state_space_fk", space_id, models.DAO.sessions.SessionSpaceDAO.session_spaces)(_.id, onDelete = ForeignKeyAction.Cascade)
  def sessionFK   = foreignKey("ses_init_state_session_fk", session,  models.DAO.BPSessionDAOF.bpsessions)(_.id, onDelete = ForeignKeyAction.Cascade)
}

object SessionInitialStateDAOF {
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
  val session_initial_states = TableQuery[SessionInitialStates]

  private def filterQuery(id: Int): Query[SessionInitialStates, SessionInitialState, Seq] =
    session_initial_states.filter(_.id === id)

}
object SessionInitialStateDAO {
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
  val session_initial_states = TableQuery[SessionInitialStates]

  private def filterQuery(id: Int): Query[SessionInitialStates, SessionInitialState, Seq] =
    session_initial_states.filter(_.id === id)

  private def filterQueryBP(id: Int): Query[SessionInitialStates, SessionInitialState, Seq] =
    session_initial_states.filter(_.process === id)

  private def filterQuerySession(id: Int): Query[SessionInitialStates, SessionInitialState, Seq] =
    session_initial_states.filter(_.session === id)

  private def filterQueryProcesses(processes: List[Int]): Query[SessionInitialStates, SessionInitialState, Seq] =
    session_initial_states.filter(_.process inSetBind processes)


  private def findOrCreateForElemQuery(titles: List[String],k: List[SessionInitialState], front_elem_id:Option[Int], space_elem_id:Option[Int]): Query[SessionInitialStates, SessionInitialState, Seq] =
    session_initial_states.filter(s => (s.title inSetBind titles) && (s.front_elem_id === front_elem_id) && (s.space_elem_id === space_elem_id) )
  private def findOrCreateForSpaceQuery(titles: List[String],k: List[SessionInitialState], space_id:Int): Query[SessionInitialStates, SessionInitialState, Seq] =
    session_initial_states.filter(s => (s.title inSetBind titles) && (s.space_id === space_id) )
  private def findOrCreateForProcessQuery(titles: List[String],k: List[SessionInitialState], process_id:Int): Query[SessionInitialStates, SessionInitialState, Seq] =
    session_initial_states.filter(s => (s.title inSetBind titles) && (s.process === process_id) && (s.process_state === true))





  def pull_object(s: SessionInitialState) =   {
    await( db.run(session_initial_states returning session_initial_states.map(_.id) += s))
  }

  def findByBP(id: Int):List[SessionInitialState] =   {
    await(db.run(filterQueryBP(id).result)).toList
  }

  def findBySession(id: Int):List[SessionInitialState] =   {
    await(db.run(filterQuerySession(id).result)).toList
  }

  def getByProcesses(processes: List[Int]) =   {
    await(db.run(filterQueryProcesses(processes).result)).toList
  }


  def findOrCreateForElem(k: List[SessionInitialState], front_elem_id:Option[Int], space_elem_id:Option[Int]):List[Int] =   {
     val titles = k.map(state => state.title)
     val existed = await(db.run(findOrCreateForElemQuery(titles,k,front_elem_id,space_elem_id).result)).toList
     val filtereds = k.filter(state => !(existed.map(_.title).contains(state.title)) )
     filtereds.map(filtered => pull_object(filtered))
  }

  def findOrCreateForSpace(k: List[SessionInitialState], space_id:Int):List[Int] =   {
     val titles = k.map(state => state.title)
     val existed = await(db.run(findOrCreateForSpaceQuery(titles, k,space_id).result)).toList
     val filtereds = k.filter(state => !(existed.map(_.title).contains(state.title)) )
     filtereds.map(filtered => pull_object(filtered))
  }

  def findOrCreateForProcess(k: List[SessionInitialState], process_id:Int):List[Int] =   {
     val titles = k.map(state => state.title)
     val existed = await(db.run(findOrCreateForProcessQuery(titles, k,process_id).result)).toList
     val filtereds = k.filter(state => !(existed.map(_.title).contains(state.title)) )
     filtereds.map(filtered => pull_object(filtered))
  }

  def get(k: Int):Option[SessionInitialState] =   {
    await(db.run(filterQuery(k).result.headOption))
  }


  def update(id: Int, bpsession: SessionInitialState) =   {
    val bpToUpdate: SessionInitialState = bpsession.copy(Option(id))
    await( db.run(session_initial_states.filter(_.id === id).update(bpToUpdate)))
  }
  def delete(id: Int) =   {
    await( db.run(session_initial_states.filter(_.id === id).delete))
  }


  val create: DBIO[Unit] = session_initial_states.schema.create
  val drop: DBIO[Unit] = session_initial_states.schema.drop
  def ddl_create = db.run(create)
  def ddl_drop = db.run(drop)


}
