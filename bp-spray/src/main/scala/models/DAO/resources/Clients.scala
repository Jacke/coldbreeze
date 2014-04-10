package models.DAO.resources

import models.DAO.driver.MyPostgresDriver.simple._

class Clients(tag: Tag) extends Table[(Option[Int], String)](tag, "clients") {
  def id = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def title = column[String]("title")



  def * = (id.?, title) //<> (Supplier.tupled, Supplier.unapply)

  def cb = ClientBusinessDAO.clients_businesses.filter(_.client_id === id).flatMap(_.businessFK)

}

case class ClientDTO(var id: Option[Int], title: String)

object ClientDAO {
  import models.DAO.FirstExample.database

  val clients = TableQuery[Clients]




  def pull_object(s: BusinessDTO) = database withSession {
    implicit session ⇒
      val tuple = BusinessDTO.unapply(s).get
      clients returning clients.map(_.id) += (value = (None, s.title))//(BusinessDTO.unapply(s).get._2, BusinessDTO.unapply(s).get._3)
  }

  def pull(id: Option[Int] = None, title: String) = Try(database withSession {
    implicit session ⇒

      clients += (id, title)
  }).isSuccess

  def get(k: Int) = database withSession {
    implicit session ⇒
      val q3 = for { s ← clients if s.id === k } yield s <> (BusinessDTO.tupled, BusinessDTO.unapply _)
      println(q3.selectStatement)
      println(q3.list)
      q3.list.head //.map(Supplier.tupled(_))
  }
  /**
   * Update a client
   * @param id
   * @param client
   */
  def update(id: Int, client: BusinessDTO) = database withSession { implicit session ⇒
    val bpToUpdate: BusinessDTO = client.copy(Option(id))
    clients.where(_.id === id).update(BusinessDTO.unapply(bpToUpdate).get)
  }
  /**
   * Delete a client
   * @param id
   */
  def delete(id: Int) = database withSession { implicit session ⇒

    clients.where(_.id === id).delete
  }
  /**
   * Count all clients
   */
  def count: Int = database withSession { implicit session ⇒
    Query(clients.length).first
  }



  def getAll = database withSession {
    implicit session ⇒
      val q3 = for { s ← clients } yield s <> (BusinessDTO.tupled, BusinessDTO.unapply _)
      q3.list.sortBy(_.id)
    //suppliers foreach {
    //  case (id, title, address, city, state, zip) ⇒
    //    Supplier(id, title, address, city, state, zip)
    //}
  }

}


