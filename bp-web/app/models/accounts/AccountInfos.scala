package models


import models.DAO.resources.{EmployeesBusinessDAO, AccountPlanDAO}
import models.DAO.resources.BusinessDTO._
import models.DAO.conversion.DatabaseCred

import securesocial.core.providers._
import securesocial.core._
import securesocial.core.services.{UserService, SaveMode}

//import slick.driver.PostgresDriver.api._
import com.github.nscala_time.time.Imports._
//import com.github.tminglei.slickpg.date.PgDateJdbcTypes
import slick.model.ForeignKeyAction

import slick.driver.PostgresDriver.simple._
import com.github.tototoshi.slick.PostgresJodaSupport._
import service.DemoUser

case class AccountInfos(tag: Tag) extends Table[AccountInfo](tag, "account_infos") {
  def id = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def uid = column[String]("uid")
  def created_at = column[org.joda.time.DateTime]("created_at")
  def ea = column[Boolean]("early_access", O.Default(false))
  def pro = column[Boolean]("pro_features", O.Default(false))
  def currentWorkbench = column[Option[Int]]("workbench_id")


  def businessFK = foreignKey("acc_info_current_biz_business_fk", currentWorkbench, models.DAO.resources.BusinessDAO.businesses)(_.id, onDelete = ForeignKeyAction.Cascade)
  def * = (id.?, uid, created_at, ea, pro, currentWorkbench) <> (AccountInfo.tupled, AccountInfo.unapply)
  def accInfoFK  = foreignKey("accInfo_fk", uid, AccountsDAO.accounts)(_.userId, onDelete = ForeignKeyAction.Cascade)
 }

 case class AccountInfo(id: Option[Int], 
 						uid: String, 
                        created_at: org.joda.time.DateTime = org.joda.time.DateTime.now(), 
                        ea: Boolean = false, 
                        pro: Boolean = false,
                        currentWorkbench: Option[Int]=None)