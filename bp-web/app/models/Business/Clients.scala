package models.DAO.resources

import scala.slick.driver.PostgresDriver.simple._
import models.DAO.conversion.DatabaseCred

class Clients(tag: Tag) extends Table[(Option[Int], String)](tag, "clients") {
  def id = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def uid = column[String]("uid")



  def * = (id.?, uid) //<> (Supplier.tupled, Supplier.unapply)

  def cb = ClientBusinessDAO.clients_businesses.filter(_.client_id === id).flatMap(_.businessFK)


}

case class ClientDTO(var id: Option[Int], uid: String)

object ClientDAO {
  import scala.util.Try
  import DatabaseCred.database

  val clients = TableQuery[Clients]




  def pull_object(s: ClientDTO) = database withSession {
    implicit session ⇒
      val tuple = ClientDTO.unapply(s).get
      clients returning clients.map(_.id) += (value = (None, s.uid))//(BusinessDTO.unapply(s).get._2, BusinessDTO.unapply(s).get._3)
  }

  def pull(id: Option[Int] = None, uid: String) = Try(database withSession {
    implicit session ⇒

      clients += (id, uid)
  }).isSuccess

  def get(k: Int) = database withSession {
    implicit session ⇒
      val q3 = for { s ← clients if s.id === k } yield s <> (ClientDTO.tupled, ClientDTO.unapply _)
      println(q3.selectStatement)
      println(q3.list)
      q3.list.headOption //.map(Supplier.tupled(_))
  }

 
  /**
   * Update a client
   * @param id
   * @param client
   */
  def update(id: Int, client: ClientDTO) = database withSession { implicit session ⇒
    val bpToUpdate: ClientDTO = client.copy(Option(id))
    clients.filter(_.id === id).update(ClientDTO.unapply(bpToUpdate).get)
  }
  /**
   * Delete a client
   * @param id
   */
  def delete(id: Int) = database withSession { implicit session ⇒

    clients.filter(_.id === id).delete
  }
  /**
   * Count all clients
   */
  def count: Int = database withSession { implicit session ⇒
    Query(clients.length).first
  }



  def getAll = database withSession {
    implicit session ⇒
      val q3 = for { s ← clients } yield s <> (ClientDTO.tupled, ClientDTO.unapply _)
      q3.list.sortBy(_.id)
    //suppliers foreach {
    //  case (id, uid, address, city, state, zip) ⇒
    //    Supplier(id, uid, address, city, state, zip)
    //}
  }

  def ddl_create = {
    database withSession {
      implicit session =>
      clients.ddl.create
    }
  }

}


