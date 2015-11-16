package models.DAO.resources

import models.DAO.driver.MyPostgresDriver1.simple._
import com.github.tminglei.slickpg.composite._
import models.DAO.conversion.{DatabaseCred, Implicits}
import slick.model.ForeignKeyAction
import org.joda.time.DateTime


class AccountPlans(tag: Tag) extends Table[AccountPlanDTO](tag, "account_plans") {
  def id          = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def business_id = column[Option[Int]]("business_id")
  def master_acc  = column[String]("master_acc")
  def plan        = column[Int]("plan_id") 
  def expired_at  = column[DateTime]("expired_at")
  def active      = column[Boolean]("active")
  def limit       = column[Int]("limit")

  def planFK      = foreignKey("acc_plan_plan_fk", plan, models.DAO.resources.PlanDAO.plans)(_.id, onDelete = ForeignKeyAction.Cascade)
  def accFK       = foreignKey("acc_plan_macc_fk", master_acc, models.AccountsDAO.accounts)(_.userId, onDelete = ForeignKeyAction.Cascade)
  def business    = foreignKey("acc_plan_buss_fk", business_id, models.DAO.resources.BusinessDAO.businesses)(_.id)

  def planJoin    = models.DAO.resources.PlanDAO.plans.filter(_.id === plan)

  def * = (id.?, business_id, master_acc, plan, expired_at,active,limit) <> (AccountPlanDTO.tupled, AccountPlanDTO.unapply)
}
/*
  Case class
 */
case class AccountPlanDTO(var id: Option[Int], 
  business_id: Option[Int], 
  master_acc: String, 
  plan: Int = 1, 
  expired_at: DateTime = DateTime.now().plusDays(5),
  active: Boolean = false,
  limit: Int = 5) {

  var planObj:Option[PlanDTO]=None
  var planHistories: List[AccountPlanHistoryDTO]=List()

  def assignPlan(plan: PlanDTO) = {
    planObj = Some(plan)
  }
  def assignHistory(histories: List[AccountPlanHistoryDTO]) = {
    planHistories = histories
  }
}

object AccountPlanDAO {
  import scala.util.Try
  import DatabaseCred.database

  val account_plans = TableQuery[AccountPlans]
  
  def pull_object(s: AccountPlanDTO) = database withSession {
    implicit session ⇒
      account_plans returning account_plans.map(_.id) += s
  }
  def assignPlan(s: Option[AccountPlanDTO]):Option[AccountPlanDTO] = {
    s match {
      case Some(account_plan) => {
        account_plan.assignPlan(PlanDAO.get(account_plan.plan).get)
        account_plan.assignHistory(AccountPlanHistoryDAO.getAllByAccountPlan(account_plan.id.getOrElse(0)))
        Some(account_plan)
      }
      case _ => None
    }
  }
  def get(k: Int):Option[AccountPlanDTO] = database withSession {
    implicit session ⇒
      val q3 = for { s ← account_plans if s.id === k } yield s 
      assignPlan(q3.list.headOption)
  }
  def getByMasterAcc(email: String):Option[AccountPlanDTO] = database withSession {
  	implicit session =>
  	val q3 = for { s ← account_plans if s.master_acc === email } yield s 
      assignPlan(q3.list.headOption)
  }
  def getPlanByMasterAcc(email: String):Tuple2[DateTime, PlanDTO] = { database withSession {
    implicit session =>
       val q1 = (for {
      s <- account_plans
      p <- s.planJoin
    } yield ((s.expired_at, p)))
      q1.list.headOption.get
    }
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
  def ddl_drop = {
    database withSession {
      implicit session =>
        account_plans.ddl.drop
    }
  }
}


