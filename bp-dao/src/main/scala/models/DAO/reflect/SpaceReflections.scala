package models.DAO.reflect


import models.DAO.driver.MyPostgresDriver.simple._
import slick.model.ForeignKeyAction
import com.github.nscala_time.time.Imports._
import models.DAO.BPDAO._
import models.DAO.resources.BusinessDTO._
import com.github.tminglei.slickpg.composite._
import models.DAO.conversion.{DatabaseCred, Implicits}
import main.scala.simple_parts.process.Units._
  
import main.scala.bprocesses.refs.UnitRefs._  

class SpaceReflections(tag: Tag) extends Table[UnitSpaceRef](tag, "space_refs") {

  def id          = column[Int]("id", O.PrimaryKey, O.AutoInc) // This is the primary key column
  def reflection  = column[Int]("reflection_id")
  def index       = column[Int]("index")
  def container   = column[Boolean]("container")
  def subbrick    = column[Boolean]("subbrick")
  def brick_front = column[Option[Int]]("brick_front")
  def brick_nested= column[Option[Int]]("brick_nested")
    
  def nestingLevel= column[Int]("nestingLevel")
  
    
  def created_at  = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at  = column[Option[org.joda.time.DateTime]]("updated_at")  
    
    
  def reflectFK   = foreignKey("reflect_fk", reflection, models.DAO.reflect.RefDAO.refs)(_.id, onDelete = ForeignKeyAction.Cascade)

    
  def * = (id.?, 
reflection,
index,
container,
subbrick,
brick_front,
brick_nested,
nestingLevel,
created_at, 
updated_at) <> (UnitSpaceRef.tupled, UnitSpaceRef.unapply)

}

import main.scala.simple_parts.process._
import main.scala.bprocesses._





/**
 * Actions
 */
object SpaceReflectionDAO {
  import DatabaseCred.database
  import models.DAO.BPDAO.bprocesses


  val space_refs = TableQuery[SpaceReflections]

  def pull_object(s: UnitSpaceRef) = database withSession {
    implicit session ⇒
      space_refs returning space_refs.map(_.id) += s
  }
  def lastIndexOfSpace(id: Int) = database withSession {
    implicit session =>
      val q3 = for { s ← space_refs if s.id === id } yield s
      val xs = q3.list.map(_.index)

      if (xs.isEmpty) 1
      else xs.max + 1
  }
  def findById(id: Int) = {
     database withSession { implicit session =>
       val q3 = for { s ← space_refs if s.id === id } yield s
       q3.list.headOption                   
    } 
  }
  def findByRef(id: Int) = {
     database withSession { implicit session =>
       val q3 = for { s ← space_refs if s.reflection === id } yield s
       q3.list                   
    } 
  }
  def findByElemRefs(ids: List[Int]) = {
     database withSession { implicit session =>
       val q3 = for { s ← space_refs if s.brick_front inSetBind ids } yield s
       q3.list                   
    } 
  }
  def retrive(k: Int, process: Int, brick_front:Option[Int]=None,
    brick_nested:Option[Int]=None):List[UnitSpace] = database withSession {
    implicit session =>
      findByRef(k).map(e => e.reflect(process, brick_front, brick_nested))

  }
  def retrive_obj(obj: List[UnitSpaceRef], process: Int, brick_front:Option[Int]=None,
    brick_nested:Option[Int]=None):List[UnitSpace] = database withSession {
    implicit session =>
      obj.map(e => e.reflect(process, brick_front, brick_nested))

  }
  
  def update(id: Int, entity: UnitSpaceRef):Boolean = {
    database withSession { implicit session =>
      findById(id) match {
      case Some(e) => {
        space_refs.filter(_.id === id).update(entity)
        true
      }
      case None => false
      }
    }
  }
  def getAll = database withSession {
    implicit session ⇒ 
      val q3 = for { s ← space_refs } yield s
      q3.list.sortBy(_.id)
  }
  def delete(id: Int) = {
   database withSession { implicit session ⇒

    val sp = get(id)
    val res = space_refs.filter(_.id === id).delete
    res
  }
  
  }

  def ddl_create = {
    database withSession {
      implicit session =>
      space_refs.ddl.create
    }
  }
  def ddl_drop = {
    database withSession {
      implicit session =>
        space_refs.ddl.drop
    }
  }
  
}

// TODO: Simple unified selectors that not include basic selectors