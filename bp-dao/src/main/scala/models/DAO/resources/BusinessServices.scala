package models.DAO.resources

import slick.driver.PostgresDriver.api._
import com.github.nscala_time.time.Imports._
import com.github.tototoshi.slick.PostgresJodaSupport._

import slick.model.ForeignKeyAction
//import slick.driver.PostgresDriver.api._
import models.DAO.conversion.DatabaseCred

class BusinessServices(tag: Tag) extends Table[BusinessServiceDTO](tag, "business_services") {
  def id          = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def title       = column[String]("title")
  def business_id = column[Int]("business_id")
  def master_acc  = column[String]("master_acc")

  //def accFK = foreignKey("macc_fk", master_acc, models.AccountsDAO.accounts)(_.userId, onDelete = ForeignKeyAction.Cascade)
  def business = foreignKey("biz_serv_buss_fk", business_id, models.DAO.resources.BusinessDAO.businesses)(_.id)

  def * = (id.?, title, business_id, master_acc) <> (BusinessServiceDTO.tupled, BusinessServiceDTO.unapply)

}

/*
  Case class
 */
case class BusinessServiceDTO(var id: Option[Int], title: String, business_id: Int, master_acc:String = "")

object BusinessServiceDAOF {
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
  
  val business_services = TableQuery[BusinessServices]

  private def filterQuery(id: Int): Query[BusinessServices, BusinessServiceDTO, Seq] =
    business_services.filter(_.id === id)
  private def filterByBusinessQuery(k: Int): Query[BusinessServices, BusinessServiceDTO, Seq] =
    for { s ← business_services
          b <- s.business if b.id === k } yield s

  def getAllByBusiness(k: Int):Future[Seq[BusinessServiceDTO]] = {
      db.run(filterByBusinessQuery(k).result)
  }

}

object BusinessServiceDAO {
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
  
  val business_services = TableQuery[BusinessServices]

  private def filterQuery(id: Int): Query[BusinessServices, BusinessServiceDTO, Seq] =
    business_services.filter(_.id === id)
  private def filterByBusinessQuery(k: Int): Query[BusinessServices, BusinessServiceDTO, Seq] =
    for { s ← business_services
          b <- s.business if b.id === k } yield s
  private def filterBusinessesQuery(k: Int) =
    for { s ← business_services
          b <- s.business if b.id === k } yield (s, b)

  private def filterQueryEmail(email: String): Query[BusinessServices, BusinessServiceDTO, Seq] =
      business_services.filter(_.master_acc === email)



  def pull_object(s: BusinessServiceDTO) =   {
      await(db.run( business_services returning business_services.map(_.id) += s ))
  }

  def get(k: Int) =   {
    await(db.run(filterQuery(k).result.headOption))
  }
  def getAll =   {
    await(db.run(business_services.result)).toList
  }

  def getBusiness(k: Int) =   {
      await(db.run(filterBusinessesQuery(k).result.headOption))
  }
  def getByBusiness(k: Int) =   {
    await(db.run(filterByBusinessQuery(k).result.headOption))
  }

  def getAllByBusiness(k: Int) =   {
    await(db.run(filterByBusinessQuery(k).result)).toList
  }


  def getByMaster(email: String) =   {
    await(db.run(filterQueryEmail(email).result)).toList.sortBy(_.id)
  }


  def update(id: Int, businessService: BusinessServiceDTO) =   {
    val bpToUpdate: BusinessServiceDTO = businessService.copy(Option(id))
    await(db.run( business_services.filter(_.id === id).update(bpToUpdate) ))
  }

  def delete(id: Int) =   {
    await(db.run( business_services.filter(_.id === id).delete ))
  }



  val create: DBIO[Unit] = business_services.schema.create
  val drop: DBIO[Unit] = business_services.schema.drop
  def ddl_create = db.run(create)
  def ddl_drop = db.run(drop)



}
