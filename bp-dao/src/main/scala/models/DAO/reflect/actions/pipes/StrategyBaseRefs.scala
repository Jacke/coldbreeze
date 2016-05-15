package models.DAO.reflect

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


/*
val id: Option[Long],
				ident: String,
				created_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now),
			    updated_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now)

 */
class StrategyBaseRefs(tag: Tag) extends Table[StrategyBaseRef](tag, "strategy_base_refs") {
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

  def strategyFK= foreignKey("strategy_base_refs_strategy_fk", strategy, models.DAO.reflect.StrategyRefsDAOF.strategy_refs)(_.id, onDelete = ForeignKeyAction.Cascade)

  def * = (id.?,
           strategy,
           key,
           baseType,
           valueType,
           valueContent,

           validationScheme,
           validationPattern,
           created_at, updated_at) <> (StrategyBaseRef.tupled, StrategyBaseRef.unapply)

}
/*
case class StrategyBaseRef(
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

object StrategyBaseRefsDAOF {
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
  val strategy_base_refs = TableQuery[StrategyBaseRefs]

  private def filterQuery(id: Long): Query[StrategyBaseRefs, StrategyBaseRef, Seq] =
    strategy_base_refs.filter(_.id === id)

  def pull(s: StrategyBaseRef):Future[Long] = db.run(strategy_base_refs returning strategy_base_refs.map(_.id) += s)

  private def filterByStrategiesQuery(ids: List[Long]): Query[StrategyBaseRefs, StrategyBaseRef, Seq] =
      strategy_base_refs.filter(_.strategy inSetBind ids)
  def getByStrategies(ids: List[Long]) = db.run(filterByStrategiesQuery(ids).result)

  val create: DBIO[Unit] = strategy_base_refs.schema.create
  val drop: DBIO[Unit] = strategy_base_refs.schema.drop


  def get(id: Long) = db.run(filterQuery(id).result.headOption)


  def ddl_create = db.run(create)
  def ddl_drop = db.run(drop)

}
