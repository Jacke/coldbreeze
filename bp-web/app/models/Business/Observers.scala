package models.DAO.resources


import com.github.nscala_time.time.Imports._
import models.DAO.driver.MyPostgresDriver1.simple._
import com.github.tminglei.slickpg.composite._
import models.DAO.conversion.{DatabaseCred, Implicits}
import slick.model.ForeignKeyAction
import org.joda.time.DateTime

class Observers(tag: Tag) extends Table[ObserverDTO](tag, "observers") {
  def id = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def station_id = column[Int]("station_id")
  def bprocess   = column[Int]("bprocess_id")   
  def hash_code  = column[Option[String]]("hash_code")
  def fullName   = column[String]("fullName")
  def created_at = column[Option[DateTime]]("created_at")

  def stationFK = foreignKey("st_fk", station_id, models.DAO.BPStationDAO.bpstations)(_.id, onDelete = ForeignKeyAction.Cascade)
  def bpFK = foreignKey("bprocess_fk", bprocess, models.DAO.BPDAO.bprocesses)(_.id, onDelete = ForeignKeyAction.Cascade)

  def * = (id.?, station_id, bprocess, hash_code, fullName, created_at) <> (ObserverDTO.tupled, ObserverDTO.unapply)
}

case class ObserverDTO(var id: Option[Int], station_id: Int, bprocess: Int, hash_code: Option[String], fullName: String, created_at: Option[DateTime] = Some(DateTime.now()))

object ObserverDAO {
  import scala.util.Try
  import DatabaseCred.database

  val observers = TableQuery[Observers]




  def pull_object(s: ObserverDTO) = database withSession {
    implicit session ⇒
     observers returning observers.map(_.id) += s
  }

  def get(k: Int) = database withSession {
    implicit session ⇒
      val q3 = for { s ← observers if s.id === k } yield s 
      println(q3.selectStatement)
      println(q3.list)
      q3.list.headOption
  }
  def getAllByBP(k: Int) = database withSession {
    implicit session ⇒
      val q3 = for { s ← observers if s.bprocess === k } yield s 
      q3.list
  }

  def getByBP(k: Int) = database withSession {
    implicit session ⇒
      val q3 = for { s ← observers if s.bprocess === k } yield s 
      q3.list.headOption
  }
  def getByBpAndStation(process: Int, station: Int) = database withSession {
    implicit session =>
    val q3 = for { s ← observers if s.station_id === station && s.bprocess === process } yield s 
    q3.list
  }
  def getByHashCode(hash_code: String) = database withSession {
    implicit session =>
    val opt_hash = Option(hash_code)
    val q3 = for { s ← observers if s.hash_code === opt_hash } yield s 
    q3.list.headOption
  }
 
  /**
   * Update a observer
   * @param id
   * @param observer
   */
  def update(id: Int, observer: ObserverDTO) = database withSession { implicit session ⇒
    val observerToUpdate: ObserverDTO = observer.copy(Option(id))
    observers.filter(_.id === id).update(observerToUpdate)
  }


  /**
   * Delete a observer
   * @param id
   */
  def delete(id: Int) = database withSession { implicit session ⇒
    observers.filter(_.id === id).delete
  }


  /**
   * Count all observers
   */
  def count: Int = database withSession { implicit session ⇒
    Query(observers.length).first
  }


  def getAll = database withSession {
    implicit session ⇒
      val q3 = for { s ← observers } yield s 
      q3.list.sortBy(_.id)
  }

  def ddl_create = {
    database withSession {
      implicit session =>
      observers.ddl.create
    }
  }
  def ddl_drop = {
    database withSession {
      implicit session =>
        observers.ddl.drop
    }
  }

}


