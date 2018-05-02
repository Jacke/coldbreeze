//Fields.scala
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

/*
class Fields(tag: Tag) extends Table[Middleware](tag, "fields") {
  def id          = column[Long]("id", O.PrimaryKey, O.AutoInc)
  def ident       = column[String]("ident")
  def reaction    = column[Int]("reaction_id")
  def created_at  = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at  = column[Option[org.joda.time.DateTime]]("updated_at")

  def reaction_FK = foreignKey("middleware_reaction_fk", reaction, models.DAO.ReactionDAO.reactions)(_.id, onDelete = ForeignKeyAction.Cascade)

  def * = (id.?,
           ident, reaction,
           created_at, updated_at) <> (Middleware.tupled, Middleware.unapply)
}

object FieldsDAOF {
  import akka.actor.ActorSystem
  import slick.backend.{StaticDatabaseConfig, DatabaseConfig}
  //import slick.driver.JdbcProfile
  //import slick.driver.PostgresDriver.api._
  import slick.jdbc.meta.MTable
  import scala.concurrent.ExecutionContext.Implicits.global
  import scala.concurrent.duration.Duration
  import scala.concurrent.{ExecutionContext, Awaitable, Await, Future}
  import scala.util.Try

  def await[T](a: Awaitable[T])(implicit ec: ExecutionContext) = Await.result(a, Duration.Inf)
  def awaitAndPrint[T](a: Awaitable[T])(implicit ec: ExecutionContext) = println(await(a))
  val middlewares = TableQuery[Fields]


  val create: DBIO[Unit] = middlewares.schema.create
  val drop: DBIO[Unit] = middlewares.schema.drop


  def ddl_create = db.run(create)
  def ddl_drop = db.run(drop)

  private def filterQuery(id: Long): Query[Fields, Middleware, Seq] =
    middlewares.filter(_.id === id)

}
*/
