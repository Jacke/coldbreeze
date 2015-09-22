package models.DAO

import main.scala.bprocesses.{BProcess, BPLoggerResult}
import main.scala.simple_parts.process.ProcElems
import models.DAO.driver.MyPostgresDriver.simple._
import com.github.nscala_time.time.Imports._
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

  def bpFK        = foreignKey("ses_init_state_bprocess_fk", process, models.DAO.BPDAO.bprocesses)(_.id, onDelete = ForeignKeyAction.Cascade)
  def procelemFK  = foreignKey("ses_init_state_procelem_fk", front_elem_id, models.DAO.sessions.SessionProcElementDAO.session_proc_elements)(_.id, onDelete = ForeignKeyAction.Cascade)
  def spaceelemFK = foreignKey("ses_init_state_spaceelem_fk", space_elem_id, models.DAO.sessions.SessionSpaceElemDAO.space_elements)(_.id, onDelete = ForeignKeyAction.Cascade)
  def spaceFK     = foreignKey("ses_init_state_space_fk", space_id, models.DAO.sessions.SessionSpaceDAO.session_spaces)(_.id, onDelete = ForeignKeyAction.Cascade)
  def sessionFK   = foreignKey("ses_init_state_session_fk", session, models.DAO.BPSessionDAO.bpsessions)(_.id, onDelete = ForeignKeyAction.Cascade)
}


object SessionInitialStateDAO {
  import scala.util.Try
  import DatabaseCred.database
  import models.DAO.conversion.Implicits._

  val session_initial_states = TableQuery[SessionInitialStates]

  def pull_object(s: SessionInitialState) = database withSession {
    implicit session ⇒
      session_initial_states returning session_initial_states.map(_.id) += s
  }

  def findByBP(id: Int):List[SessionInitialState] = database withSession {
    implicit session =>
    val q3 = for { s <- session_initial_states if s.process === id } yield s
    q3.list
  }
  def findBySession(id: Int):List[SessionInitialState] = database withSession {
    implicit session =>
    val q3 = for { s <- session_initial_states if s.session === id } yield s
    q3.list
  }  
  def getByProcesses(processes: List[Int]) = database withSession {
    implicit session =>
      val q3 = for { s ← session_initial_states if s.process inSetBind processes } yield s
      q3.list
  }

  def findOrCreateForElem(k: List[SessionInitialState], front_elem_id:Option[Int], space_elem_id:Option[Int]):List[Int] = database withSession {
    implicit session =>
     val titles = k.map(state => state.title)
     val q3 = for { s <- session_initial_states if (s.title inSetBind titles) && (s.front_elem_id === front_elem_id) && (s.space_elem_id === space_elem_id) } yield s
     val existed = q3.list
     val filtereds = k.filter(state => !(existed.map(_.title).contains(state.title)) )
     filtereds.map(filtered => pull_object(filtered))
  }

  def findOrCreateForSpace(k: List[SessionInitialState], space_id:Int):List[Int] = database withSession {
    implicit session =>
     val titles = k.map(state => state.title)
     val q3 = for { s <- session_initial_states if (s.title inSetBind titles) && (s.space_id === space_id) } yield s
     val existed = q3.list
     val filtereds = k.filter(state => !(existed.map(_.title).contains(state.title)) )
     filtereds.map(filtered => pull_object(filtered))
  }
  def findOrCreateForProcess(k: List[SessionInitialState], process_id:Int):List[Int] = database withSession {
    implicit session =>
     val titles = k.map(state => state.title)
     val q3 = for { s <- session_initial_states if (s.title inSetBind titles) && (s.process === process_id) && (s.process_state === true) } yield s
     val existed = q3.list
     val filtereds = k.filter(state => !(existed.map(_.title).contains(state.title)) )
     filtereds.map(filtered => pull_object(filtered))
  }
  def get(k: Int):Option[SessionInitialState] = database withSession {
    implicit session ⇒
      val q3 = for { s ← session_initial_states if s.id === k } yield s
      q3.list.headOption 
  }

  def update(id: Int, bpsession: SessionInitialState) = database withSession { implicit session ⇒
    val bpToUpdate: SessionInitialState = bpsession.copy(Option(id))
    session_initial_states.filter(_.id === id).update(bpToUpdate)
  }
  def delete(id: Int) = database withSession { implicit session ⇒
    session_initial_states.filter(_.id === id).delete
  }
  def count: Int = database withSession { implicit session ⇒
    Query(session_initial_states.length).first
  }

  def ddl_create = {
    database withSession {
      implicit session =>
      session_initial_states.ddl.create
    }
  }
  def ddl_drop = {
    database withSession {
      implicit session =>
       session_initial_states.ddl.drop
    }
  }

  def getAll = database withSession {
    implicit session ⇒
      val q3 = for { s ← session_initial_states } yield s
      q3.list.sortBy(_.id)
  }
}