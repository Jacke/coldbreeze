package models.DAO

import models.DAO.driver.MyPostgresDriver.simple._
import scala.slick.model.ForeignKeyAction
import models.DAO.conversion.DatabaseCred

class BPLinks(tag: Tag) extends Table[(Option[Int], Int, Int)](tag, "bplinks") {
  def id = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def bprocess = column[Int]("bprocess_id")
  def proc_elem = column[Int]("proc_elem_id")



  def * = (id.?, bprocess, proc_elem) //<> (Supplier.tupled, Supplier.unapply)

  def bpFK = foreignKey("bprocess_fk", bprocess, models.DAO.BPDAO.bprocesses)(_.id, onDelete = ForeignKeyAction.Cascade)
  def peFK = foreignKey("proc_elem_fk", bprocess, models.DAO.ProcElemDAO.proc_elements)(_.id, onDelete = ForeignKeyAction.Cascade)


}

/*
  Case class
 */
case class BPLinkDTO(var id: Option[Int], bprocess: Int, proc_elem: Int)


/*
  Data conversion
 */
object BPLinkDCO {

  /** *
    * (BPLinkDTO):BPLink = ((BPLinkDTO.elem1, BPLinkDTO.elem2) -> BProcess.variety.find(_.order, _.space))
    * BPLink(ProcElem, ProcElem) -> BProcess LinkContainer
    */
}

object BPLinkDAO {
  import scala.util.Try
  import DatabaseCred.database

  val bplinks = TableQuery[BPLinks]




  def pull_object(s: BPLinkDTO) = database withSession {
    implicit session ⇒

     bplinks returning bplinks.map(_.id) += (value = (None, s.bprocess, s.proc_elem))
     //(BusinessDTO.unapply(s).get._2, BusinessDTO.unapply(s).get._3)
  }

  def pull(id: Option[Int] = None, bprocess: Int, proc_elem: Int) = Try(database withSession {
    implicit session ⇒

      bplinks += (id, bprocess, proc_elem)
  }).isSuccess

  def get(k: Int) = database withSession {
    implicit session ⇒
      val q3 = for { s ← bplinks if s.id === k } yield s <> (BPLinkDTO.tupled, BPLinkDTO.unapply _)
      println(q3.selectStatement)
      println(q3.list)
      q3.list.headOption //.map(Supplier.tupled(_))
  }


  /**
   * Update a bplink
   * @param id
   * @param bplink
   */
  def update(id: Int, bplink: BPLinkDTO) = database withSession { implicit session ⇒
    val bplinkToUpdate: BPLinkDTO = bplink.copy(Option(id))
    bplinks.where(_.id === id).update(BPLinkDTO.unapply(bplinkToUpdate).get)
  }

  /**
   * Delete a bplink
   * @param id
   */
  def delete(id: Int) = database withSession { implicit session ⇒

    bplinks.where(_.id === id).delete
  }
  /**
   * Count all bplinks
   */
  def count: Int = database withSession { implicit session ⇒
    Query(bplinks.length).first
  }



  def ddl_create = {
    database withSession {
      implicit session =>
        bplinks.ddl.create
    }
  }

}


