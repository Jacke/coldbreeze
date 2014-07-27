package models.DAO.resources

import scala.slick.driver.PostgresDriver.simple._
import models.DAO.conversion.DatabaseCred

class Employees(tag: Tag) extends Table[(Option[Int], String)](tag, "employees") {
  def id = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def uid = column[String]("uid")



  def * = (id.?, uid) //<> (Supplier.tupled, Supplier.unapply)

  def eb = EmployeesBusinessDAO.employees_businesses.filter(_.employee_id === id).flatMap(_.businessFK)
}

case class EmployeeDTO(var id: Option[Int], uid: String)


object EmployeeDAO {
  import scala.util.Try
  import DatabaseCred.database

 val employees = TableQuery[Employees]

 def pull_object(s: EmployeeDTO) = database withSession {
    implicit session ⇒
      val tuple = EmployeeDTO.unapply(s).get
      employees returning employees.map(_.id) += (value = (None, s.uid))//(EmployeeDTO.unapply(s).get._2, EmployeeDTO.unapply(s).get._3)
  }

  def pull(id: Option[Int] = None, uid: String) = Try(database withSession {
    implicit session ⇒

      employees += (id, uid)
  }).isSuccess

  def get(k: Int) = database withSession {
    implicit session ⇒
      val q3 = for { s ← employees if s.id === k } yield s <> (EmployeeDTO.tupled, EmployeeDTO.unapply _)
      println(q3.selectStatement)
      println(q3.list)
      q3.list.headOption //.map(Supplier.tupled(_))
  }
  
 
  /**
   * Update a employee
   * @param id
   * @param employee
   */
  def update(id: Int, employee: EmployeeDTO) = database withSession { implicit session ⇒
    val bpToUpdate: EmployeeDTO = employee.copy(Option(id))
    employees.where(_.id === id).update(EmployeeDTO.unapply(bpToUpdate).get)
  }
  /**
   * Delete a employee
   * @param id
   */
  def delete(id: Int) = database withSession { implicit session ⇒

    employees.where(_.id === id).delete
  }
  /**
   * Count all employees
   */
  def count: Int = database withSession { implicit session ⇒
    Query(employees.length).first
  }



  def getAll = database withSession {
    implicit session ⇒
      val q3 = for { s ← employees } yield s <> (EmployeeDTO.tupled, EmployeeDTO.unapply _)
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

}





 
