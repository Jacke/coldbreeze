package models.DAO.resources


import slick.driver.PostgresDriver.api._
import com.github.nscala_time.time.Imports._
import com.github.tototoshi.slick.PostgresJodaSupport._
import slick.model.ForeignKeyAction
import models.DAO.resources.BusinessDTO._
import models.DAO.resources.EmployeeDAO._
import models.DAO.conversion.DatabaseCred

class EmployeesBusinesses(tag: Tag) extends Table[(Int, Int)](tag, "employees_businesses") {
  def employee_id = column[Int]("employee_id")
  def business_id = column[Int]("business_id")

  def employeeFK = foreignKey("emp_biz_employee_fk", employee_id, models.DAO.resources.EmployeeDAO.employees)(_.id, onDelete = ForeignKeyAction.Cascade)
  def businessFK = foreignKey("emp_biz_business_fk", business_id, models.DAO.resources.BusinessDAO.businesses)(_.id, onDelete = ForeignKeyAction.Cascade)

  def * = (employee_id, business_id) //<> (Supplier.tupled, Supplier.unapply)

}


object EmployeesBusinessDAO {
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

  val employees_businesses = TableQuery[EmployeesBusinesses]

  def pull(employee_id: Int, business_id: Int) = Try(  {
      await(db.run( employees_businesses += (employee_id, business_id) ))
  }).isSuccess


  def getAll =   {
      val q3 = for { s ← employees_businesses } yield s
      await(db.run(q3.result)).toList
  }

  def getByBusiness(k: Int) =   {
      val q3 = for { s ← employees_businesses if s.business_id === k } yield s
      await(db.run(q3.result)).toList
  }

  def isEmployable(business_id: Int, email: String) =   {
    val emp = EmployeeDAO.getByUID(email) match {
        case Some(x) => x.id.get
        case _ => 0
      }

      val q3 = for { s ← employees_businesses if s.employee_id === emp && s.business_id === business_id } yield s
      await(db.run(q3.result.headOption)).isDefined
  }

  def getByUID(email: String):Option[Tuple2[Int, Int]] =   {
      val emp = EmployeeDAO.getByEmployeeUID(email) match {
        case Some(x) => x.id
        case _ => None
      }
      val q3 = for { s ← employees_businesses if s.employee_id === emp.getOrElse(0) } yield s
      await(db.run(q3.result.headOption))
  }

  def getByID(id: Int):Option[Tuple2[Int, Int]] =   {
      val q3 = for { s ← employees_businesses if s.employee_id === id } yield s
      await(db.run(q3.result.headOption))
  }
  def getBusinessByUID(email: String):Option[BusinessDTO] =   {
    getByUID(email) match {
      case Some(tuple) => {
        BusinessDAO.get(tuple._2)
      }
      case _ => None
    }
  }

  def deleteByEmployee(employee_id: Int) =   {
    await(db.run( employees_businesses.filter(_.employee_id === employee_id).delete ))
  }
  def deleteByEmployeeAndBusiness(employee_id: Int, business_id: Int) =   {
    await(db.run( employees_businesses.filter(em => em.employee_id === employee_id && em.business_id === business_id).delete ))
    //employees_businesses.filter(_.employee_id === employee_id &&& _.business_id === business_id).delete
  }

  val create: DBIO[Unit] = employees_businesses.schema.create
  val drop: DBIO[Unit] = employees_businesses.schema.drop

  def ddl_create = db.run(create)
  def ddl_drop = db.run(drop)

}
