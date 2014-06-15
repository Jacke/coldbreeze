package models.DAO.resources

import models.DAO.driver.MyPostgresDriver.simple._
import models.DAO.conversion.DatabaseCred

class Employees(tag: Tag) extends Table[(Option[Int], String)](tag, "employees") {
  def id = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def title = column[String]("title")



  def * = (id.?, title) //<> (Supplier.tupled, Supplier.unapply)

  def eb = EmployeesBusinessDAO.employees_businesses.filter(_.employee_id === id).flatMap(_.businessFK)
}

case class EmployeeDTO(var id: Option[Int], title: String)


object EmployeeDAO {
  import scala.util.Try
  import DatabaseCred.database

 val employees = TableQuery[Employees]

 def pull_object(s: EmployeeDTO) = database withSession {
    implicit session ⇒
      val tuple = EmployeeDTO.unapply(s).get
      employees returning employees.map(_.id) += (value = (None, s.title))//(EmployeeDTO.unapply(s).get._2, EmployeeDTO.unapply(s).get._3)
  }

  def pull(id: Option[Int] = None, title: String) = Try(database withSession {
    implicit session ⇒

      employees += (id, title)
  }).isSuccess

  def get(k: Int) = database withSession {
    implicit session ⇒
      val q3 = for { s ← employees if s.id === k } yield s <> (EmployeeDTO.tupled, EmployeeDTO.unapply _)
      println(q3.selectStatement)
      println(q3.list)
      q3.list.headOption //.map(Supplier.tupled(_))
  }
  
  def getBusiness(k: Int) = database withSession {
    implicit session ⇒
      val q1 = (for { 
      s ← employees if s.id === k
      j <- s.eb
      } yield (s.id, j.title))
      println("Manual join")
      println(q1.selectStatement)

      println(q1.run.toSet)
      q1.run.toSet
      //q1.list.head //.map(Supplier.tupled(_))
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
    //  case (id, title, address, city, state, zip) ⇒
    //    Supplier(id, title, address, city, state, zip)
    //}
  }

  def ddl_create = {
    database withSession {
      implicit session =>
      employees.ddl.create
    }
  }

}





 
