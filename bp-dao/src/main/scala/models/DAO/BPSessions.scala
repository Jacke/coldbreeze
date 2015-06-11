package models.DAO
  
  
import main.scala.bprocesses.{BProcess, BPLoggerResult}
import main.scala.simple_parts.process.ProcElems
import models.DAO.driver.MyPostgresDriver.simple._
import com.github.nscala_time.time.Imports._
//import com.github.tminglei.slickpg.date.PgDateJdbcTypes
import slick.model.ForeignKeyAction

import models.DAO.ProcElemDAO._
import models.DAO.BPDAO._
import models.DAO.BPStationDAO._
import models.DAO.conversion.DatabaseCred

import builders._
import main.scala.bprocesses.BPSession  
  
class BPSessions(tag: Tag) extends Table[BPSession](tag, "bpsessions") {
  def id = column[Int]("id", O.PrimaryKey, O.AutoInc) 
  def process = column[Int]("process_id")
    
  def created_at = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at = column[Option[org.joda.time.DateTime]]("updated_at")  
  def active_listed = column[Boolean]("active_listed", O.Default(false)) 

  def * = (id.?, process, created_at, updated_at, active_listed) <> (BPSession.tupled, BPSession.unapply)
  
  def bpFK = foreignKey("bprocess_fk", process, models.DAO.BPDAO.bprocesses)(_.id, onDelete = ForeignKeyAction.Cascade)
}


case class SessionStatus(var percent: Int = 0, 
                         process:BProcessDTO, 
                         session: BPSession, 
                         station: Option[BPStationDTO], 
                         around: Option[ElemAround] = None) 
case class SessionContainer(process: BProcessDTO, sessions: List[SessionStatus])
import main.scala.utils.InputParamProc


object BPSessionDAO {
  import scala.util.Try
  import DatabaseCred.database
  import models.DAO.conversion.Implicits._

  

  val bpsessions = TableQuery[BPSessions]

  def pull_object(s: BPSession) = database withSession {
    implicit session ⇒
      bpsessions returning bpsessions.map(_.id) += s
  }

  def findByBusiness(bid: Int):List[SessionContainer] = database withSession {
    implicit session =>
    val p = BPDAO.findByBusiness(bid)
    val ids = p.map(_.id.get)
    val q3 = for { s <- bpsessions if s.process inSetBind ids } yield s
    val sess = q3.list

    p.map { p =>
      SessionContainer(p, 
      sess.filter(ses => ses.process == p.id.get).map { ses => 
        val station = BPStationDAO.findBySession(ses.id.get)        
        val element_quantity = ProcElemDAO.findByBPId(p.id.get).length
        val step = station match {
          case Some(station) => station.step.toDouble
          case _ => element_quantity.toDouble
        }
        val percent = (step / element_quantity.toDouble * 100).toInt
        SessionStatus(percent, p, ses, station, None)//Some(AroundProcessElementsBuilder.detect(p.id.get, station.get.id.get)))
      })
    }
  }
  def findById(id: Int):Option[SessionContainer] = database withSession {
    implicit session =>
    val q3 = for { s <- bpsessions if s.id === id } yield s
    val sess = q3.list.headOption

    sess match {
      case Some(ses) => {
        val station = BPStationDAO.findBySession(ses.id.get)        
        val element_quantity = ProcElemDAO.findByBPId(ses.process).length
        val process = BPDAO.get(ses.process).get

        val step = station match {
          case Some(station) => station.step.toDouble
          case _ => element_quantity.toDouble
        }
        val percent = (step / element_quantity.toDouble * 100).toInt

      Some(SessionContainer(process, 
        List(SessionStatus(percent, process, ses, station, Some(AroundProcessElementsBuilder.detect(ses.process, station.get.id.get)))) 
      ))

      }
      case _ => None
    }


  }
  def findListedByBusiness(bid: Int):List[SessionContainer] = database withSession {
    implicit session =>
    val p = BPDAO.findByBusiness(bid)
    val ids = p.flatMap(_.id)
    val q3 = for { s <- bpsessions if (s.process inSetBind ids) && s.active_listed === true } yield s
    val sess = q3.list

    p.map { p =>
      SessionContainer(p, 
      sess.filter(ses => ses.process == p.id.get).map { ses => 
        val station = BPStationDAO.findBySession(ses.id.get)        
        val element_quantity = ProcElemDAO.findByBPId(p.id.get).length
        val step = station match {
          case Some(station) => station.step.toDouble
          case _ => element_quantity.toDouble
        }
        val percent = (step / element_quantity.toDouble * 100).toInt
        SessionStatus(percent, p, ses, station, None)//Some(AroundProcessElementsBuilder.detect(p.id.get, station.get.id.get)))
      })
    }
  }
  

  def makeUnlisted(id: Int) = database withSession {
    implicit session =>
    get(id) match {
      case Some(session) => {
        update(id, session.copy(active_listed = false))
        id
      }
      case _ => -1
    }
  }

  def findByProcess(pid: Int):Option[SessionContainer] = database withSession {
    implicit session =>
    val p = BPDAO.get(pid)
    p match {
      case Some(process) => {
      val process_id = process.id.get
      val q3 = for { s <- bpsessions if s.process === process_id } yield s
      val sess = q3.list


        Some(
          SessionContainer(process, 
          sess.filter(ses => ses.process == process_id).map { ses => 
          val station = BPStationDAO.findBySession(ses.id.get)        
          val element_quantity = ProcElemDAO.findByBPId(process_id).length
          val step = station match {
            case Some(station) => station.step.toDouble
            case _ => element_quantity.toDouble
          }
          val percent = (step / element_quantity.toDouble * 100).toInt
          SessionStatus(percent, process, ses, station, Some(AroundProcessElementsBuilder.detect(process_id, station.get.id.get))) 
          })
        )
      }
      case _ => None
    }  
  }

  def findByBP(id: Int):List[BPSession] = database withSession {
    implicit session =>
    val q3 = for { s <- bpsessions if s.process === id } yield s
    q3.list
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



