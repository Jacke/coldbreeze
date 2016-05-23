package models.DAO

import main.scala.bprocesses.{ BProcess, BPLoggerResult }
import main.scala.simple_parts.process.ProcElems

import models.DAO.conversion.DatabaseCred
import models.DAO._
import models.DAO.conversion.DatabaseFuture._
import com.github.nscala_time.time.Imports._
import models.DAO.conversion.DatabaseCred.dbConfig.driver.api._
import com.github.tototoshi.slick.PostgresJodaSupport._


import models.DAO.ProcElemDAO._
import models.DAO.BPDAO._
import models.DAO.BPStationDAO._
import models.DAO.conversion.DatabaseCred
import models.DAO._
import models.DAO.sessions._
import builders._
import main.scala.bprocesses.BPSession
import main.scala.simple_parts.process.Units._


class ProcElementsF(tag: Tag) extends Table[UndefElement](tag, "proc_elements") {

  def id        = column[Int]("id", O.PrimaryKey, O.AutoInc) // This is the primary key column
  def title     = column[String]("title")
  def desc      = column[String]("desc")
  def business  = column[Int]("business_id")
  def bprocess  = column[Int]("bprocess_id")
  def b_type    = column[String]("b_type")
  def type_title= column[String]("type_title")

  def space_own = column[Option[Int]]("space_id")

  def order     = column[Int]("order")
  //def comps = column[Option[List[CompositeValues]]]("comps", O.DBType("compositevalues[]"))

  def created_at= column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at= column[Option[org.joda.time.DateTime]]("updated_at")

  def * = (id.?, title, desc, business, bprocess, b_type, type_title, space_own, order,
           created_at, updated_at) <> (UndefElement.tupled, UndefElement.unapply)

  def businessFK = foreignKey("pr_elem_business_fk", business, models.DAO.resources.BusinessDAO.businesses)(_.id, onDelete = ForeignKeyAction.Cascade)
  def bpFK       = foreignKey("pr_elem_bprocess_fk", bprocess, models.DAO.BPDAOF.bprocesses)(_.id, onDelete = ForeignKeyAction.Cascade)
}
object ProcElemDAOF {
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
  val proc_elements = TableQuery[ProcElementsF]


  private def filterQuery(id: Int): Query[ProcElementsF, UndefElement, Seq] =
    proc_elements.filter(_.id === id)
  private def filterByBPQuery(id: Int): Query[ProcElementsF, UndefElement, Seq] =
    proc_elements.filter(_.bprocess === id)
    private def filterByBPSQuery(ids: List[Int]): Query[ProcElementsF, UndefElement, Seq] =
      proc_elements.filter(_.bprocess inSetBind ids)

  def findByBPId(bpId: Int) = db.run(filterByBPQuery(bpId).result)
  def findByBPSId(bpsId: List[Int]) = db.run(filterByBPSQuery(bpsId).result)

  def pull(s: UndefElement):Future[Int] = db.run(proc_elements returning proc_elements.map(_.id) += s)

  def findByBPIdAndTimestamp(bpId: Int, timestamp: Option[String]) = db.run(filterByBPQuery(bpId).result)

}
