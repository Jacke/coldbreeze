package models.DAO

import akka.actor.ActorSystem
import akka.stream.ActorFlowMaterializer
import akka.stream.scaladsl.Source
import slick.backend.{StaticDatabaseConfig, DatabaseConfig}
//import slick.driver.JdbcProfile
import slick.driver.PostgresDriver.api._

import slick.jdbc.meta.MTable
import scala.concurrent.ExecutionContext.Implicits.global

import com.github.tototoshi.slick.JdbcJodaSupport._
import scala.concurrent.duration.Duration
import scala.concurrent.{ExecutionContext, Awaitable, Await, Future}

class CachedRemovedResources(tag: Tag) extends Table[CachedRemovedResourceDTO](tag, "cached_removed_resources") {
//Table[(Int,String,String,Option[Int],Option[String],Option[Int], org.joda.time.DateTime)](tag, "process_histories") {
  def id       = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def scope      = column[String]("scope")
  def scopeType  = column[String]("scope_type")

  def action            = column[String]("action")
  def resourceTitle     = column[String]("what")
  def resourceId        = column[String]("what_id")
  def date              = column[org.joda.time.DateTime]("date")


  def * = (id.?, scope, scopeType, action, resourceTitle, resourceId, date) <> (CachedRemovedResourceDTO.tupled, CachedRemovedResourceDTO.unapply _)

}

case class CachedRemovedResourceDTO(var id: Option[Int],
  scope: String,
  scopeType: String,
  action: String,
  resourceTitle: String,
  resourceId: String,
  date: org.joda.time.DateTime)

object CachedRemovedResourcesDAO {
  import scala.util.Try
import akka.actor.ActorSystem
import akka.stream.ActorFlowMaterializer
import akka.stream.scaladsl.Source
import slick.backend.{StaticDatabaseConfig, DatabaseConfig}
//import slick.driver.JdbcProfile
import slick.driver.PostgresDriver.api._
import slick.jdbc.meta.MTable
import scala.concurrent.ExecutionContext.Implicits.global
import com.github.tototoshi.slick.JdbcJodaSupport._
import scala.concurrent.duration.Duration
import scala.concurrent.{ExecutionContext, Awaitable, Await, Future}
import scala.util.Try
import models.DAO.conversion.DatabaseFuture._
  //import dbConfig.driver.api._ //
  def await[T](a: Awaitable[T])(implicit ec: ExecutionContext) = Await.result(a, Duration.Inf)
  def awaitAndPrint[T](a: Awaitable[T])(implicit ec: ExecutionContext) = println(await(a))




  val cached_removed_resources = TableQuery[CachedRemovedResources]

  private def filterQuery(id: Int): Query[CachedRemovedResources, CachedRemovedResourceDTO, Seq] =
    cached_removed_resources.filter(_.id === id)
    private def filterByScopeQuery(scope: String): Query[CachedRemovedResources, CachedRemovedResourceDTO, Seq] =
      cached_removed_resources.filter(_.scope === scope)


  def findById(id: Int): Future[CachedRemovedResourceDTO] =
    db.run(filterQuery(id).result.head)

  def findAllByScope(scope: String): Future[Seq[CachedRemovedResourceDTO]] =
      db.run(filterByScopeQuery(scope).result)


 def pull_object(s: CachedRemovedResourceDTO) =
      cached_removed_resources returning cached_removed_resources.map(_.id) += s


  def getAll:Future[Int] = db.run(cached_removed_resources.length.result)


  val create: DBIO[Unit] = cached_removed_resources.schema.create
  val drop: DBIO[Unit] = cached_removed_resources.schema.drop
  def ddl_create = db.run(create)
  def ddl_drop = db.run(drop)




}
