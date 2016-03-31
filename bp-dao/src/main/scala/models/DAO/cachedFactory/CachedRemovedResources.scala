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
  def updatedAttributes = column[String]("updatedAttributes")
  def date              = column[org.joda.time.DateTime]("date")


  def * = (id.?, scope, scopeType, action, resourceTitle, resourceId, updatedAttributes, date) <> (CachedRemovedResourceDTO.tupled, CachedRemovedResourceDTO.unapply _)

}

case class CachedRemovedResourceDTO(var id: Option[Int],
  scope: String,
  scopeType: String,
  action: String,
  resourceTitle: String,
  resourceId: String,
  updatedAttributes: String,
  date: org.joda.time.DateTime) {

    // extract json from updatedAttributes and transform it
    def detectUpdates:List[String] = {
      List(updatedAttributes)
    }

  }
case class DeltasContainer(u: Seq[CachedRemovedResourceDTO], d: Seq[CachedRemovedResourceDTO])

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
    private def filterByScopeQuery(scope: String, scopeType: String, resourceTitle:String, t:org.joda.time.DateTime): Query[CachedRemovedResources, CachedRemovedResourceDTO, Seq] =
      cached_removed_resources.filter(c => c.scope === scope
        && c.scopeType === scopeType
        && c.resourceTitle === resourceTitle
        && c.date > t)


  def findById(id: Int): Future[CachedRemovedResourceDTO] =
    db.run(filterQuery(id).result.head)

  def findAllByScope(scope: String, scopeType: String, resourceTitle:String, timestamp: Option[String]): Future[DeltasContainer] = {
      val sInt:String = timestamp.getOrElse("0")
      val datetime = new org.joda.time.DateTime(sInt.toLong)

      db.run(filterByScopeQuery(scope, scopeType, resourceTitle,datetime).result).map { resourceDeltas =>
        DeltasContainer(
          u = resourceDeltas.filter(c => c.action == "updated"),
          d = resourceDeltas.filter(c => c.action == "deleted")
        )
      }
  }


 def makeResourceRemoveEntity(
   scope: String,
   action: String,
   resourceTitle: String,
   resourceId: String
 ) = {
   println("makeResourceRemoveEntity")
   pull_object(
     CachedRemovedResourceDTO(
       None,
       scope,
       scopeType = "workbench",
       action = "deleted",
       resourceTitle,
       resourceId,
       "",
       org.joda.time.DateTime.now()
   ))
 }
 def makeResourceUpdateEntity(
   scope: String,
   action: String,
   resourceTitle: String,
   resourceId: String,
   updatedEntity:Map[String, String]=Map()
 ) = {
   pull_object(
     CachedRemovedResourceDTO(
       None,
       scope,
       scopeType = "workbench",
       action = "updated",
       resourceTitle,
       resourceId,
       updatedEntity.foldLeft(":") { (s: String, pair: (String, String)) =>
         pair._1 + s + pair._2
       },
       org.joda.time.DateTime.now()
     ))
 }


 def pull_object(s: CachedRemovedResourceDTO) =
      db.run(cached_removed_resources returning cached_removed_resources.map(_.id) += s)


  def getAll:Future[Int] = db.run(cached_removed_resources.length.result)


  val create: DBIO[Unit] = cached_removed_resources.schema.create
  val drop: DBIO[Unit] = cached_removed_resources.schema.drop
  def ddl_create = db.run(create)
  def ddl_drop = db.run(drop)




}
