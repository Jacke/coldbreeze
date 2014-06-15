package models.DAO

import models.DAO.driver.MyPostgresDriver.simple._
import scala.slick.model.ForeignKeyAction

class BPSpaces(tag: Tag) extends Table[BPSpaceDTO](tag, "bpspaces") {
  def id        = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def process   = column[Int]("process_id")
  def index     = column[Int]("index")
  def container = column[Boolean]("container", O.Default(false))
  def subbrick  = column[Boolean]("subbrick",  O.Default(false))



  def * = (id.?, process, index, container, subbrick) <> (BPSpaceDTO.tupled, BPSpaceDTO.unapply)

}
case class BPSpaceDTO(id: Option[Int], process: Int, index:Int, container:Boolean, subbrick:Boolean)

object BPSpaceDAO {
  val bpspaces = TableQuery[BPSpaces]


}
