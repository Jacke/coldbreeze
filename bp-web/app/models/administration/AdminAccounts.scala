package models.administration


import scala.slick.driver.PostgresDriver.simple._
import scala.slick.model.ForeignKeyAction
import models.DAO.resources.BusinessDTO._
import models.DAO.resources.EmployeeDAO._
import models.DAO.conversion.DatabaseCred

case class AdminAccountDTO(id: Option[Int], account_id: String, sudo: Boolean = false)
class AdminAccounts(tag: Tag) extends Table[AdminAccountDTO](tag, "admin_accounts") {
  def id = column[Int]("id", O.PrimaryKey, O.AutoInc)

  def account_id = column[String]("account_id")
  def sudo = column[Boolean]("sudo")
  
  def maccFK = foreignKey("macc_fk", account_id, models.AccountsDAO.accounts)(_.userId, onDelete = ForeignKeyAction.Cascade)

  def * = (id.?, account_id, sudo) <> (AdminAccountDTO.tupled, AdminAccountDTO.unapply)

}


object AdminAccountsDAO {
  import scala.util.Try
  import DatabaseCred.database

  val admin_accounts = TableQuery[AdminAccounts]

  def getByUID(email: String):Option[AdminAccountDTO] = database withSession {
    implicit session =>
      val q3 = for { s ← admin_accounts if s.account_id === email } yield s 
      q3.list.headOption
  }

  def getAllByUID(emails: List[String]):List[AdminAccountDTO] = database withSession {
    implicit session =>
      val q3 = for { s ← admin_accounts if s.account_id inSetBind emails } yield s 
      q3.list
  }

  def ddl_create = {
    database withSession {
      implicit session =>
      admin_accounts.ddl.create
    }
  }
  def ddl_drop = {
    database withSession {
      implicit session =>
        admin_accounts.ddl.drop
    }
  }

}