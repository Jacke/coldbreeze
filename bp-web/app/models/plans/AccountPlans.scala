package models.DAO.resources

import slick.driver.PostgresDriver.simple._
import scala.slick.model.ForeignKeyAction
//import models.DAO.driver.MyPostgresDriver.simple._
import models.DAO.conversion.DatabaseCred

class AccountPlans(tag: Tag) extends Table[AccountPlanDTO](tag, "account_plans") {
  def id = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def business_id = column[Option[Int]]("business_id")
  def master_acc = column[String]("master_acc")
  def plan = column[Int]("plan_id") 

  def planFK = foreignKey("plan_fk", plan, models.DAO.resources.PlanDAO.plans)(_.id, onDelete = ForeignKeyAction.Cascade)
  def accFK = foreignKey("macc_fk", master_acc, models.AccountsDAO.accounts)(_.userId, onDelete = ForeignKeyAction.Cascade)
  def business = foreignKey("buss_fk", business_id, models.DAO.resources.BusinessDAO.businesses)(_.id)


  def * = (id.?, business_id, master_acc, plan) <> (AccountPlanDTO.tupled, AccountPlanDTO.unapply)

}

/*
  Case class
 */
case class AccountPlanDTO(var id: Option[Int], business_id: Option[Int], master_acc: String, plan: Int)

object AccountPlanDAO {
  import scala.util.Try
  import DatabaseCred.database

  val account_plans = TableQuery[AccountPlans]
  
  def pull_object(s: AccountPlanDTO) = database withSession {
    implicit session ⇒
      account_plans returning account_plans.map(_.id) += s
  }
  def get(k: Int) = database withSession {
    implicit session ⇒
      val q3 = for { s ← account_plans if s.id === k } yield s 
      q3.list.headOption
  }
  def getByMasterAcc(email: String) = database withSession {
  	implicit session =>
  	val q3 = for { s ← account_plans if s.master_acc === email } yield s 
      q3.list.headOption
  }
  /**
   * Update a business service
   * @param id
   * @param business service
   */
  def update(id: Int, businessService: AccountPlanDTO) = database withSession { implicit session ⇒
    val bpToUpdate: AccountPlanDTO = businessService.copy(Option(id))
    account_plans.filter(_.id === id).update(bpToUpdate)
  } /**
   * Delete a business service
   * @param id
   */
  def delete(id: Int) = database withSession { implicit session ⇒

    account_plans.filter(_.id === id).delete
  }
  /**
   * Count all account_plans
   */
  def count: Int = database withSession { implicit session ⇒
    Query(account_plans.length).first
  }



  def getAll = database withSession {
    implicit session ⇒
      val q3 = for { s ← account_plans } yield s 
      q3.list.sortBy(_.id)
  }

   def ddl_create = {
    database withSession {
      implicit session =>
      account_plans.ddl.create
    }
  }
}
