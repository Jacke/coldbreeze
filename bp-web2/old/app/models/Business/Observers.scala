package models.DAO.resources


import slick.driver.PostgresDriver.api._
import com.github.nscala_time.time.Imports._
import com.github.tototoshi.slick.PostgresJodaSupport._
import com.github.tminglei.slickpg.composite._
import models.DAO.conversion.{DatabaseCred, Implicits}
import slick.model.ForeignKeyAction
import org.joda.time.DateTime

class Observers(tag: Tag) extends Table[ObserverDTO](tag, "observers") {
  def id         = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def station_id = column[Int]("station_id")
  def bprocess   = column[Int]("bprocess_id")
  def hash_code  = column[Option[String]]("hash_code")
  def fullName   = column[String]("fullName")
  def created_at = column[Option[DateTime]]("created_at")

  def stationFK = foreignKey("obs_st_fk", station_id, models.DAO.BPStationDAO.bpstations)(_.id, onDelete = ForeignKeyAction.Cascade)
  def bpFK      = foreignKey("obs_bprocess_fk", bprocess, models.DAO.BPDAOF.bprocesses)(_.id, onDelete = ForeignKeyAction.Cascade)

  def * = (id.?, station_id, bprocess, hash_code, fullName, created_at) <> (ObserverDTO.tupled, ObserverDTO.unapply)
}

case class ObserverDTO(var id: Option[Int], station_id: Int, bprocess: Int, hash_code: Option[String], fullName: String, created_at: Option[DateTime] = Some(DateTime.now()))

object ObserverDAO {
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

  val observers = TableQuery[Observers]




  def pull_object(s: ObserverDTO) =   {
     await(db.run( observers returning observers.map(_.id) += s ))
  }

  def get(k: Int) =   {
      val q3 = for { s ← observers if s.id === k } yield s
      await(db.run(q3.result.headOption))
  }
  def getAllByBP(k: Int) =   {
      val q3 = for { s ← observers if s.bprocess === k } yield s
      await(db.run(q3.result)).toList
  }

  def getByBP(k: Int) =   {
      val q3 = for { s ← observers if s.bprocess === k } yield s
      await(db.run(q3.result.headOption))
  }
  def getByBpAndStation(process: Int, station: Int) =   {
    val q3 = for { s ← observers if s.station_id === station && s.bprocess === process } yield s
    await(db.run(q3.result)).toList
  }
  def getByHashCode(hash_code: String) =   {
    val opt_hash = Option(hash_code)
    val q3 = for { s ← observers if s.hash_code === opt_hash } yield s
    await(db.run(q3.result.headOption))
  }

  /**
   * Update a observer
   * @param id
   * @param observer
   */
  def update(id: Int, observer: ObserverDTO) =   {
    val observerToUpdate: ObserverDTO = observer.copy(Option(id))
    await(db.run( observers.filter(_.id === id).update(observerToUpdate) ))
  }


  /**
   * Delete a observer
   * @param id
   */
  def delete(id: Int) =   {
    await(db.run( observers.filter(_.id === id).delete ))
  }


  val create: DBIO[Unit] = observers.schema.create
  val drop: DBIO[Unit] = observers.schema.drop

  def ddl_create = db.run(create)
  def ddl_drop = db.run(drop)
}
