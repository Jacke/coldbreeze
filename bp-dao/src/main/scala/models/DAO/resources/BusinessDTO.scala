package models.DAO.resources




import scala.slick.driver.PostgresDriver.simple._

import scala.slick.model.ForeignKeyAction
import models.DAO.conversion.DatabaseCred

/**
 * BProcess Scheme
 */
class Businesses(tag: Tag) extends Table[BusinessDTO](tag, "businesses") {
  def id = column[Int]("id", O.PrimaryKey, O.AutoInc) // This is the primary key column
  def title = column[String]("title")
  // Every table needs a * projection with the same type as the table's type parameter
  def * = (id.?, title) <> (BusinessDTO.tupled, BusinessDTO.unapply)

}


/*
  Case class
 */
case class BusinessDTO(var id: Option[Int], title: String)

/*
  DataConversion
 */
object BPDCO {

}


object BusinessDAO {
  /**
   * Actions
   */
  import scala.util.Try
  import scala.slick.driver.PostgresDriver.simple._
  import DatabaseCred.database


  val businesses = TableQuery[Businesses]

  def pull_object(s: BusinessDTO) = database withSession {
    implicit session ⇒
      businesses returning businesses.map(_.id) += s
  }



  def pull(id: Option[Int] = None, title: String) = Try(database withSession {
    implicit session ⇒

      businesses += BusinessDTO(id, title)
  }).isSuccess

  def get(k: Int) = database withSession {
    implicit session ⇒
      val q3 = for { s ← businesses if s.id === k } yield s
      //println(q3.selectStatement)
      println(q3.list)
      q3.list.headOption //.map(Supplier.tupled(_))
  }
  /**
   * Update a bprocess
   * @param id
   * @param business
   */
  def update(id: Int, business: BusinessDTO) = database withSession { implicit session ⇒
    val bpToUpdate: BusinessDTO = business.copy(Option(id))
    businesses.filter(_.id === id).update(bpToUpdate)
  }
  /**
   * Delete a bprocess
   * @param id
   */
  def delete(id: Int) = database withSession { implicit session ⇒

    businesses.filter(_.id === id).delete
  }
  /**
   * Count all bprocesses
   */
  def count: Int = database withSession { implicit session ⇒
    Query(businesses.length).first
  }

   def ddl_create = {
    database withSession {
      implicit session =>
      businesses.ddl.create
    }
  }


  def getAll = database withSession {
    implicit session ⇒
      val q3 = for { s ← businesses } yield s
      q3.list.sortBy(_.id)
    //suppliers foreach {
    //  case (id, title, address, city, state, zip) ⇒
    //    Supplier(id, title, address, city, state, zip)
    //}
  }
}
