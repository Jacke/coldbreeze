package models.DAO.resources

import slick.driver.PostgresDriver.simple._
import models.DAO.conversion.DatabaseCred
import slick.model.ForeignKeyAction

class BusinessWalks(tag: Tag) extends Table[BusinessWalkDTO](tag, "business_walks") {
  def id = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def business_id = column[Int]("business_id")
    
    

  def businesswalkFK = foreignKey("businesswalk_fk", business_id, models.DAO.resources.web.BusinessDAO.businesses)(_.id, onDelete = ForeignKeyAction.Cascade)

  def * = (id.?, business_id) <> (BusinessWalkDTO.tupled, BusinessWalkDTO.unapply)

}

case class BusinessWalkDTO(var id: Option[Int], business_id: Int)

object BusinessWalksDAO {
  import scala.util.Try
  import DatabaseCred.database

  val business_walks = TableQuery[BusinessWalks]


  def pull_object(s: BusinessWalkDTO) = database withSession {
    implicit session ⇒
      business_walks returning business_walks.map(_.id) += s
  }

  def get(k: Int) = database withSession {
    implicit session ⇒
      val q3 = for { s ← business_walks if s.id === k } yield s 
      q3.list.headOption
  }

  def update(id: Int, walk: BusinessWalkDTO) = database withSession { implicit session ⇒
    val walkToUpdate: BusinessWalkDTO = walk.copy(Option(id))
    business_walks.filter(_.id === id).update(walkToUpdate)
  }

  def delete(id: Int) = database withSession { implicit session ⇒
    business_walks.filter(_.id === id).delete
  }

  def count: Int = database withSession { implicit session ⇒
    Query(business_walks.length).first
  }



  def ddl_create = {
    database withSession {
      implicit session =>
        business_walks.ddl.create
    }
  }
  def ddl_drop = {
    database withSession {
      implicit session =>
         business_walks.ddl.drop
    }
  }
}


