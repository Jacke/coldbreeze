package models.DAO

import us.ority.min.actions._


import models.DAO.conversion.DatabaseCred
//import models.DAO.driver.MyPostgresDriver.simple._
import models.DAO._
//import models.DAO.driver.MyPostgresDriver.simple._
import models.DAO.conversion.DatabaseFuture._
import com.github.nscala_time.time.Imports._
import models.DAO.conversion.DatabaseCred.dbConfig.driver.api._
import com.github.tototoshi.slick.JdbcJodaSupport._
import main.scala.bprocesses.refs.UnitRefs._
import main.scala.simple_parts.process.Units._


/*
val id: Option[Long],
				ident: String,
				created_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now),
			    updated_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now)

 */
class StrategyInputs(tag: Tag) extends Table[StrategyInputUnit](tag, "strategy_inputs") {
  def id          = column[Long]("id", O.PrimaryKey, O.AutoInc)
  def strategy    = column[Long]("strategy_id")
  def op          = column[String]("op")
  def title       = column[String]("title")
  def desc        = column[Option[String]]("desc")

  def ident       = column[String]("ident")
  def targetType  = column[String]("target_type")

  def created_at  = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at  = column[Option[org.joda.time.DateTime]]("updated_at")


  def strategyFK= foreignKey("strategy_inputs_unit_strategy_fk", strategy, models.DAO.StrategiesDAOF.strategies)(_.id, onDelete = ForeignKeyAction.Cascade)


  def * = (id.?,
           strategy,
           op,
           title,
           desc,
           ident,
           targetType,
           created_at, updated_at) <> (StrategyInputUnit.tupled, StrategyInputUnit.unapply)
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

object StrategyInputsDAOF {
  import akka.actor.ActorSystem
  import akka.stream.ActorFlowMaterializer
  import akka.stream.scaladsl.Source
  import slick.backend.{StaticDatabaseConfig, DatabaseConfig}
  import slick.jdbc.meta.MTable
  import scala.concurrent.ExecutionContext.Implicits.global
  import scala.concurrent.duration.Duration
  import scala.concurrent.{ExecutionContext, Awaitable, Await, Future}
  import scala.util.Try
  def await[T](a: Awaitable[T])(implicit ec: ExecutionContext) = Await.result(a, Duration.Inf)
  def awaitAndPrint[T](a: Awaitable[T])(implicit ec: ExecutionContext) = println(await(a))
  val strategy_inputs = TableQuery[StrategyInputs]

  private def filterQuery(id: Long): Query[StrategyInputs, StrategyInputUnit, Seq] =
    strategy_inputs.filter(_.id === id)

  val create: DBIO[Unit] = strategy_inputs.schema.create
  val drop: DBIO[Unit] = strategy_inputs.schema.drop

  def ddl_create = db.run(create)
  def ddl_drop = db.run(drop)

}
