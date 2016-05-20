package models.DAO.resources

object EmployeesBusinessDAOF {
  import scala.util.Try
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

//  val dbConfig = models.DAO.conversion.DatabaseCred.dbConfig//slick.backend.DatabaseConfig.forConfig[slick.driver.JdbcProfile]("postgres")
//  val db = models.DAO.conversion.DatabaseCred.databaseF // all database interactions are realised through this object
  //import dbConfig.driver.api._ //
  def await[T](a: Awaitable[T])(implicit ec: ExecutionContext) = Await.result(a, Duration.Inf)
  def awaitAndPrint[T](a: Awaitable[T])(implicit ec: ExecutionContext) = println(await(a))

  val employees_businesses = EmployeesBusinessDAO.employees_businesses
  private def filterQuery(id: Int): Query[EmployeesBusinesses, (Int, Int), Seq] =
    employees_businesses.filter(_.employee_id === id)

  def findById(id: Int): Future[Option[(Int, Int)]] =
    db.run(filterQuery(id).result.headOption)
    //finally println("db.close")//db.close

}



object EmployeeDAOF {
  import scala.util.Try
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

  val employees = EmployeeDAO.employees


  private def filterQuery(id: Int): Query[Employees, EmployeeDTO, Seq] =
    employees.filter(_.id === id)
  private def filterByEmail(email:String): Query[Employees, EmployeeDTO, Seq] =
    employees.filter(_.uid === email)
  private def filterByEmailAndWorkbench(email:String, workbench:Int): Query[Employees, EmployeeDTO, Seq] =
    employees.filter(e => e.uid === email && e.workbench === workbench)
  private def filterByWorkbench(workbench:Int): Query[Employees, EmployeeDTO, Seq] =
    employees.filter(_.workbench === workbench)
  private def All(): Query[Employees, EmployeeDTO, Seq] =
    employees

  def getByEmpById(id: Int):Future[Seq[EmployeeDTO]] = {
    db.run(filterQuery(id).result)
    //finally println("db.close")//db.close
  }
  def getByEmpByUID(uid: String):Future[Option[EmployeeDTO]] = {
    db.run(filterByEmail(uid).result.headOption)
    //finally println("db.close")//db.close
  }
  def getByEmployeeUIDAndWorkbench(uid: String, workbench: Int):Future[Option[EmployeeDTO]] = {
    db.run(filterByEmailAndWorkbench(uid, workbench).result.headOption)
  }
  def getAllByEmpByUID(uid: String):Future[Seq[EmployeeDTO]] = {
    db.run(filterByEmail(uid).result)
    //finally println("db.close")//db.close
  }


  def getAll():Future[Seq[EmployeeDTO]] = {
    db.run(All().result)
    //finally println("db.close")//db.close
  }
  def getAllByWorkbench(workbench: Int):Future[Seq[EmployeeDTO]] = {
    db.run(filterByWorkbench(workbench).result)
  }

  def updateBusinessForAllEmployees() = {
    val emps:Future[Seq[EmployeeDTO]] = db.run(All().result)
    emps.map { empSeq =>
      empSeq.map { emp =>
      val empbiz = EmployeesBusinessDAOF.findById(emp.id.get)
       val biz = empbiz.map { c => c match {
          case Some(biz) => biz._2
          case _ => 0
        }
        }
        biz.map { b => updateF(emp.id.get, employee = emp.copy(workbench = b)) }
    }
    }
  }

  def updateF(id: Int, employee: EmployeeDTO): Future[Int] =
    db.run(filterQuery(id).update(employee))
    //finally println(db.close)

}


import slick.driver.PostgresDriver.simple._
import models.DAO.conversion.DatabaseCred

class Employees(tag: Tag) extends Table[EmployeeDTO](tag, "employees") {
  def id          = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def uid         = column[String]("uid")
  def master_acc  = column[String]("master_acc")
  def position    = column[Option[String]]("position")
  def manager     = column[Boolean]("manager")
  def workbench   = column[Int]("workbench_id")

  // TODO: CHECK AND FIX BELOW
  //def accFK = foreignKey("acc_fk", uid, models.AccountsDAO.accounts)(_.userId, onDelete = ForeignKeyAction.Cascade)
  def maccFK      = foreignKey("emp_macc_fk", master_acc, models.AccountsDAO.accounts)(_.userId, onDelete = ForeignKeyAction.Cascade, onUpdate = ForeignKeyAction.Cascade)
  def workBenchFK = foreignKey("emp_workbench_fk", workbench, models.DAO.resources.BusinessDAO.businesses)(_.id, onDelete = ForeignKeyAction.Cascade)
  def eb          = EmployeesBusinessDAO.employees_businesses.filter(_.employee_id === id).flatMap(_.businessFK)

