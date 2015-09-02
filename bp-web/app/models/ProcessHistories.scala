package models.DAO

//import models.DAO.driver.MyPostgresDriver1.simple._
//import com.github.tminglei.slickpg.composite._
import models.DAO.conversion.{DatabaseCred, Implicits}
import org.joda.time.DateTime
//import slick.driver.PostgresDriver.api._
import scala.concurrent.Future
import models.DAO.driver.MyPostgresDriver1.simple._
import com.github.tminglei.slickpg.composite._
//import com.github.tototoshi.slick.PostgresJodaSupport._

//  import slick.model.ForeignKeyAction
class ProcessHistories(tag: Tag) extends Table[ProcessHistoryDTO](tag, "process_histories") {
  def id       = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def acc      = column[String]("master_acc")
  def process  = column[Option[Int]]("process_id")
  def action   = column[String]("action")
  def what     = column[Option[String]]("what")
  def what_id  = column[Option[Int]]("what_id")
  def date     = column[org.joda.time.DateTime]("date")

  def bpFK     = foreignKey("pr_hist_bprocess_fk", process, models.DAO.BPDAO.bprocesses)(_.id)
  def accFK    = foreignKey("pr_hist_macc_fk", acc, models.AccountsDAO.accounts)(_.userId, onDelete = ForeignKeyAction.Cascade)


  def * = (id.?, acc, action, process, what, what_id, date) <> (ProcessHistoryDTO.tupled, ProcessHistoryDTO.unapply)

}




/*
  Process Histories
 */
case class ProcessHistoryDTO(var id: Option[Int], 
  acc: String, 
  action: String,
  process: Option[Int], 
  what: Option[String] = None,
  what_id: Option[Int] = None,
  date: DateTime) {
   
}
object ProcHisCom {
  def apply(id: Option[Int], 
    acc: String, 
    action: String, 
    process: Option[Int], 
    what: Option[String] = None, 
    what_id: Option[Int] = None, 
    date: DateTime = org.joda.time.DateTime.now()):ProcessHistoryDTO = {
    new ProcessHistoryDTO(id, acc, action, process, what, what_id, date)
  }
  def processCreated = "process_created"
  def processUpdated = "process_updated"
  def processDeleted = "process_deleted"
  def processLaunched = "process_launched"
  def processResumed = "process_resumed"
  def elementCreated = "elem_created"
  def elementRenamed = "element_renamed"
  def elementDeleted = "element_deleted"
  def elementMovedUp = "element_up"
  def elementDown    = "element_down"
  def spaceElementCreated      = "space_elem_created"
  def spaceElementRenamed      = "space_element_renamed"
  def spaceElementDeleted      = "space_element_deleted"
  def spaceElementMovedUp      = "space_element_up"
  def spaceElementMovedDown    = "element_down"  
  def permCreated              = "perm_created"
  def permDeleted              = "perm_deleted"
}

object ProcHistoryDAO {
  import scala.util.Try
  import DatabaseCred.database


  case object ProcCreated
  case object ProcUpdated
  case object ProdDeleted


  val proc_histories = TableQuery[ProcessHistories]
 /*
  def make_history[A](userId: String, bprocess: Int, action: A) = {
  	pull_object( ProcessHistoryDTO(None, userId, bprocess, action.getClass.getName.split("\\$").last.toLowerCase, DateTime.now() ) )
  }



  */
  //def pull_async(s: ProcessHistoryDTO):Future[Int] = {
  //  try database.run(proc_histories += s)
  //  finally database.close
  //}
  def pull_object(s: ProcessHistoryDTO) = database withSession {
    implicit session ⇒
      proc_histories returning proc_histories.map(_.id) += s
  }
  def getByProcess(proc_id: Int):List[models.DAO.ProcessHistoryDTO] = database withSession {
    implicit session ⇒
      val q3 = for { s ← proc_histories if s.process === proc_id } yield s 
      q3.list//.headOption
  }
  /*
  def get(k: Int) = database withSession {
    implicit session ⇒
      val q3 = for { s ← proc_histories if s.id === k } yield s 
      q3.list.headOption
  }
    /**
   * Update a business service
   * @param id
   * @param business service
   */
  def update(id: Int, history: ProcessHistoryDTO) = database withSession { implicit session ⇒
    val historyToUpdate: ProcessHistoryDTO = history.copy(Option(id))
    proc_histories.filter(_.id === id).update(historyToUpdate)
  } /**
   * Delete a business service
   * @param id
   */
  def delete(id: Int) = database withSession { implicit session ⇒

    proc_histories.filter(_.id === id).delete
  }
  /**
   * Count all business_services
   */
  def count: Int = database withSession { implicit session ⇒
    Query(proc_histories.length).first
  }



  def getAll = database withSession {
    implicit session ⇒
      val q3 = for { s ← proc_histories } yield s 
      q3.list.sortBy(_.id)

  }*/

  def ddl_create = {
    database withSession {
      implicit session =>
      proc_histories.schema.create
    }
  }
  def ddl_drop = {
    database withSession {
      implicit session =>
        proc_histories.schema.drop
    }
  }
}


/*
  Process commits

class ProcessCommits(tag: Tag) extends Table[ProcessCommitDTO](tag, "process_commits") {
  import slick.model.ForeignKeyAction

  def id = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def title = column[String]("title")
  def bprocess = column[Int]("process_id")
  def created_at = column[DateTime]("created_at")

  def bpFK = foreignKey("bprocess_fk", bprocess, models.DAO.BPDAO.bprocesses)(_.id, onDelete = ForeignKeyAction.Cascade)


  def * = (id.?, title, bprocess, created_at) <> (ProcessCommitDTO.tupled, ProcessCommitDTO.unapply)

}

case class ProcessCommitDTO(var id: Option[Int], title: String = "", bprocess: Int, created_at: DateTime)

object ProcCommitDAO {

  import scala.util.Try
  import DatabaseCred.database
  val proc_commits = TableQuery[ProcessCommits]
  def ddl_create = {
    database withSession {
      implicit session =>
        proc_commits.schema.create
    }
  }
  def ddl_drop = {
    database withSession {
      implicit session =>
        proc_commits.schema.drop
    }
  }
}

*/