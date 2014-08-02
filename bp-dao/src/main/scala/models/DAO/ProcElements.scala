package models.DAO


import models.DAO.driver.MyPostgresDriver.simple._
import scala.slick.model.ForeignKeyAction
import models.DAO.BPDAO._
import models.DAO.resources.BusinessDTO._
import com.github.tminglei.slickpg.composite._
import models.DAO.conversion.{DatabaseCred, Implicits}

import main.scala.simple_parts.process.data.Constant
/**
 * ProcElements scheme
 */
 case class CompositeValues(
                              a_string: Option[String] = None,
                              b_string: Option[String] = None,
                              a_int: Option[Int] = None,
                              b_int: Option[Int] = None,
                              a_bool: Option[Boolean] = None,
                              b_bool: Option[Boolean] = None
                           ) extends Struct

class ProcElements(tag: Tag) extends Table[UndefElement](tag, "proc_elements") {

  def id = column[Int]("id", O.PrimaryKey, O.AutoInc) // This is the primary key column
  def title = column[String]("title")
  def desc  = column[String]("desc")
  def business = column[Int]("business_id")
  def bprocess = column[Int]("bprocess_id")
  def b_type = column[String]("b_type")
  def type_title = column[String]("type_title")

  def space_own = column[Option[Int]]("space_id")

  def order = column[Int]("order")
  def comps = column[Option[List[CompositeValues]]]("comps", O.DBType("compositevalues[]"))
  def * = (id.?, title, desc, business, bprocess, b_type, type_title, space_own, order, comps) <> (UndefElement.tupled, UndefElement.unapply)

  def businessFK = foreignKey("business_fk", business, models.DAO.resources.BusinessDAO.businesses)(_.id, onDelete = ForeignKeyAction.Cascade)
  def bpFK = foreignKey("bprocess_fk", bprocess, models.DAO.BPDAO.bprocesses)(_.id, onDelete = ForeignKeyAction.Cascade)


}

import main.scala.simple_parts.process._
import main.scala.bprocesses._

/*
  Case class
 */
case class UndefElement(id: Option[Int],
                        title:String,
                        desc:String,
                        business:Int,
                        bprocess:Int,
                        b_type:String,
                        type_title:String,
                        space_own:Option[Int],
                        order:Int,
                        comps: Option[List[CompositeValues]]) {
  def cast(process: BProcess):Option[ProcElems] = { 
// TODO: to space casting 
// TODO: Refactor
    println("block castiong")
    println(order)
    this match {
      case y if (y.b_type == "brick" | y.type_title == "container_brick") => {
        Option(
            new ContainerBrick(id.get, title, desc,Implicits.fetch_cv(comps), process, b_type, type_title, order)
          )
      }
      case constant if (constant.b_type == "block" | constant.type_title == "constant") => {
        Option(
           new Constant[Boolean](id.get, true, process, order, space_id = None)
        )
      }
      case x if (x.b_type == "block" | x.type_title == "test block") => { 
        Option(
          new Block(id.get,title,desc,Implicits.fetch_cv(comps),process,b_type,type_title,order)
        )
      }
      case _ => None
    }
  
  }
}

/*
  DataConversion
 */
object ProcElemDCO {

}


case class KeeprDAO(eltype:String, elname:String, desc:String)

/**
 * Actions
 */
object ProcElemDAO {
  import DatabaseCred.database
  import models.DAO.BPDAO.bprocesses


  val proc_elements = TableQuery[ProcElements]
  /**
   * Find a specific entity by id.
   */
  def findByBPId(id: Int) = {
    database withSession { implicit session =>
     val q3 = for { el ← proc_elements if el.bprocess === id } yield el// <> (UndefElement.tupled, UndefElement.unapply _)
      q3.list 
    }
  }
  def findById(id: Int):Option[UndefElement] = {
    database withSession { implicit session =>
     val q3 = for { el ← proc_elements if el.id === id } yield el //<> (UndefElement.tupled, UndefElement.unapply _)
      q3.list.headOption
    }
  }
  def findByBPanOrder(id: Int, order: Int) = {
    database withSession { implicit session =>
     val q3 = for { el ← proc_elements if el.bprocess === id; if el.order === order } yield el// <> (UndefElement.tupled, UndefElement.unapply _)
      q3.list.headOption 
    }
  }
  def update(id: Int, entity: UndefElement):Boolean = {
    database withSession { implicit session =>
      findById(id) match {
      case Some(e) => {
        proc_elements.where(_.id === id).update(entity)
        true
      }
      case None => false
      }
    }
  }
  def update_order(id: Int, order_num: Int): String = {
    // TODO: update_order
    "true && true"
  }


  def ddl_create = {
    database withSession {
      implicit session =>
      proc_elements.ddl.create
    }
  }
  /**
   * Delete a specific entity by id. If successfully completed return true, else false
   */
  //def delete(id: Int):Boolean =
  //  database withSession { implicit session =>
  //  findById(id) match {
  //    case Some(entity) => { proc_elements.where(_.id === id).delete; true }
  //    case None => false
  //  }
  //  }

  /**
   * Update a specific entity by id. If successfully completed return true, else false
   */
  //def update(id: Int, entity: (Option[Int], String, String, Int, Int, String, String, Int)):Boolean = {
  //  database withSession { implicit session =>
  //    findById(id) match {
  //    case Some(e) => { proc_elements.where(_.id === id).update(entity); true }
  //    case None => false
  //    }
  //  }
  //}
}