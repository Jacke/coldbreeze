package models.DAO.resources


import slick.driver.PostgresDriver.simple._
import slick.model.ForeignKeyAction
import models.DAO.resources.BusinessDTO._
import models.DAO.resources.EmployeeDAO._
import models.DAO.conversion.DatabaseCred

class EmployeesBusinesses(tag: Tag) extends Table[(Int, Int)](tag, "employees_businesses") {
  def employee_id = column[Int]("employee_id")
  def business_id = column[Int]("business_id")
  
  def employeeFK = foreignKey("emp_biz_employee_fk", employee_id, models.DAO.resources.EmployeeDAO.employees)(_.id, onDelete = ForeignKeyAction.Cascade)
  def businessFK = foreignKey("emp_biz_business_fk", business_id, models.DAO.resources.BusinessDAO.businesses)(_.id, onDelete = ForeignKeyAction.Cascade)

  def * = (employee_id, business_id) //<> (Supplier.tupled, Supplier.unapply)

}


object EmployeesBusinessDAO {
  import scala.util.Try
  import DatabaseCred.database

  val employees_businesses = TableQuery[EmployeesBusinesses]

  def pull(employee_id: Int, business_id: Int) = Try(database withSession {
    implicit session ⇒

      employees_businesses += (employee_id, business_id)
  }).isSuccess



  def getByBusiness(k: Int) = database withSession {
    implicit session =>
      val q3 = for { s ← employees_businesses if s.business_id === k } yield s 
      q3.list 
  }
  def isEmployable(business_id: Int, email: String) = database withSession {
    implicit session =>
    val emp = EmployeeDAO.getByUID(email) match {
        case Some(x) => x.id.get
        case _ => 0
      }

      val q3 = for { s ← employees_businesses if s.employee_id === emp && s.business_id === business_id } yield s 
      q3.list.headOption.isDefined
  }
  def getByUID(email: String):Option[Tuple2[Int, Int]] = database withSession {
    implicit session =>
      val emp = EmployeeDAO.getByEmployeeUID(email) match {
        case Some(x) => x.id
        case _ => None
      }

      val q3 = for { s ← employees_businesses if s.employee_id === emp.getOrElse(0) } yield s 
      q3.list.headOption
  }
  def getByID(id: Int):Option[Tuple2[Int, Int]] = database withSession {
    implicit session =>
      val q3 = for { s ← employees_businesses if s.employee_id === id } yield s 
      q3.list.headOption
  }  
  def getBusinessByUID(email: String):Option[BusinessDTO] = database withSession {
    implicit session =>
    getByUID(email) match {
      case Some(tuple) => {
        BusinessDAO.get(tuple._2) 
      }
      case _ => None
    }
  }

  def deleteByEmployee(employee_id: Int) = database withSession { implicit session ⇒

    employees_businesses.filter(_.employee_id === employee_id).delete
  }
  def deleteByEmployeeAndBusiness(employee_id: Int, business_id: Int) = database withSession { implicit session ⇒
    employees_businesses.filter(em => em.employee_id === employee_id && em.business_id === business_id).delete
    //employees_businesses.filter(_.employee_id === employee_id &&& _.business_id === business_id).delete
  }

  def getAll = database withSession {
    implicit session ⇒
      val q3 = for { s ← employees_businesses } yield s 
      q3.list//.sortBy(_._1)
  }

  def ddl_create = {
    database withSession {
      implicit session =>
      employees_businesses.ddl.create
    }
  }
  def ddl_drop = {
    database withSession {
      implicit session =>
        employees_businesses.ddl.drop
    }
  }

}