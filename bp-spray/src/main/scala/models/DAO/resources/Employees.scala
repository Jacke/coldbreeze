package models.DAO.resources

import models.DAO.driver.MyPostgresDriver.simple._

class Employees(tag: Tag) extends Table[(Option[Int], String)](tag, "employees") {
  def id = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def title = column[String]("title")



  def * = (id.?, title) //<> (Supplier.tupled, Supplier.unapply)

  def eb = EmployeesBusinessDAO.employees_businesses.filter(_.employee_id === id).flatMap(_.businessFK)
}

case class EmployeeDAO(var id: Option[Int], title: String)
object EmployeeDTO {
  import models.DAO.FirstExample.database

 val employees = TableQuery[Employees]

 def pull_object(s: EmployeeDAO) = database withSession {
    implicit session ⇒
      val tuple = EmployeeDAO.unapply(s).get
      employees returning employees.map(_.id) += (value = (None, s.title))//(EmployeeDAO.unapply(s).get._2, EmployeeDAO.unapply(s).get._3)
  }

  def pull(id: Option[Int] = None, title: String) = Try(database withSession {
    implicit session ⇒

      employees += (id, title)
  }).isSuccess

  def get(k: Int) = database withSession {
    implicit session ⇒
      val q3 = for { s ← employees if s.id === k } yield s <> (EmployeeDAO.tupled, EmployeeDAO.unapply _)
      println(q3.selectStatement)
      println(q3.list)
      q3.list.head //.map(Supplier.tupled(_))
  }
  /**
   * Update a employee
   * @param id
   * @param employee
   */
  def update(id: Int, employee: EmployeeDAO) = database withSession { implicit session ⇒
    val bpToUpdate: EmployeeDAO = employee.copy(Option(id))
    employees.where(_.id === id).update(EmployeeDAO.unapply(bpToUpdate).get)
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
      val q3 = for { s ← employees } yield s <> (EmployeeDAO.tupled, EmployeeDAO.unapply _)
      q3.list.sortBy(_.id)
    //suppliers foreach {
    //  case (id, title, address, city, state, zip) ⇒
    //    Supplier(id, title, address, city, state, zip)
    //}
  }


}





 
