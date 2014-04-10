package models.DAO.resources


import models.DAO.driver.MyPostgresDriver.simple._


class EmployeesBusinesses(tag: Tag) extends Table[Int, Int)](tag, "employees_businesses") {
  def employee_id = column[Int]("employee_id")
  def business_id = column[Int]("business_id")
  
  def employeeFK = foreignKey("employee_fk", employee_id, Employees)(_.id, onDelete = ForeignKeyAction.Cascade)
  def businessFK = foreignKey("business_fk", business_id, Businesses)(_.id, onDelete = ForeignKeyAction.Cascade)

  def * = (employee_id, business_id) //<> (Supplier.tupled, Supplier.unapply)

}


object EmployeesBusinessDAO {
  import models.DAO.FirstExample.database

  val employees_businesses = TableQuery[EmployeesBusinesses]

  def pull(employee_id: Int, business_id: Int) = Try(database withSession {
    implicit session ⇒

      employees_businesses += (employee_id, business_id)
  }).isSuccess

  def getByBusiness(k: Int) = database withSession {
    implicit session ⇒
      val q3 = for { s ← employees_businesses if s.business_id === k } yield s 
      println(q3.selectStatement)
      println(q3.list)
      q3.list 
  }

  def deleteByEmployee(employee_id: Int) = database withSession { implicit session ⇒

    employees_businesses.where(_.id === employee_id).delete
  }

  def getAll = database withSession {
    implicit session ⇒
      val q3 = for { s ← employees_businesses } yield s 
      q3.list.sortBy(_.employee_id)
  }

}