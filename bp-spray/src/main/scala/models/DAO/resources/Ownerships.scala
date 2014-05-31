package models.DAO.resources

import models.DAO.driver.MyPostgresDriver.simple._
import scala.slick.model.ForeignKeyAction
import models.DAO.conversion.DatabaseCred

class Ownerships(tag: Tag) extends Table[(Option[Int], Int, Int, Int, Int)](tag, "ownerships") {
  def id = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def bprocess = column[Int]("bprocess_id")
  def employee = column[Int]("employee_id")
  def client = column[Int]("client_id")
  def proc_elem = column[Int]("proc_elem_id")



  def * = (id.?, bprocess, employee, client, proc_elem) 
  //<> (Supplier.tupled, Supplier.unapply)

  def bpFK = foreignKey("bprocess_fk", bprocess, models.DAO.BPDAO.bprocesses)(_.id, onDelete = ForeignKeyAction.Cascade)
  def peFK = foreignKey("proc_elem_fk", bprocess, models.DAO.ProcElemDAO.proc_elements)(_.id, onDelete = ForeignKeyAction.Cascade)
  def empFK = foreignKey("employee_fk", employee, models.DAO.resources.EmployeeDAO.employees)(_.id, onDelete = ForeignKeyAction.Cascade)
  def cliFK = foreignKey("client_fk", client, models.DAO.resources.ClientDAO.clients)(_.id, onDelete = ForeignKeyAction.Cascade)
}

case class OnwershipDTO(var id: Option[Int], bprocess: Int, employee:Int, client:Int, proc_elem: Int)

object OnwershipDAO {
  import scala.util.Try
  import DatabaseCred.database

  val ownerships = TableQuery[Ownerships]




  def pull_object(s: OnwershipDTO) = database withSession {
    implicit session ⇒

      ownerships returning ownerships.map(_.id) += (value = (None, s.bprocess, s.employee, s.client, s.proc_elem))
    //(BusinessDTO.unapply(s).get._2, BusinessDTO.unapply(s).get._3)
  }

  def pull(id: Option[Int] = None, bprocess: Int, employee: Int, client:Int, proc_elem: Int) = Try(database withSession {
    implicit session ⇒

      ownerships += (value = (id, bprocess, employee, client, proc_elem))
  }).isSuccess

  def get(k: Int) = database withSession {
    implicit session ⇒
      val q3 = for { s ← ownerships if s.id === k } yield s <> (OnwershipDTO.tupled, OnwershipDTO.unapply _)
      println(q3.selectStatement)
      println(q3.list)
      q3.list.headOption //.map(Supplier.tupled(_))
  }


  /**
   * Update a bplink
   * @param id
   * @param ownership
   */
  def update(id: Int, ownership: OnwershipDTO) = database withSession { implicit session ⇒
    val ownershipToUpdate: OnwershipDTO = ownership.copy(Option(id))
    ownerships.where(_.id === id).update(OnwershipDTO.unapply(ownershipToUpdate).get)
  }

  /**
   * Delete a bplink
   * @param id
   */
  def delete(id: Int) = database withSession { implicit session ⇒

    ownerships.where(_.id === id).delete
  }
  /**
   * Count all bplinks
   */
  def count: Int = database withSession { implicit session ⇒
    Query(ownerships.length).first
  }



  def ddl_create = {
    database withSession {
      implicit session =>
        ownerships.ddl.create
    }
  }

}
