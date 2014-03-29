package models.DAO.resources

import models.DAO.driver.MyPostgresDriver.simple._

class Employees(tag: Tag) extends Table[(Option[Int], String)](tag, "employees") {
  def id = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def title = column[String]("title")



  def * = (id.?, title) //<> (Supplier.tupled, Supplier.unapply)

}

object BusinessDTO {
  val employees = TableQuery[Employees]


}
