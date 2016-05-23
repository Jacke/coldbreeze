package models.DAO.resources.web

import slick.driver.PostgresDriver.api._
import models.DAO.conversion.DatabaseCred
import com.github.nscala_time.time.Imports._
import com.github.tototoshi.slick.PostgresJodaSupport._

import com.github.nscala_time.time.Imports._

case class BizFormDTO(title: String, phone: Option[String] = None, website: Option[String] = None, country: String, city: String, address: Option[String], nickname: Option[String] = None)

class Businesses(tag: Tag) extends Table[BusinessDTO](tag, "businesses") {
  def id      = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def title   = column[String]("title")
  def phone   = column[Option[String]]("phone")
  def website = column[Option[String]]("website")
  def country = column[String]("country")
  def city    = column[String]("city")
  def address = column[Option[String]]("address")
  def nickname= column[Option[String]]("nickname", O.Default(None))

  def walkthrough = column[Boolean]("walkthrough")
  def organization         = column[Boolean]("org", O.Default(false))

  def created_at = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at = column[Option[org.joda.time.DateTime]]("updated_at")


  def * = (id.?, title, phone, website, country, city, address, nickname, walkthrough,
           created_at, updated_at, organization) <> (BusinessDTO.tupled, BusinessDTO.unapply)

}

/*
  Case class
 */
case class BusinessDTO(var id: Option[Int],
  title: String,
  phone: Option[String] = None,
  website: Option[String] = None,
  country: String,
  city: String,
  address: Option[String],
  nickname: Option[String] = None,
  walkthrough: Boolean = false,
  created_at:Option[org.joda.time.DateTime] = None,
  updated_at:Option[org.joda.time.DateTime] = None,
  organization: Boolean = false)





object BusinessDAOF {
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
  val businesses = BusinessDAO.businesses

  //private def filterQueryByProcess(process: Int): Query[ProcessHistoriesF, ProcessHistoryDTO, Seq] =
  //  bpsessions.filter(_.process === process)
  private def filterQuery(id: Int): Query[Businesses, BusinessDTO, Seq] =
    businesses.filter(_.id === id)

  def get(id: Int):Future[Option[BusinessDTO]] = {
     db.run(filterQuery(id).result.headOption)
  }




} // Future Impl




object BusinessDAO {
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
  val businesses = TableQuery[Businesses]

  //private def filterQueryByProcess(process: Int): Query[ProcessHistoriesF, ProcessHistoryDTO, Seq] =
  //  bpsessions.filter(_.process === process)
  private def filterQuery(id: Int): Query[Businesses, BusinessDTO, Seq] =
    businesses.filter(_.id === id)

  private def filterQueryNickName(nickname: String): Query[Businesses, BusinessDTO, Seq] =
    businesses.filter(_.nickname === nickname)
  private def filterQuerys(ids: List[Int]): Query[Businesses, BusinessDTO, Seq] =
    businesses.filter(_.id inSetBind ids)

  def pull_object(s: BusinessDTO) =   {
      await(db.run( businesses returning businesses.map(_.id) += s ))
  }

  def get(k: Int):Option[BusinessDTO] =   {
        await(db.run (filterQuery(k).result.headOption))
  }

  def getByIDS(k: List[Int]):List[BusinessDTO] =   {
      await(db.run(filterQuerys(k).result)).toList
  }
  def getAll:List[BusinessDTO] =   {
      await(db.run (businesses.result)).toList
  }

  def update(id: Int, business: BusinessDTO) =   {
    val bpToUpdate: BusinessDTO = business.copy(Option(id))
    await(db.run( businesses.filter(_.id === id).update(bpToUpdate) ))
  }


  def updateCredentials(id: Int, cred: BizFormDTO) =   {
    val result = get(id)
      result match {
        case Some(origin) => {
         val toUpdate = origin.copy(title = cred.title,
           phone = cred.phone, website = cred.website,
           country = cred.country, city = cred.city,
           address = cred.address, nickname = cred.nickname)

           await(db.run( businesses.filter(_.id === id).update(toUpdate) ))
           true
        }
        case _ => false
      }

  }


  def delete(id: Int) =   {
    await(db.run( businesses.filter(_.id === id).delete ))
  }


  val create: DBIO[Unit] = businesses.schema.create
  val drop: DBIO[Unit] = businesses.schema.drop
  def ddl_create = db.run(create)
  def ddl_drop = db.run(drop)

}
