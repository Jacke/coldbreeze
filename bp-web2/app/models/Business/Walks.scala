package models.DAO.resources

//import slick.driver.PostgresDriver.api._
import models.DAO.conversion.DatabaseCred
import slick.driver.PostgresDriver.api._
import com.github.nscala_time.time.Imports._
import com.github.tototoshi.slick.PostgresJodaSupport._


class Walks(tag: Tag) extends Table[WalkDTO](tag, "walks") {
  def id          = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def title       = column[String]("title")
  def predicate   = column[String]("predicate")

  def finished    = column[Boolean]("finished")
  def started     = column[Boolean]("started")
  def finished_at = column[org.joda.time.DateTime]("finished_at")
  def started_at  = column[org.joda.time.DateTime]("started_at")


  def * = (id.?, title, predicate, finished, started, finished_at, started_at) <> (WalkDTO.tupled, WalkDTO.unapply)

}
/**
*  Model for Walkthrought
*  Based on predicate checking
*  Have not been used yet.
**/

case class WalkDTO(var id: Option[Int],
                  title: String,
                  predicate: String,
                  finished: Boolean,
                  started: Boolean,
                  finished_at: org.joda.time.DateTime,
                  started_at: org.joda.time.DateTime)

object WalksDAO {
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

  val walks = TableQuery[Walks]


  def pull_object(s: WalkDTO) =   {
      await(db.run( walks returning walks.map(_.id) += s ))
  }

  def get(k: Int) =   {
      val q3 = for { s ← walks if s.id === k } yield s
      await(db.run(q3.result.headOption))
  }

  def update(id: Int, walk: WalkDTO) =   {
    val walkToUpdate: WalkDTO = walk.copy(Option(id))
    await(db.run( walks.filter(_.id === id).update(walkToUpdate) ))
  }
  /**
   * Delete a walk
   * @param id
   */
  def delete(id: Int) =   {
    await(db.run( walks.filter(_.id === id).delete ))
  }


  val create: DBIO[Unit] = walks.schema.create
  val drop: DBIO[Unit] = walks.schema.drop

  def ddl_create = db.run(create)
  def ddl_drop = db.run(drop)

}
