package models.DAO

import models.DAO.driver.MyPostgresDriver.simple._

class BPSpaces(tag: Tag) extends Table[(Option[Int], Int, Int, Int)](tag, "bpspaces") {
  def id = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def process = column[Int]("process_id")

  def index   = column[Int]("index")
  def brick_owner     = column[Int]("brick_owner")



  def * = (id.?, process, index, brick_owner) //<> (Supplier.tupled, Supplier.unapply)

}

object BPSpaceDTO {
  val bpspaces = TableQuery[BPSpaces]


}
