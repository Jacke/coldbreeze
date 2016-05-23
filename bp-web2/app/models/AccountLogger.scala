package models.DAO

import slick.driver.PostgresDriver.api._
import com.github.nscala_time.time.Imports._
import com.github.tototoshi.slick.PostgresJodaSupport._
import com.github.nscala_time.time.Imports._
import models.DAO.conversion.DatabaseCred

class AccountLoggers(tag: Tag) extends Table[AccountLogger](tag, "account_loggers") {
  def id              = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def ip              = column[String]("ip")
  def user_agent      = column[String]("user_agent")
  def email           = column[Option[String]]("email")
  def date            = column[org.joda.time.DateTime]("date")

  def * = (id.?, ip, user_agent, email, date) <> (AccountLogger.tupled, AccountLogger.unapply)

  //def eb = EmployeesBusinessDAO.employees_businesses.filter(_.employee_id === id).flatMap(_.businessFK)
}

case class AccountLogger(var id: Option[Int],
  ip:String,
  user_agent:String,
  email: Option[String] = None,
  date: org.joda.time.DateTime = org.joda.time.DateTime.now
)


object AccountLoggerDAO {
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

 val account_loggers = TableQuery[AccountLoggers]

 def pull_object(s: AccountLogger) =   {
      await(db.run(  account_loggers returning account_loggers.map(_.id) += s ))
 }

  def get(k: Int) =   {

      val q3 = for { s ← account_loggers if s.id === k } yield s
      await(db.run(q3.result.headOption))
  }
  def update(id: Int, obj: AccountLogger) =   {
    val toUpdate: AccountLogger = obj.copy(Option(id))
    await(db.run(  account_loggers.filter(_.id === id).update(toUpdate) ))
  }

  def delete(id: Int) =   {
    await(db.run(  account_loggers.filter(_.id === id).delete ))
  }


  val create: DBIO[Unit] = account_loggers.schema.create
  val drop: DBIO[Unit] = account_loggers.schema.drop

  def ddl_create = db.run(create)
  def ddl_drop = db.run(drop)

}
