package models.DAO.resources

import play.api.db.DB

import slick.driver.PostgresDriver.simple._
import models.DAO.conversion.DatabaseCred

class Employees(tag: Tag) extends Table[EmployeeDTO](tag, "employees") {
  def id = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def uid = column[String]("uid")
  def master_acc = column[String]("master_acc")
  def position = column[Option[String]]("position")
  def manager = column[Boolean]("manager")

  // TODO: CHECK AND FIX BELOW
  //def accFK = foreignKey("acc_fk", uid, models.AccountsDAO.accounts)(_.userId, onDelete = ForeignKeyAction.Cascade)
  def maccFK = foreignKey("macc_fk", master_acc, models.AccountsDAO.accounts)(_.userId, onDelete = ForeignKeyAction.Cascade)
  def eb = EmployeesBusinessDAO.employees_businesses.filter(_.employee_id === id).flatMap(_.businessFK)

  def * = (id.?, uid, master_acc, position, manager) <> (EmployeeDTO.tupled, EmployeeDTO.unapply)

}

case class EmployeeDTO(var id: Option[Int], uid: String, master_acc:String, position:Option[String], manager:Boolean = false)


object EmployeeDAO {
  import scala.util.Try
  import DatabaseCred.database

 val employees = TableQuery[Employees]
  //val db = DB.getDataSource()

 def pull_object(s: EmployeeDTO) = database withSession {
    implicit session ⇒
      
      employees returning employees.map(_.id) += s//(value = (None, s.uid))//(EmployeeDTO.unapply(s).get._2, EmployeeDTO.unapply(s).get._3)
  }
def pull_object_for(s: EmployeeDTO, email: String) = database withSession {
  implicit session ⇒

    if (!getAllByMaster(email).map(_.uid).contains(s.uid)) {

      employees returning employees.map(_.id) += s //(value = (None, s.uid))//(EmployeeDTO.unapply(s).get._2, EmployeeDTO.unapply(s).get._3)
    }
 }
  def get(k: Int) = database withSession {
    implicit session ⇒
      val q3 = for { s ← employees if s.id === k } yield s// <> (EmployeeDTO.tupled, EmployeeDTO.unapply _)
      q3.list.headOption 
  }
  def getAllByMaster(email: String) = database withSession {
    implicit session =>
      val q3 = for { s <- employees if s.master_acc === email } yield s
      q3.list
  }
 

  def getByUID(uid: String) = database withSession {
    implicit session =>
    val q3 = for { s ← employees if s.uid === uid && s.master_acc === uid } yield s// <> (EmployeeDTO.tupled, EmployeeDTO.unapply _)
      println(q3.selectStatement)
      println(q3.list)
      q3.list.headOption
  }
  
 
  /**
   * Update a employee
   * @param id
   * @param employee
   */
  def update(id: Int, employee: EmployeeDTO) = database withSession { implicit session ⇒
    val bpToUpdate: EmployeeDTO = employee.copy(Option(id))
    employees.filter(_.id === id).update(bpToUpdate)
  }
  /**
   * Delete a employee
   * @param id
   */
  def delete(id: Int) = database withSession { implicit session ⇒

    employees.filter(_.id === id).delete
  }
  /**
   * Count all employees
   */
  def count: Int = database withSession { implicit session ⇒
    Query(employees.length).first
  }



  def getAll = database withSession {
    implicit session ⇒
      val q3 = for { s ← employees } yield s //<> (EmployeeDTO.tupled, EmployeeDTO.unapply _)
      q3.list.sortBy(_.id)
    //suppliers foreach {
    //  case (id, uid, address, city, state, zip) ⇒
    //    Supplier(id, uid, address, city, state, zip)
    //}
  }

  def ddl_create = {
    database withSession {
      implicit session =>
      employees.ddl.create
    }
  }
  def ddl_drop = {
    database withSession {
      implicit session =>
        employees.ddl.drop
    }
  }

}





 
