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
  
import main.scala.bprocesses.refs.UnitRefs.{UnitReactionRef, UnitReactionStateOutRef}
  
class ReactionRefs(tag: Tag) extends Table[UnitReactionRef](tag, "reaction_refs") {
  def id = column[Int]("id", O.PrimaryKey, O.AutoInc) 
  def reflection = column[Int]("reflection_id")
  def autostart = column[Boolean]("autostart")
  def element = column[Int]("element_id")
  def from_state = column[Option[Int]]("state_ref_id")
  def title = column[String]("title")  
    
  def created_at = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at = column[Option[org.joda.time.DateTime]]("updated_at")  

  def elementFK = foreignKey("element_fk", element, models.DAO.reflect.ReflectElemTopologDAO.reflected_elem_topologs)(_.id, onDelete = ForeignKeyAction.Cascade)
  def reflectFK = foreignKey("reflect_fk", reflection, models.DAO.reflect.RefDAO.refs)(_.id, onDelete = ForeignKeyAction.Cascade)
  def stateFK = foreignKey("state_fk", from_state, models.DAO.reflect.BPStateRefDAO.state_refs)(_.id, onDelete = ForeignKeyAction.Cascade)

  def * = (id.?, 
           reflection, 
           autostart, 
           element,
           from_state,
           title,
           created_at, updated_at) <> (UnitReactionRef.tupled, UnitReactionRef.unapply)

}


object ReactionRefDAO {
  import scala.util.Try
  import DatabaseCred.database
  import models.DAO.conversion.Implicits._
  val reaction_refs = TableQuery[ReactionRefs]

  def pull_object(s: UnitReactionRef) = database withSession {
    implicit session ⇒
      reaction_refs returning reaction_refs.map(_.id) += s
  }
  def get(k: Int):Option[UnitReactionRef] = database withSession {
    implicit session ⇒
      val q3 = for { s ← reaction_refs if s.id === k } yield s
      q3.list.headOption 
  }
  def findByRef(id: Int) = {
     database withSession { implicit session =>
       val q3 = for { s ← reaction_refs if s.reflection === id } yield s
       q3.list                   
    } 
  }
  def retrive(k: Int, process: Int, element: Int, from_state: Option[Int]):List[UnitReaction] = database withSession {
    implicit session =>
      findByRef(k).map(e => e.reflect(process, element, from_state))

  }
  def update(id: Int, switcher: UnitReactionRef) = database withSession { implicit session ⇒
    val switcherToUpdate: UnitReactionRef = switcher.copy(Option(id))
    reaction_refs.filter(_.id === id).update(switcherToUpdate)
  }
  def delete(id: Int) = database withSession { implicit session ⇒
    reaction_refs.filter(_.id === id).delete
  }
  def count: Int = database withSession { implicit session ⇒
    Query(reaction_refs.length).first
  }

  def ddl_create = {
    database withSession {
      implicit session =>
      reaction_refs.ddl.create
    }
  }
  def ddl_drop = {
    database withSession {
      implicit session =>
       reaction_refs.ddl.drop
    }
  }
  def getAll = database withSession {
    implicit session ⇒
      val q3 = for { s ← reaction_refs } yield s
      q3.list.sortBy(_.id)
  }
}




class ReactionStateOutRefs(tag: Tag) extends Table[UnitReactionStateOutRef](tag, "reaction_state_out_refs") {
  def id = column[Int]("id", O.PrimaryKey, O.AutoInc) 
  def reaction = column[Int]("reaction_id")
  def state_ref = column[Int]("state_ref")
  def on = column[Boolean]("on")
  def on_rate = column[Int]("on_rate")

    
  def created_at = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at = column[Option[org.joda.time.DateTime]]("updated_at")  


  def * = (id.?,
    state_ref,
    reaction,
    on,
    on_rate,
    created_at, updated_at) <> (UnitReactionStateOutRef.tupled, UnitReactionStateOutRef.unapply)

  def reaction_refFK = foreignKey("reaction_ref_fk", reaction, models.DAO.reflect.ReactionRefDAO.reaction_refs)(_.id, onDelete = ForeignKeyAction.Cascade)
  def state_refFK = foreignKey("state_ref_fk", state_ref, models.DAO.reflect.BPStateRefDAO.state_refs)(_.id, onDelete = ForeignKeyAction.Cascade)
//def session_state_refFK = foreignKey("session_state_ref_fk", session_state_ref, SpaceElementReflectionDAO.space_element_reflections)(_.id, onDelete = ForeignKeyAction.Cascade)

}


object ReactionStateOutRefDAO {
  import scala.util.Try
  import DatabaseCred.database
  import models.DAO.conversion.Implicits._
  val reaction_state_out_refs = TableQuery[ReactionStateOutRefs]

  def pull_object(s: UnitReactionStateOutRef) = database withSession {
    implicit session ⇒
      reaction_state_out_refs returning reaction_state_out_refs.map(_.id) += s
  }
  def get(k: Int):Option[UnitReactionStateOutRef] = database withSession {
    implicit session ⇒
      val q3 = for { s ← reaction_state_out_refs if s.id === k } yield s
      q3.list.headOption 
  }
  def findByReactionRef(id: Int) = {
     database withSession { implicit session =>
       val q3 = for { s ← reaction_state_out_refs if s.reaction === id } yield s
       q3.list                   
    } 
  }
  def findByReactionRefs(ids: List[Int]) = {
     database withSession { implicit session =>
       val q3 = for { s ← reaction_state_out_refs if s.reaction inSetBind ids } yield s
       q3.list                   
    } 
  }
  def retrive(k: Int, state_ref: Int, reaction: Int):List[UnitReactionStateOut] = database withSession {
    implicit session =>
      findByReactionRef(k).map(e => e.reflect(state_ref, reaction))

  }
  def update(id: Int, switcher: UnitReactionStateOutRef) = database withSession { implicit session ⇒
    val switcherToUpdate: UnitReactionStateOutRef = switcher.copy(Option(id))
    reaction_state_out_refs.filter(_.id === id).update(switcherToUpdate)
  }
  def delete(id: Int) = database withSession { implicit session ⇒
    reaction_state_out_refs.filter(_.id === id).delete
  }
  def count: Int = database withSession { implicit session ⇒
    Query(reaction_state_out_refs.length).first
  }

  def ddl_create = {
    database withSession {
      implicit session =>
      reaction_state_out_refs.ddl.create
    }
  }
  def ddl_drop = {
    database withSession {
      implicit session =>
       reaction_state_out_refs.ddl.drop
    }
  }
  def getAll = database withSession {
    implicit session ⇒
      val q3 = for { s ← reaction_state_out_refs } yield s
      q3.list.sortBy(_.id)
  }
}