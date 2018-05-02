package models.DAO.resources

import slick.driver.PostgresDriver.api._
import com.github.nscala_time.time.Imports._
import com.github.tototoshi.slick.PostgresJodaSupport._
import slick.model.ForeignKeyAction
//import slick.driver.PostgresDriver.api._
import models.DAO.conversion.DatabaseCred

class Plans(tag: Tag) extends Table[PlanDTO](tag, "plans") {
  def id    = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def title = column[String]("title")
  def price = column[BigDecimal]("price")
  def description = column[Option[String]]("description")
  def slot_included = column[Int]("slot_included", O.Default(5))
  def order = column[Int]("order", O.Default(1))
  def hidden = column[Boolean]("hidden", O.Default(false))

  def * = (id.?, title, price, description, slot_included, order, hidden) <> (PlanDTO.tupled, PlanDTO.unapply)

}

/*
  Case class
 */
case class PlanDTO(var id: Option[Int],
                    title: String,
                    price: BigDecimal,
                    description:Option[String] = None,
                    slotIncluded: Int=5,
                    order: Int = 1,
                    hidden: Boolean = false)

object PlanDAOF {
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
  val plans = PlanDAO.plans

  private def filterQuery(id: Int): Query[Plans, PlanDTO, Seq] =
    plans.filter(_.id === id)
  def get(id: Int):Future[Option[PlanDTO]] = {
     db.run(filterQuery(id).result.headOption)
  }
}



object PlanDAO {
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

  val plans = TableQuery[Plans]

  def pull_object(s: PlanDTO) =   {

      await(db.run( plans returning plans.map(_.id) += s ))
  }
  def get(k: Int) =   {
      val q3 = for { s ← plans if s.id === k } yield s
      await(db.run(q3.result.headOption))
  }

  def getAll =   {
      await(db.run(plans.result)).toList
  }
    /**
   * Update a business service
   * @param id
   * @param business service
   */
  def update(id: Int, plan: PlanDTO) =   {
    val planToUpdate: PlanDTO = plan.copy(Option(id))
    await(db.run( plans.filter(_.id === id).update(planToUpdate) ))
  }

  /**
   * Delete a business service
   * @param id
   */
  def delete(id: Int) =   {
    await(db.run( plans.filter(_.id === id).delete ))
  }

  val create: DBIO[Unit] = plans.schema.create
  val drop: DBIO[Unit] = plans.schema.drop

  def ddl_create = db.run(create)
  def ddl_drop = db.run(drop)
}
