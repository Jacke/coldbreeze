package models.DAO

import slick.driver.PostgresDriver.api._
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
  import scala.util.Try
  import DatabaseCred.database



  val billing_infos = TableQuery[BillingInfos]
 

  def push(s: BillingInfoDTO) = database withSession {
    implicit session=>
    getByBusiness(s.business) match {
     case Some(info) => update(info.id.get, s.copy(id = info.id, created_at = info.created_at))
     case _ => pull_object(s)
    }

  }

  def pull_object(s: BillingInfoDTO) = database withSession {
    implicit session ⇒
      billing_infos returning billing_infos.map(_.id) += s
  }
  def get(k: Int) = database withSession {
    implicit session ⇒
      val q3 = for { s ← billing_infos if s.id === k } yield s 
      q3.list.headOption
  }
  def getByBusiness(business: Int) = database withSession {
    implicit session ⇒
      val q3 = for { s ← billing_infos if s.business === business } yield s 
      q3.list.headOption
  }

  def update(id: Int, code: BillingInfoDTO) = database withSession { implicit session ⇒
    val codeToUpdate: BillingInfoDTO = code.copy(Option(id))
    billing_infos.filter(_.id === id).update(codeToUpdate)
  } 

  def delete(id: Int) = database withSession { implicit session ⇒

    billing_infos.filter(_.id === id).delete
  }
  def count: Int = database withSession { implicit session ⇒
    Query(billing_infos.length).first
  }



  def getAll = database withSession {
    implicit session ⇒
      val q3 = for { s ← billing_infos } yield s 
      q3.list.sortBy(_.id)

  }

   def ddl_create = {
    database withSession {
      implicit session =>
      billing_infos.ddl.create
    }
  }
  def ddl_drop = {
    database withSession {
      implicit session =>
        billing_infos.ddl.drop
    }
  }
}
