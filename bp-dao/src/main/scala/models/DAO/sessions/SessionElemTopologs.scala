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
import main.scala.simple_parts.process.Units._


    
class SessionTopologs(tag: Tag) extends Table[SessionElemTopology](tag, "session_elem_topologs") {
  def id            = column[Int]("id", O.PrimaryKey, O.AutoInc) 
  def process       = column[Int]("process_id")
  def hash          = column[String]("hash")
  def session   = column[Int]("session_id")

  def front_elem_id = column[Option[Int]]("front_elem_id")
  def space_elem_id = column[Option[Int]]("space_elem_id")
  def space_id      = column[Option[Int]]("space_id")  
    
  def created_at = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at = column[Option[org.joda.time.DateTime]]("updated_at")  

  def * = (id.?, process, session,
          front_elem_id,
          space_elem_id,
          hash,
           created_at, updated_at, space_id) <> (SessionElemTopology.tupled, SessionElemTopology.unapply)

  def bpFK        = foreignKey("topo_bprocess_fk", process, models.DAO.BPDAO.bprocesses)(_.id, onDelete = ForeignKeyAction.Cascade)
  def procelemFK  = foreignKey("topo_procelem_fk", front_elem_id, models.DAO.sessions.SessionProcElementDAO.session_proc_elements)(_.id, onDelete = ForeignKeyAction.Cascade)
  def spaceelemFK = foreignKey("topo_spaceelem_fk", space_elem_id, models.DAO.sessions.SessionSpaceElemDAO.space_elements)(_.id, onDelete = ForeignKeyAction.Cascade)
  def spaceFK     = foreignKey("topo_bpspace_fk", space_id, models.DAO.sessions.SessionSpaceDAO.session_spaces)(_.id, onDelete = ForeignKeyAction.Cascade)
  def sessionFK   = foreignKey("topo_s_sp_session_fk", session, models.DAO.BPSessionDAO.bpsessions)(_.id, onDelete = ForeignKeyAction.Cascade)

}


object SessionElemTopologDAO {
  /**
   * Actions
   */
  import scala.util.Try

  import DatabaseCred.database
  import models.DAO.conversion.Implicits._



  val session_elem_topologs = TableQuery[SessionTopologs]

  def pull_object(s: SessionElemTopology) = database withSession {
    implicit session ⇒
      session_elem_topologs returning session_elem_topologs.map(_.id) += s
  }

  def findByBP(id: Int):List[SessionElemTopology] = database withSession {
    implicit session =>
    val q3 = for { s <- session_elem_topologs if s.process === id } yield s
    q3.list
  }
  def findBySession(id: Int):List[SessionElemTopology] = database withSession {
    implicit session =>
    val q3 = for { s <- session_elem_topologs if s.session === id } yield s
    q3.list
  }
  def getIdentityById(k: Int):Option[EitherTypeElement] = {
    get(k) match {
      case Some(topo) => {
        if (topo.front_elem_id.isDefined) {
          val front_el = ProcElemDAO.findById(topo.front_elem_id.get).get
          Some(EitherTypeElement(front = Some(front_el), 
                                 nested = None,
                                 title = front_el.title))
        } else if (topo.space_elem_id.isDefined) {
          val nested_el = SpaceElemDAO.findById(topo.space_elem_id.get).get
          Some(EitherTypeElement(front = None, 
                                 nested = Some(nested_el),
                                 title = nested_el.title))
        } else {
          None
        }

      }
      case _ => None
    }
  }

  def get(k: Int):Option[SessionElemTopology] = database withSession {
    implicit session ⇒
      val q3 = for { s ← session_elem_topologs if s.id === k } yield s
      q3.list.headOption 
  }
  def isFront(k: Int):Boolean = database withSession {
    implicit session ⇒
      val q3 = for { s ← session_elem_topologs if s.id === k } yield s
      q3.list.headOption match {
        case Some(el) => el.front_elem_id.isDefined
        case _ => false
      }
  }
  def isNested(k: Int):Boolean = database withSession {
    implicit session ⇒
      val q3 = for { s ← session_elem_topologs if s.id === k } yield s
      q3.list.headOption match {
        case Some(el) => el.space_elem_id.isDefined
        case _ => false
      }
  }




  def update(id: Int, topology: SessionElemTopology) = database withSession { implicit session ⇒
    val topologyToUpdate: SessionElemTopology = topology.copy(Option(id))
    session_elem_topologs.filter(_.id === id).update(topologyToUpdate)
  }
  def delete(id: Int) = database withSession { implicit session ⇒
    session_elem_topologs.filter(_.id === id).delete
  }
  def count: Int = database withSession { implicit session ⇒
    Query(session_elem_topologs.length).first
  }

  def ddl_create = {
    database withSession {
      implicit session =>
      session_elem_topologs.ddl.create
    }
  }
  def ddl_drop = {
    database withSession {
      implicit session =>
       session_elem_topologs.ddl.drop
    }
  }

  def getAll = database withSession {
    implicit session ⇒
      val q3 = for { s ← session_elem_topologs } yield s
      q3.list.sortBy(_.id)
  }
}

