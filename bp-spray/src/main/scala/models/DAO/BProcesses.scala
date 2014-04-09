package models.DAO


import scala.slick.driver.PostgresDriver.simple._



/**
 * BProcess Scheme
 */
class BProcesses(tag: Tag) extends Table[(Option[Int], String, Int)](tag, "bprocesses") {
  def id = column[Int]("id", O.PrimaryKey, O.AutoInc) // This is the primary key column
  def title = column[String]("title")
  def business = column[Int]("business_id")
  // Every table needs a * projection with the same type as the table's type parameter
  def * = (id.?, title, business) //<> (Supplier.tupled, Supplier.unapply)

}


/*
  Case class
 */
case class BProcessDTO(var id: Option[Int], title: String, business: Int)
//case class BProcessesDTO(suppliers: List[BProcess])

object BPDTO {
  /**
   * Actions
   */
  import scala.util.Try
  import scala.slick.driver.PostgresDriver.simple._
  import models.DAO.FirstExample.database


  val bprocesses = TableQuery[BProcesses]

  def pull_object(s: BProcessDTO) = database withSession {
    implicit session ⇒
      val tuple = BProcessDTO.unapply(s).get
      bprocesses returning bprocesses.map(_.id) += (value = (None, s.title, s.business))//(BProcessDTO.unapply(s).get._2, BProcessDTO.unapply(s).get._3)
  }

  def pull(id: Option[Int] = None, title: String, business: Int) = Try(database withSession {
    implicit session ⇒

      bprocesses += (id, title, business)
  }).isSuccess

  def get(k: Int) = database withSession {
    implicit session ⇒
      val q3 = for { s ← bprocesses if s.id === k } yield s <> (BProcessDTO.tupled, BProcessDTO.unapply _)
      println(q3.selectStatement)
      println(q3.list)
      q3.list.head //.map(Supplier.tupled(_))
  }
  /**
   * Update a bprocess
   * @param id
   * @param bprocess
   */
  def update(id: Int, bprocess: BProcessDTO) = database withSession { implicit session ⇒
    val bpToUpdate: BProcessDTO = bprocess.copy(Option(id))
    bprocesses.where(_.id === id).update(BProcessDTO.unapply(bpToUpdate).get)
  }
  /**
   * Delete a bprocess
   * @param id
   */
  def delete(id: Int) = database withSession { implicit session ⇒

    bprocesses.where(_.id === id).delete
  }
  /**
   * Count all bprocesses
   */
  def count: Int = database withSession { implicit session ⇒
    Query(bprocesses.length).first
  }



  def getAll = database withSession {
    implicit session ⇒
      val q3 = for { s ← bprocesses if s.business === 1} yield s <> (BProcessDTO.tupled, BProcessDTO.unapply _)
      q3.list.sortBy(_.id)
    //suppliers foreach {
    //  case (id, title, address, city, state, zip) ⇒
    //    Supplier(id, title, address, city, state, zip)
    //}
  }
}