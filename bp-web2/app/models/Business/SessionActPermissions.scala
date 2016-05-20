package models.DAO.resources

import slick.driver.PostgresDriver.simple._
import models.DAO.conversion.DatabaseCred
import models.DAO._

/*
object PermissionRole {
  val roles:List[String] = List("view",
                                "edit",
                                "interact", // TODO: currently not used.
                                "all")
}
*/

class SessionActPermissions(tag: Tag) extends Table[SessionActPermission](tag, "session_process_permissions") {
  def id    = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def uid   = column[Option[String]]("uid")
  def group = column[Option[Int]]("group_id")

  // Process permissions
  def process = column[Int]("bprocess")
  def session = column[Int]("session_id")
  def role    = column[String]("role")
  /***
   *  Role:
   *  1. View
   *  2. Edit
   *  3. All
   *  4. Interact
   */
  // Elements permissions
  def front_elem_id = column[Option[Int]]("front_elem_id")
  def space_elem_id = column[Option[Int]]("space_elem_id")
  def reaction      = column[Option[Int]]("reaction_id")

  def maccFK  = foreignKey("pr_perm_acc_fk", uid, models.AccountsDAO.users)(_.email, onDelete = ForeignKeyAction.Cascade, onUpdate = ForeignKeyAction.Cascade)
  def procFK  = foreignKey("pr_perm_process_fk", process, models.DAO.BPDAOF.bprocesses)(_.id, onDelete = ForeignKeyAction.Cascade)
  def fElemFK = foreignKey("pr_perm_fElemPermFK", front_elem_id, models.DAO.ProcElemDAO.proc_elements)(_.id, onDelete = ForeignKeyAction.Cascade)
  def spElemFK= foreignKey("pr_perm_spElemPermFK", space_elem_id, models.DAO.SpaceElemDAO.space_elements)(_.id, onDelete = ForeignKeyAction.Cascade)
  def groupFK = foreignKey("pr_perm_groupFK", group, models.DAO.resources.GroupsDAO.groups)(_.id, onDelete = ForeignKeyAction.Cascade)
  def reactFK = foreignKey("pr_perm_reactionFK", reaction, models.DAO.ReactionDAO.reactions)(_.id, onDelete = ForeignKeyAction.Cascade)
  def sesActFK= foreignKey("session_act_fk", session, models.DAO.BPSessionDAO.bpsessions)(_.id, onDelete = ForeignKeyAction.Cascade)

  def * = (id.?, uid, group, process, session, front_elem_id, space_elem_id, reaction, role) <> (SessionActPermission.tupled, SessionActPermission.unapply)

  //def eb = EmployeesBusinessDAO.employees_businesses.filter(_.employee_id === id).flatMap(_.businessFK)
}

case class SessionActPermission(var id: Option[Int],
                         uid: Option[String],
                         group:Option[Int],
                         process: Int,
                         session: Int,
                         front_elem_id:Option[Int],
                         space_elem_id:Option[Int],
                         reaction: Option[Int],
                         role: String = "interact"
)
case class SessionResAct(bprocess_id: Int, bprocess_title: String, elem_title: String)


object SessionActPermissionDAO {
  import scala.util.Try
  import DatabaseCred.database

   val session_act_permissions = TableQuery[SessionActPermissions]

 def pull_object(perm: SessionActPermission) = database withSession {
    implicit session ⇒
      def creation(perm: SessionActPermission) = {
        if (PermissionRole.roles.contains(perm.role))
          session_act_permissions returning session_act_permissions.map(_.id) += perm
        else
          -1
      }
      perm.uid match {
        case Some(uid) => creation(perm)
        case _ => { // create for group
          perm.group match {
            case Some(account_group) => {
              val group_id = GroupsDAO.get(account_group) match {
                case Some(group) => { creation(perm.copy(group = Some(group.id.get))) }
                case _ => { println("group not found" + account_group); -1 }
                }
            }
            case _ => -1
          }
        }
      }
  }
  def get(k: Int) = database withSession {
    implicit session ⇒
      val q3 = for { s ← session_act_permissions if s.id === k } yield s
      q3.list.headOption
  }
  def getByUID(uid: String) = database withSession {
    implicit session =>
    val q3 = for { s ← session_act_permissions if s.uid === uid } yield s
      q3.list
  }
  def getByProcessesIDS(proc_ids: List[Int]) = database withSession {
     implicit session =>
    val q3 = for { s ← session_act_permissions if s.process inSetBind proc_ids } yield s
      q3.list
  }
  def getByProcessId(process_id: Int) = database withSession {
    implicit session =>
    val q3 = for { s ← session_act_permissions if s.process === process_id } yield s
      q3.list
  }

  def getByUIDprocIDS(uid: String):List[Int] = {
    val z = {
    database withSession {
    implicit session =>
    val q3 = for { s ← session_act_permissions if s.uid === uid } yield s
      q3.list
  }
  }
  val u = {
    z.map { perm =>
      /*
    if (perm.front_elem_id.isDefined) {

      models.DAO.ProcElemDAO.findById(perm.front_elem_id.get).get.bprocess.asInstanceOf[Int]
    } else if (perm.space_elem_id.isDefined) {
      models.DAO.SpaceElemDAO.findById(perm.space_elem_id.get).get.bprocess.asInstanceOf[Int]
    }
    } */
    }
  }
  z.map(_.process)
  }


def getByUIDelemTitles(uid: String) = {
    // TODO: Refactor that shit above and below
    val z = {
    database withSession {
      implicit session =>
      val q3 = for { s ← session_act_permissions if s.uid === uid } yield s
        q3.list
    }
  }
  def prepareElements(perms: List[SessionActPermission]):Map[Int, String] = {
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
    val processes = BPDAO.getAll
    val bpIds = SessionActPermissionDAO.getByUIDprocIDS(email)
    val active_stations = BPStationDAO.findActiveByBPIds(bpIds)

    // Active stations
    // processes on dat
    // Current element and next
    val acts: List[Option[SessionResAct]] = {
      active_stations.map { station =>
        processes.find(bp => bp.id.get == station.process) match {
          case Some(process) => Some(SessionResAct(station.process, process.title, "Обрезка"))
          case _ => None
        }

    }
    }
    acts.flatten

  }







  def update(id: Int, obj: SessionActPermission) = database withSession { implicit session ⇒
    val toUpdate: SessionActPermission = obj.copy(Option(id))
    session_act_permissions.filter(_.id === id).update(toUpdate)
  }

  def delete(id: Int) = database withSession { implicit session ⇒

    session_act_permissions.filter(_.id === id).delete
  }
  def count: Int = database withSession { implicit session ⇒
    Query(session_act_permissions.length).first
  }
  def getAll = database withSession {
    implicit session ⇒
      val q3 = for { s ← session_act_permissions } yield s
      q3.list.sortBy(_.id)

  }

  def ddl_create = {
    database withSession {
      implicit session =>
      session_act_permissions.ddl.create
    }
  }
  def ddl_drop = {
    database withSession {
      implicit session =>
        session_act_permissions.ddl.drop
    }
  }

}
