package models.DAO.resources

import models.DAO.driver.MyPostgresDriver1.simple._
import com.github.tminglei.slickpg.composite._
import models.DAO.conversion.{DatabaseCred, Implicits}
import slick.model.ForeignKeyAction
import org.joda.time.DateTime

class Bills(tag: Tag) extends Table[BillDTO](tag, "bills") {
  def id          = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def title       = column[String]("title")
  def master_acc  = column[String]("master_acc")
  def assigned    = column[DateTime]("assigned")
  def approved    = column[Boolean]("approved")
  def expired     = column[DateTime]("expired")
  def sum         = column[BigDecimal]("sum")
  def workbench   = column[Int]("workbench_id")

  def accFK = foreignKey("bill_macc_fk", master_acc, models.AccountsDAO.accounts)(_.userId, onDelete = ForeignKeyAction.Cascade)
  def wbFK  = foreignKey("bills_current_biz_business_fk", workbench, models.DAO.resources.BusinessDAO.businesses)(_.id, onDelete = ForeignKeyAction.Cascade)

  def * = (id.?, title, master_acc, assigned, approved, expired, sum, workbench) <> (BillDTO.tupled, BillDTO.unapply)

}

/*
  Case class
 */
case class BillDTO(var id: Option[Int], 
  title: String, 
  master_acc: String, 
  assigned: DateTime = DateTime.now(), 
  approved: Boolean = false,
  expired: DateTime = DateTime.now(),
  sum: BigDecimal = BigDecimal("0.0"),
  workbench: Int)

object BillDAO {
  import scala.util.Try
  import DatabaseCred.database

  val bills = TableQuery[Bills]
 
  def pull_object(s: BillDTO) = database withSession {
    implicit session ⇒
      bills returning bills.map(_.id) += s
  }
  def get(k: Int) = database withSession {
    implicit session ⇒
      val q3 = for { s ← bills if s.id === k } yield s 
      println(q3.selectStatement)
      println(q3.list)
      q3.list.headOption
  }
  def getAllByMasterAcc(email: String) = database withSession {
    implicit session =>
    val q3 = for { s ← bills if s.master_acc === email } yield s 
      q3.list
  }
  def getAllByWorkbench(workbench_id: Int) = database withSession {
    implicit session =>
    val q3 = for { s ← bills if s.workbench === workbench_id } yield s 
      q3.list
  }

  /**
   * Update a business service
   * @param id
   * @param business service
   */
  def update(id: Int, bill: BillDTO) = database withSession { implicit session ⇒
    val billToUpdate: BillDTO = bill.copy(Option(id))
    bills.filter(_.id === id).update(billToUpdate)
  } /**
   * Delete a business service
   * @param id
   */
  def delete(id: Int) = database withSession { implicit session ⇒

    bills.filter(_.id === id).delete
  }
  /**
   * Count all business_services
   */
  def count: Int = database withSession { implicit session ⇒
    Query(bills.length).first
  }



  def getAll = database withSession {
    implicit session ⇒
      val q3 = for { s ← bills } yield s 
      q3.list.sortBy(_.id)

  }

   def ddl_create = {
    database withSession {
      implicit session =>
      bills.ddl.create
    }
  }
  def ddl_drop = {
    database withSession {
      implicit session =>
        bills.ddl.drop
    }
  }
}
