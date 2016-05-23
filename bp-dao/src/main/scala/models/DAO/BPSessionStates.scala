package models.DAO

import main.scala.bprocesses.{BProcess, BPLoggerResult}
import main.scala.simple_parts.process.ProcElems
//import com.github.tminglei.slickpg.date.PgDateJdbcTypes
import slick.model.ForeignKeyAction
import models.DAO.ProcElemDAO._
import models.DAO.BPDAO._
import models.DAO.BPStationDAO._
import models.DAO.conversion.DatabaseCred
import main.scala.bprocesses._
import main.scala.bprocesses.{BPState, BPSessionState}

import models.DAO.conversion.DatabaseFuture._
import com.github.nscala_time.time.Imports._
import models.DAO.conversion.DatabaseCred.dbConfig.driver.api._
import com.github.tototoshi.slick.PostgresJodaSupport._

class BPSessionStates(tag: Tag) extends Table[BPSessionState](tag, "sessionstates") {
  def id            = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def process       = column[Int]("process_id")
  def session       = column[Int]("session_id")
  def title         = column[String]("title")
  def neutral       = column[String]("neutral")
  def process_state = column[Boolean]("is_process_state", O.Default(false))

  def on            = column[Boolean]("on", O.Default(false))
  def on_rate       = column[Int]("on_rate", O.Default(0))

  def space_id      = column[Option[Int]]("space_id")
  def front_elem_id = column[Option[Int]]("front_elem_id")
  def space_elem_id = column[Option[Int]]("space_elem_id")

  def origin_state  = column[Option[Int]]("origin_state_id")
  def created_at    = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at    = column[Option[org.joda.time.DateTime]]("updated_at")

  def middle        = column[String]("middle", O.Default(""))
  def middleable    = column[Boolean]("middleable", O.Default(false))
  def oposite       = column[String]("oposite", O.Default(""))
  def opositable    = column[Boolean]("opositable", O.Default(false))

  def s_front_elem_id = column[Option[Int]]("session_front_elem_id")
  def s_space_id      = column[Option[Int]]("session_space_id")
  def s_space_elem_id = column[Option[Int]]("session_space_elem_id")

  def lang          = column[String]("lang", O.Default("en"))

   def session_elements = (s_front_elem_id,s_space_id,s_space_elem_id).<>[Option[SessionElements], (Option[Int], Option[Int], Option[Int])]({
     case (Some(lt), Some(ln), Some(fn)) => Some(SessionElements(Some(lt), Some(ln), Some(fn)))
     case (Some(lt), Some(ln), None) => Some(SessionElements(Some(lt), Some(ln), None))
     case (Some(lt), None, Some(fn)) => Some(SessionElements(Some(lt), None, Some(fn)))
     case (None, Some(ln), Some(fn)) => Some(SessionElements(None, Some(ln), Some(fn)))
     case (None, None, Some(fn)) =>     Some(SessionElements(None, None, Some(fn)))
     case (Some(lt), None, None) =>     Some(SessionElements(Some(lt), None, None))
     case (None, Some(ln), None) =>     Some(SessionElements(None, Some(ln), None))
     case (None, None, None) =>     Some(SessionElements(None, None, None))

     case _ => None
   }, { (t: Option[SessionElements]) => {
            t map(o => (o.s_front_elem_id, o.s_space_id, o.s_space_elem_id))
         }
    })

/*
 def session_elements = (s_front_elem_id,s_space_id,s_space_elem_id).<>[Option[SessionElements], (Option[Int], Option[Int], Option[Int])](
    { mappedRecord =>
      mappedRecord match {
        case (Some(s_front_elem_id), Some(s_space_id), Some(s_space_elem_id)) => {
          Some(SessionElements(s_front_elem_id, s_space_id, s_space_elem_id))
        }
        case _ => None
      }
    },
    { result =>
      result match {
        case rec: Option[SessionElements] => Some(rec.map(_.s_front_elem_id), rec.map(_.s_space_id), rec.map(_.s_space_elem_id))
      }
    })
*/


  def * = (id.?, process, session, title, neutral,
                                          process_state,
                                          on, on_rate,
                                          front_elem_id,
                                          space_elem_id,
                                          space_id,
                                          origin_state,
           created_at, updated_at, lang, middle, middleable, oposite, opositable,
            session_elements) <> (BPSessionState.tupled, BPSessionState.unapply)
  def sesFK       = foreignKey("s_st_session_fk", session,  models.DAO.BPSessionDAOF.bpsessions)(_.id, onDelete = ForeignKeyAction.Cascade)
  def procelemFK  = foreignKey("s_st_procelem_fk", front_elem_id, proc_elements)(_.id)
  def spaceelemFK = foreignKey("s_st_spaceelem_fk", space_elem_id, SpaceElemDAO.space_elements)(_.id)
  def spaceFK     = foreignKey("s_st_space_fk", space_id, BPSpaceDAO.bpspaces)(_.id)
  def sesPElemFK  = foreignKey("sesPElemFK", s_front_elem_id, models.DAO.sessions.SessionProcElementDAO.session_proc_elements)(_.id, onDelete = ForeignKeyAction.Cascade)
  def sesSpaceFK  = foreignKey("sesSpaceFK", s_space_id, models.DAO.sessions.SessionSpaceDAO.session_spaces)(_.id, onDelete = ForeignKeyAction.Cascade)
  def sesSpElemFK = foreignKey("sesSpElemFK",s_space_elem_id, models.DAO.sessions.SessionSpaceElemDAO.space_elements)(_.id, onDelete = ForeignKeyAction.Cascade)
  def stateFK     = foreignKey("s_st_state_fk", origin_state, SessionInitialStateDAO.session_initial_states)(_.id)

