package models.DAO.resources


import slick.driver.PostgresDriver.simple._
import slick.model.ForeignKeyAction

import models.DAO.resources.BusinessDTO._
import models.DAO.resources.ClientDAO._
import models.DAO.conversion.DatabaseCred


class ClientsBusinesses(tag: Tag) extends Table[(Int, Int)](tag, "clients_businesses") {
  def client_id = column[Int]("client_id")
  def business_id = column[Int]("business_id")
  
  def clientFK = foreignKey("client_fk", client_id, clients)(_.id, onDelete = ForeignKeyAction.Cascade)
  def businessFK = foreignKey("business_fk", business_id, models.DAO.resources.BusinessDAO.businesses)(_.id, onDelete = ForeignKeyAction.Cascade)

  def * = (client_id, business_id) 

}


object ClientBusinessDAO {
  import scala.util.Try
  import DatabaseCred.database

  val clients_businesses = TableQuery[ClientsBusinesses]


  def addAsClient(uid: String, business_id: Int) = database withSession { implicit session =>
    val client_id = ClientDAO.pull_new_object(ClientDTO(None, uid))
    client_id match {
      case Some(id) => pull_new(id, business_id)
      case _ => false
    }
  }


  def pull_new(client_id: Int, business_id: Int) = Try(database withSession {
    implicit session ⇒
      if (!getByBusinessAndClient(client_id, business_id).isDefined) {
        clients_businesses += (client_id, business_id)
      } else {
        false
      }
  }).isSuccess


  def pull(client_id: Int, business_id: Int) = Try(database withSession {
    implicit session ⇒

      clients_businesses += (client_id, business_id)
  }).isSuccess


  def getByBusinessAndClient(client: Int, k: Int) = database withSession {
    implicit session ⇒
      val q3 = for { s ← clients_businesses if s.business_id === k && s.client_id === client } yield s
      println(q3.selectStatement)
      println(q3.list)
      q3.list.headOption 
  }

  def getByBusiness(k: Int) = database withSession {
    implicit session ⇒
      val q3 = for { s ← clients_businesses if s.business_id === k } yield s
      println(q3.selectStatement)
      println(q3.list)
      q3.list 
  }
  def deleteByClientAndBusiness(client_id: Int, business_id: Int) = database withSession { implicit session ⇒
    clients_businesses.filter(em => em.client_id === client_id && em.business_id === business_id).delete
  }
  def deleteByClient(client_id: Int) = database withSession { implicit session ⇒

    clients_businesses.filter(_.client_id === client_id).delete
  }

  def getAll = database withSession {
    implicit session ⇒
      val q3 = for { s ← clients_businesses } yield s
      q3.list.sortBy(_._1) // client_id
  }

  def ddl_create = {
    database withSession {
      implicit session =>
      clients_businesses.ddl.create
    }
  }
}


