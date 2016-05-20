package models.DAO.resources

//import slick.driver.PostgresDriver.simple._
import models.DAO.conversion.DatabaseCred
import slick.driver.PostgresDriver.api._

import com.github.nscala_time.time.Imports._

class Groups(tag: Tag) extends Table[GroupDTO](tag, "groups") {
  def id          = column[Int]("id", O.PrimaryKey, O.AutoInc)

  def title       = column[String]("title")
  def business    = column[Int]("business_id")
  def created_at  = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at  = column[Option[org.joda.time.DateTime]]("updated_at")

  def businessFK  = foreignKey("group_business_fk", business, models.DAO.resources.BusinessDAO.businesses)(_.id, onDelete = ForeignKeyAction.Cascade)

  def * = (id.?, title, business,  created_at, updated_at) <> (GroupDTO.tupled, GroupDTO.unapply)
}
class AccountGroup(tag: Tag) extends Table[AccoutGroupDTO](tag, "account_group") {
  def id         = column[Int]("id", O.PrimaryKey, O.AutoInc)

  def account_id = column[Option[String]]("account_id")
  def group_id   = column[Int]("group_id")
  def created_at = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at = column[Option[org.joda.time.DateTime]]("updated_at")
  def employee_id = column[Int]("employee_id")

  def accFK      = foreignKey("acc_group_acc_fk", account_id, models.AccountsDAO.users)(_.email, onDelete = ForeignKeyAction.Cascade, onUpdate = ForeignKeyAction.Cascade)
  def group_FK   = foreignKey("acc_group_group_FK", group_id, models.DAO.resources.GroupsDAO.groups)(_.id, onDelete = ForeignKeyAction.Cascade)
  def employeeFK = foreignKey("acc_group_employee_fk", employee_id, models.DAO.resources.EmployeeDAO.employees)(_.id, onDelete = ForeignKeyAction.Cascade)


  def * = (id.?, account_id, group_id, created_at, updated_at,employee_id) <> (AccoutGroupDTO.tupled, AccoutGroupDTO.unapply)
}

/**
*  Model for Walkthrought
*  Based on predicate checking
*  Have not been used yet.
**/
case class AccoutGroupDTO(
						var id: Option[Int],
						account_id: Option[String],
						group_id: Int,
						created_at: Option[org.joda.time.DateTime],
    				updated_at: Option[org.joda.time.DateTime],
            employee_id: Int = 0)
object GroupDAOF {
  import akka.actor.ActorSystem
   
    
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
  def await[T](a: Awaitable[T])(implicit ec: ExecutionContext) = Await.result(a, Duration.Inf)
  def awaitAndPrint[T](a: Awaitable[T])(implicit ec: ExecutionContext) = println(await(a))
  val groups = GroupsDAO.groups

  //private def filterQueryByProcess(process: Int): Query[ProcessHistoriesF, ProcessHistoryDTO, Seq] =
  //  bpsessions.filter(_.process === process)
  private def filterQuery(id: Int): Query[Groups, GroupDTO, Seq] =
    groups.filter(_.id === id)
  private def filterByWorkbenchQuery(workbench_id: Int): Query[Groups, GroupDTO, Seq] =
    groups.filter(_.business === workbench_id)

  def get(id: Int):Future[Option[GroupDTO]] = {
     db.run(filterQuery(id).result.headOption)
  }
  def getAllByBusiness(workbench_id: Int):Future[Seq[GroupDTO]] = {
     db.run(filterByWorkbenchQuery(workbench_id).result)
  }
}

object AccountGroupDAOF {
  import akka.actor.ActorSystem
   
    
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
  val account_group = AccountGroupDAO.account_group

  //private def filterQueryByProcess(process: Int): Query[ProcessHistoriesF, ProcessHistoryDTO, Seq] =
  //  bpsessions.filter(_.process === process)
  private def filterQuery(id: Int): Query[AccountGroup, AccoutGroupDTO, Seq] =
    account_group.filter(_.id === id)
  private def filterQueryByGroups(ids: List[Int]): Query[AccountGroup, AccoutGroupDTO, Seq] =
    account_group.filter(_.id inSetBind ids)


  def get(id: Int):Future[Option[AccoutGroupDTO]] = {
     db.run(filterQuery(id).result.headOption)
  }

  def getAllByGroupIDS(group_ids: List[Int]):Future[Seq[AccoutGroupDTO]] = {
    db.run(filterQueryByGroups(group_ids).result)

  }

}


object AccountGroupDAO {
  import scala.util.Try
  import DatabaseCred.database
  val account_group = TableQuery[AccountGroup]

