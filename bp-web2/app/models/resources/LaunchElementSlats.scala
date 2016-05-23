// LaunchElementSlats.scala
package models.DAO

import slick.driver.PostgresDriver.api._
import com.github.nscala_time.time.Imports._
import com.github.tototoshi.slick.PostgresJodaSupport._
import slick.model.ForeignKeyAction
import models.DAO.conversion.{DatabaseCred, Implicits}
import slick.model.ForeignKeyAction


class LaunchElementSlats(tag: Tag) extends Table[LaunchElementSlatDTO](tag, "launch_element_slats"){
  def id         = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def element    = column[Int]("launched_element_id")
  def slat       = column[String]("slat_id")
  def created_at = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at = column[Option[org.joda.time.DateTime]]("updated_at")

  def elementFK  = foreignKey("launchel_fk", element, models.DAO.SessionElemTopologDAO.session_elem_topologs)(_.id, onDelete = ForeignKeyAction.Cascade)

  def * = (id.?, element, slat,
           created_at,
           updated_at) <> (LaunchElementSlatDTO.tupled, LaunchElementSlatDTO.unapply)

}
case class LaunchElementSlatDTO(
  var id: Option[Int],
  element: Int,
  slat: String,
  created_at: Option[org.joda.time.DateTime] = None,
  updated_at: Option[org.joda.time.DateTime] = None )

object LaunchElementSlatDAO {
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

  val launch_element_slats = TableQuery[LaunchElementSlats]


  def pull_object(s: LaunchElementSlatDTO) =   {

      await(db.run(  launch_element_slats returning launch_element_slats.map(_.id) += s.copy(created_at = Some(org.joda.time.DateTime.now),
                                                                              updated_at = Some(org.joda.time.DateTime.now)) ))
  }
  def get(k: Int) =   {

      val q3 = for { s ← launch_element_slats if s.id === k } yield s
      await(db.run(q3.result.headOption))
  }
  def update(id: Int, annotation: LaunchElementSlatDTO) =   {
    val launch_element_slatsUpdate: LaunchElementSlatDTO = annotation.copy(Option(id))
    await(db.run(  launch_element_slats.filter(_.id === id).update(launch_element_slatsUpdate) ))
  }


  def delete(id: Int) =   {
    await(db.run(  launch_element_slats.filter(_.id === id).delete ))
  }
  val create: DBIO[Unit] = launch_element_slats.schema.create
  val drop: DBIO[Unit] = launch_element_slats.schema.drop

  def ddl_create = db.run(create)
  def ddl_drop = db.run(drop)

}
