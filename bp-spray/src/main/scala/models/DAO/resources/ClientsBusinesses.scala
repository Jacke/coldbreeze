package models.DAO.resources


import models.DAO.driver.MyPostgresDriver.simple._


class ClientsBusinesses(tag: Tag) extends Table[Int, Int)](tag, "clients_businesses") {
  def client_id = column[Int]("client_id")
  def business_id = column[Int]("business_id")
  
  def clientFK = foreignKey("client_fk", client_id, Clients)(_.id, onDelete = ForeignKeyAction.Cascade)
  def businessFK = foreignKey("business_fk", business_id, Businesses)(_.id, onDelete = ForeignKeyAction.Cascade)

  def * = (client_id, business_id) 

}


object ClientBusinessDAO {
  import models.DAO.FirstExample.database

  val clients_businesses = TableQuery[ClientsBusinesses]




  def pull(client_id: Int, business_id: Int) = Try(database withSession {
    implicit session ⇒

      clients_businesses += (client_id, business_id)
  }).isSuccess

  def getByBusiness(k: Int) = database withSession {
    implicit session ⇒
      val q3 = for { s ← clients_businesses if s.business_id === k } yield s
      println(q3.selectStatement)
      println(q3.list)
      q3.list 
  }

  def deleteByClient(client_id: Int) = database withSession { implicit session ⇒

    clients_businesses.where(_.id === client_id).delete
  }

  def getAll = database withSession {
    implicit session ⇒
      val q3 = for { s ← clients_businesses } yield s
      q3.list.sortBy(_.client_id)
  }

}