  def * = (id.?, uid, master_acc, position, manager, workbench) <> (EmployeeDTO.tupled, EmployeeDTO.unapply)

}

case class EmployeeDTO(var id: Option[Int],
                       uid: String,
                       master_acc:String,
                       position:Option[String],
                       manager:Boolean = false,
                       workbench:Int=0)


object EmployeeDAO {
 import scala.util.Try
 import DatabaseCred.database
 val employees = TableQuery[Employees]

 def pull_object(s: EmployeeDTO) = database withSession {
    implicit session ⇒

      employees returning employees.map(_.id) += s
  }
def pull_object_for(s: EmployeeDTO, email: String):Int = database withSession {
  implicit session ⇒
    if (!getAllByMaster(email).map(_.uid).contains(s.uid)) {
      employees returning employees.map(_.id) += s
    } else {
      -1
    }
 }
  def get(k: Int) = database withSession {
    implicit session ⇒
      val q3 = for { s ← employees if s.id === k } yield s// <> (EmployeeDTO.tupled, EmployeeDTO.unapply _)
      q3.list.headOption
  }
  def getAllByMaster(email: String) = database withSession {
    implicit session =>
      val q3 = for { s <- employees if s.master_acc === email } yield s
      q3.list
  }
  def updateBusinessForAllEmployees() = database withSession {
    implicit session =>
    val q3 = for { s ← employees } yield s// <> (EmployeeDTO.tupled, EmployeeDTO.unapply _)
      q3.list.foreach { emp =>
        val empbiz = EmployeesBusinessDAO.getByID(emp.id.get)

        val biz = empbiz match {
          case Some(biz) => biz._2
          case _ => 0
        }
        update(emp.id.get, employee = emp.copy(workbench = biz))
      }
  }
  def getMasterByAccount(email: String) = database withSession {
    implicit session =>
      getByUID(email) match {
      case Some(acc) => {
        models.AccountsDAO.getAccount(acc.master_acc)
      }
      case _ => None
    }
  }
  def getByEmployeeUID(uid: String) = database withSession {
    implicit session =>
    val q3 = for { s ← employees if s.uid === uid } yield s// <> (EmployeeDTO.tupled, EmployeeDTO.unapply _)
      q3.list.headOption
  }
  def getByEmployeeUIDAndWorkbench(uid: String, workbench_id: Int) = database withSession {
    implicit session =>
    val q3 = for { s ← employees if s.uid === uid && s.workbench === workbench_id } yield s// <> (EmployeeDTO.tupled, EmployeeDTO.unapply _)
      q3.list.headOption
  }
  def getAllByEmployeeUID(uid: String) = database withSession {
    implicit session =>
    val q3 = for { s ← employees if s.uid === uid } yield s// <> (EmployeeDTO.tupled, EmployeeDTO.unapply _)
      q3.list
  }
  def getByUID(uid: String) = database withSession {
    implicit session =>
    val q3 = for { s ← employees if s.uid === uid && s.master_acc === uid } yield s// <> (EmployeeDTO.tupled, EmployeeDTO.unapply _)
      q3.list.headOption
  }
  def getAllByWorkbench(workbench: Int) = database withSession {
    implicit session =>
    val q3 = for { s ← employees if s.workbench === workbench } yield s// <> (EmployeeDTO.tupled, EmployeeDTO.unapply _)
      q3.list
  }
  def getLengthByWorkbench(workbench: Int) = database withSession {
    implicit session =>
    val q3 = for { s ← employees if s.workbench === workbench } yield s// <> (EmployeeDTO.tupled, EmployeeDTO.unapply _)
      q3.list.length
  }
  /**
   * Update a employee
   * @param id
   * @param employee
   */
  def update(id: Int, employee: EmployeeDTO) = database withSession { implicit session ⇒
    val bpToUpdate: EmployeeDTO = employee.copy(Option(id))
    employees.filter(_.id === id).update(bpToUpdate)
  }
  /**
   * Delete a employee
   * @param id
   */
  def delete(id: Int) = database withSession { implicit session ⇒

    employees.filter(_.id === id).delete
  }
  /**
   * Count all employees
   */
  def count: Int = database withSession { implicit session ⇒
    Query(employees.length).first
  }



  def getAll = database withSession {
    implicit session ⇒
      val q3 = for { s ← employees } yield s
      q3.list.sortBy(_.id)
  }
  def ddl_create = {
    database withSession {
      implicit session =>
      employees.ddl.create
    }
  }
  def ddl_drop = {
    database withSession {
      implicit session =>
        employees.ddl.drop
    }
  }

}
