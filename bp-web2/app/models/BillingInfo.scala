package models.DAO

import slick.driver.PostgresDriver.api._
import com.github.nscala_time.time.Imports._
import com.github.tototoshi.slick.PostgresJodaSupport._
import com.github.tminglei.slickpg.composite._
import models.DAO.conversion.{DatabaseCred, Implicits}
import slick.model.ForeignKeyAction
import org.joda.time.DateTime

class BillingInfos(tag: Tag) extends Table[BillingInfoDTO](tag, "billing_infos") {
  def id        = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def business  = column[Int]("business_id")
  def firstName = column[String]("firstname")
  def lastName  = column[String]("lastname")
  def address   = column[String]("address")
  def zipcode   = column[String]("zipcode")

  def created_at = column[org.joda.time.DateTime]("created_at")
  def updated_at = column[org.joda.time.DateTime]("updated_at")
  def bizzFK = foreignKey("bill_info_biz_fk", business,models.DAO.resources.web.BusinessDAO.businesses)(_.id, onDelete = ForeignKeyAction.Cascade)

  def * = (id.?, business, firstName, lastName, address, zipcode, created_at, updated_at) <> (BillingInfoDTO.tupled, BillingInfoDTO.unapply)
}

/*
  Case class
 */
case class BillingInfoDTO(var id: Option[Int] = None,
business:Int=0,
firstName:String,
lastName:String,
address:String,
zipcode:String,
created_at: org.joda.time.DateTime,
updated_at: org.joda.time.DateTime)


object BillingInfosDAO {
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

  val billing_infos = TableQuery[BillingInfos]


  def push(s: BillingInfoDTO) =   {
    getByBusiness(s.business) match {
     case Some(info) => update(info.id.get, s.copy(id = info.id, created_at = info.created_at))
     case _ => pull_object(s)
    }

  }

  def pull_object(s: BillingInfoDTO) =   {
      await(db.run(  billing_infos returning billing_infos.map(_.id) += s ))
  }
  
  def get(k: Int) =   {
      val q3 = for { s ← billing_infos if s.id === k } yield s
      await(db.run(q3.result.headOption))
  }

  def getByBusiness(business: Int) =   {
      val q3 = for { s ← billing_infos if s.business === business } yield s
      await(db.run(q3.result.headOption))
  }

  def update(id: Int, code: BillingInfoDTO) =   {
    val codeToUpdate: BillingInfoDTO = code.copy(Option(id))
    await(db.run(  billing_infos.filter(_.id === id).update(codeToUpdate) ))
  }

  def delete(id: Int) =   {
    await(db.run(  billing_infos.filter(_.id === id).delete ))
  }


    val create: DBIO[Unit] = billing_infos.schema.create
    val drop: DBIO[Unit] = billing_infos.schema.drop

    def ddl_create = db.run(create)
    def ddl_drop = db.run(drop)

}
