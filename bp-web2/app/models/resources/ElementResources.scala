package models.DAO


//import slick.driver.PostgresDriver.api._
//import com.github.tminglei.slickpg.composite._
import models.DAO.conversion.{DatabaseCred, Implicits}
import org.joda.time.DateTime
//import slick.driver.PostgresDriver.api._
import scala.concurrent.Future
import slick.driver.PostgresDriver.api._
import com.github.tminglei.slickpg.composite._
//import com.github.tototoshi.slick.PostgresJodaSupport._
import scala.concurrent._
import ExecutionContext.Implicits.global
//  import slick.model.ForeignKeyAction
/*
 Try implement this shit, for nested objects, like slats and entities
object Foo {
  def fromRow(id: Int, myInt: Int, myString: String): Foo = Foo(id, Bar(myInt, myString))
  def toRow(f: Foo) = Some((f.id, f.myBar.myInt, f.myBar.myString))
}

Then in your table schema:

def * = id ~ myInt ~ myString <> (Foo.fromRow _, Foo.toRow _)
*/

class ElementResources(tag: Tag) extends Table[ElementResourceDTO](tag, "element_resources"){
  def id         = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def element    = column[Int]("element_id")
  def process    = column[Int]("process_id")
  def resource   = column[Int]("resource_id")
  def entities   = column[String]("entities", O.Default(""))
  def created_at = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at = column[Option[org.joda.time.DateTime]]("updated_at")
  def elementFK  = foreignKey("el_res_fk", element, models.DAO.ElemTopologDAO.elem_topologs)(_.id, onDelete = ForeignKeyAction.Cascade)
  def resFK      = foreignKey("res_fk", resource, models.DAO.ResourceDAO.resources)(_.id, onDelete = ForeignKeyAction.Cascade)
  def bpFK       = foreignKey("el_res_sp_bprocess_fk", process, models.DAO.BPDAOF.bprocesses)(_.id, onDelete = ForeignKeyAction.Cascade)

  def * = (id.?, element, process, resource,entities,
           created_at,
           updated_at) <> (ElementResourceDTO.tupled, ElementResourceDTO.unapply)
}
class SessionElementResources(tag: Tag) extends Table[SessionElementResourceDTO](tag, "session_element_resources"){
  def id         = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def element    = column[Int]("session_element_id")
  def process    = column[Int]("process_id")
  def session    = column[Int]("session_id")
  def resource   = column[Int]("resource_id")
  def entities   = column[String]("entities", O.Default(""))
  def created_at = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at = column[Option[org.joda.time.DateTime]]("updated_at")
  def sesElementFK  = foreignKey("ses_el_res_fk", element, models.DAO.SessionElemTopologDAO.session_elem_topologs)(_.id, onDelete = ForeignKeyAction.Cascade)
  def resFK      = foreignKey("ses_res_fk", resource, models.DAO.ResourceDAO.resources)(_.id, onDelete = ForeignKeyAction.Cascade)
  def bpFK       = foreignKey("s_res_sp_bprocess_fk", process, models.DAO.BPDAOF.bprocesses)(_.id, onDelete = ForeignKeyAction.Cascade)
  def sessionFK  = foreignKey("s_res_s_sp_session_fk", session, models.DAO.BPSessionDAO.bpsessions)(_.id, onDelete = ForeignKeyAction.Cascade)

  def * = (id.?, element, process, session, resource,entities,
           created_at,
           updated_at) <> (SessionElementResourceDTO.tupled, SessionElementResourceDTO.unapply)
}
case class ElementResourceDTO(
  var id: Option[Int],
  element_id: Int,
  process_id:Int,
  resource_id: Int,
  entities: String = "",
  created_at: Option[org.joda.time.DateTime] = None,
  updated_at: Option[org.joda.time.DateTime] = None
) {
	def fetchEntities:List[String] = {
		entities.split(",").toList
	}
}
case class SessionElementResourceDTO(
  var id: Option[Int],
  element_id: Int,
  process_id:Int,
  session_id:Int,
  resource_id: Int,
  entities: String = "",
  created_at: Option[org.joda.time.DateTime] = None,
  updated_at: Option[org.joda.time.DateTime] = None) {
  def fetchEntities:List[String] = {
    entities.split(",").toList
  }
}


