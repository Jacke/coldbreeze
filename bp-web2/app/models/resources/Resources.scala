package models.DAO

import slick.driver.PostgresDriver.api._
import com.github.nscala_time.time.Imports._
import com.github.tototoshi.slick.PostgresJodaSupport._
import slick.model.ForeignKeyAction
import models.DAO.conversion.{DatabaseCred, Implicits}
import slick.model.ForeignKeyAction


class Resources(tag: Tag) extends Table[ResourceDTO](tag, "resources"){
  def id         = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def title      = column[String]("title")
  def business   = column[Int]("business_id")
  def created_at = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at = column[Option[org.joda.time.DateTime]]("updated_at")

  def businessFK  = foreignKey("res_business_fk", business, models.DAO.resources.BusinessDAO.businesses)(_.id, onDelete = ForeignKeyAction.Cascade)


  def * = (id.?, title,business,
           created_at,
           updated_at) <> (ResourceDTO.tupled, ResourceDTO.unapply)

}
case class ResourceDTO(
  var id: Option[Int],
  title: String,
  business:Int,
  created_at: Option[org.joda.time.DateTime] = None,
  updated_at: Option[org.joda.time.DateTime] = None )

object ResourceDAO {
  import akka.actor.ActorSystem
  import slick.backend.{StaticDatabaseConfig, DatabaseConfig}
  //import slick.driver.JdbcProfile
  import slick.driver.PostgresDriver.api._
  import slick.jdbc.meta.MTable
  import scala.concurrent.ExecutionContext.Implicits.global
  import com.github.tototoshi.slick.PostgresJodaSupport._
  import scala.concurrent.duration.Duration
  import scala.concurrent.{ExecutionContext, Awaitable, Await, Future}
  import scala.util.Try
  import models.DAO.conversion.DatabaseFuture._

  //import dbConfig.driver.api._ //
  def await[T](a: Awaitable[T])(implicit ec: ExecutionContext) = Await.result(a, Duration.Inf)
  def awaitAndPrint[T](a: Awaitable[T])(implicit ec: ExecutionContext) = println(await(a))

  val resources = TableQuery[Resources]


  def pull_object(s: ResourceDTO) =   {

      await(db.run(
        resources returning resources.map(_.id) += s.copy(created_at=Some(org.joda.time.DateTime.now),updated_at = Some(org.joda.time.DateTime.now)) ))
  }
  def get(k: Int) =   {
      val q3 = for { s ← resources if s.id === k } yield s
      await(db.run(q3.result.headOption))
  }

  def findByBusinessId(id: Int) =   {
      val q3 = for { s ← resources if s.business === id } yield s
      await(db.run(q3.result)).toList
  }

  def update(id: Int, annotation: ResourceDTO) =   {
    val resourcesUpdate: ResourceDTO = annotation.copy(id = Option(id), updated_at = Some(org.joda.time.DateTime.now))
    await(db.run(  resources.filter(_.id === id).update(resourcesUpdate) ))
  }


  def delete(id: Int) =   {
    await(db.run(  resources.filter(_.id === id).delete ))
  }


  val create: DBIO[Unit] = resources.schema.create
  val drop: DBIO[Unit] = resources.schema.drop

  def ddl_create = db.run(create)
  def ddl_drop = db.run(drop)

}
