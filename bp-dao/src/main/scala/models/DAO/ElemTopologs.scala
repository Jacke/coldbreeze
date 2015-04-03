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
    
class ElemTopologs(tag: Tag) extends Table[ElemTopology](tag, "elem_topologs") {
  def id = column[Int]("id", O.PrimaryKey, O.AutoInc) 
  def process = column[Int]("process_id")
  def hash = column[String]("hash")

  def front_elem_id = column[Option[Int]]("front_elem_id")
  def space_elem_id = column[Option[Int]]("space_elem_id")
  def space_id      = column[Option[Int]]("space_id")  
    
  def created_at = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at = column[Option[org.joda.time.DateTime]]("updated_at")  

  def * = (id.?, process, 
          front_elem_id,
          space_elem_id,
          hash,
           created_at, updated_at, space_id) <> (ElemTopology.tupled, ElemTopology.unapply)

  def bpFK = foreignKey("bprocess_fk", process, models.DAO.BPDAO.bprocesses)(_.id, onDelete = ForeignKeyAction.Cascade)
  def procelemFK = foreignKey("procelem_fk", front_elem_id, proc_elements)(_.id, onDelete = ForeignKeyAction.Cascade)
  def spaceelemFK = foreignKey("spaceelem_fk", space_elem_id, SpaceElemDAO.space_elements)(_.id, onDelete = ForeignKeyAction.Cascade)
  def spaceFK = foreignKey("bpspace_fk", space_id, models.DAO.BPSpaceDAO.bpspaces)(_.id, onDelete = ForeignKeyAction.Cascade)

}
case class ElemTopology(id: Option[Int], 
  process: Int, 
  front_elem_id: Option[Int], 
  space_elem_id: Option[Int], 
  hash: String = "", 
  created_at: Option[org.joda.time.DateTime] = None,
  updated_at: Option[org.joda.time.DateTime] = None,
  space_id: Option[Int] = None)

object ElemTopologDAO {
  /**
   * Actions
   */
  import scala.util.Try

  import DatabaseCred.database
  import models.DAO.conversion.Implicits._



  val elem_topologs = TableQuery[ElemTopologs]

  def pull_object(s: ElemTopology) = database withSession {
    implicit session ⇒
      elem_topologs returning elem_topologs.map(_.id) += s
  }

  def findByBP(id: Int):List[ElemTopology] = database withSession {
    implicit session =>
    val q3 = for { s <- elem_topologs if s.process === id } yield s
    q3.list
  }


  def get(k: Int):Option[ElemTopology] = database withSession {
    implicit session ⇒
      val q3 = for { s ← elem_topologs if s.id === k } yield s
      q3.list.headOption 
  }
  def isFront(k: Int):Boolean = database withSession {
    implicit session ⇒
      val q3 = for { s ← elem_topologs if s.id === k } yield s
      q3.list.headOption match {
        case Some(el) => el.front_elem_id.isDefined
        case _ => false
      }
  }
  def isNested(k: Int):Boolean = database withSession {
    implicit session ⇒
      val q3 = for { s ← elem_topologs if s.id === k } yield s
      q3.list.headOption match {
        case Some(el) => el.space_elem_id.isDefined
        case _ => false
      }
  }




  def update(id: Int, topology: ElemTopology) = database withSession { implicit session ⇒
    val topologyToUpdate: ElemTopology = topology.copy(Option(id))
    elem_topologs.filter(_.id === id).update(topologyToUpdate)
  }
  def delete(id: Int) = database withSession { implicit session ⇒
    elem_topologs.filter(_.id === id).delete
  }
  def count: Int = database withSession { implicit session ⇒
    Query(elem_topologs.length).first
  }

  def ddl_create = {
    database withSession {
      implicit session =>
      elem_topologs.ddl.create
    }
  }
  def ddl_drop = {
    database withSession {
      implicit session =>
       elem_topologs.ddl.drop
    }
  }

  def getAll = database withSession {
    implicit session ⇒
      val q3 = for { s ← elem_topologs } yield s
      q3.list.sortBy(_.id)
  }
}

