package models.DAO

import models.DAO.driver.MyPostgresDriver1.simple._
import slick.model.ForeignKeyAction
import models.DAO.conversion.{DatabaseCred, Implicits}  
import slick.model.ForeignKeyAction


class Resources(tag: Tag) extends Table[ResourceDTO](tag, "resources"){
  def id         = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def title      = column[String]("title")
  def business   = column[Int]("business_id")
  def created_at = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at = column[Option[org.joda.time.DateTime]]("updated_at")  
    
  def businessFK  = foreignKey("res_business_fk", business, models.DAO.resources.BusinessDAO.businesses)(_.id, onDelete = ForeignKeyAction.Cascade)


  def * = (id.?, title,business,
           created_at,
           updated_at) <> (ResourceDTO.tupled, ResourceDTO.unapply)  
    
}
case class ResourceDTO(  
  var id: Option[Int],
  title: String,
  business:Int,
  created_at: Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now),
  updated_at: Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now) )
  
object ResourceDAO {
  import scala.util.Try
  import DatabaseCred.database

  val resources = TableQuery[Resources]
    
    
  def pull_object(s: ResourceDTO) = database withSession {
    implicit session ⇒
      resources returning resources.map(_.id) += s
  }
  def get(k: Int) = database withSession {
    implicit session ⇒
      val q3 = for { s ← resources if s.id === k } yield s 
      println(q3.selectStatement)
      println(q3.list)
      q3.list.headOption
  }
  def update(id: Int, annotation: ResourceDTO) = database withSession { implicit session ⇒
    val resourcesUpdate: ResourceDTO = annotation.copy(Option(id))
    resources.filter(_.id === id).update(resourcesUpdate)
  } 


  def delete(id: Int) = database withSession { implicit session ⇒
    resources.filter(_.id === id).delete
  }
  def count: Int = database withSession { implicit session ⇒
    Query(resources.length).first
  }
  def getAll = database withSession {
    implicit session ⇒
      val q3 = for { s ← resources } yield s 
      q3.list.sortBy(_.id)
  }
  def ddl_create = {
    database withSession {
      implicit session =>
      resources.ddl.create
    }
  }
  def ddl_drop = {
    database withSession {
      implicit session =>
        resources.ddl.drop
    }
  }  
      
}
  


