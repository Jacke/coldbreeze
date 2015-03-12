package models.DAO.reflect


import models.DAO.driver.MyPostgresDriver.simple._
import scala.slick.model.ForeignKeyAction
import com.github.nscala_time.time.Imports._
import models.DAO.BPDAO._
import models.DAO.resources.BusinessDTO._
import com.github.tminglei.slickpg.composite._
import models.DAO.conversion.{DatabaseCred, Implicits}
import main.scala.simple_parts.process.Units._
  
  
import main.scala.simple_parts.process.data.{Confirm, Constant}


class ProcElementReflections(tag: Tag) extends Table[UnitElement](tag, "proc_element_reflections") {

  def id = column[Int]("id", O.PrimaryKey, O.AutoInc) // This is the primary key column
  def title = column[String]("title")
  def desc  = column[String]("desc")
  def business = column[Int]("business_id")
  def bprocess = column[Int]("bprocess_id")
  def b_type = column[String]("b_type")
  def type_title = column[String]("type_title")

  def space_own = column[Option[Int]]("space_id")

  def order = column[Int]("order")
    
  def created_at = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at = column[Option[org.joda.time.DateTime]]("updated_at")  
    
  def * = (id.?, title, desc, business, bprocess, b_type, type_title, space_own, order,
           created_at, updated_at) <> (UnitElement.tupled, UnitElement.unapply)

  def businessFK = foreignKey("business_fk", business, models.DAO.resources.BusinessDAO.businesses)(_.id, onDelete = ForeignKeyAction.Cascade)
  def bpFK = foreignKey("bprocess_fk", bprocess, models.DAO.BPDAO.bprocesses)(_.id, onDelete = ForeignKeyAction.Cascade)


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
  /**
   * Find a specific entity by id.
   */
  def findByBPId(id: Int) = {
    database withSession { implicit session =>
     val q3 = for { el ← proc_element_reflections if el.bprocess === id } yield el
      q3.list 
    }
  }
  def findLengthByBPId(id: Int):Int = {
    database withSession { implicit session => 
       val q3 = for { el ← proc_element_reflections if el.bprocess === id } yield el
      Query(q3.length).first
    }
  }
  def findById(id: Int):Option[UnitElement] = {
    database withSession { implicit session =>
     val q3 = for { el ← proc_element_reflections if el.id === id } yield el 
      q3.list.headOption
    }
  }
  def findByBPanOrder(id: Int, order: Int) = {
    database withSession { implicit session =>
     val q3 = for { el ← proc_element_reflections if el.bprocess === id; if el.order === order } yield el
      q3.list.headOption 
    }
  }
  def pull_object(s: UnitElement) = database withSession {
    implicit session ⇒
      proc_element_reflections returning proc_element_reflections.map(_.id) += s
  }
  def update(id: Int, entity: UnitElement):Boolean = {
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
    val res = proc_element_reflections.filter(_.id === id).delete
    elem match {
       case Some(el) => renewOrder(el.bprocess, el.order)
       case _ =>
    }
    res
    }
  }
  def moveUp(bprocess: Int, element_id: Int) = {
    database withSession { implicit session =>
      val minimum = findByBPId(bprocess).sortBy(_.order)
      findById(element_id) match {
        case Some(e) => { 
          println(e.order)          
          if (e.order > 1 && e.order != minimum.head.order) {
            println("moved")
            proc_element_reflections.filter(_.id === element_id).update(e.copy(order = e.order - 1))
            val ch = findById(minimum.find(_.order == (e.order - 1)).get.id.get).get
            proc_element_reflections.filter(_.id === minimum.find(_.order == (e.order - 1)).get.id.get).update(ch.copy(order = ch.order + 1))
          }
          true 
        }
        case None => false
      }
    }
  }
  def moveDown(bprocess: Int, element_id: Int) = {
    database withSession { implicit session =>
      val maximum = findByBPId(bprocess).sortBy(_.order)
      findById(element_id) match {
        case Some(e) => { 
          println(maximum.last.order)
          if (e.order < maximum.last.order && e.order != maximum.last.order) {
            println("moved")
            proc_element_reflections.filter(_.id === element_id).update(e.copy(order = e.order + 1))
            val ch = findById(maximum.find(_.order == (e.order + 1)).get.id.get).get
            proc_element_reflections.filter(_.id === maximum.find(_.order == (e.order + 1)).get.id.get).update(ch.copy(order = ch.order - 1))
          }
          true 
        }
        case None => false
      }
    }
  }
  def renewOrder(bprocess: Int, order_num: Int) = {
    database withSession { implicit session ⇒
      val q3 = for { el ← proc_element_reflections if el.bprocess === bprocess && el.order > order_num } yield el
      val ordered = q3.list.zipWithIndex.map(el => el._1.copy(order = (el._2 + 1) + (order_num - 1)))
      ordered.foreach { el => 
         update(el.id.get, el)
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