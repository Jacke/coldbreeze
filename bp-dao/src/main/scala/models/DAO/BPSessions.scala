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
  
import main.scala.bprocesses.BPSession  
  
class BPSessions(tag: Tag) extends Table[BPSession](tag, "bpsessions") {
  def id = column[Int]("id", O.PrimaryKey, O.AutoInc) 
  def process = column[Int]("process_id")
    
  def created_at = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at = column[Option[org.joda.time.DateTime]]("updated_at")  

  def * = (id.?, process, created_at, updated_at) <> (BPSession.tupled, BPSession.unapply)
  
  def bpFK = foreignKey("bprocess_fk", process, models.DAO.BPDAO.bprocesses)(_.id, onDelete = ForeignKeyAction.Cascade)
 
}


object BPSessionDAO {
  /**
   * Actions
   */
  import scala.util.Try

  import DatabaseCred.database
  import models.DAO.conversion.Implicits._



  val bpsessions = TableQuery[BPSessions]

  def pull_object(s: BPSession) = database withSession {
    implicit session ⇒
      bpsessions returning bpsessions.map(_.id) += s
  }

  def findByBP(id: Int):Option[BPSession] = database withSession {
    implicit session =>
    val q3 = for { s <- bpsessions if s.process === id } yield s
    q3.list.headOption
  }
  def getByProcesses(processes: List[Int]) = database withSession {
    implicit session =>
      val q3 = for { s ← bpsessions if s.process inSetBind processes } yield s
      q3.list
  }


  def get(k: Int):Option[BPSession] = database withSession {
    implicit session ⇒
      val q3 = for { s ← bpsessions if s.id === k } yield s
      q3.list.headOption 
  }

  def update(id: Int, bpsession: BPSession) = database withSession { implicit session ⇒
    val bpToUpdate: BPSession = bpsession.copy(Option(id))
    bpsessions.filter(_.id === id).update(bpToUpdate)
  }
  def delete(id: Int) = database withSession { implicit session ⇒
    bpsessions.filter(_.id === id).delete
  }
  def count: Int = database withSession { implicit session ⇒
    Query(bpsessions.length).first
  }

  def ddl_create = {
    database withSession {
      implicit session =>
      bpsessions.ddl.create
    }
  }
  def ddl_drop = {
    database withSession {
      implicit session =>
       bpsessions.ddl.drop
    }
  }

  def getAll = database withSession {
    implicit session ⇒
      val q3 = for { s ← bpsessions } yield s
      q3.list.sortBy(_.id)
  }
}