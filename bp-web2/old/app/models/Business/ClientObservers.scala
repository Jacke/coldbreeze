package models.DAO.resources

import slick.driver.PostgresDriver.api._
import com.github.nscala_time.time.Imports._
import com.github.tototoshi.slick.PostgresJodaSupport._
import models.DAO.conversion.DatabaseCred

class ClientObservers(tag: Tag) extends Table[ClientObserverDTO](tag, "client_observers") {
  def id  = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def uid = column[String]("uid")



  def * = (id.?, uid) <> (ClientObserverDTO.tupled, ClientObserverDTO.unapply)

  def cb = ClientBusinessDAO.clients_businesses.filter(_.client_id === id).flatMap(_.businessFK)


}

case class ClientObserverDTO(var id: Option[Int], uid: String)

object ClientObserversDAO {
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

  val client_observers = TableQuery[ClientObservers]




  def pull_object(s: ClientObserverDTO) =   {

     await(db.run( client_observers returning client_observers.map(_.id) += s ))
  }

  def get(k: Int) =   {

      val q3 = for { s ← client_observers if s.id === k } yield s
      await(db.run(q3.result.headOption))
  }


  /**
   * Update a observer_clients
   * @param id
   * @param observer_clients
   */
  def update(id: Int, observer_clients: ClientObserverDTO) =   {
    val observerClientToUpdate: ClientObserverDTO = observer_clients.copy(Option(id))
    await(db.run( client_observers.filter(_.id === id).update(observerClientToUpdate) ))
  }


  /**
   * Delete a observer_clients
   * @param id
   */
  def delete(id: Int) =   {
    await(db.run( client_observers.filter(_.id === id).delete ))
  }



  val create: DBIO[Unit] = client_observers.schema.create
  val drop: DBIO[Unit] = client_observers.schema.drop

  def ddl_create = db.run(create)
  def ddl_drop = db.run(drop)


}
