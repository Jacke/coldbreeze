package models.DAO
  
import main.scala.bprocesses.{BProcess, BPLoggerResult}
import main.scala.simple_parts.process.ProcElems
import models.DAO.driver.MyPostgresDriver.simple._
import com.github.nscala_time.time.Imports._
//import com.github.tminglei.slickpg.date.PgDateJdbcTypes
import scala.slick.model.ForeignKeyAction

import models.DAO.ProcElemDAO._
import models.DAO.BPDAO._
import models.DAO.BPStationDAO._
import models.DAO.conversion.DatabaseCred
  
import main.scala.simple_parts.process.Units._
  
class BPSwitchers(tag: Tag) extends Table[UnitSwitcher](tag, "bpswitchers") {
  def id = column[Int]("id", O.PrimaryKey, O.AutoInc) 
  def process = column[Int]("bprocess_id")
  def switch_type = column[String]("switch_type")
  def priority = column[Int]("priority", O.Default(2))
  def state = column[Int]("state_id")
  def session_state = column[Option[Int]]("session_state", O.Default(None))
  def fn = column[String]("fn")
  def target = column[String]("target")
    
  def created_at = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at = column[Option[org.joda.time.DateTime]]("updated_at")  

  def * = (id.?, 
process, 
switch_type, 
priority,           
state,
session_state, 
fn,
target,          
created_at, updated_at) <> (UnitSwitcher.tupled, UnitSwitcher.unapply)

def stateFK = foreignKey("statefk", state, models.DAO.BPStateDAO.bpstates)(_.id, onDelete = ForeignKeyAction.Cascade)
def session_state_refFK = foreignKey("session_state_fk", session_state, BPSessionStateDAO.sessionstates)(_.id, onDelete = ForeignKeyAction.Cascade)

}


object SwitcherDAO {
  /**
   * Actions
   */
  import scala.util.Try

  import DatabaseCred.database
  import models.DAO.conversion.Implicits._



  val switchers = TableQuery[BPSwitchers]

  def pull_object(s: UnitSwitcher) = database withSession {
    implicit session ⇒
      switchers returning switchers.map(_.id) += s
  }
  def get(k: Int):Option[UnitSwitcher] = database withSession {
    implicit session ⇒
      val q3 = for { s ← switchers if s.id === k } yield s
      q3.list.headOption 
  }
  def findByBPId(id: Int) = {
    database withSession { implicit session =>
     val q3 = for { st ← switchers if st.process === id } yield st// <> (BPStationDTO.tupled, BPStationDTO.unapply _)

      q3.list
    }
  }
  def update(id: Int, switcher: UnitSwitcher) = database withSession { implicit session ⇒
    val switcherToUpdate: UnitSwitcher = switcher.copy(Option(id))
    switchers.filter(_.id === id).update(switcherToUpdate)
  }
  def delete(id: Int) = database withSession { implicit session ⇒
    switchers.filter(_.id === id).delete
  }
  def count: Int = database withSession { implicit session ⇒
    Query(switchers.length).first
  }

  def ddl_create = {
    database withSession {
      implicit session =>
      switchers.ddl.create
    }
  }
  def ddl_drop = {
    database withSession {
      implicit session =>
       switchers.ddl.drop
    }
  }

  def getAll = database withSession {
    implicit session ⇒
      val q3 = for { s ← switchers } yield s
      q3.list.sortBy(_.id)
  }
}
