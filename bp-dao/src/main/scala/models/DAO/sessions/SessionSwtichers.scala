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
  
import main.scala.simple_parts.process.Units._
  
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
def session_state_refFK = foreignKey("sw_session_state_fk", session_state, BPSessionStateDAO.sessionstates)(_.id, onDelete = ForeignKeyAction.Cascade)
def sessionFK  = foreignKey("sw_s_sp_session_fk", session, models.DAO.BPSessionDAO.bpsessions)(_.id, onDelete = ForeignKeyAction.Cascade)

}


object SessionSwitcherDAO {
  /**
   * Actions
   */
  import scala.util.Try

  import DatabaseCred.database
  import models.DAO.conversion.Implicits._



  val session_switchers = TableQuery[SessionSwitchers]

  def pull_object(s: SessionUnitSwitcher) = database withSession {
    implicit session ⇒
      session_switchers returning session_switchers.map(_.id) += s
  }
  def get(k: Int):Option[SessionUnitSwitcher] = database withSession {
    implicit session ⇒
      val q3 = for { s ← session_switchers if s.id === k } yield s
      q3.list.headOption 
  }
  def findByBPId(id: Int) = {
    database withSession { implicit session =>
     val q3 = for { st ← session_switchers if st.process === id } yield st// <> (BPStationDTO.tupled, BPStationDTO.unapply _)\
      q3.list
    }
  }
  def findBySession(id: Int) = {
    database withSession { implicit session =>
     val q3 = for { st ← session_switchers if st.session === id } yield st
      q3.list
    }
  }  
  def update(id: Int, switcher: SessionUnitSwitcher) = database withSession { implicit session ⇒
    val switcherToUpdate: SessionUnitSwitcher = switcher.copy(Option(id))
    session_switchers.filter(_.id === id).update(switcherToUpdate)
  }
  def delete(id: Int) = database withSession { implicit session ⇒
    session_switchers.filter(_.id === id).delete
  }
  def count: Int = database withSession { implicit session ⇒
    Query(session_switchers.length).first
  }

  def ddl_create = {
    database withSession {
      implicit session =>
      session_switchers.ddl.create
    }
  }
  def ddl_drop = {
    database withSession {
      implicit session =>
       session_switchers.ddl.drop
    }
  }

  def getAll = database withSession {
    implicit session ⇒
      val q3 = for { s ← session_switchers } yield s
      q3.list.sortBy(_.id)
  }
}
