package models.DAO

import slick.driver.PostgresDriver.api._
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
  import scala.util.Try
  import DatabaseCred.database

 val account_loggers = TableQuery[AccountLoggers]

 def pull_object(s: AccountLogger) = database withSession {
    implicit session ⇒
      account_loggers returning account_loggers.map(_.id) += s
  }
  def get(k: Int) = database withSession {
    implicit session ⇒
      val q3 = for { s ← account_loggers if s.id === k } yield s
      q3.list.headOption 
  }
  def update(id: Int, obj: AccountLogger) = database withSession { implicit session ⇒
    val toUpdate: AccountLogger = obj.copy(Option(id))
    account_loggers.filter(_.id === id).update(toUpdate)
  }

  def delete(id: Int) = database withSession { implicit session ⇒

    account_loggers.filter(_.id === id).delete
  }
  def count: Int = database withSession { implicit session ⇒
    Query(account_loggers.length).first
  }  
  def getAll = database withSession {
    implicit session ⇒
      val q3 = for { s ← account_loggers } yield s 
      q3.list.sortBy(_.id)
  
  }

  def ddl_create = {
    database withSession {
      implicit session =>
      account_loggers.ddl.create
    }
  }
  def ddl_drop = {
    database withSession {
      implicit session =>
        account_loggers.ddl.drop
    }
  }

}




