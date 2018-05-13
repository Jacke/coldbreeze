package models.administration


import slick.driver.PostgresDriver.api._
import com.github.nscala_time.time.Imports._
import com.github.tototoshi.slick.PostgresJodaSupport._
import slick.model.ForeignKeyAction
import models.DAO.resources.BusinessDTO._
import models.DAO.resources.EmployeeDAO._

case class AdminAccountDTO(id: Option[Int], account_id: String, sudo: Boolean = false)
class AdminAccounts(tag: Tag) extends Table[AdminAccountDTO](tag, "admin_accounts") {
  def id          = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def account_id  = column[String]("account_id")
  def sudo        = column[Boolean]("sudo")

//  def maccFK      = foreignKey("ad_acc_macc_fk", account_id, models.AccountsDAO.accounts)(_.userId, onDelete = ForeignKeyAction.Cascade)

  def * = (id.?, account_id, sudo) <> (AdminAccountDTO.tupled, AdminAccountDTO.unapply)

}


object AdminAccountsDAO {
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

  val admin_accounts = TableQuery[AdminAccounts]

  def getByUID(email: String):Option[AdminAccountDTO] =   {
      val q3 = for { s ← admin_accounts if s.account_id === email } yield s
      await(db.run(q3.result.headOption))
  }

  def getAllByUID(emails: List[String]):List[AdminAccountDTO] =   {
      val q3 = for { s ← admin_accounts if s.account_id inSetBind emails } yield s
      await(db.run(q3.result)).toList
  }

  val create: DBIO[Unit] = admin_accounts.schema.create
  val drop: DBIO[Unit] = admin_accounts.schema.drop

  def ddl_create = db.run(create)
  def ddl_drop = db.run(drop)

}
