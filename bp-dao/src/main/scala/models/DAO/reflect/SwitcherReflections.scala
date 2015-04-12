package models.DAO.reflect

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
  
import main.scala.bprocesses.refs.UnitRefs.{UnitSwitcherRef}
  
class SwitcherRefs(tag: Tag) extends Table[UnitSwitcherRef](tag, "switcher_refs") {
  def id = column[Int]("id", O.PrimaryKey, O.AutoInc) 
  def reflection = column[Int]("reflection_id")
  def switch_type = column[String]("switch_type")
  def priority = column[Int]("priority", O.Default(2))
  def state_ref = column[Int]("state_ref_id")
  def fn = column[String]("fn")
  def target = column[String]("target")  
  def override_group = column[Int]("override_group", O.Default(0))
    
  def created_at = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at = column[Option[org.joda.time.DateTime]]("updated_at")  

  def reflectFK = foreignKey("reflect_fk", reflection, models.DAO.reflect.RefDAO.refs)(_.id, onDelete = ForeignKeyAction.Cascade)

  def * = (id.?, 
reflection, 
switch_type, 
priority,           
state_ref,
fn,
target,
override_group,
created_at, updated_at) <> (UnitSwitcherRef.tupled, UnitSwitcherRef.unapply)

  def state_refFK = foreignKey("state_ref_fk", state_ref, models.DAO.reflect.BPStateRefDAO.state_refs)(_.id, onDelete = ForeignKeyAction.Cascade)
//def session_state_refFK = foreignKey("session_state_ref_fk", session_state_ref, SpaceElementReflectionDAO.space_element_reflections)(_.id, onDelete = ForeignKeyAction.Cascade)

}


object SwitcherRefDAO {
  /**
   * Actions
   */
  import scala.util.Try

  import DatabaseCred.database
  import models.DAO.conversion.Implicits._



  val switcher_refs = TableQuery[SwitcherRefs]

  def pull_object(s: UnitSwitcherRef) = database withSession {
    implicit session ⇒
      switcher_refs returning switcher_refs.map(_.id) += s
  }
  def get(k: Int):Option[UnitSwitcherRef] = database withSession {
    implicit session ⇒
      val q3 = for { s ← switcher_refs if s.id === k } yield s
      q3.list.headOption 
  }
  def findByRef(id: Int) = {
     database withSession { implicit session =>
       val q3 = for { s ← switcher_refs if s.reflection === id } yield s
       q3.list                   
    } 
  }
  def retrive(k: Int, process: Int, state_ref: Int, sess: Option[Int] = None):List[UnitSwitcher] = database withSession {
    implicit session =>
      findByRef(k).map(e => e.reflect(process, state_ref, sess))

  }
  def update(id: Int, switcher: UnitSwitcherRef) = database withSession { implicit session ⇒
    val switcherToUpdate: UnitSwitcherRef = switcher.copy(Option(id))
    switcher_refs.filter(_.id === id).update(switcherToUpdate)
  }
  def delete(id: Int) = database withSession { implicit session ⇒
    switcher_refs.filter(_.id === id).delete
  }
  def count: Int = database withSession { implicit session ⇒
    Query(switcher_refs.length).first
  }

  def ddl_create = {
    database withSession {
      implicit session =>
      switcher_refs.ddl.create
    }
  }
  def ddl_drop = {
    database withSession {
      implicit session =>
       switcher_refs.ddl.drop
    }
  }

  def getAll = database withSession {
    implicit session ⇒
      val q3 = for { s ← switcher_refs } yield s
      q3.list.sortBy(_.id)
  }
}