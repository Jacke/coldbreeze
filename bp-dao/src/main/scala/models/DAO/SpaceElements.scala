package models.DAO

import main.scala.bprocesses.BProcess
import main.scala.simple_parts.process.{Block, ProcElems}
import models.DAO.driver.MyPostgresDriver.simple._
import scala.slick.model.ForeignKeyAction
import models.DAO.conversion.{DatabaseCred, Implicits}


class SpaceElements(tag: Tag) extends Table[SpaceElementDTO](tag, "space_elements") {
  def id = column[Int]("id", O.PrimaryKey, O.AutoInc) // This is the primary key column
  def title = column[String]("title")
  def desc  = column[String]("desc")
  def business = column[Int]("business_id")
  def bprocess = column[Int]("bprocess_id")
  def b_type = column[String]("b_type")
  def type_title = column[String]("type_title")

  def space_own = column[Option[Int]]("own_space_id")
  def space_owned = column[Int]("owned_space_id")
  def space_role = column[Option[String]]("space_role")

  def order = column[Int]("order")
  def comps = column[Option[List[CompositeValues]]]("comps", O.DBType("compositevalues[]"))
  def * = (id.?, title, desc,  business,
           bprocess,   b_type, type_title,
           space_own,  space_owned,
           space_role, order, comps) <> (SpaceElementDTO.tupled, SpaceElementDTO.unapply)

  def businessFK = foreignKey("business_fk", business, models.DAO.resources.BusinessDAO.businesses)(_.id, onDelete = ForeignKeyAction.Cascade)
  def bpFK = foreignKey("bprocess_fk", bprocess, models.DAO.BPDAO.bprocesses)(_.id, onDelete = ForeignKeyAction.Cascade)
  // TODO: Space FK

}

/*
  Case class
 */
case class SpaceElementDTO(id: Option[Int],
                        title:String,
                        desc:String,
                        business:Int,
                        bprocess:Int,
                        b_type:String,
                        type_title:String,
                        space_own:Option[Int],
                        space_owned: Int,
                        space_role:Option[String],
                        order:Int,
                        comps: Option[List[CompositeValues]]) {
  def cast(process: BProcess):Option[ProcElems] = {
    // TODO: to space casting
    // TODO: Refactor
    println("block castiong")
    println(order)
    this match {
      case x if (x.b_type == "block" | x.type_title == "test block") => {
        Option(
          new Block(id.get,title,desc,Implicits.fetch_cv(comps),process,b_type,type_title,order)
        )
      }
      case _ => None
    }

  }
}
/**
 * Actions
 */
object SpaceElemDAO {
  import DatabaseCred.database
  import models.DAO.BPDAO.bprocesses


  val space_elements = TableQuery[SpaceElements]
  /**
   * Find a specific entity by id.
   */
  def findByBPId(id: Int) = {
    database withSession { implicit session =>
      val q3 = for { el ← space_elements if el.bprocess === id } yield el
      q3.list
    }
  }
  def findById(id: Int):Option[SpaceElementDTO] = {
    database withSession { implicit session =>
      val q3 = for { el ← space_elements if el.id === id } yield el
      q3.list.headOption
    }
  }
  def findByBPanOrder(id: Int, order: Int) = {
    database withSession { implicit session =>
      val q3 = for { el ← space_elements if el.bprocess === id; if el.order === order } yield el
      q3.list.headOption
    }
  }
  def update(id: Int, entity: SpaceElementDTO):Boolean = {
    database withSession { implicit session =>
      findById(id) match {
        case Some(e) => { space_elements.where(_.id === id).update(entity); true }
        case None => false
      }
    }
  }
  def update_order(id: Int, order_num: Int): String = {
    // TODO: update_order
    "true && true"
  }
}