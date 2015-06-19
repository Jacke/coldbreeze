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
import main.scala.bprocesses._
import main.scala.bprocesses.{BPState, BPSessionState} 

class BPSessionStates(tag: Tag) extends Table[BPSessionState](tag, "sessionstates") {
  def id            = column[Int]("id", O.PrimaryKey, O.AutoInc) 
  def process       = column[Int]("process_id")
  def session       = column[Int]("session_id")
  def title         = column[String]("title")
  def neutral       = column[String]("neutral")
  def process_state = column[Boolean]("is_process_state", O.Default(false))
  
  def on            = column[Boolean]("on", O.Default(false))  
  def on_rate       = column[Int]("on_rate", O.Default(0))  

  def space_id      = column[Option[Int]]("space_id")     
  def front_elem_id = column[Option[Int]]("front_elem_id")
  def space_elem_id = column[Option[Int]]("space_elem_id")
    
  def origin_state  = column[Option[Int]]("origin_state_id")  
  def created_at    = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at    = column[Option[org.joda.time.DateTime]]("updated_at")  

  def middle        = column[String]("middle", O.Default(""))
  def middleable    = column[Boolean]("middleable", O.Default(false))
  def oposite       = column[String]("oposite", O.Default(""))
  def opositable    = column[Boolean]("opositable", O.Default(false))   


  def lang          = column[String]("lang", O.Default("en"))  
  def * = (id.?, process, session, title, neutral,
                                          process_state,
                                          on, on_rate,
                                          front_elem_id,
                                          space_elem_id,
                                          space_id,
                                          origin_state,
           created_at, updated_at, lang, middle, middleable, oposite, opositable) <> (BPSessionState.tupled, BPSessionState.unapply)
  def sesFK       = foreignKey("s_st_session_fk", session, models.DAO.BPSessionDAO.bpsessions)(_.id, onDelete = ForeignKeyAction.Cascade)
  def procelemFK  = foreignKey("s_st_procelem_fk", front_elem_id, proc_elements)(_.id, onDelete = ForeignKeyAction.Cascade)
  def spaceelemFK = foreignKey("s_st_spaceelem_fk", space_elem_id, SpaceElemDAO.space_elements)(_.id, onDelete = ForeignKeyAction.Cascade)
  def spaceFK     = foreignKey("s_st_space_fk", space_id, BPSpaceDAO.bpspaces)(_.id, onDelete = ForeignKeyAction.Cascade)
  def stateFK     = foreignKey("s_st_state_fk", origin_state, BPStateDAO.bpstates)(_.id, onDelete = ForeignKeyAction.Cascade)

  def bpFK        = foreignKey("s_st_bprocess_fk", process, models.DAO.BPDAO.bprocesses)(_.id, onDelete = ForeignKeyAction.Cascade)
 
}


object BPSessionStateDAO {
  import scala.util.Try
  import DatabaseCred.database
  import models.DAO.conversion.Implicits._

  val sessionstates = TableQuery[BPSessionStates]

  def pull_object(s: BPSessionState) = database withSession {
    implicit session ⇒
      sessionstates returning sessionstates.map(_.id) += s
  }

  /**
   * Filter session state with existed entity, for avoiding possible override
   * @param s BPSessionState
   * @return id
   */
  def pull_new_object(s: BPSessionState):Int = database withSession {
    implicit session ⇒
      findByOriginAndSession(s.origin_state, s.session) match {
        case Some(session_state) => -1
        case _ => sessionstates returning sessionstates.map(_.id) += s
      }
  }

  def findByBP(id: Int):List[BPSessionState] = database withSession {
    implicit session =>
    val q3 = for { s <- sessionstates if s.process === id } yield s
    q3.list
  }
  def findByOriginAndSession(origin_state_id: Option[Int], session_id: Int):Option[BPSessionState] = database withSession {
    implicit session =>
      val q3 = for { s <- sessionstates if s.origin_state === origin_state_id && s.session === session_id } yield s
      q3.list.headOption
  }
  def findByBPAndSession(id: Int, session_id: Int):List[BPSessionState] = database withSession {
    implicit session =>
    val q3 = for { s <- sessionstates if s.process === id && s.session === session_id } yield s
    q3.list
  }
  def getByProcesses(processes: List[Int]) = database withSession {
    implicit session =>
      val q3 = for { s ← sessionstates if s.process inSetBind processes } yield s
      q3.list
  }
  def findByOriginIds(ids: List[Int]) = database withSession {
    implicit session =>
    val q3 = for { s ← sessionstates if s.origin_state inSetBind ids } yield s
      q3.list
  }
  def findByOriginId(id: Int) = database withSession {
    implicit session =>
    val q3 = for { s ← sessionstates if s.origin_state === id } yield s
      q3.list.headOption
  }

  def get(k: Int):Option[BPSessionState] = database withSession {
    implicit session ⇒
      val q3 = for { s ← sessionstates if s.id === k } yield s
      q3.list.headOption 
  }

  def update(id: Int, bpsession: BPSessionState) = database withSession { implicit session ⇒
    val bpToUpdate: BPSessionState = bpsession.copy(Option(id))
    sessionstates.filter(_.id === id).update(bpToUpdate)
  }
  def delete(id: Int) = database withSession { implicit session ⇒
    sessionstates.filter(_.id === id).delete
  }
  def count: Int = database withSession { implicit session ⇒
    Query(sessionstates.length).first
  }

  def ddl_create = {
    database withSession {
      implicit session =>
      sessionstates.ddl.create
    }
  }
  def ddl_drop = {
    database withSession {
      implicit session =>
       sessionstates.ddl.drop
    }
  }

  def getAll = database withSession {
    implicit session ⇒
      val q3 = for { s ← sessionstates } yield s
      q3.list.sortBy(_.id)
  }
}