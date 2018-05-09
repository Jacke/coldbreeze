package models.DAO

import us.ority.min.actions._


import models.DAO.conversion.DatabaseCred
//import slick.driver.PostgresDriver.api._
import models.DAO._
//import slick.driver.PostgresDriver.api._
import models.DAO.conversion.DatabaseFuture._
import com.github.nscala_time.time.Imports._
import models.DAO.conversion.DatabaseCred.dbConfig.driver.api._
import com.github.tototoshi.slick.PostgresJodaSupport._
import us.ority.min.actions._

/*
val id: Option[Long],
				ident: String,
				created_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now),
			    updated_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now)

 */
class LaunchStrategies(tag: Tag) extends Table[LaunchStrategy](tag, "launch_strategies") {
  def id          = column[Long]("id", O.PrimaryKey, O.AutoInc)
  def session     = column[Int]("session_id")

  def ident       = column[String]("ident")
  def middleware  = column[Long]("middleware_id")
  def isNullStrategy = column[Boolean]("is_null_strategy")

  def created_at  = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at  = column[Option[org.joda.time.DateTime]]("updated_at")

  def sessionFK  = foreignKey("middleware_reaction_session_fk", session,  models.DAO.BPSessionDAOF.bpsessions)(_.id, onDelete = ForeignKeyAction.Cascade)
  def middleware_FK = foreignKey("launch_strategy_middleware_fk", middleware, models.DAO.LaunchMiddlewaresDAOF.launch_middlewares)(_.id, onDelete = ForeignKeyAction.Cascade)

  def * = (id.?,session,
           ident, middleware,isNullStrategy,
           created_at, updated_at) <> (LaunchStrategy.tupled, LaunchStrategy.unapply)
}

object LaunchStrategiesDAOF {
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
  
  val launch_strategies = TableQuery[LaunchStrategies]

  private def filterQuery(id: Long): Query[LaunchStrategies, LaunchStrategy, Seq] =
    launch_strategies.filter(_.id === id)

  val create: DBIO[Unit] = launch_strategies.schema.create
  val drop: DBIO[Unit] = launch_strategies.schema.drop

  def findByMiddlewares(middlewares: List[Long]) = db.run(filterMiddlewaresQuery(middlewares).result)

  private def filterMiddlewaresQuery(ids: List[Long]): Query[LaunchStrategies, LaunchStrategy, Seq] =
    launch_strategies.filter(c => c.middleware inSetBind ids)

  def pull(s: LaunchStrategy):Future[Long] = db.run(launch_strategies returning launch_strategies.map(_.id) += s)
  def get(id: Long) = db.run(filterQuery(id).result.headOption)


  def ddl_create = db.run(create)
  def ddl_drop = db.run(drop)

}
