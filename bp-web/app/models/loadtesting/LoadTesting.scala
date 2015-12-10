package models

//import scalikejdbc._
//import scalikejdbc.config._
import play.api.db._
import play.api.Play.current

import anorm._
import anorm.SqlParser._



object LoadTesting {

  def all() = DB.withConnection { implicit c =>
    SQL("select * from accounts") //.as(simple *)
  }

 /* val simple = {
    get[String]("token.token") ~
    get[String]("token.email") ~
    get[String]("token.action") ~
    get[Date]("token.created") map {
      case token~email~action~created => Token(token, email, action, created)
    }
  }*/
	/*
  def test() = {
	DBs.setupAll()
	// DBs.setup()
	// DBs.setup('legacy)
	// // Unlike DBs.setupAll(), DBs.setup() doesn't load configurations under global settings automatically
	// DBs.loadGlobalSettings()

	// loaded from "db.default.*"
	val memberIds = DB readOnly { implicit session =>
	  sql"select email from accounts".map(_.string(1)).list.apply()
	}
	// loaded from "db.legacy.*"
	val legacyMemberIds = NamedDB('legacy) readOnly { implicit session =>
	  sql"select email from accounts".map(_.string(1)).list.apply()
	}
    memberIds.foreach { e => println(e) }
	legacyMemberIds.foreach { e => println(e) }
	// wipes out ConnectionPool
	DBs.closeAll()
  }
  */

}
import play.api.libs.json._
import play.api.cache._
import play.api.data._
import play.api.data.Forms._
import play.api.data.format.Formats
import play.api.data.format.Formatter
import play.api.data.FormError
import play.api.Logger
import play.api.libs.json._
import play.api._
import play.api.mvc._
import play.api.data._
import play.api.data.Forms._
import java.util.Date
import java.sql.{ Date => SqlDate }
import play.api.Play.current
import slick.lifted.Tag
import java.sql.Timestamp
import slick.driver.PostgresDriver.api._

case class PageT[A](items: Seq[A], page: Int, offset: Long, total: Long) { //(implicit val tWrites: Writes[A]) {
  lazy val prev = Option(page - 1).filter(_ >= 0)
  lazy val next = Option(page + 1).filter(_ => (offset + items.size) < total)
}

/*
object Page {
  implicit def pageWriter[A]: Writes[Page[A]] = new Writes[Page[A]] {
    def writes(o: Page[A]): JsValue = {
      implicit val tWrites = o.tWrites
      val writes = Json.writes[Page[A]]
      writes.writes(o)
    }
  }
}
*/

case class EmployeeT(id: Option[Long], name: String, address: String, dob: Option[Date], joiningDate: Date, designation: Option[String])

class EmployeesT(tag: Tag) extends Table[EmployeeT](tag, "FAKEEMPLOYEE") {

  implicit val dateColumnType = MappedColumnType.base[Date, Long](d => d.getTime, d => new Date(d))

  def id = column[Long]("id", O.PrimaryKey, O.AutoInc)
  def name = column[String]("name")
  def address = column[String]("address")
  def dob = column[Date]("date_of_birth")
  def joiningDate = column[Date]("joining_date")
  def designation = column[String]("designation")

  def * = (id.?, name, address, dob.?, joiningDate, designation.?) <> (EmployeeT.tupled, EmployeeT.unapply _)

}

import slick.driver.PostgresDriver.api._
import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits.global
import play.api.db.DB
import play.api.Play.current

trait DAOComponent {

  def insert(employee: EmployeeT): Future[Int]
  def update(id: Long, employee: EmployeeT): Future[Int]
  def delete(id: Long): Future[Int]
  def list(page: Int = 0, pageSize: Int = 10, orderBy: Int = 1, filter: String = "%"): Future[PageT[EmployeeT]]
  def findById(id: Long): Future[EmployeeT]
  def count: Future[Int]

}

object EmployeeTDAO extends DAOComponent {

  private val employees = TableQuery[EmployeesT]

  private def db: Database = Database.forDataSource(DB.getDataSource())

  /**
   * Filter employee with id
   */
  private def filterQuery(id: Long): Query[EmployeesT, EmployeeT, Seq] =
    employees.filter(_.id === id)

  /**
   * Count employees with a filter
   */
  private def count(filter: String): Future[Int] =
    try db.run(employees.filter(_.name.toLowerCase like filter.toLowerCase()).length.result)
    finally db.close

  /**
   * Count total employees in database
   */
  override def count: Future[Int] =
    try db.run(employees.length.result)
    finally db.close

  /**
   * Find employee by id
   */
  override def findById(id: Long): Future[EmployeeT] =
    try db.run(filterQuery(id).result.head)
    finally db.close

  /**
   * Create a new employee
   */
  override def insert(employee: EmployeeT): Future[Int] =
    try db.run(employees += employee)
    finally db.close

  /**
   * Update employee with id
   */
  override def update(id: Long, employee: EmployeeT): Future[Int] =
    try db.run(filterQuery(id).update(employee))
    finally db.close

  /**
   * Delete employee with id
   */
  override def delete(id: Long): Future[Int] =
    try db.run(filterQuery(id).delete)
    finally db.close

  /**
   * Return a page of employees
   */
  override def list(page: Int = 0, pageSize: Int = 10, orderBy: Int = 1, filter: String = "%"): Future[PageT[EmployeeT]] = {
    try {
      val offset = pageSize * page
      val query =
        (for {
          employee <- employees if employee.name.toLowerCase like filter.toLowerCase
        } yield (employee))//.drop(1000).take(1000)
      val totalRows = count(filter)
      val result = db.run(query.result)
      result flatMap (employees => totalRows map (rows => PageT(employees, page, offset, rows)))
    } finally { db.close() }
  }

}
