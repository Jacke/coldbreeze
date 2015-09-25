// LaunchElementSlats.scala
package models.DAO

import models.DAO.driver.MyPostgresDriver1.simple._
import slick.model.ForeignKeyAction
import models.DAO.conversion.{DatabaseCred, Implicits}  
import slick.model.ForeignKeyAction


class LaunchElementSlats(tag: Tag) extends Table[LaunchElementSlatDTO](tag, "launch_element_slats"){
  def id         = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def element    = column[Int]("launched_element_id")
  def slat       = column[Int]("slat_id")
  def created_at = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at = column[Option[org.joda.time.DateTime]]("updated_at")  
    

  def * = (id.?, element, slat,       
           created_at,
           updated_at) <> (LaunchElementSlatDTO.tupled, LaunchElementSlatDTO.unapply)  
    
}
case class LaunchElementSlatDTO(  
  var id: Option[Int],
  element: Int,
  slat: Int,
  created_at: Option[org.joda.time.DateTime],
  updated_at: Option[org.joda.time.DateTime] )
  
object LaunchElementSlatDAO {
  import scala.util.Try
  import DatabaseCred.database

  val launch_element_slats = TableQuery[LaunchElementSlats]
    
    
  def pull_object(s: LaunchElementSlatDTO) = database withSession {
    implicit session ⇒
      launch_element_slats returning launch_element_slats.map(_.id) += s
  }
  def get(k: Int) = database withSession {
    implicit session ⇒
      val q3 = for { s ← launch_element_slats if s.id === k } yield s 
      println(q3.selectStatement)
      println(q3.list)
      q3.list.headOption
  }
  def update(id: Int, annotation: LaunchElementSlatDTO) = database withSession { implicit session ⇒
    val launch_element_slatsUpdate: LaunchElementSlatDTO = annotation.copy(Option(id))
    launch_element_slats.filter(_.id === id).update(launch_element_slatsUpdate)
  } 


  def delete(id: Int) = database withSession { implicit session ⇒
    launch_element_slats.filter(_.id === id).delete
  }
  def count: Int = database withSession { implicit session ⇒
    Query(launch_element_slats.length).first
  }
  def getAll = database withSession {
    implicit session ⇒
      val q3 = for { s ← launch_element_slats } yield s 
      q3.list.sortBy(_.id)
  }
  def ddl_create = {
    database withSession {
      implicit session =>
      launch_element_slats.ddl.create
    }
  }
  def ddl_drop = {
    database withSession {
      implicit session =>
        launch_element_slats.ddl.drop
    }
  }  
      
}
  


