package models


import models.DAO.resources.{EmployeesBusinessDAO, AccountPlanDAO}
import models.DAO.resources.BusinessDTO._
import models.DAO.conversion.DatabaseCred

import securesocial.core.providers._
import securesocial.core._
import securesocial.core.services.{UserService, SaveMode}

//import models.DAO.driver.MyPostgresDriver.simple._
import com.github.nscala_time.time.Imports._
//import com.github.tminglei.slickpg.date.PgDateJdbcTypes
import slick.model.ForeignKeyAction

import slick.driver.PostgresDriver.simple._
import com.github.tototoshi.slick.PostgresJodaSupport._
import service.DemoUser



class Tokens(tag: Tag) extends Table[MailToken](tag, "tokens") {
  def id            = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def uuid          = column[String]("uuid")
  def email         = column[String]("email")
  def creationTime  = column[org.joda.time.DateTime]("creationTime")
  def expirationTime= column[org.joda.time.DateTime]("expirationTime")
  def isSignUp      = column[Boolean]("isSignUp")

  def * = (uuid, email, creationTime, expirationTime, isSignUp) <> (MailToken.tupled, MailToken.unapply)

}


object TokensDAO {

  import scala.util.Try
  import slick.driver.PostgresDriver.simple._
  import DatabaseCred.database

  val tokens = TableQuery[Tokens]

  def saveToken(token: MailToken): MailToken = database withSession {
    implicit session ⇒
      tokens += token
      token
  }

  def findToken(token: String): Option[MailToken] = { database withSession {
    implicit session ⇒
      val q3 = for { a ← tokens if a.uuid === token } yield a
      q3.list.headOption
  }

  }
  def deleteToken(uuid: String): Option[MailToken] = database withSession {
    implicit session ⇒
      val tok = findToken(uuid)
      tok match {
        case Some(token) =>
          tokens.filter(_.uuid === token.uuid).delete
          Some(token)
        case None => None
      }
  }
  def ddl_create = {
    database withSession {
      implicit session =>
      tokens.ddl.create
    }
  }
  def ddl_drop = {
    database withSession {
      implicit session =>
        tokens.ddl.drop
    }
  }
}