  def pull_object(s: AccoutGroupDTO) = database withSession {
    implicit session ⇒
      account_group returning account_group.map(_.id) += s
  }
  def assign(account_id: Option[String], group_id: Int, employee_id: Int = -1) = database withSession {
  	implicit session =>
  	val now = org.joda.time.DateTime.now()
  	getByEmpAndGroup(employee_id, group_id) match {
  		case Some(group) => -1
  		case _ => pull_object(AccoutGroupDTO(None, account_id, group_id, Some(now), Some(now), employee_id))
  	}
  }
  def unassign(account_id: Option[String], group_id: Int, employee_id: Int = -1) = database withSession {
  	implicit session =>
  	getByEmpAndGroup(employee_id, group_id) match {
  		case Some(group) => delete(group.id.get)
  		case _ => -1
  	}
  }
  def getAllByGroup(group_id: Int) = database withSession {
    implicit session ⇒
      val q3 = for { s ← account_group if s.group_id === group_id } yield s
      q3.list
  }
  def getAllByGroupIDS(group_ids: List[Int]) = database withSession {
    implicit session ⇒
      val q3 = for { s ← account_group if s.group_id inSetBind group_ids } yield s
      q3.list
  }
  def get(k: Int) = database withSession {
    implicit session ⇒
      val q3 = for { s ← account_group if s.id === k } yield s
      q3.list.headOption
  }
  def getByAccountAndGroup(account_id: String, group_id: Int) = database withSession {
    implicit session ⇒
      val q3 = for { s ← account_group if (s.account_id === account_id) && (s.group_id === group_id) } yield s
      q3.list.headOption
  }
  def getByEmpAndGroup(employee_id: Int, group_id: Int) = database withSession {
    implicit session ⇒
      val q3 = for { s ← account_group if (s.employee_id === employee_id) && (s.group_id === group_id) } yield s
      q3.list.headOption
  }
  def getByAccount(account_id: String) = database withSession {
    implicit session ⇒
      val q3 = for { s ← account_group if s.account_id === account_id } yield s
      q3.list
  }
  def getByAccounts(account_ids: List[String]) = database withSession {
    implicit session ⇒
      val q3 = for { s ← account_group if s.account_id inSetBind account_ids } yield s
      GroupsDAO.gets(q3.list.map(_.group_id))
  }
  def update(id: Int, group: AccoutGroupDTO) = database withSession { implicit session ⇒
    val walkToUpdate: AccoutGroupDTO = group.copy(Option(id))
    account_group.filter(_.id === id).update(walkToUpdate)
  }
  def delete(id: Int) = database withSession { implicit session ⇒
    account_group.filter(_.id === id).delete
  }
  def ddl_create = {
    database withSession {
      implicit session =>
      account_group.ddl.create
    }
  }
  def ddl_drop = {
    database withSession {
      implicit session =>
      account_group.ddl.drop
    }
  }
}

case class GroupDTO(var id: Option[Int],
                  title: String,
                  business: Int,
                  created_at: Option[org.joda.time.DateTime],
                  updated_at: Option[org.joda.time.DateTime])
object GroupsDAO {
  import scala.util.Try
  import DatabaseCred.database

  val groups = TableQuery[Groups]


  def pull_object(s: GroupDTO) = database withSession {
    implicit session ⇒
      groups returning groups.map(_.id) += s
  }

  def get(k: Int) = database withSession {
    implicit session ⇒
      val q3 = for { s ← groups if s.id === k } yield s
      q3.list.headOption
  }
  def gets(ids: List[Int]) = database withSession {
    implicit session ⇒
      val q3 = for { s ← groups if s.id inSetBind ids } yield s
      q3.list
  }
  def getsByBusiness(business: Int) = database withSession {
    implicit session =>
      val q3 = for { s ← groups if s.business === business } yield s
      q3.list
  }
  def getByBusiness(bid: Int) = database withSession {
    implicit session =>
     val q3 = for { s ← groups if s.business === bid } yield s
      q3.list.headOption
  }
  def getAllByBusiness(bid: Int) = database withSession {
    implicit session =>
     val q3 = for { s ← groups if s.business === bid } yield s
      q3.list
  }
  def update(id: Int, group: GroupDTO) = database withSession { implicit session ⇒
    val walkToUpdate: GroupDTO = group.copy(Option(id))
    groups.filter(_.id === id).update(walkToUpdate)
  }
  /**
   * Delete a group
   * @param id
   */
  def delete(id: Int) = database withSession { implicit session ⇒

    groups.filter(_.id === id).delete
  }
  /**
   * Count all groups
   */
  def count: Int = database withSession { implicit session ⇒
    Query(groups.length).first
  }
  def ddl_create = {
    database withSession {
      implicit session =>
      groups.ddl.create
    }
  }
  def ddl_drop = {
    database withSession {
      implicit session =>
      groups.ddl.drop
    }
  }

}
