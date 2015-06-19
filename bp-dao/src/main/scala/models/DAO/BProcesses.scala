package models.DAO


import models.DAO.driver.MyPostgresDriver1.simple._
import com.github.nscala_time.time.Imports._
//import com.github.tminglei.slickpg.date.PgDateJdbcTypes
import slick.model.ForeignKeyAction
  
import slick.model.ForeignKeyAction
import models.DAO.resources.BusinessDTO._
import models.DAO.conversion.DatabaseCred

/**
 * BProcess Scheme
 */
class BProcesses(tag: Tag) extends Table[BProcessDTO](tag, "bprocesses") {
  def id          = column[Int]("id", O.PrimaryKey, O.AutoInc) 
  def title       = column[String]("title")
  def service     = column[Int]("service_id")
  def business    = column[Int]("business_id")
    
  def created_at  = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at  = column[Option[org.joda.time.DateTime]]("updated_at")  

  def version     = column[Long]("version", O.Default(1L))
  def state_machine_type = column[String]("state_machine_type", O.Default("base"))
  // Every table needs a * projection with the same type as the table's type parameter
  def * = (id.?, title, service, business ,created_at, updated_at, version, state_machine_type) <> (BProcessDTO.tupled, BProcessDTO.unapply)
  
  def businessFK  = foreignKey("proc_business_fk", business, models.DAO.resources.BusinessDAO.businesses)(_.id, onDelete = ForeignKeyAction.Cascade)
  def serviceFK   = foreignKey("proc_service_fk", service, models.DAO.resources.BusinessServiceDAO.business_services)(_.id, onDelete = ForeignKeyAction.Cascade)
}


/*
  Case class
 */
case class BProcessDTO(var id: Option[Int], title: String, 
                       service: Int, business: Int , 
                       created_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now),
                       updated_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now), 
                       version: Long = 1L, state_machine_type: String = "base")

/*
  DataConversion
 */
object BPDCO {

}


object BPDAO {
  /**
   * Actions
   */
  import scala.util.Try

  import DatabaseCred.database
  import models.DAO.conversion.Implicits._



  val bprocesses = TableQuery[BProcesses]

  def pull_object(s: BProcessDTO) = database withSession {
    implicit session ⇒
      bprocesses returning bprocesses.map(_.id) += s
  }

  def findOwnerByBP(BPid: Int) = database withSession {
    implicit session =>
      val q3 = for { bp ← bprocesses 
                     srv <- models.DAO.resources.BusinessServiceDAO.business_services
        if bp.id === BPid && srv.id === bp.service  } yield srv
      q3.list.headOption.get.master_acc

  }

  def findByBusiness(business: Int):List[BProcessDTO] = database withSession {
    implicit session =>
    val q3 = for { s ← bprocesses if s.business === business } yield s
    q3.list
  }
  def getByServices(services: List[Int]) = database withSession {
    implicit session =>
      val q3 = for { s ← bprocesses if s.service inSetBind services } yield s
      q3.list
  }
  def checkTitle(title: String) = database withSession {
    implicit service =>
     val q3 = for { s ← bprocesses if s.title === title } yield s
      q3.list.headOption
  }

  def pull(id: Option[Int] = None, title: String, service: Int, business: Int) = Try(database withSession {
    implicit session ⇒

      bprocesses += BProcessDTO(id, title, service, business)
  }).isSuccess

  def get(k: Int) = database withSession {
    implicit session ⇒
      val q3 = for { s ← bprocesses if s.id === k } yield s
      q3.list.headOption //.map(Supplier.tupled(_))
  }
  /**
   * Update a bprocess
   * @param id
   * @param bprocess
   */
  def update(id: Int, bprocess: BProcessDTO) = database withSession { implicit session ⇒
    val bpToUpdate: BProcessDTO = bprocess.copy(Option(id))
    bprocesses.filter(_.id === id).update(bpToUpdate)
  }
  /**
   * Delete a bprocess
   * @param id
   */
  def delete(id: Int) = database withSession { implicit session ⇒

    bprocesses.filter(_.id === id).delete
  }
  /**
   * Count all bprocesses
   */
  def count: Int = database withSession { implicit session ⇒
    Query(bprocesses.length).first
  }

  def ddl_create = {
    database withSession {
      implicit session =>
      bprocesses.ddl.create
    }
  }
  def ddl_drop = {
    database withSession {
      implicit session =>
       bprocesses.ddl.drop
    }
  }

  def getAll = database withSession {
    implicit session ⇒ // TODO: s.service === 1 CHANGE DAT
      val q3 = for { s ← bprocesses } yield s
      q3.list.sortBy(_.id)
    //suppliers foreach {
    //  case (id, title, address, city, state, zip) ⇒
    //    Supplier(id, title, address, city, state, zip)
    //}
  }
}
