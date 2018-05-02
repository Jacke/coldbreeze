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
import main.scala.bprocesses.refs._
import main.scala.simple_parts.process._

/*
val id: Option[Long],
				ident: String,
				created_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now),
			    updated_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now)

 */
class LaunchStrategyBases(tag: Tag) extends Table[LaunchStrategyBaseUnit](tag, "launch_strategy_bases") {
  def id               = column[Long]("id", O.PrimaryKey, O.AutoInc)
  def strategy         = column[Long]("strategy_id")
  def key              = column[String]("key")
  def baseType         = column[String]("base_type")
  def valueType        = column[String]("value_type")
  def valueContent     = column[String]("value_content")

  def validationScheme       = column[Option[String]]("validation_scheme")
  def validationPattern      = column[Option[String]]("validation_pattern")

  def created_at  = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at  = column[Option[org.joda.time.DateTime]]("updated_at")

  def strategyFK= foreignKey("launch_strategy_bases_unit_strategy_fk", strategy, models.DAO.LaunchStrategiesDAOF.launch_strategies)(_.id, onDelete = ForeignKeyAction.Cascade)

  def * = (id.?,
           strategy,
           key,
           baseType,
           valueType,
           valueContent,

           validationScheme,
           validationPattern,
           created_at, updated_at) <> (LaunchStrategyBaseUnit.tupled, LaunchStrategyBaseUnit.unapply)

}
/*
case class StrategyBaseUnit(
  val id: Option[Long],
  strategy: Long,
  key: String,
  baseType: String,
  valueType: String,
  valueContent: String,
  validationScheme: Option[String] = None,
  validationPettern: Option[String] = None,
  created_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now),
  updated_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now))
*/

object LaunchStrategyBasesDAOF {
  import akka.actor.ActorSystem
  import slick.backend.{StaticDatabaseConfig, DatabaseConfig}
  import slick.jdbc.meta.MTable
  import scala.concurrent.ExecutionContext.Implicits.global
  import scala.concurrent.duration.Duration
  import scala.concurrent.{ExecutionContext, Awaitable, Await, Future}
  import scala.util.Try
  def await[T](a: Awaitable[T])(implicit ec: ExecutionContext) = Await.result(a, Duration.Inf)
  def awaitAndPrint[T](a: Awaitable[T])(implicit ec: ExecutionContext) = println(await(a))
  val strategy_bases = TableQuery[LaunchStrategyBases]

  private def filterQuery(id: Long): Query[LaunchStrategyBases, LaunchStrategyBaseUnit, Seq] =
    strategy_bases.filter(_.id === id)

  private def filterStrategiesQuery(ids: List[Long]): Query[LaunchStrategyBases, LaunchStrategyBaseUnit, Seq] =
    strategy_bases.filter(_.strategy inSetBind ids)

  val create: DBIO[Unit] = strategy_bases.schema.create
  val drop: DBIO[Unit] = strategy_bases.schema.drop

  def getByStrategies(ids: List[Long]) = db.run(filterStrategiesQuery(ids).result)


  def pull(s: LaunchStrategyBaseUnit):Future[Long] = db.run(strategy_bases returning strategy_bases.map(_.id) += s)
  def get(id: Long) = db.run(filterQuery(id).result.headOption)

  def ddl_create = db.run(create)
  def ddl_drop = db.run(drop)

}
