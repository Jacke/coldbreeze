package models.DAO.reflect

import us.ority.min.actions._


import models.DAO.conversion.DatabaseCred
//import slick.driver.PostgresDriver.api._
import models.DAO._
//import slick.driver.PostgresDriver.api._
import models.DAO.conversion.DatabaseFuture._
import com.github.nscala_time.time.Imports._
import models.DAO.conversion.DatabaseCred.dbConfig.driver.api._
import com.github.tototoshi.slick.JdbcJodaSupport._
import main.scala.bprocesses.refs.UnitRefs._


/*
val id: Option[Long],
				ident: String,
				created_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now),
			    updated_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now)

 */
class StrategyInputRefs(tag: Tag) extends Table[StrategyInputRef](tag, "strategy_input_refs") {
  def id          = column[Long]("id", O.PrimaryKey, O.AutoInc)
  def strategy    = column[Long]("strategy_id")
  def op          = column[String]("op")
  def title       = column[String]("title")
  def desc        = column[Option[String]]("desc")

  def ident       = column[String]("ident")
  def targetType  = column[String]("target_type")

  def created_at  = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at  = column[Option[org.joda.time.DateTime]]("updated_at")


  def strategyFK= foreignKey("strategy_input_refs_strategy_fk", strategy, models.DAO.reflect.StrategyRefsDAOF.strategy_refs)(_.id, onDelete = ForeignKeyAction.Cascade)


  def * = (id.?,
           strategy,
           op,
           title,
           desc,
           ident,
           targetType,
           created_at, updated_at) <> (StrategyInputRef.tupled, StrategyInputRef.unapply)
}

/*
val id: Option[Long],
strategy: Long,
op: String,
title: String,
desc: Option[String],
ident: String,
targetType: String,
created_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now),
updated_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now))
*/

object StrategyInputRefsDAOF {
  import akka.actor.ActorSystem
  import slick.backend.{StaticDatabaseConfig, DatabaseConfig}
  import slick.jdbc.meta.MTable
  import scala.concurrent.ExecutionContext.Implicits.global
  import scala.concurrent.duration.Duration
  import scala.concurrent.{ExecutionContext, Awaitable, Await, Future}
  import scala.util.Try
  def await[T](a: Awaitable[T])(implicit ec: ExecutionContext) = Await.result(a, Duration.Inf)
  def awaitAndPrint[T](a: Awaitable[T])(implicit ec: ExecutionContext) = println(await(a))
  val strategy_input_refs = TableQuery[StrategyInputRefs]

  private def filterQuery(id: Long): Query[StrategyInputRefs, StrategyInputRef, Seq] =
    strategy_input_refs.filter(_.id === id)


  def pull(s: StrategyInputRef):Future[Long] = db.run(strategy_input_refs returning strategy_input_refs.map(_.id) += s)

  private def filterByStrategiesQuery(ids: List[Long]): Query[StrategyInputRefs, StrategyInputRef, Seq] =
      strategy_input_refs.filter(_.strategy inSetBind ids)
  def getByStrategies(ids: List[Long]) = db.run(filterByStrategiesQuery(ids).result)
  def get(id: Long) = db.run(filterQuery(id).result.headOption)

  def delete(id: Long) = {
    get(id).map { obj =>
      obj match {
        case Some(finded) => db.run(strategy_input_refs.filter(_.id === id).delete)
        case _ => 0
      }
    }
  }


  val create: DBIO[Unit] = strategy_input_refs.schema.create
  val drop: DBIO[Unit] = strategy_input_refs.schema.drop

  def ddl_create = db.run(create)
  def ddl_drop = db.run(drop)

}
