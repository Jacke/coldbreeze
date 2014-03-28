package models.DAO
import models.DAO.driver.MyPostgresDriver.simple._
/**
 * ProcElements scheme
 */
class ProcElements(tag: Tag) extends Table[(Option[Int], String, String, Int, Int, String, String, Option[Int], Option[String], Int)](tag, "proc_elements") {
  def id = column[Int]("id", O.PrimaryKey, O.AutoInc) // This is the primary key column
  def title = column[String]("title")
  def desc  = column[String]("desc")
  def business = column[Int]("business_id")
  def bprocess = column[Int]("bprocess_id")
  def b_type = column[String]("b_type")
  def type_title = column[String]("type_title")
  def order = column[Int]("order")
  def space_parent = column[Option[Int]]("space_id")
  def space_role = column[Option[String]]("space_role")
  // TODO: values: CompositeValues,

  def * = (id.?, title, desc, business, bprocess, b_type, type_title, space_parent, space_role, order)// <> (UndefElement.tupled, UndefElement.unapply)

}

import main.scala.simple_parts.process._
import main.scala.bprocesses._

case class UndefElement(id: Option[Int],
                        title:String,
                        desc:String,
                        business:Int,
                        bprocess:Int,
                        b_type:String,
                        type_title:String,
                        space_parent:Option[Int],
                        space_role:Option[String],
                        order:Int) {
  def cast(process: BProcess):Option[ProcElems] = { 
// TODO: to space casting 
    this match {
      case x if (x.b_type == "block" | x.type_title == "test block") => { 
        Option(
          new Block(id.get,title,desc,CompositeValues(),process,b_type,type_title,order) 
        )
      }
      case _ => None
    }
  
  }
}



case class KeeprDAO(eltype:String, elname:String, desc:String)

/**
 * Actions
 */
object ProcElemCRUD {
  import models.DAO.FirstExample.database
  import models.DAO.BPDTO.bprocesses


  val proc_elements = TableQuery[ProcElements]
  /**
   * Find a specific entity by id.
   */
  def findByBPId(id: Int) = {
    database withSession { implicit session =>
     val q3 = for { el ← proc_elements if el.bprocess === id } yield el <> (UndefElement.tupled, UndefElement.unapply _)
      println(q3.selectStatement)
      println(q3.list)
      q3.list 
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