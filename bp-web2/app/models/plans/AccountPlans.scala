package models.DAO.resources

import slick.driver.PostgresDriver.api._
import com.github.nscala_time.time.Imports._
import com.github.tototoshi.slick.PostgresJodaSupport._
import com.github.tminglei.slickpg.composite._
import models.DAO.conversion.{DatabaseCred, Implicits}
import slick.model.ForeignKeyAction
import org.joda.time.DateTime


class AccountPlans(tag: Tag) extends Table[AccountPlanDTO](tag, "account_plans") {
  def id          = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def workbench   = column[Int]("business_id")
  def master_acc  = column[String]("master_acc")
  def plan        = column[Int]("plan_id")
  def expired_at  = column[DateTime]("expired_at")
  def active      = column[Boolean]("active")
  def limit       = column[Int]("limit")

  def planFK      = foreignKey("acc_plan_plan_fk", plan, models.DAO.resources.PlanDAO.plans)(_.id, onDelete = ForeignKeyAction.Cascade)
  def accFK       = foreignKey("acc_plan_macc_fk", master_acc, models.AccountsDAO.accounts)(_.userId, onDelete = ForeignKeyAction.Cascade)
  def business    = foreignKey("acc_plan_buss_fk", workbench, models.DAO.resources.BusinessDAO.businesses)(_.id, onDelete = ForeignKeyAction.Cascade)

  def planJoin    = models.DAO.resources.PlanDAO.plans.filter(_.id === plan)

  def * = (id.?, workbench, master_acc, plan, expired_at,active,limit) <> (AccountPlanDTO.tupled, AccountPlanDTO.unapply)
}
/*
  Case class
 */
case class AccountPlanDTO(var id: Option[Int],
  business_id: Int,
  master_acc: String,
  plan: Int = -1,
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



object AccountPlanDAOF {
  import akka.actor.ActorSystem


  import slick.backend.{StaticDatabaseConfig, DatabaseConfig}
  //import slick.driver.JdbcProfile
  import slick.driver.PostgresDriver.api._
  import slick.jdbc.meta.MTable
  import scala.concurrent.ExecutionContext.Implicits.global
  import com.github.tototoshi.slick.PostgresJodaSupport._
  import scala.concurrent.duration.Duration
  import scala.concurrent.{ExecutionContext, Awaitable, Await, Future}
  import scala.util.Try
  import models.DAO.conversion.DatabaseFuture._
  //import dbConfig.driver.api._ //
  def await[T](a: Awaitable[T])(implicit ec: ExecutionContext) = Await.result(a, Duration.Inf)
  def awaitAndPrint[T](a: Awaitable[T])(implicit ec: ExecutionContext) = println(await(a))
  val account_plans = AccountPlanDAO.account_plans

  private def filterQuery(id: Int): Query[AccountPlans, AccountPlanDTO, Seq] =
    account_plans.filter(_.id === id)
  private def filterByWorkbenchQuery(workbench: Int): Query[AccountPlans, AccountPlanDTO, Seq] =
    account_plans.filter(_.workbench === workbench)
  def get(id: Int):Future[Option[AccountPlanDTO]] = {
     db.run(filterQuery(id).result.headOption)
  }

  def getByWorkbenchAcc(workbench_id: Int):Future[Option[AccountPlanDTO]] = {
      assignPlan(db.run(filterByWorkbenchQuery(workbench_id).result.headOption))
  }

  def assignPlan(s: Future[Option[AccountPlanDTO]]):Future[Option[AccountPlanDTO]] = {
    s.map { v =>
      v match {
      case Some(account_plan) => {
        account_plan.assignPlan(PlanDAO.get(account_plan.plan).get)
        account_plan.assignHistory(AccountPlanHistoryDAO.getAllByAccountPlan(account_plan.id.getOrElse(0)))
        Some(account_plan)
      }
        case _ => None
      }
    }
  }

} // Future Impl


object AccountPlanDAO {
  import akka.actor.ActorSystem
  import slick.backend.{StaticDatabaseConfig, DatabaseConfig}
  //import slick.driver.JdbcProfile
  import slick.driver.PostgresDriver.api._
  import slick.jdbc.meta.MTable
  import scala.concurrent.ExecutionContext.Implicits.global
  import com.github.tototoshi.slick.PostgresJodaSupport._
  import scala.concurrent.duration.Duration
  import scala.concurrent.{ExecutionContext, Awaitable, Await, Future}
  import scala.util.Try
  import models.DAO.conversion.DatabaseFuture._

  //import dbConfig.driver.api._ //
  def await[T](a: Awaitable[T])(implicit ec: ExecutionContext) = Await.result(a, Duration.Inf)
  def awaitAndPrint[T](a: Awaitable[T])(implicit ec: ExecutionContext) = println(await(a))

  val account_plans = TableQuery[AccountPlans]

  def generateDefaultAccountPlans() =   {

        val employees = EmployeeDAO.getAll
        val workbenches_ids = employees.map { employee =>
          employee.workbench
        }.distinct
        // Now we must create plans that doesnt exist
        val allAc = AccountPlanDAO.getAll
        val allAcWorkbenchIds = allAc.map(_.business_id)
        val emptyBenchesIds = workbenches_ids.filter(ac => !allAcWorkbenchIds.contains(ac) )
        emptyBenchesIds.map { emptyWorkbechId =>
          val master_acc:String = employees.find(e => e.workbench == emptyWorkbechId && e.manager == true) match {
            case Some(emp) => emp.uid
            case _ => ""
          }
          AccountPlanDAO.pull_object(AccountPlanDTO(None, emptyWorkbechId, master_acc, 1))
        }
  }

  def pull_object(s: AccountPlanDTO) =   {
      await(db.run( account_plans returning account_plans.map(_.id) += s ))
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

  def get(k: Int):Option[AccountPlanDTO] =   {
      val q3 = for { s ← account_plans if s.id === k } yield s
      assignPlan(await(db.run(q3.result.headOption)))
  }
  
  def getAll:List[AccountPlanDTO] =   {
      val q3 = for { s ← account_plans } yield s
      await(db.run(q3.result)).toList
  }

  def getByWorkbenchAcc(workbench_id: Int):Option[AccountPlanDTO] =   {
    val q3 = for { pl <- account_plans if pl.workbench === workbench_id } yield pl
      assignPlan(await(db.run(q3.result.headOption))) // Fetch planObject!!!
  }
  def getByMasterAcc(email: String):Option[AccountPlanDTO] =   {
    val q3 = for { s ← account_plans if s.master_acc === email } yield s
      assignPlan(await(db.run(q3.result.headOption)))
  }

  def getPlanByMasterAcc(email: String):Tuple2[DateTime, PlanDTO] = {   {
       val q1 = (for {
      s <- account_plans
      p <- s.planJoin
    } yield ((s.expired_at, p)))
      await(db.run( q1.result.headOption)).get
    }
  }


  def update(id: Int, businessService: AccountPlanDTO) =   {
    val bpToUpdate: AccountPlanDTO = businessService.copy(Option(id))
    await(db.run( account_plans.filter(_.id === id).update(bpToUpdate) ))
  }


  def delete(id: Int) =   {
    await(db.run( account_plans.filter(_.id === id).delete ))
  }

  val create: DBIO[Unit] = account_plans.schema.create
  val drop: DBIO[Unit] = account_plans.schema.drop

  def ddl_create = db.run(create)
  def ddl_drop = db.run(drop)
}
