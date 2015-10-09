package models.DAO

import models.DAO.driver.MyPostgresDriver1.simple._
import slick.model.ForeignKeyAction
import models.DAO.conversion.{DatabaseCred, Implicits}  
import slick.model.ForeignKeyAction

class ElementResources(tag: Tag) extends Table[ElementResourceDTO](tag, "element_resources"){
  def id         = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def element    = column[Int]("element_id")
  def resource   = column[Int]("resource_id")
  def entities   = column[String]("entities", O.Default(""))
  def created_at = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at = column[Option[org.joda.time.DateTime]]("updated_at")  
  def elementFK  = foreignKey("el_res_fk", element, models.DAO.ElemTopologDAO.elem_topologs)(_.id, onDelete = ForeignKeyAction.Cascade)
  def resFK      = foreignKey("res_fk", resource, models.DAO.ResourceDAO.resources)(_.id, onDelete = ForeignKeyAction.Cascade)

  def * = (id.?, element, resource,entities,
           created_at,
           updated_at) <> (ElementResourceDTO.tupled, ElementResourceDTO.unapply)  
}
class SessionElementResources(tag: Tag) extends Table[SessionElementResourceDTO](tag, "session_element_resources"){
  def id         = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def element    = column[Int]("session_element_id")
  def resource   = column[Int]("resource_id")
  def entities   = column[String]("entities", O.Default(""))
  def created_at = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at = column[Option[org.joda.time.DateTime]]("updated_at")  
  def sesElementFK  = foreignKey("ses_el_res_fk", element, models.DAO.SessionElemTopologDAO.session_elem_topologs)(_.id, onDelete = ForeignKeyAction.Cascade)
  def resFK      = foreignKey("ses_res_fk", resource, models.DAO.ResourceDAO.resources)(_.id, onDelete = ForeignKeyAction.Cascade)

  def * = (id.?, element, resource,entities,
           created_at,
           updated_at) <> (SessionElementResourceDTO.tupled, SessionElementResourceDTO.unapply)  
}
case class ElementResourceDTO(  
  var id: Option[Int],
  element: Int,
  resource: Int,
  entities: String = "",
  created_at: Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now),
  updated_at: Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now) ) {
	def fetchEntities:List[String] = {
		entities.split(",").toList
	}
}
case class SessionElementResourceDTO(  
  var id: Option[Int],
  element: Int,
  resource: Int,
  entities: String = "",
  created_at: Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now),
  updated_at: Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now) ) {
  def fetchEntities:List[String] = {
    entities.split(",").toList
  }
}  
object ElementResourceDAO {
  import scala.util.Try
  import DatabaseCred.database
  val element_resources = TableQuery[ElementResources]
  def pull_object(s: ElementResourceDTO) = database withSession {
    implicit session ⇒ element_resources returning element_resources.map(_.id) += s }
  def get(k: Int) = database withSession {
    implicit session ⇒
      val q3 = for { s ← element_resources if s.id === k } yield s 
      q3.list.headOption
  }
  def update(id: Int, annotation: ElementResourceDTO) = database withSession { implicit session ⇒
    val element_resourcesUpdate: ElementResourceDTO = annotation.copy(Option(id))
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
  import DatabaseCred.database
  val session_element_resources = TableQuery[SessionElementResources]
  def pull_object(s: SessionElementResourceDTO) = database withSession {
    implicit session ⇒  session_element_resources returning session_element_resources.map(_.id) += s }
  def get(k: Int) = database withSession {
    implicit session ⇒
      val q3 = for { s ← session_element_resources if s.id === k } yield s 
      q3.list.headOption
  }
  def update(id: Int, annotation: SessionElementResourceDTO) = database withSession { implicit session ⇒
    val element_resourcesUpdate: SessionElementResourceDTO = annotation.copy(Option(id))
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
  





