package models.DAO.resources

import models.DAO.driver.MyPostgresDriver.simple._

class Businesses(tag: Tag) extends Table[(Option[Int], String)](tag, "businesses") {
  def id = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def title = column[String]("title")



  def * = (id.?, title) //<> (Supplier.tupled, Supplier.unapply)

}

object BusinessDTO {
  val businesses = TableQuery[Businesses]


}
