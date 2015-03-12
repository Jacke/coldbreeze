package models.DAO
  
  
import main.scala.bprocesses.{BProcess, BPLoggerResult}
import main.scala.simple_parts.process.ProcElems
import models.DAO.driver.MyPostgresDriver.simple._
import com.github.nscala_time.time.Imports._
//import com.github.tminglei.slickpg.date.PgDateJdbcTypes
import scala.slick.model.ForeignKeyAction

import models.DAO.ProcElemDAO._
import models.DAO.BPDAO._
import models.DAO.BPStationDAO._
import models.DAO.conversion.DatabaseCred
  
import main.scala.bprocesses.BPState 
  
class BPStates(tag: Tag) extends Table[BPState](tag, "bpstates") {
  def id = column[Int]("id", O.PrimaryKey, O.AutoInc) 
  def process = column[Int]("process_id")
  def session = column[Int]("session_id")
  def title = column[String]("title")
  def opposite = column[String]("opposite")
  
  def created_at = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at = column[Option[org.joda.time.DateTime]]("updated_at")  

  def * = (id.?, process, session, title, opposite, created_at, updated_at) <> (BPState.tupled, BPState.unapply)
  def sesFK = foreignKey("session_fk", session, models.DAO.BPSessionDAO.bpsessions)(_.id, onDelete = ForeignKeyAction.Cascade)

  def bpFK = foreignKey("bprocess_fk", process, models.DAO.BPDAO.bprocesses)(_.id, onDelete = ForeignKeyAction.Cascade)
 
}


object BPStateDAO {
  /**
   * Actions
   */
  import scala.util.Try

  import DatabaseCred.database
  import models.DAO.conversion.Implicits._



  val bpstates = TableQuery[BPStates]

  def pull_object(s: BPState) = database withSession {
    implicit session ⇒
      bpstates returning bpstates.map(_.id) += s
  }

  def findByBP(id: Int):Option[BPState] = database withSession {
    implicit session =>
    val q3 = for { s <- bpstates if s.process === id } yield s
    q3.list.headOption
  }
  def getByProcesses(processes: List[Int]) = database withSession {
    implicit session =>
      val q3 = for { s ← bpstates if s.process inSetBind processes } yield s
      q3.list
  }


  def get(k: Int):Option[BPState] = database withSession {
    implicit session ⇒
      val q3 = for { s ← bpstates if s.id === k } yield s
      q3.list.headOption 
  }

  def update(id: Int, bpsession: BPState) = database withSession { implicit session ⇒
    val bpToUpdate: BPState = bpsession.copy(Option(id))
    bpstates.filter(_.id === id).update(bpToUpdate)
  }
  def delete(id: Int) = database withSession { implicit session ⇒
    bpstates.filter(_.id === id).delete
  }
  def count: Int = database withSession { implicit session ⇒
    Query(bpstates.length).first
  }

  def ddl_create = {
    database withSession {
      implicit session =>
      bpstates.ddl.create
    }
  }
  def ddl_drop = {
    database withSession {
      implicit session =>
       bpstates.ddl.drop
    }
  }

  def getAll = database withSession {
    implicit session ⇒
      val q3 = for { s ← bpstates } yield s
      q3.list.sortBy(_.id)
  }
}