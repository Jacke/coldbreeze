package models.DAO.reflect


import models.DAO.driver.MyPostgresDriver.simple._
import scala.slick.model.ForeignKeyAction
import com.github.nscala_time.time.Imports._
import models.DAO.BPDAO._
import models.DAO.resources.BusinessDTO._
import com.github.tminglei.slickpg.composite._
import models.DAO.conversion.{DatabaseCred, Implicits}
import main.scala.bprocesses.refs.UnitRefs._
import main.scala.simple_parts.process.Units._  
import models.DAO._  
  

class ProcElementReflections(tag: Tag) extends Table[UnitElementRef](tag, "proc_element_reflections") {

  def id = column[Int]("id", O.PrimaryKey, O.AutoInc) // This is the primary key column
  def reflection = column[Int]("reflection_id")
  def title = column[String]("title")
  def desc  = column[String]("desc")
  def b_type = column[String]("b_type")
  def type_title = column[String]("type_title")

  def space_own = column[Option[Int]]("ref_space_id")

  def order = column[Int]("order")
    
  def created_at = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at = column[Option[org.joda.time.DateTime]]("updated_at")  
  
  def reflectFK = foreignKey("reflect_fk", reflection, models.DAO.reflect.RefDAO.refs)(_.id, onDelete = ForeignKeyAction.Cascade)
  
  /*
id: Option[Int],
                        reflection: Int,
                        title:String,
                        desc:String,
                        b_type:String,
                        type_title:String,
                        space_own:Option[Int],
                        order:Int,
created_at:Option[org.joda.time.DateTime] = None,
updated_at:Option[org.joda.time.DateTime] = None
*/
    
  def * = (id.?, reflection, title, desc, b_type, type_title, space_own, order,
           created_at, updated_at) <> (UnitElementRef.tupled, UnitElementRef.unapply)

}

import main.scala.simple_parts.process._
import main.scala.bprocesses._





/**
 * Actions
 */
object ProcElemReflectionDAO {
  import DatabaseCred.database
  import models.DAO.BPDAO.bprocesses


  val proc_element_reflections = TableQuery[ProcElementReflections]
  
  def findByRef(reflection: Int) = {
    database withSession { implicit session =>
     val q3 = for { el ← proc_element_reflections if el.reflection === reflection } yield el
      q3.list 
    }
  }
  def findByRefs(reflections: List[Int]) = {
    database withSession { implicit session =>
     val q3 = for { el ← proc_element_reflections if el.reflection inSetBind reflections } yield el
      q3.list 
    }
  }
  def lastOrderOfRef(id: Int):Int = {
    database withSession { implicit session =>
       val q3 = for { el ← proc_element_reflections if el.reflection === id } yield el
       val xs = q3.list.map(_.order)
      if (xs.isEmpty) 1
      else xs.max + 1
    }
  }
  def pull_object(s: UnitElementRef) = database withSession {
    implicit session ⇒
      proc_element_reflections returning proc_element_reflections.map(_.id) += s
  }
  def findById(id: Int) = {
     database withSession { implicit session =>
       val q3 = for { s ← proc_element_reflections if s.id === id } yield s
       q3.list.headOption                   
    } 
  }
  def retrive(k: Int, bid: Int, process: Int, space_own:Option[Int] = None):List[UnitElement] = database withSession {
    implicit session =>
      findByRef(k).map(e => e.reflect(bid, process, space_own))

  }
  def update(id: Int, entity: UnitElementRef):Boolean = {
    database withSession { implicit session =>
      findById(id) match {
      case Some(e) => {
        proc_element_reflections.filter(_.id === id).update(entity)
        true
      }
      case None => false
      }
    }
  }
  def getAll = database withSession {
    implicit session ⇒ 
      val q3 = for { s ← proc_element_reflections } yield s
      q3.list.sortBy(_.id)
  }
  def delete(id: Int) = { 
    database withSession { implicit session ⇒
      val elem = findById(id)
      proc_element_reflections.filter(_.id === id).delete
    }
  }

def moveUp(reflection: Int, element_id: Int) = {
    database withSession { implicit session =>
      val minimum = findByRef(reflection).sortBy(_.order)
      findById(element_id) match {
        case Some(e) => { 
          println(e.order)          
          if (e.order > 1 && e.order != minimum.head.order) {
            println("moved")
            proc_element_reflections
              .filter(_.id === element_id).update(e.copy(order = e.order - 1))
            val ch = findById(minimum.find(_.order == (e.order - 1)).get.id.get).get
            proc_element_reflections
              .filter(_.id === minimum.find(_.order == (e.order - 1)).get.id.get).update(ch.copy(order = ch.order + 1))
          }
          true 
        }
        case None => false
      }
    }
  }

  def moveDown(reflection: Int, element_id: Int) = {
    database withSession { implicit session =>
      val maximum = findByRef(reflection).sortBy(_.order)
      findById(element_id) match {
        case Some(e) => { 
          println(maximum.last.order)
          if (e.order < maximum.last.order && e.order != maximum.last.order) {
            println("moved")
            proc_element_reflections
              .filter(_.id === element_id).update(e.copy(order = e.order + 1))
            val ch = findById(maximum.find(_.order == (e.order + 1)).get.id.get).get
            proc_element_reflections
              .filter(_.id === maximum.find(_.order == (e.order + 1)).get.id.get).update(ch.copy(order = ch.order - 1))
          }
          true 
        }
        case None => false
      }
    }
  }


  def ddl_create = {
    database withSession {
      implicit session =>
      proc_element_reflections.ddl.create
    }
  }
  def ddl_drop = {
    database withSession {
      implicit session =>
        proc_element_reflections.ddl.drop
    }
  }
  
}