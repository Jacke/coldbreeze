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
import us.ority.min.actions._

/*
val id: Option[Long],
				ident: String,
				created_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now),
			    updated_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now)

 */
class Strategies(tag: Tag) extends Table[Strategy](tag, "strategies") {
  def id          = column[Long]("id", O.PrimaryKey, O.AutoInc)
  def ident       = column[String]("ident")
  def middleware  = column[Long]("middleware_id")
  def isNullStrategy = column[Boolean]("is_null_strategy")

  def created_at  = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at  = column[Option[org.joda.time.DateTime]]("updated_at")


  def middleware_FK = foreignKey("strategy_middleware_fk", middleware, models.DAO.MiddlewaresDAOF.middlewares)(_.id, onDelete = ForeignKeyAction.Cascade)

  def * = (id.?,
           ident, middleware,isNullStrategy,
           created_at, updated_at) <> (Strategy.tupled, Strategy.unapply)
}

object StrategiesDAOF {
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
  //import dbConfig.driver.api._ //
  def await[T](a: Awaitable[T])(implicit ec: ExecutionContext) = Await.result(a, Duration.Inf)
  def awaitAndPrint[T](a: Awaitable[T])(implicit ec: ExecutionContext) = println(await(a))
  val strategies = StrategiesDAO.strategies

  private def filterQuery(id: Long): Query[Strategies, Strategy, Seq] =
    strategies.filter(_.id === id)

  val create: DBIO[Unit] = strategies.schema.create
  val drop: DBIO[Unit] = strategies.schema.drop


  def pull(s: Strategy):Future[Long] = db.run(strategies returning strategies.map(_.id) += s)
  def get(id: Long) = db.run(filterQuery(id).result.headOption)


  def ddl_create = db.run(create)
  def ddl_drop = db.run(drop)

}
object StrategiesDAO {
	  val strategies = TableQuery[Strategies]
}
