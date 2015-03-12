package models.DAO.resources

import scala.slick.driver.PostgresDriver.simple._
import models.DAO.conversion.DatabaseCred

class ClientObservers(tag: Tag) extends Table[ClientObserverDTO](tag, "client_observers") {
  def id = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def uid = column[String]("uid")



  def * = (id.?, uid) <> (ClientObserverDTO.tupled, ClientObserverDTO.unapply)

  def cb = ClientBusinessDAO.clients_businesses.filter(_.client_id === id).flatMap(_.businessFK)


}

case class ClientObserverDTO(var id: Option[Int], uid: String)

object ClientObserversDAO {
  import scala.util.Try
  import DatabaseCred.database

  val client_observers = TableQuery[ClientObservers]




  def pull_object(s: ClientObserverDTO) = database withSession {
    implicit session ⇒
     client_observers returning client_observers.map(_.id) += s
  }

  def get(k: Int) = database withSession {
    implicit session ⇒
      val q3 = for { s ← client_observers if s.id === k } yield s 
      q3.list.headOption
  }

 
  /**
   * Update a observer_clients
   * @param id
   * @param observer_clients
   */
  def update(id: Int, observer_clients: ClientObserverDTO) = database withSession { implicit session ⇒
    val observerClientToUpdate: ClientObserverDTO = observer_clients.copy(Option(id))
    client_observers.filter(_.id === id).update(observerClientToUpdate)
  }
  

  /**
   * Delete a observer_clients
   * @param id
   */
  def delete(id: Int) = database withSession { implicit session ⇒
    client_observers.filter(_.id === id).delete
  }


  /**
   * Count all client_observers
   */
  def count: Int = database withSession { implicit session ⇒
    Query(client_observers.length).first
  }



  def getAll = database withSession {
    implicit session ⇒
      val q3 = for { s ← client_observers } yield s 
      q3.list.sortBy(_.id)
  }

  def ddl_create = {
    database withSession {
      implicit session =>
      client_observers.ddl.create
    }
  }
  def ddl_drop = {
    database withSession {
      implicit session =>
        client_observers.ddl.drop
    }
  }

}


