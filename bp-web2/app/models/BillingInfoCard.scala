package models.DAO

import models.DAO.driver.MyPostgresDriver1.simple._
import com.github.tminglei.slickpg.composite._
import models.DAO.conversion.{DatabaseCred, Implicits}
import slick.model.ForeignKeyAction
import org.joda.time.DateTime

class BillingInfoCard(tag: Tag) extends Table[BillingInfoCardDTO](tag, "billing_info_cards") {
  def id        = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def billing_info = column[Int]("billing_info_id")

  def number = column[String]("number")
  def expire_month = column[String]("expire_month")
  def expire_year = column[String]("expire_year")
  def first_name = column[String]("first_name")
  def last_name = column[String]("last_name")
  def cvv2 = column[Option[String]]("cvv2")
  def created_at = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at = column[Option[org.joda.time.DateTime]]("updated_at")

  def bizzFK = foreignKey("bill_info_card_bill_fk", billing_info,BillingInfosDAO.billing_infos)(_.id, onDelete = ForeignKeyAction.Cascade)


  def * = (id.?, billing_info, number,expire_month,expire_year,first_name,last_name,cvv2, created_at, updated_at) <> (BillingInfoCardDTO.tupled, BillingInfoCardDTO.unapply)
}
/*case class Address(line1: String,
                   line2: Option[String] = None,
                   city: String,
                   country_code: String,
                   postal_code: Option[String],
                   state: String,
                   phone: Option[String] = None)*/
case class BillingInfoCardDTO(var id: Option[Int] = None,
				      billing_info: Int,
                      number: String,
                      expire_month: String,
                      expire_year: String,
                      first_name: String,
                      last_name: String,
                      cvv2: Option[String] = None,
                      created_at: Option[org.joda.time.DateTime] = None,
                      updated_at: Option[org.joda.time.DateTime] = None)


object BillingInfoCardsDAO {
  import scala.util.Try
  import DatabaseCred.database



  val billing_info_cards = TableQuery[BillingInfoCard]



  def pull_object(s: BillingInfoCardDTO) = database withSession {
    implicit session ⇒
      billing_info_cards returning billing_info_cards.map(_.id) += s.copy(created_at = Some(org.joda.time.DateTime.now()) )
  }
  def get(k: Int) = database withSession {
    implicit session ⇒
      val q3 = for { s ← billing_info_cards if s.id === k } yield s
      q3.list.headOption
  }

  def update(id: Int, code: BillingInfoCardDTO) = database withSession { implicit session ⇒
    val codeToUpdate: BillingInfoCardDTO = code.copy(Option(id), updated_at = Some(org.joda.time.DateTime.now()) )
    billing_info_cards.filter(_.id === id).update(codeToUpdate)
  }

  def delete(id: Int) = database withSession { implicit session ⇒

    billing_info_cards.filter(_.id === id).delete
  }
  def count: Int = database withSession { implicit session ⇒
    Query(billing_info_cards.length).first
  }



  def getAll = database withSession {
    implicit session ⇒
      val q3 = for { s ← billing_info_cards } yield s
      q3.list.sortBy(_.id)

  }

   def ddl_create = {
    database withSession {
      implicit session =>
      billing_info_cards.ddl.create
    }
  }
  def ddl_drop = {
    database withSession {
      implicit session =>
        billing_info_cards.ddl.drop
    }
  }
}
