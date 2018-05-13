package models.DAO.resources

import slick.driver.PostgresDriver.api._
import com.github.nscala_time.time.Imports._
import com.github.tototoshi.slick.PostgresJodaSupport._
import models.DAO.conversion.DatabaseCred
import slick.model.ForeignKeyAction

class BusinessWalks(tag: Tag) extends Table[BusinessWalkDTO](tag, "business_walks") {
  def id          = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def business_id = column[Int]("business_id")



  def businesswalkFK = foreignKey("bwalk_business_fk", business_id, models.DAO.resources.web.BusinessDAO.businesses)(_.id, onDelete = ForeignKeyAction.Cascade)

  def * = (id.?, business_id) <> (BusinessWalkDTO.tupled, BusinessWalkDTO.unapply)

}

case class BusinessWalkDTO(var id: Option[Int], business_id: Int)

object BusinessWalksDAO {
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
  val business_walks = TableQuery[BusinessWalks]


  def pull_object(s: BusinessWalkDTO) =   {

      await(db.run( business_walks returning business_walks.map(_.id) += s ))
  }

  def get(k: Int) =   {

      val q3 = for { s ← business_walks if s.id === k } yield s
      await(db.run(q3.result.headOption))
  }

  def update(id: Int, walk: BusinessWalkDTO) =   {
    val walkToUpdate: BusinessWalkDTO = walk.copy(Option(id))
    await(db.run( business_walks.filter(_.id === id).update(walkToUpdate) ))
  }

  def delete(id: Int) =   {
    await(db.run( business_walks.filter(_.id === id).delete ))
  }



    val create: DBIO[Unit] = business_walks.schema.create
    val drop: DBIO[Unit] = business_walks.schema.drop

    def ddl_create = db.run(create)
    def ddl_drop = db.run(drop)


}
