package models.DAO.reflect

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
  
import main.scala.bprocesses.refs.{BPStateRef} 
import main.scala.bprocesses.refs._
import main.scala.bprocesses._ 
class StateRefs(tag: Tag) extends Table[BPStateRef](tag, "state_refs") {
  def id          = column[Int]("id", O.PrimaryKey, O.AutoInc) 
  def reflection  = column[Int]("reflection_id")
  def title       = column[String]("title")
  def neutral     = column[String]("neutral")
  def process_state = column[Boolean]("process_state", O.Default(false))
  def on          = column[Boolean]("on", O.Default(false)) 
  def on_rate     = column[Int]("on_rate", O.Default(0))   
    
  def space_id      = column[Option[Int]]("ref_space_id")  
  def front_elem_id = column[Option[Int]]("ref_front_elem_id")
  def space_elem_id = column[Option[Int]]("ref_space_elem_id")
    
 
  def middle      = column[String]("middle", O.Default(""))
  def middleable  = column[Boolean]("middleable", O.Default(false))   
  def oposite     = column[String]("oposite", O.Default(""))
  def opositable  = column[Boolean]("opositable", O.Default(false))   

  def created_at  = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at  = column[Option[org.joda.time.DateTime]]("updated_at")  

  def reflectFK   = foreignKey("reflect_fk", reflection, models.DAO.reflect.RefDAO.refs)(_.id, onDelete = ForeignKeyAction.Cascade)
  def ref_procelemFK  = foreignKey("ref_procelem_fk", front_elem_id, ProcElemReflectionDAO.proc_element_reflections)(_.id, onDelete = ForeignKeyAction.Cascade)
  def ref_spaceelemFK = foreignKey("ref_spaceelem_fk", space_elem_id, SpaceElementReflectionDAO.space_element_reflections)(_.id, onDelete = ForeignKeyAction.Cascade)
  def spaceFK         = foreignKey("ref_space_fk", space_elem_id, SpaceReflectionDAO.space_refs)(_.id, onDelete = ForeignKeyAction.Cascade)

  def lang        = column[String]("lang", O.Default("en"))  
/*

var id:Option[Int], 
  reflection:   Int,
  title:        String, 
  var neutral: String = "",
  process_state:Boolean = false,
  front_elem_id:Option[Int],
  space_elem_id:Option[Int],
  created_at:   Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now), 
  updated_at:   Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now), 
  lang:         String = "en"*/
    
  def * = (id.?, 
reflection, 
title, 
neutral,
process_state,
on,
on_rate,
front_elem_id,
space_elem_id,
space_id,
created_at, updated_at, 
lang,
middle,
middleable,
oposite,
opositable) <> (BPStateRef.tupled, BPStateRef.unapply)

}


object BPStateRefDAO {
  /**
   * Actions
   */
  import scala.util.Try

  import DatabaseCred.database
  import models.DAO.conversion.Implicits._



  val state_refs = TableQuery[StateRefs]

  def pull_object(s: BPStateRef) = database withSession {
    implicit session ⇒
      state_refs returning state_refs.map(_.id) += s
  }
  def get(k: Int):Option[BPStateRef] = database withSession {
    implicit session ⇒
      val q3 = for { s ← state_refs if s.id === k } yield s
      q3.list.headOption 
  }
  def findByRef(id: Int) = {
     database withSession { implicit session =>
       val q3 = for { s ← state_refs if s.reflection === id } yield s
       q3.list                   
    } 
  }
  def findOrCreateForElem(k: List[BPStateRef], front_elem_id:Option[Int], space_elem_id:Option[Int]):List[Int] = database withSession {
    implicit session =>
     val titles = k.map(state => state.title)
     val q3 = for { s <- state_refs if (s.title inSetBind titles) && (s.front_elem_id === front_elem_id) && (s.space_elem_id === space_elem_id) } yield s
     val existed = q3.list
     val filtereds = k.filter(state => existed.map(_.title).contains(state.title) )
     filtereds.map(filtered => pull_object(filtered))
  }
  def findOrCreateForSpace(k: List[BPStateRef], space_id:Int):List[Int] = database withSession {
    implicit session =>
     val titles = k.map(state => state.title)
     val q3 = for { s <- state_refs if (s.title inSetBind titles) && (s.space_id === space_id) } yield s
     val existed = q3.list
     val filtereds = k.filter(state => existed.map(_.title).contains(state.title) )
     filtereds.map(filtered => pull_object(filtered))
  }
  def retrive(k: Int, process: Int, front_elem_id:Option[Int],
  space_elem_id:Option[Int], state_id:Option[Int]):List[BPState] = database withSession {
    implicit session =>
      findByRef(k).map(e => e.reflect(process, front_elem_id, space_elem_id, state_id))

  }
  def update(id: Int, bpsession: BPStateRef) = database withSession { implicit session ⇒
    val bpToUpdate: BPStateRef = bpsession.copy(Option(id))
    state_refs.filter(_.id === id).update(bpToUpdate)
  }
  def delete(id: Int) = database withSession { implicit session ⇒
    state_refs.filter(_.id === id).delete
  }
  def count: Int = database withSession { implicit session ⇒
    Query(state_refs.length).first
  }

  def ddl_create = {
    database withSession {
      implicit session =>
      state_refs.ddl.create
    }
  }
  def ddl_drop = {
    database withSession {
      implicit session =>
       state_refs.ddl.drop
    }
  }

  def getAll = database withSession {
    implicit session ⇒
      val q3 = for { s ← state_refs } yield s
      q3.list.sortBy(_.id)
  }
}