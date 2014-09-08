package models.DAO.resources

import scala.slick.driver.PostgresDriver.simple._
import models.DAO.conversion.DatabaseCred

class ActPermissions(tag: Tag) extends Table[ActPermission](tag, "act_permissions") {
  def id = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def uid = column[String]("uid")
  def front_elem_id = column[Option[Int]]("front_elem_id")
  def space_elem_id = column[Option[Int]]("space_elem_id")



  def fElemFK = foreignKey("fElemPermFK", front_elem_id, models.DAO.ProcElemDAO.proc_elements)(_.id, onDelete = ForeignKeyAction.Cascade)
  def spElemFK = foreignKey("spElemPermFK", space_elem_id, models.DAO.SpaceElemDAO.space_elements)(_.id, onDelete = ForeignKeyAction.Cascade)

  def * = (id.?, uid, front_elem_id, space_elem_id) <> (ActPermission.tupled, ActPermission.unapply)

  //def eb = EmployeesBusinessDAO.employees_businesses.filter(_.employee_id === id).flatMap(_.businessFK)
}

case class ActPermission(var id: Option[Int], uid: String, front_elem_id:Option[Int], space_elem_id:Option[Int])


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
      println(q3.selectStatement)
      println(q3.list)
      q3.list.headOption
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

}




