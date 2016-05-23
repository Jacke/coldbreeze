package models.DAO.reflect

import us.ority.min.actions._


import models.DAO.conversion.DatabaseCred
//import slick.driver.PostgresDriver.api._
import models.DAO._
//import slick.driver.PostgresDriver.api._
import models.DAO.conversion.DatabaseFuture._
import slick.driver.PostgresDriver.api._
import com.github.nscala_time.time.Imports._
import com.github.tototoshi.slick.PostgresJodaSupport._
import main.scala.bprocesses.refs.UnitRefs._


/*
val id: Option[Long],
				ident: String,
				created_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now),
			    updated_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now)

 */
class StrategyRefs(tag: Tag) extends Table[StrategyRef](tag, "strategy_refs") {
  def id          = column[Long]("id", O.PrimaryKey, O.AutoInc)
  def ident       = column[String]("ident")
  def reflection  = column[Int]("reflection_id")
  def middleware  = column[Long]("middleware_id")
  def isNullStrategy = column[Boolean]("is_null_strategy")
  def created_at  = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at  = column[Option[org.joda.time.DateTime]]("updated_at")
  def reflectFK   = foreignKey("strategy_ref_reflect_fk", reflection, models.DAO.reflect.RefDAO.refs)(_.id, onDelete = ForeignKeyAction.Cascade)
  def middlewareFK= foreignKey("middleware_ref_reflect_fk", middleware, models.DAO.reflect.MiddlewareRefsDAOF.middleware_refs)(_.id, onDelete = ForeignKeyAction.Cascade)

  def * = (id.?,
           ident,
           reflection, middleware,isNullStrategy,
           created_at, updated_at) <> (StrategyRef.tupled, StrategyRef.unapply)
}

object StrategyRefsDAOF {
  import akka.actor.ActorSystem
  import slick.backend.{StaticDatabaseConfig, DatabaseConfig}
  import slick.jdbc.meta.MTable
  import scala.concurrent.ExecutionContext.Implicits.global
  import scala.concurrent.duration.Duration
  import scala.concurrent.{ExecutionContext, Awaitable, Await, Future}
  import scala.util.Try
  def await[T](a: Awaitable[T])(implicit ec: ExecutionContext) = Await.result(a, Duration.Inf)
  def awaitAndPrint[T](a: Awaitable[T])(implicit ec: ExecutionContext) = println(await(a))
  val strategy_refs = TableQuery[StrategyRefs]

  private def filterQuery(id: Long): Query[StrategyRefs, StrategyRef, Seq] =
    strategy_refs.filter(_.id === id)

  private def filterByMWsQuery(ids: List[Long]): Query[StrategyRefs, StrategyRef, Seq] =
      strategy_refs.filter(_.middleware inSetBind ids)


  def getByMWS(ids: List[Long]) = db.run(filterByMWsQuery(ids).result)

  val create: DBIO[Unit] = strategy_refs.schema.create
  val drop: DBIO[Unit] = strategy_refs.schema.drop
  def pull(s: StrategyRef):Future[Long] = db.run(strategy_refs returning strategy_refs.map(_.id) += s)
  def get(id: Long) = db.run(filterQuery(id).result.headOption)

  def ddl_create = db.run(create)
  def ddl_drop = db.run(drop)

  def delete(id: Long) = {
      get(id).map { obj =>
        obj match {
          case Some(finded) => db.run(strategy_refs.filter(_.id === id).delete)
          case _ => 0
        }
      }
  }
}

object StrategyRefsDAO {
	  val strategy_refs = TableQuery[StrategyRefs]
}
