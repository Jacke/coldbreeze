package models.DAO


import us.ority.min.actions._

import models.DAO.conversion.DatabaseCred
//import slick.driver.PostgresDriver.api._
import models.DAO._
//import slick.driver.PostgresDriver.api._
import models.DAO.conversion.DatabaseFuture._
import com.github.nscala_time.time.Imports._
import models.DAO.conversion.DatabaseCred.dbConfig.driver.api._
import com.github.tototoshi.slick.JdbcJodaSupport._

case class LaunchedStrategy(val id: Option[Long],
				ident: String,
				launch_id: Int,
				created_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now),
			    updated_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now))

class LaunchedStrategies(tag: Tag) extends Table[LaunchedStrategy](tag, "launched_strategies") {
  def id          = column[Long]("id", O.PrimaryKey, O.AutoInc)
  def ident       = column[String]("ident")
  def session_id  = column[Int]("session_id")
  def created_at  = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at  = column[Option[org.joda.time.DateTime]]("updated_at")


  def * = (id.?,
           ident, session_id,
           created_at, updated_at) <> (LaunchedStrategy.tupled, LaunchedStrategy.unapply)
}

object LaunchedStrategiesDAOF {
  import akka.actor.ActorSystem
  import slick.backend.{StaticDatabaseConfig, DatabaseConfig}
  //import slick.driver.JdbcProfile
  //import slick.driver.PostgresDriver.api._
  import slick.jdbc.meta.MTable
  import scala.concurrent.ExecutionContext.Implicits.global
  import scala.concurrent.duration.Duration
  import scala.concurrent.{ExecutionContext, Awaitable, Await, Future}
  import scala.util.Try
//import slick.driver.PostgresDriver.api._

  def await[T](a: Awaitable[T])(implicit ec: ExecutionContext) = Await.result(a, Duration.Inf)
  def awaitAndPrint[T](a: Awaitable[T])(implicit ec: ExecutionContext) = println(await(a))
  val launched_strategies = TableQuery[LaunchedStrategies]


  val create: DBIO[Unit] = launched_strategies.schema.create
  val drop: DBIO[Unit] = launched_strategies.schema.drop


  def ddl_create = db.run(create)
  def ddl_drop = db.run(drop)


  private def filterQuery(id: Long): Query[LaunchedStrategies, LaunchedStrategy, Seq] =
    launched_strategies.filter(_.id === id)

}
