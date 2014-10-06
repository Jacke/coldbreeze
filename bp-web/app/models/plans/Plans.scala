package models.DAO.resources

import slick.driver.PostgresDriver.simple._
import scala.slick.model.ForeignKeyAction
//import models.DAO.driver.MyPostgresDriver.simple._
import models.DAO.conversion.DatabaseCred

class Plans(tag: Tag) extends Table[PlanDTO](tag, "plans") {
  def id = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def title = column[String]("title")

  def * = (id.?, title) <> (PlanDTO.tupled, PlanDTO.unapply)

}

/*
  Case class
 */
case class PlanDTO(var id: Option[Int], title: String)

object PlanDAO {
  import scala.util.Try
  import DatabaseCred.database

  val plans = TableQuery[Plans]
 
  def pull_object(s: PlanDTO) = database withSession {
    implicit session ⇒
      plans returning plans.map(_.id) += s
  }
  def get(k: Int) = database withSession {
    implicit session ⇒
      val q3 = for { s ← plans if s.id === k } yield s 
      println(q3.selectStatement)
      println(q3.list)
      q3.list.headOption
  }
    /**
   * Update a business service
   * @param id
   * @param business service
   */
  def update(id: Int, businessService: PlanDTO) = database withSession { implicit session ⇒
    val bpToUpdate: PlanDTO = businessService.copy(Option(id))
    plans.filter(_.id === id).update(bpToUpdate)
  } /**
   * Delete a business service
   * @param id
   */
  def delete(id: Int) = database withSession { implicit session ⇒

    plans.filter(_.id === id).delete
  }
  /**
   * Count all business_services
   */
  def count: Int = database withSession { implicit session ⇒
    Query(plans.length).first
  }



  def getAll = database withSession {
    implicit session ⇒
      val q3 = for { s ← plans } yield s 
      q3.list.sortBy(_.id)

  }

   def ddl_create = {
    database withSession {
      implicit session =>
      plans.ddl.create
    }
  }
}
