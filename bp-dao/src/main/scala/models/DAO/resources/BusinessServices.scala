package models.DAO.resources

import slick.driver.PostgresDriver.simple._
//import models.DAO.driver.MyPostgresDriver.simple._
import models.DAO.conversion.DatabaseCred

class BusinessServices(tag: Tag) extends Table[BusinessServiceDTO](tag, "business_services") {
  def id = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def title = column[String]("title")
  def business_id = column[Int]("business_id")

  def business = foreignKey("buss_fk", business_id, models.DAO.resources.BusinessDAO.businesses)(_.id)

  def * = (id.?, title, business_id) <> (BusinessServiceDTO.tupled, BusinessServiceDTO.unapply)

}

/*
  Case class
 */
case class BusinessServiceDTO(var id: Option[Int], title: String, business_id: Int)

object BusinessServiceDAO {
  import scala.util.Try
  import DatabaseCred.database

  val business_services = TableQuery[BusinessServices]
  



  def pull_object(s: BusinessServiceDTO) = database withSession {
    implicit session ⇒
      business_services returning business_services.map(_.id) += s
  }

  def pull(id: Option[Int] = None, title: String, business_id: Int) = Try(database withSession {
    implicit session ⇒

      business_services += BusinessServiceDTO(id, title, business_id)
  }).isSuccess

  def get(k: Int) = database withSession {
    implicit session ⇒
      val q3 = for { s ← business_services if s.id === k } yield s //<> (BusinessService.tupled, BusinessService.unapply _)
      println(q3.selectStatement)
      println(q3.list)
      q3.list.headOption
  }
  def getBusiness(k: Int) = database withSession {
    implicit session ⇒
      val q3 = for { s ← business_services
                     b <- s.business if s.id === k } yield (s, b) //<> (BusinessService.tupled, BusinessService.unapply _)
      println(q3.selectStatement)
      println(q3.list)
      q3.list.headOption
  }
  def getByBusiness(k: Int) = database withSession {
    implicit session ⇒
      val q3 = for { s ← business_services
                     b <- s.business if b.id === k } yield (s) //<> (BusinessService.tupled, BusinessService.unapply _)
      println(q3.selectStatement)
      println(q3.list)
      q3.list.headOption
  }
  /**
   * Update a business service
   * @param id
   * @param business service
   */
  def update(id: Int, businessService: BusinessServiceDTO) = database withSession { implicit session ⇒
    val bpToUpdate: BusinessServiceDTO = businessService.copy(Option(id))
    business_services.filter(_.id === id).update(bpToUpdate)
  } /**
   * Delete a business service
   * @param id
   */
  def delete(id: Int) = database withSession { implicit session ⇒

    business_services.filter(_.id === id).delete
  }
  /**
   * Count all business_services
   */
  def count: Int = database withSession { implicit session ⇒
    Query(business_services.length).first
  }



  def getAll = database withSession {
    implicit session ⇒
      val q3 = for { s ← business_services } yield s //<> (BusinessService.tupled, BusinessService.unapply _)
      q3.list.sortBy(_.id)
    //suppliers foreach {
    //  case (id, title, address, city, state, zip) ⇒
    //    Supplier(id, title, address, city, state, zip)
    //}
  }

   def ddl_create = {
    database withSession {
      implicit session =>
      business_services.ddl.create
    }
  }
}
