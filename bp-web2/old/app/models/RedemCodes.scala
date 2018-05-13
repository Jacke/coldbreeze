package models.DAO

import slick.driver.PostgresDriver.api._
import com.github.nscala_time.time.Imports._
import com.github.tototoshi.slick.PostgresJodaSupport._
import com.github.tminglei.slickpg.composite._
import models.DAO.conversion.{DatabaseCred, Implicits}
import slick.model.ForeignKeyAction
import org.joda.time.DateTime

class RedemCodes(tag: Tag) extends Table[RedemCodeDTO](tag, "redem_codes") {
  def id         = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def code       = column[String]("code")
  def force      = column[Int]("force")
  def created_at = column[DateTime]("created_at")



  def * = (id.?, code, force, created_at) <> (RedemCodeDTO.tupled, RedemCodeDTO.unapply)

}

/*
  Case class
 */
case class RedemCodeDTO(var id: Option[Int], code: String, force: Int, created_at: DateTime)


object RedemCodesDAO {
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

  val redem_codes = TableQuery[RedemCodes]


  def pull_object(s: RedemCodeDTO) =   {
      await(db.run( redem_codes returning redem_codes.map(_.id) += s ))
  }
  def get(k: Int) =   {
      val q3 = for { s ← redem_codes if s.id === k } yield s
      await(db.run(q3.result.headOption))
  }
  def getByCode(code: String) =   {
      val q3 = for { s ← redem_codes if s.code === code } yield s
      await(db.run(q3.result.headOption))
  }

  /**
   * Update a redem code
   * @param id
   * @param business service
   */
  def update(id: Int, code: RedemCodeDTO) =   {
    val codeToUpdate: RedemCodeDTO = code.copy(Option(id))
    await(db.run( redem_codes.filter(_.id === id).update(codeToUpdate) ))
  }
  /**
   * Delete a redem code
   * @param id
   */
  def delete(id: Int) =   {
    await(db.run( redem_codes.filter(_.id === id).delete ))
  }



  val create: DBIO[Unit] = redem_codes.schema.create
  val drop: DBIO[Unit] = redem_codes.schema.drop

  def ddl_create = db.run(create)
  def ddl_drop = db.run(drop)


}