  def bpFK        = foreignKey("s_st_bprocess_fk", process, models.DAO.BPDAOF.bprocesses)(_.id, onDelete = ForeignKeyAction.Cascade)

}
object BPSessionStateDAOF {
  import akka.actor.ActorSystem
  import slick.backend.{StaticDatabaseConfig, DatabaseConfig}
  import slick.jdbc.meta.MTable
  import scala.concurrent.ExecutionContext.Implicits.global
  import scala.concurrent.duration.Duration
  import scala.concurrent.{ExecutionContext, Awaitable, Await, Future}
  import scala.util.Try

  //import dbConfig.driver.api._ //
  def await[T](a: Awaitable[T])(implicit ec: ExecutionContext) = Await.result(a, Duration.Inf)
  def awaitAndPrint[T](a: Awaitable[T])(implicit ec: ExecutionContext) = println(await(a))
  val sessionstates = TableQuery[BPSessionStates]

  private def filterQuery(id: Int): Query[BPSessionStates, BPSessionState, Seq] =
    sessionstates.filter(_.id === id)
  private def filterQuerySession(id: Int): Query[BPSessionStates, BPSessionState, Seq] =
    sessionstates.filter(_.session === id)
  private def filterQueryProcess(id: Int): Query[BPSessionStates, BPSessionState, Seq] =
    sessionstates.filter(_.process === id)

  private def filterQueryOrigin(id: Int): Query[BPSessionStates, BPSessionState, Seq] =
    sessionstates.filter(_.origin_state === id)
  private def filterQueryOrigins(ids: List[Int]): Query[BPSessionStates, BPSessionState, Seq] =
    sessionstates.filter(_.origin_state inSetBind ids)
  private def filterQueryProcesses(ids: List[Int]): Query[BPSessionStates, BPSessionState, Seq] =
    sessionstates.filter(_.process inSetBind ids)

  private def findByOriginAndSessionQuery(origin_state_id: Option[Int], session_id: Int) = {
        sessionstates.filter(s => (s.origin_state === origin_state_id) && (s.session === session_id) )
  }

  private def filterByProcSesQuery(id: Int, session_id: Int): Query[BPSessionStates, BPSessionState, Seq] =
    sessionstates.filter(s => s.process === id && s.session === session_id)
  private def filterByProcsSessQuery(ids: List[Int], session_id: List[Int]): Query[BPSessionStates, BPSessionState, Seq] =
    sessionstates.filter(s => (s.process inSetBind ids) && (s.session inSetBind session_id))

  def findByBPAndSession(id: Int, session_id: Int):Future[Seq[BPSessionState]] =
      db.run(filterByProcSesQuery(id, session_id).result)

  def findByBPSAndSessions(ids: List[Int], session_id: List[Int]):Future[Seq[BPSessionState]] =
      db.run(filterByProcsSessQuery(ids, session_id).result)

  def pull(s: BPSessionState):Future[Int] =
     db.run(sessionstates returning sessionstates.map(_.id) += s)

  def pull_object(s: BPSessionState) =
    await( pull(s) )




  /**
   * Filter session state with existed entity, for avoiding possible override
   * @param s BPSessionState
   * @return id
   */
  def pull_new_object(s: BPSessionState):Int = {
      findByOriginAndSession(s.origin_state, s.session) match {
        case Some(session_state) => -1
        case _ => await( db.run(sessionstates returning sessionstates.map(_.id) += s) )
      }
  }

  def findByBP(id: Int):List[BPSessionState] = {
    await( db.run(filterQueryProcess(id).result) ).toList
  }

  def findBySession(id: Int):List[BPSessionState] = {
    await( db.run(filterQuerySession(id).result) ).toList
  }

  def findByOriginAndSession(origin_state_id: Option[Int], session_id: Int):Option[BPSessionState] = {
      origin_state_id match {
        case Some(id) => {
          await( db.run(findByOriginAndSessionQuery(origin_state_id, session_id).result.headOption) )
        }
        case _ => None
      }
  }

  def getByProcesses(processes: List[Int]) = {
    await( db.run(filterQueryProcesses(processes).result) ).toList
  }

  def findByOriginIds(ids: List[Int]) = {
    await(db.run(filterQueryOrigins(ids).result) ).toList
  }

  def findByOriginId(id: Int) = {
    await(db.run(filterQueryOrigin(id).result.headOption) ).toList
  }

  def get(k: Int):Future[Option[BPSessionState]] =
      db.run(filterQuery(k).result.headOption)

  def update(id: Int, bpsession: BPSessionState) = {
    val bpToUpdate: BPSessionState = bpsession.copy(Option(id))
    db.run( sessionstates.filter(_.id === id).update(bpToUpdate) )
  }

  def updateB(id: Int, bpsession: BPSessionState) = {
    val bpToUpdate: BPSessionState = bpsession.copy(Option(id))
    await( db.run( sessionstates.filter(_.id === id).update(bpToUpdate) ) )
  }

  def deleteB(id: Int) = await( db.run( sessionstates.filter(_.id === id).delete ) )
  def delete(id: Int) = db.run( sessionstates.filter(_.id === id).delete )



  val create: DBIO[Unit] = sessionstates.schema.create
  val drop: DBIO[Unit] = sessionstates.schema.drop

  def ddl_create = db.run(create)
  def ddl_drop = db.run(drop)

}
