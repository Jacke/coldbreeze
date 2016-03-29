package models.DAO.resources

import slick.driver.PostgresDriver.simple._
import slick.model.ForeignKeyAction
//import models.DAO.driver.MyPostgresDriver.simple._
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
  import akka.stream.ActorFlowMaterializer
  import akka.stream.scaladsl.Source
  import slick.backend.{StaticDatabaseConfig, DatabaseConfig}
  //import slick.driver.JdbcProfile
  import slick.driver.PostgresDriver.api._
  import slick.jdbc.meta.MTable
  import scala.concurrent.ExecutionContext.Implicits.global
  import com.github.tototoshi.slick.JdbcJodaSupport._
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
  import scala.util.Try
  import DatabaseCred.database

  val plans = TableQuery[Plans]
 
  def pull_object(s: PlanDTO) = database withSession {
    implicit session ⇒
      plans returning plans.map(_.id) += s
  }
  def get(k: Int) = database withSession {
    implicit session ⇒
      val q3 = for { s ← plans if s.id === k } yield s 
      q3.list.headOption
  }
    /**
   * Update a business service
   * @param id
   * @param business service
   */
  def update(id: Int, plan: PlanDTO) = database withSession { implicit session ⇒
    val planToUpdate: PlanDTO = plan.copy(Option(id))
    plans.filter(_.id === id).update(planToUpdate)
  } 

  /**
   * Delete a business service
   * @param id
   */
  def delete(id: Int) = database withSession { implicit session ⇒
    plans.filter(_.id === id).delete
  }
  
  /**
   * Count all business_services
   */
  def count: Int = database withSession { implicit session ⇒
    Query(plans.length).first
  }



  def getAll = database withSession {
    implicit session ⇒
      val q3 = for { s ← plans } yield s 
      q3.list.sortBy(_.id)

  }

   def ddl_create = {
    database withSession {
      implicit session =>
      plans.ddl.create
      // Add default plan
      pull_object(PlanDTO(None, "Trial", 0))
      pull_object(PlanDTO(None, "Startup", 50.0))
      pull_object(PlanDTO(None, "Company", 160.0))
    }
  }
  def ddl_drop = {
    database withSession {
      implicit session =>
        plans.ddl.drop

    }
  }
}
