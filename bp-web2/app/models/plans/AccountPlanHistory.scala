package models.DAO.resources

import slick.driver.PostgresDriver.api._
import com.github.nscala_time.time.Imports._
import com.github.tototoshi.slick.PostgresJodaSupport._
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


  val account_plan_history = TableQuery[AccountPlanHistory]

  def pull_object(s: AccountPlanHistoryDTO) =   {
      await(db.run( account_plan_history returning account_plan_history.map(_.id) += s ))
  }

  def get(k: Int):Option[AccountPlanHistoryDTO] =   {
      val q3 = for { s ← account_plan_history if s.id === k } yield s
      await(db.run(q3.result.headOption))
  }

  def getByBill(k: Int):Option[AccountPlanHistoryDTO] =   {
      val q3 = for { s ← account_plan_history if s.byBill === k } yield s
      await(db.run(q3.result.headOption))
  }

  def getAllByAccountPlan(k: Int):List[AccountPlanHistoryDTO] =   {
      val q3 = for { s ← account_plan_history if s.account_plan === k } yield s
      await(db.run(q3.result)).toList
  }

  /**
   * Update a business service
   * @param id
   * @param business service
   */
  def update(id: Int, businessService: AccountPlanHistoryDTO) =   {
    val bpToUpdate: AccountPlanHistoryDTO = businessService.copy(Option(id))
    await(db.run( account_plan_history.filter(_.id === id).update(bpToUpdate) ))
  } /**
   * Delete a business service
   * @param id
   */
  def delete(id: Int) =   {
    await(db.run( account_plan_history.filter(_.id === id).delete ))
  }


    val create: DBIO[Unit] = account_plan_history.schema.create
    val drop: DBIO[Unit] = account_plan_history.schema.drop

    def ddl_create = db.run(create)
    def ddl_drop = db.run(drop)
}
