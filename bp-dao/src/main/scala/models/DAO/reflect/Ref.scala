package models.DAO.reflect

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
import main.scala.bprocesses.{BPState, BPSessionState} 
import models.DAO._
import models.DAO.projections._
import main.scala.simple_parts.process.Units._
import main.scala.bprocesses.refs.UnitRefs._  
import com.typesafe.scalalogging._

class Refs(tag: Tag) extends Table[Ref](tag, "refs") {
  def id      = column[Int]("id", O.PrimaryKey, O.AutoInc) 
  def title   = column[String]("title")
  def host    = column[String]("host")
  def desc    = column[Option[String]]("desc")
  def category= column[String]("category", O.Default("Base"))
  def hidden  = column[Boolean]("hidden", O.Default(false))

  def created_at = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at = column[Option[org.joda.time.DateTime]]("updated_at")  

  def * = (id.?, title, host, desc,
           created_at, updated_at, category, hidden) <> (Ref.tupled, Ref.unapply)

}

case class Ref(id: Option[Int], title: String, host: String = "", desc: Option[String] = None,
created_at:Option[org.joda.time.DateTime] = None, updated_at:Option[org.joda.time.DateTime] = None, category: String = "Base", hidden:Boolean = false)


  case class RetrivedRef(
    proc_elems: List[UnitElement], 
    spaces: List[UnitSpace], // change to DTO
    space_elems: List[UnitSpaceElement], // change to DTO
    states: List[BPState],
    switches: List[UnitSwitcher],
    reactions: List[UnitReaction],
    reaction_state_outs: List[UnitReactionStateOut])

  case class RefResulted(proc_elems: List[Int], 
    space_elems: List[Int], 
    spaces:List[Int],
    states: List[Int], 
    switches: List[Int], 
    reactions: List[Int], 
    reaction_state_outs: List[Int],
    topoElem:List[Int]=List.empty,
    topoSpaceElem:List[Int]=List.empty)

  
object RefDAO {
  import scala.util.Try
  import DatabaseCred.database
  import models.DAO.conversion.Implicits._
  //val logger = Logger(LoggerFactory.getLogger("name"))

  val refs = TableQuery[Refs]

  def pull_object(s: Ref) = database withSession {
    implicit session ⇒
      refs returning refs.map(_.id) += s
  }

  def get(k: Int):Option[Ref] = database withSession {
    implicit session ⇒
      val q3 = for { s ← refs if s.id === k } yield s
      q3.list.headOption 
  }
  def getByTitle(title: String):List[Ref] = database withSession {
    implicit session ⇒
      val q3 = for { s ← refs if s.title === title } yield s
      q3.list
  }
  def deleteByTitle(title: String) = database withSession {
    implicit session =>
    getByTitle(title).map(el => el.id.get).foreach { id =>
      delete(id)
    }
  }

  /**
  * Project ref to existed elements and states
  */
  def retrive(k: Int, process: Int,
              business: Int, in: String = "front", 
              title: String, desc:String = "", 
              space_id: Option[Int] = None):Option[RefResulted] = database withSession {
    //logger.debug(k, process, business, title, desc, space_id)
    implicit session ⇒
      in match {
        case "front" => RefProjector.projecting(k, process, business, title,desc, "front")
        case _ => RefProjector.projecting(k, process, business, title,desc, "nested", space_id)
      }
  }


  def update(id: Int, ref: Ref) = database withSession { implicit session ⇒
    val refToUpdate: Ref = ref.copy(Option(id))
    refs.filter(_.id === id).update(refToUpdate)
  }
  def delete(id: Int) = database withSession { implicit session ⇒
    refs.filter(_.id === id).delete
  }
  def count: Int = database withSession { implicit session ⇒
    Query(refs.length).first
  }

  def ddl_create = {
    database withSession {
      implicit session =>
      refs.ddl.create
    }
  }
  def ddl_drop = {
    database withSession {
      implicit session =>
       refs.ddl.drop
    }
  }
  def getAllVisible = database withSession {
    implicit session ⇒
      val q3 = for { s ← refs if s.hidden === false } yield s
      q3.list.sortBy(_.id)
  }
  def getAll = database withSession {
    implicit session ⇒
      val q3 = for { s ← refs } yield s
      q3.list.sortBy(_.id)
  }
}