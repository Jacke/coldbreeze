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


class LaunchMiddlewares(tag: Tag) extends Table[LaunchMiddleware](tag, "launch_middlewares") {
  def id          = column[Long]("id", O.PrimaryKey, O.AutoInc)
  def session     = column[Int]("session_id")
  def ident       = column[String]("ident")
  def ifaceIdent  = column[String]("iface_ident")
  def reaction    = column[Int]("reaction_id")

  def created_at  = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at  = column[Option[org.joda.time.DateTime]]("updated_at")

  def reaction_FK = foreignKey("middleware_reaction_fk", reaction, models.DAO.SessionReactionDAO.session_reactions)(_.id, onDelete = ForeignKeyAction.Cascade)
  def sessionFK  = foreignKey("middleware_reaction_session_fk", session,  models.DAO.BPSessionDAOF.bpsessions)(_.id, onDelete = ForeignKeyAction.Cascade)

  def * = (id.?,
           session,
           ident,
           ifaceIdent,
           reaction,
           created_at, updated_at) <> (LaunchMiddleware.tupled, LaunchMiddleware.unapply)
}

object LaunchMiddlewaresDAOF {
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
  val launch_middlewares = TableQuery[LaunchMiddlewares]


  val create: DBIO[Unit] = launch_middlewares.schema.create
  val drop: DBIO[Unit] = launch_middlewares.schema.drop
  def get(id: Long) = db.run(filterQuery(id).result.headOption)

  def pull(s: LaunchMiddleware):Future[Long] = db.run(launch_middlewares returning launch_middlewares.map(_.id) += s)

  def ddl_create = db.run(create)
  def ddl_drop = db.run(drop)

  def findByReactions(reaction: List[Int]) = db.run(filterReactionsQuery(reaction).result)

  private def filterReactionsQuery(ids: List[Int]): Query[LaunchMiddlewares, LaunchMiddleware, Seq] =
    launch_middlewares.filter(_.reaction inSetBind ids)
  private def filterQuery(id: Long): Query[LaunchMiddlewares, LaunchMiddleware, Seq] =
    launch_middlewares.filter(_.id === id)

}
