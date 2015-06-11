package models.DAO.resources

//import slick.driver.PostgresDriver.simple._
import models.DAO.conversion.DatabaseCred
import models.DAO.driver.MyPostgresDriver.simple._

import com.github.nscala_time.time.Imports._

class Walks(tag: Tag) extends Table[WalkDTO](tag, "walks") {
  def id = column[Int]("id", O.PrimaryKey, O.AutoInc)
    
  def title = column[String]("title")
  def predicate = column[String]("predicate")
    
  def finished = column[Boolean]("finished")
  def started = column[Boolean]("started")
  def finished_at = column[org.joda.time.DateTime]("finished_at")
  def started_at = column[org.joda.time.DateTime]("started_at")


  def * = (id.?, title, predicate, finished, started, finished_at, started_at) <> (WalkDTO.tupled, WalkDTO.unapply)

}
/**
*  Model for Walkthrought
*  Based on predicate checking
*  Have not been used yet.
**/

case class WalkDTO(var id: Option[Int],
                  title: String,
                  predicate: String,
                  finished: Boolean,
                  started: Boolean,
                  finished_at: org.joda.time.DateTime,
                  started_at: org.joda.time.DateTime)

object WalksDAO {
  import scala.util.Try
  import DatabaseCred.database

  val walks = TableQuery[Walks]


  def pull_object(s: WalkDTO) = database withSession {
    implicit session ⇒
      walks returning walks.map(_.id) += s
  }

  def get(k: Int) = database withSession {
    implicit session ⇒
      val q3 = for { s ← walks if s.id === k } yield s 
      q3.list.headOption
  }

  def update(id: Int, walk: WalkDTO) = database withSession { implicit session ⇒
    val walkToUpdate: WalkDTO = walk.copy(Option(id))
    walks.filter(_.id === id).update(walkToUpdate)
  }
  /**
   * Delete a walk
   * @param id
   */
  def delete(id: Int) = database withSession { implicit session ⇒

    walks.filter(_.id === id).delete
  }
  /**
   * Count all walks
   */
  def count: Int = database withSession { implicit session ⇒
    Query(walks.length).first
  }



  def ddl_create = {
    database withSession {
      implicit session =>
      walks.ddl.create
    }
  }
  def ddl_drop = {
    database withSession {
      implicit session =>
      walks.ddl.drop
    }
  }

}


