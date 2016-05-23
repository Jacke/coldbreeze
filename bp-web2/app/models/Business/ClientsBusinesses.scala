package models.DAO.resources


import slick.driver.PostgresDriver.api._
import com.github.nscala_time.time.Imports._
import com.github.tototoshi.slick.PostgresJodaSupport._
import slick.model.ForeignKeyAction

import models.DAO.resources.BusinessDTO._
import models.DAO.resources.ClientDAO._
import models.DAO.conversion.DatabaseCred


class ClientsBusinesses(tag: Tag) extends Table[(Int, Int)](tag, "clients_businesses") {
  def client_id   = column[Int]("client_id")
  def business_id = column[Int]("business_id")

  def clientFK   = foreignKey("cl_biz_client_fk", client_id, clients)(_.id, onDelete = ForeignKeyAction.Cascade)
  def businessFK = foreignKey("cl_biz_business_fk", business_id, models.DAO.resources.BusinessDAO.businesses)(_.id, onDelete = ForeignKeyAction.Cascade)

  def * = (client_id, business_id)

}


object ClientBusinessDAO {
  import akka.actor.ActorSystem
  import slick.backend.{StaticDatabaseConfig, DatabaseConfig}
  //import slick.driver.JdbcProfile
  import slick.driver.PostgresDriver.api._
  import slick.jdbc.meta.MTable
  import scala.concurrent.ExecutionContext.Implicits.global
  import com.github.tototoshi.slick.PostgresJodaSupport._
  import scala.concurrent.duration.Duration
  import scala.concurrent.{ExecutionContext, Awaitable, Await, Future}
  import scala.util.Try
  import models.DAO.conversion.DatabaseFuture._

  //import dbConfig.driver.api._ //
  def await[T](a: Awaitable[T])(implicit ec: ExecutionContext) = Await.result(a, Duration.Inf)
  def awaitAndPrint[T](a: Awaitable[T])(implicit ec: ExecutionContext) = println(await(a))

  val clients_businesses = TableQuery[ClientsBusinesses]


  def addAsClient(uid: String, business_id: Int) =   {
    val client_id = ClientDAO.pull_new_object(ClientDTO(None, uid))
    //client_id match {
    //  case Some(id) => pull_new(id, business_id)
    //  case _ => false
    //}
  }


  def pull_new(client_id: Int, business_id: Int) = Try(  {
      if (!getByBusinessAndClient(client_id, business_id).isDefined) {
        await(db.run( clients_businesses += (client_id, business_id) ))
      } else {
        false
      }
  }).isSuccess


  def pull(client_id: Int, business_id: Int) = Try(  {
      await(db.run( clients_businesses += (client_id, business_id) ))
  }).isSuccess


  def getByBusinessAndClient(client: Int, k: Int) =   {
      val q3 = for { s ← clients_businesses if s.business_id === k && s.client_id === client } yield s
      await(db.run(q3.result.headOption))
  }

  def getByBusiness(k: Int) =   {
      val q3 = for { s ← clients_businesses if s.business_id === k } yield s
      await(db.run(q3.result)).toList
  }
  def deleteByClientAndBusiness(client_id: Int, business_id: Int) =   {
    await(db.run( clients_businesses.filter(em => em.client_id === client_id && em.business_id === business_id).delete ))
  }
  def deleteByClient(client_id: Int) =   {
    await(db.run( clients_businesses.filter(_.client_id === client_id).delete ))
  }


  val create: DBIO[Unit] = clients_businesses.schema.create
  val drop: DBIO[Unit] = clients_businesses.schema.drop

  def ddl_create = db.run(create)
  def ddl_drop = db.run(drop)


}
