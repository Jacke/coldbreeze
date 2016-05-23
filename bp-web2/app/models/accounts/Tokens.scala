package models


import models.DAO.resources.{EmployeesBusinessDAO, AccountPlanDAO}
import models.DAO.resources.BusinessDTO._
import models.DAO.conversion.DatabaseCred

import securesocial.core.providers._
import securesocial.core._
import securesocial.core.services.{UserService, SaveMode}

//import slick.driver.PostgresDriver.api._
import com.github.nscala_time.time.Imports._
//import com.github.tminglei.slickpg.date.PgDateJdbcTypes
import slick.model.ForeignKeyAction

import slick.driver.PostgresDriver.api._
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


  val tokens = TableQuery[Tokens]
/*
  def saveToken(token: MailToken): MailToken =   {

      tokens += token
      token
  }

  def findToken(token: String): Option[MailToken] =   {

      val q3 = for { a ← tokens if a.uuid === token } yield a
      await(db.run(q3.result.headOption))
  }
  def findTokenByEmail(email: String): Option[MailToken] =   {

      val q3 = for { a ← tokens if a.email === email } yield a
      await(db.run(q3.result.headOption))
  }
  def deleteToken(uuid: String): Option[MailToken] =   {

      val tok = findToken(uuid)
      tok match {
        case Some(token) =>
          tokens.filter(_.uuid === token.uuid).delete
          Some(token)
        case None => None
      }
  }
  def deleteTokens() =   {

    val q3 = for { s ← tokens } yield s
    await(db.run(q3.result)).toList.map(token => deleteToken(token.uuid)).flatten

  }
  */

  val create: DBIO[Unit] = tokens.schema.create
  val drop: DBIO[Unit] = tokens.schema.drop

  def ddl_create = db.run(create)
  def ddl_drop = db.run(drop)

}
