package models.DAO

import slick.driver.PostgresDriver.api._
import com.github.tminglei.slickpg.composite._
import models.DAO.conversion.{DatabaseCred, Implicits}
import slick.model.ForeignKeyAction
import org.joda.time.DateTime

class RedemCodes(tag: Tag) extends Table[RedemCodeDTO](tag, "redem_codes") {
  def id         = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def code       = column[String]("code")
  def force      = column[Int]("force")
  def created_at = column[DateTime]("created_at")



  def * = (id.?, code, force, created_at) <> (RedemCodeDTO.tupled, RedemCodeDTO.unapply)

}

/*
  Case class
 */
case class RedemCodeDTO(var id: Option[Int], code: String, force: Int, created_at: DateTime)


object RedemCodesDAO {
  import scala.util.Try
  import DatabaseCred.database



  val redem_codes = TableQuery[RedemCodes]
 


  def pull_object(s: RedemCodeDTO) = database withSession {
    implicit session ⇒
      redem_codes returning redem_codes.map(_.id) += s
  }
  def get(k: Int) = database withSession {
    implicit session ⇒
      val q3 = for { s ← redem_codes if s.id === k } yield s 
      q3.list.headOption
  }
  def getByCode(code: String) = database withSession {
    implicit session ⇒
      val q3 = for { s ← redem_codes if s.code === code } yield s 

      q3.list.headOption
  }

  /**
   * Update a redem code
   * @param id
   * @param business service
   */
  def update(id: Int, code: RedemCodeDTO) = database withSession { implicit session ⇒
    val codeToUpdate: RedemCodeDTO = code.copy(Option(id))
    redem_codes.filter(_.id === id).update(codeToUpdate)
  } 
  /**
   * Delete a redem code
   * @param id
   */
  def delete(id: Int) = database withSession { implicit session ⇒

    redem_codes.filter(_.id === id).delete
  }
  /**
   * Count all business_services
   */
  def count: Int = database withSession { implicit session ⇒
    Query(redem_codes.length).first
  }



  def getAll = database withSession {
    implicit session ⇒
      val q3 = for { s ← redem_codes } yield s 
      q3.list.sortBy(_.id)

  }

   def ddl_create = {
    database withSession {
      implicit session =>
      redem_codes.ddl.create
    }
  }
  def ddl_drop = {
    database withSession {
      implicit session =>
        redem_codes.ddl.drop
    }
  }
}
