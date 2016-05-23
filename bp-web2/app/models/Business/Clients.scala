package models.DAO.resources

import slick.driver.PostgresDriver.api._
import com.github.nscala_time.time.Imports._
import com.github.tototoshi.slick.PostgresJodaSupport._
import models.DAO.conversion.DatabaseCred

class Clients(tag: Tag) extends Table[(Option[Int], String)](tag, "clients") {
  def id  = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def uid = column[String]("uid")



  def * = (id.?, uid) //<> (Supplier.tupled, Supplier.unapply)

  def cb = ClientBusinessDAO.clients_businesses.filter(_.client_id === id).flatMap(_.businessFK)


}

case class ClientDTO(var id: Option[Int], uid: String)

object ClientDAO {
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

  val clients = TableQuery[Clients]



  def pull_new_object(s: ClientDTO) =   {
      val tuple = ClientDTO.unapply(s).get
      await(db.run( clients returning clients.map(_.id) += (value = (None, s.uid)) ))
  }

  def pull_object(s: ClientDTO) =   {
      val tuple = ClientDTO.unapply(s).get
      await(db.run( clients returning clients.map(_.id) += (value = (None, s.uid)) ))
  }

  def pull(id: Option[Int] = None, uid: String) = Try(  {
      await(db.run( clients += (id, uid) ))
  }).isSuccess

  def get(k: Int) =   {
      val q3 = for { s ← clients if s.id === k } yield s <> (ClientDTO.tupled, ClientDTO.unapply _)
      await(db.run(q3.result.headOption)) //.map(Supplier.tupled(_))
  }
  def getByUID(uid: String) =   {
      val q3 = for { s ← clients if s.uid === uid } yield s <> (ClientDTO.tupled, ClientDTO.unapply _)
      await(db.run(q3.result.headOption)) //.map(Supplier.tupled(_))
  }

  /**
   * Update a client
   * @param id
   * @param client
   */
  def update(id: Int, client: ClientDTO) =   {
    val bpToUpdate: ClientDTO = client.copy(Option(id))
    await(db.run( clients.filter(_.id === id).update(ClientDTO.unapply(bpToUpdate).get) ))
  }
  /**
   * Delete a client
   * @param id
   */
  def delete(id: Int) =   {
    await(db.run( clients.filter(_.id === id).delete  ))
  }



    val create: DBIO[Unit] = clients.schema.create
    val drop: DBIO[Unit] = clients.schema.drop

    def ddl_create = db.run(create)
    def ddl_drop = db.run(drop)

}
