package models.DAO.resources

import models.DAO.driver.MyPostgresDriver.simple._
import models.DAO.conversion.DatabaseCred

class Businesses(tag: Tag) extends Table[(Option[Int], String)](tag, "businesses") {
  def id = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def title = column[String]("title")



  def * = (id.?, title) //<> (Supplier.tupled, Supplier.unapply)

}

/*
  Case class
 */
case class BusinessDTO(var id: Option[Int], title: String)

object BusinessDAO {
  import scala.util.Try
  import DatabaseCred.database

  val businesses = TableQuery[Businesses]
  



  def pull_object(s: BusinessDTO) = database withSession {
    implicit session ⇒
      val tuple = BusinessDTO.unapply(s).get
      businesses returning businesses.map(_.id) += (value = (None, s.title))//(BusinessDTO.unapply(s).get._2, BusinessDTO.unapply(s).get._3)
  }

  def pull(id: Option[Int] = None, title: String, business: Int) = Try(database withSession {
    implicit session ⇒

      businesses += (id, title)
  }).isSuccess

  def get(k: Int) = database withSession {
    implicit session ⇒
      val q3 = for { s ← businesses if s.id === k } yield s <> (BusinessDTO.tupled, BusinessDTO.unapply _)
      println(q3.selectStatement)
      println(q3.list)
      q3.list.headOption //.map(Supplier.tupled(_))
  }
  /**
   * Update a business
   * @param id
   * @param business
   */
  def update(id: Int, business: BusinessDTO) = database withSession { implicit session ⇒
    val bpToUpdate: BusinessDTO = business.copy(Option(id))
    businesses.where(_.id === id).update(BusinessDTO.unapply(bpToUpdate).get)
  }
  /**
   * Delete a business
   * @param id
   */
  def delete(id: Int) = database withSession { implicit session ⇒

    businesses.where(_.id === id).delete
  }
  /**
   * Count all businesses
   */
  def count: Int = database withSession { implicit session ⇒
    Query(businesses.length).first
  }



  def getAll = database withSession {
    implicit session ⇒
      val q3 = for { s ← businesses } yield s <> (BusinessDTO.tupled, BusinessDTO.unapply _)
      q3.list.sortBy(_.id)
    //suppliers foreach {
    //  case (id, title, address, city, state, zip) ⇒
    //    Supplier(id, title, address, city, state, zip)
    //}
  }

   def ddl_create = {
    database withSession {
      implicit session =>
      businesses.ddl.create
    }
  }
}
