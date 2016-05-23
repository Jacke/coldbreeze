package models.DAO.resources

import slick.driver.PostgresDriver.api._
import com.github.nscala_time.time.Imports._
import com.github.tototoshi.slick.PostgresJodaSupport._
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

  val bills = TableQuery[Bills]

  def pull_object(s: BillDTO) =   {

      await(db.run( bills returning bills.map(_.id) += s ))
  }
  def get(k: Int) =   {

      val q3 = for { s ← bills if s.id === k } yield s
      await(db.run(q3.result.headOption))
  }
  def getAllByMasterAcc(email: String) =   {

    val q3 = for { s ← bills if s.master_acc === email } yield s
      await(db.run(q3.result)).toList
  }
  def getAllByWorkbench(workbench_id: Int) =   {

    val q3 = for { s ← bills if s.workbench === workbench_id } yield s
      await(db.run(q3.result)).toList
  }

  /**
   * Update a business service
   * @param id
   * @param business service
   */
  def update(id: Int, bill: BillDTO) =   {
    val billToUpdate: BillDTO = bill.copy(Option(id))
    await(db.run( bills.filter(_.id === id).update(billToUpdate) ))
  } /**
   * Delete a business service
   * @param id
   */
  def delete(id: Int) =   {
    await(db.run( bills.filter(_.id === id).delete ))
  }
  val create: DBIO[Unit] = bills.schema.create
  val drop: DBIO[Unit] = bills.schema.drop

  def ddl_create = db.run(create)
  def ddl_drop = db.run(drop)
}
