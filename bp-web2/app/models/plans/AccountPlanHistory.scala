package models.DAO.resources

import models.DAO.driver.MyPostgresDriver1.simple._
import com.github.tminglei.slickpg.composite._
import models.DAO.conversion.{DatabaseCred, Implicits}
import slick.model.ForeignKeyAction
import org.joda.time.DateTime

class AccountPlanHistory(tag: Tag) extends Table[AccountPlanHistoryDTO](tag, "account_plan_history") {
  def id           = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def account_plan = column[Int]("account_plan_id")
  def limit_diff   = column[Int]("limit_diff")
  def plan_diff    = column[Int]("plan_diff")
  def byBill       = column[Int]("bill_id")

  def planFK      = foreignKey("acc_plan_his_fk", account_plan, models.DAO.resources.AccountPlanDAO.account_plans)(_.id, onDelete = ForeignKeyAction.Cascade)
  def billFK      = foreignKey("bill_his_fk", byBill, models.DAO.resources.BillDAO.bills)(_.id, onDelete = ForeignKeyAction.Cascade)

  def * = (id.?, account_plan, limit_diff, plan_diff, byBill) <> (AccountPlanHistoryDTO.tupled, AccountPlanHistoryDTO.unapply)

}
case class AccountPlanHistoryDTO(var id: Option[Int], 
  account_plan: Int,
  limit_diff:Int = -1,
  plan_diff:Int = -1,
  byBill: Int)



object AccountPlanHistoryDAO {
  import scala.util.Try
  import DatabaseCred.database

  val account_plan_history = TableQuery[AccountPlanHistory]
  
  def pull_object(s: AccountPlanHistoryDTO) = database withSession {
    implicit session ⇒
      account_plan_history returning account_plan_history.map(_.id) += s
  }

  def get(k: Int):Option[AccountPlanHistoryDTO] = database withSession {
    implicit session ⇒
      val q3 = for { s ← account_plan_history if s.id === k } yield s 
      q3.list.headOption
  }
  def getByBill(k: Int):Option[AccountPlanHistoryDTO] = database withSession {
    implicit session ⇒
      val q3 = for { s ← account_plan_history if s.byBill === k } yield s 
      q3.list.headOption
  }
  def getAllByAccountPlan(k: Int):List[AccountPlanHistoryDTO] = database withSession {
    implicit session ⇒
      val q3 = for { s ← account_plan_history if s.account_plan === k } yield s 
      q3.list
  }  
  /**
   * Update a business service
   * @param id
   * @param business service
   */
  def update(id: Int, businessService: AccountPlanHistoryDTO) = database withSession { implicit session ⇒
    val bpToUpdate: AccountPlanHistoryDTO = businessService.copy(Option(id))
    account_plan_history.filter(_.id === id).update(bpToUpdate)
  } /**
   * Delete a business service
   * @param id
   */
  def delete(id: Int) = database withSession { implicit session ⇒
    account_plan_history.filter(_.id === id).delete
  }
  /**
   * Count all account_plans
   */
  def count: Int = database withSession { implicit session ⇒
    Query(account_plan_history.length).first
  }
  def getAll = database withSession {
    implicit session ⇒
      val q3 = for { s ← account_plan_history } yield s 
      q3.list.sortBy(_.id)
  }
  def ddl_create = {
    database withSession {
      implicit session =>
      account_plan_history.ddl.create
    }
  }
  def ddl_drop = {
    database withSession {
      implicit session =>
        account_plan_history.ddl.drop
    }
  }
}
