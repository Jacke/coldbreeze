package models.DAO.resources

import scala.slick.driver.PostgresDriver.simple._
import models.DAO.conversion.DatabaseCred
import models.DAO._

class ActPermissions(tag: Tag) extends Table[ActPermission](tag, "act_permissions") {
  def id = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def uid = column[String]("uid")
  def bprocess = column[Int]("bprocess")
  def front_elem_id = column[Option[Int]]("front_elem_id")
  def space_elem_id = column[Option[Int]]("space_elem_id")



  def fElemFK = foreignKey("fElemPermFK", front_elem_id, models.DAO.ProcElemDAO.proc_elements)(_.id, onDelete = ForeignKeyAction.Cascade)
  def spElemFK = foreignKey("spElemPermFK", space_elem_id, models.DAO.SpaceElemDAO.space_elements)(_.id, onDelete = ForeignKeyAction.Cascade)

  def * = (id.?, uid, bprocess, front_elem_id, space_elem_id) <> (ActPermission.tupled, ActPermission.unapply)

  //def eb = EmployeesBusinessDAO.employees_businesses.filter(_.employee_id === id).flatMap(_.businessFK)
}

case class ActPermission(var id: Option[Int], uid: String, bprocess: Int,front_elem_id:Option[Int], space_elem_id:Option[Int])
case class ResAct(bprocess_id: Int, bprocess_title: String, elem_title: String)


object ActPermissionDAO {
  import scala.util.Try
  import DatabaseCred.database

 val act_permissions = TableQuery[ActPermissions]

 def pull_object(s: ActPermission) = database withSession {
    implicit session ⇒

      act_permissions returning act_permissions.map(_.id) += s
  }
  def get(k: Int) = database withSession {
    implicit session ⇒
      val q3 = for { s ← act_permissions if s.id === k } yield s
      q3.list.headOption
  }
  def getByUID(uid: String) = database withSession {
    implicit session =>
    val q3 = for { s ← act_permissions if s.uid === uid } yield s
      q3.list
  }
  def getByProcessesIDS(proc_ids: List[Int]) = database withSession {
     implicit session =>
    val q3 = for { s ← act_permissions if s.bprocess inSetBind proc_ids } yield s
      q3.list  
  }

  def getByUIDprocIDS(uid: String) = { 
    val z = {
    database withSession {
    implicit session =>
    val q3 = for { s ← act_permissions if s.uid === uid } yield s
      q3.list
  }
  }
  val u = { z.map{ perm =>
    if (perm.front_elem_id.isDefined) {
      models.DAO.ProcElemDAO.findById(perm.front_elem_id.get).get.bprocess.asInstanceOf[Int]
    } else if (perm.space_elem_id.isDefined) {
      models.DAO.SpaceElemDAO.findById(perm.space_elem_id.get).get.bprocess.asInstanceOf[Int]
    }
    }
  }
  u.asInstanceOf[List[Int]]
  }
  

def getByUIDelemTitles(uid: String) = { 
    // TODO: Refactor that shit above and below
    val z = {
    database withSession {
      implicit session =>
      val q3 = for { s ← act_permissions if s.uid === uid } yield s
        q3.list
    }
  }
  def prepareElements(perms: List[ActPermission]):Map[Int, String] = {
    var result_map:Map[Int, String] = Map.empty[Int, String]
    perms.map { perm =>
      if (perm.front_elem_id.isDefined) {

       result_map = result_map + ((models.DAO.ProcElemDAO.findById(perm.front_elem_id.get).get.id.get.asInstanceOf[Int],
                       models.DAO.ProcElemDAO.findById(perm.front_elem_id.get).get.title.asInstanceOf[String]))
      } else if (perm.space_elem_id.isDefined) {
       result_map = result_map + ((models.DAO.SpaceElemDAO.findById(perm.space_elem_id.get).get.id.get.asInstanceOf[Int],
                                       models.DAO.SpaceElemDAO.findById(perm.space_elem_id.get).get.title.asInstanceOf[String]))
      }
      }
    result_map
    }
  
  val u = Map.empty[Int, String]
  if (z.length > 0) {
    val u = prepareElements(z)
  } 
  /*

  val result = u.asInstanceOf[List[Map[Int, String]]]
  if (result.size > 0) {
    result.reduceLeft(_ ++ _).asInstanceOf[Map[Int, String]]
    result
  } else {
    val result = Map.empty[Int, String]
    result.asInstanceOf[Map[Int, String]]
  }
*/
  u
}
  def getActsByUID(email: String) = {
    val bprocess = BPDAO.getAll
    val bpIds = ActPermissionDAO.getByUIDprocIDS(email)
    val active_stations = BPStationDAO.findActiveByBPIds(bpIds)

    // Active stations
    // Bprocesses on dat
    // Current element and next
    val acts: List[Option[ResAct]] = { 
      active_stations.map { station =>  
        bprocess.find(bp => bp.id.get == station.process) match {
          case Some(bprocess) => Some(ResAct(station.process, bprocess.title, "Обрезка")) 
          case _ => None
        }
      
    }
    }
    acts.flatten
   
  }







  def update(id: Int, obj: ActPermission) = database withSession { implicit session ⇒
    val toUpdate: ActPermission = obj.copy(Option(id))
    act_permissions.filter(_.id === id).update(toUpdate)
  }

  def delete(id: Int) = database withSession { implicit session ⇒

    act_permissions.filter(_.id === id).delete
  }
  def count: Int = database withSession { implicit session ⇒
    Query(act_permissions.length).first
  }
  def getAll = database withSession {
    implicit session ⇒
      val q3 = for { s ← act_permissions } yield s
      q3.list.sortBy(_.id)

  }

  def ddl_create = {
    database withSession {
      implicit session =>
      act_permissions.ddl.create
    }
  }
  def ddl_drop = {
    database withSession {
      implicit session =>
        act_permissions.ddl.drop
    }
  }

}
