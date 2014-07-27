package models.DAO


import scala.slick.driver.PostgresDriver.simple._

import scala.slick.model.ForeignKeyAction
import models.DAO.resources.BusinessDTO._
import models.DAO.conversion.DatabaseCred

/**
 * BProcess Scheme
 */
class BProcesses(tag: Tag) extends Table[BProcessDTO](tag, "bprocesses") {
  def id = column[Int]("id", O.PrimaryKey, O.AutoInc) // This is the primary key column
  def title = column[String]("title")
  def service = column[Int]("service_id")
  // Every table needs a * projection with the same type as the table's type parameter
  def * = (id.?, title, service) <> (BProcessDTO.tupled, BProcessDTO.unapply)
  
  def serviceFK = foreignKey("service_fk", service, models.DAO.resources.BusinessServiceDAO.business_services)(_.id, onDelete = ForeignKeyAction.Cascade)
}


/*
  Case class
 */
case class BProcessDTO(var id: Option[Int], title: String, service: Int)

/*
  DataConversion
 */
object BPDCO {

}


object BPDAO {
  /**
   * Actions
   */
  import scala.util.Try
  import scala.slick.driver.PostgresDriver.simple._
  import DatabaseCred.database


  val bprocesses = TableQuery[BProcesses]

  def pull_object(s: BProcessDTO) = database withSession {
    implicit session ⇒
      bprocesses returning bprocesses.map(_.id) += s
  }

  def pull(id: Option[Int] = None, title: String, service: Int) = Try(database withSession {
    implicit session ⇒

      bprocesses += BProcessDTO(id, title, service)
  }).isSuccess

  def get(k: Int) = database withSession {
    implicit session ⇒
      val q3 = for { s ← bprocesses if s.id === k } yield s
      println(q3.selectStatement)
      println(q3.list)
      q3.list.headOption //.map(Supplier.tupled(_))
  }
  /**
   * Update a bprocess
   * @param id
   * @param bprocess
   */
  def update(id: Int, bprocess: BProcessDTO) = database withSession { implicit session ⇒
    val bpToUpdate: BProcessDTO = bprocess.copy(Option(id))
    bprocesses.where(_.id === id).update(bpToUpdate)
  }
  /**
   * Delete a bprocess
   * @param id
   */
  def delete(id: Int) = database withSession { implicit session ⇒

    bprocesses.where(_.id === id).delete
  }
  /**
   * Count all bprocesses
   */
  def count: Int = database withSession { implicit session ⇒
    Query(bprocesses.length).first
  }

  def ddl_create = {
    database withSession {
      implicit session =>
      bprocesses.ddl.create
    }
  }

  def getAll = database withSession {
    implicit session ⇒ // TODO: s.service === 1 CHANGE DAT
      val q3 = for { s ← bprocesses if s.service === 1} yield s
      q3.list.sortBy(_.id)
    //suppliers foreach {
    //  case (id, title, address, city, state, zip) ⇒
    //    Supplier(id, title, address, city, state, zip)
    //}
  }
}