object ElementResourceDAO {
  import scala.util.Try
  import models.DAO.conversion.DatabaseCred.database
  val element_resources = TableQuery[ElementResources]
  def pull_object(s: ElementResourceDTO) = database withSession {
    implicit session ⇒ element_resources returning element_resources.map(_.id) += s.copy(
      created_at = Some(org.joda.time.DateTime.now),
      updated_at = Some(org.joda.time.DateTime.now)) }


  def get(k: Int) = database withSession {
    implicit session ⇒
      val q3 = for { s ← element_resources if s.id === k } yield s
      q3.list.headOption
  }
  def getByProcess(k: Int) = database withSession {
    implicit session ⇒
      val q3 = for { s ← element_resources if s.process === k } yield s
      q3.list
  }
  def getAllByElement(k: Int):List[ElementResourceDTO] = database withSession {
    implicit session ⇒
      val q3 = for { s ← element_resources if s.element === k } yield s
      q3.list
  }
  def update(id: Int, annotation: ElementResourceDTO) = database withSession { implicit session ⇒
    val element_resourcesUpdate: ElementResourceDTO = annotation.copy(id = Option(id), updated_at = Some(org.joda.time.DateTime.now) )
    element_resources.filter(_.id === id).update(element_resourcesUpdate)
  }
  def delete(id: Int) = database withSession { implicit session ⇒
    element_resources.filter(_.id === id).delete
  }
  def count: Int = database withSession { implicit session ⇒
    Query(element_resources.length).first
  }
  def getAll = database withSession {
    implicit session ⇒
      val q3 = for { s ← element_resources } yield s
      q3.list.sortBy(_.id)
  }
  def ddl_create = {
    database withSession {
      implicit session =>
      element_resources.ddl.create
    }
  }
  def ddl_drop = {
    database withSession {
      implicit session =>
        element_resources.ddl.drop
    }
  }
}


object SessionElementResourceDAO {
  import scala.util.Try
  import models.DAO.conversion.DatabaseCred.database

  val session_element_resources = TableQuery[SessionElementResources]
  def pull_object(s: SessionElementResourceDTO) = database withSession {
    implicit session ⇒  session_element_resources returning session_element_resources.map(_.id) += s.copy(
      created_at = Some(org.joda.time.DateTime.now),
      updated_at = Some(org.joda.time.DateTime.now)) }
  def get(k: Int) = database withSession {
    implicit session ⇒
      val q3 = for { s ← session_element_resources if s.id === k } yield s
      q3.list.headOption
  }
  def getByProcess(k: Int) = database withSession {
    implicit session ⇒
      val q3 = for { s ← session_element_resources if s.process === k } yield s
      q3.list
  }
  def getAllByElement(k: Int):List[SessionElementResourceDTO] = database withSession {
    implicit session ⇒
      val q3 = for { s ← session_element_resources if s.element === k } yield s
      q3.list
  }
  def getBySession(k: Int) = database withSession {
    implicit session ⇒
      val q3 = for { s ← session_element_resources if s.session === k } yield s
      q3.list
  }
  def update(id: Int, annotation: SessionElementResourceDTO) = database withSession { implicit session ⇒
    val element_resourcesUpdate: SessionElementResourceDTO = annotation.copy(id = Option(id),
      updated_at = Some(org.joda.time.DateTime.now))
    session_element_resources.filter(_.id === id).update(element_resourcesUpdate)
  }
  def delete(id: Int) = database withSession { implicit session ⇒
    session_element_resources.filter(_.id === id).delete
  }
  def count: Int = database withSession { implicit session ⇒
    Query(session_element_resources.length).first
  }
  def getAll = database withSession {
    implicit session ⇒
      val q3 = for { s ← session_element_resources } yield s
      q3.list.sortBy(_.id)
  }
  def ddl_create = {
    database withSession {
      implicit session =>
      session_element_resources.ddl.create
    }
  }
  def ddl_drop = {
    database withSession {
      implicit session =>
        session_element_resources.ddl.drop
    }
  }
}
