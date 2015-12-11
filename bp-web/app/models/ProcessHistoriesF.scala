package models.DAO

import akka.actor.ActorSystem
import akka.stream.ActorFlowMaterializer
import akka.stream.scaladsl.Source
import slick.backend.{StaticDatabaseConfig, DatabaseConfig}
//import slick.driver.JdbcProfile
import slick.driver.PostgresDriver.api._

import slick.jdbc.meta.MTable
import scala.concurrent.ExecutionContext.Implicits.global

import com.github.tototoshi.slick.JdbcJodaSupport._
import scala.concurrent.duration.Duration
import scala.concurrent.{ExecutionContext, Awaitable, Await, Future}

class ProcessHistoriesF(tag: Tag) extends Table[ProcessHistoryDTO](tag, "process_histories") {
//Table[(Int,String,String,Option[Int],Option[String],Option[Int], org.joda.time.DateTime)](tag, "process_histories") {
  def id       = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def acc      = column[String]("master_acc")
  def process  = column[Option[Int]]("process_id")
  def action   = column[String]("action")
  def what     = column[Option[String]]("what")
  def what_id  = column[Option[Int]]("what_id")
  def date     = column[org.joda.time.DateTime]("date")


  def bpFK     = foreignKey("pr_hist_bprocess_fk", process, models.DAO.BPDAO.bprocesses)(_.id)
  def accFK    = foreignKey("pr_hist_macc_fk", acc, models.AccountsDAO.accounts)(_.userId, onDelete = ForeignKeyAction.Cascade)


  def * = (id.?, acc, action, process, what, what_id, date) <> (ProcessHistoryDTO.tupled, ProcessHistoryDTO.unapply _)

//<> (ProcessHistoryDTO.tupled, ProcessHistoryDTO.unapply)

}


object ProcHistoryDAOF {
  import scala.util.Try
import akka.actor.ActorSystem
import akka.stream.ActorFlowMaterializer
import akka.stream.scaladsl.Source
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




  val proc_historiesf = TableQuery[ProcessHistoriesF]

  private def filterQueryByProcess(process: Int): Query[ProcessHistoriesF, ProcessHistoryDTO, Seq] =
    proc_historiesf.filter(_.process === process)
  private def filterQuery(id: Int): Query[ProcessHistoriesF, ProcessHistoryDTO, Seq] =
    proc_historiesf.filter(_.id === id)

  def getByProcessF(proc_id: Int):Future[Seq[ProcessHistoryDTO]] = { 
    try db.run(filterQueryByProcess(proc_id).result)
    finally println("db.close")//db.close
  }
  def findById(id: Int): Future[ProcessHistoryDTO] =
    try db.run(filterQuery(id).result.head)
    finally println("db.close")//db.close


  def getAll:Future[Int] = try db.run(proc_historiesf.length.result)
  finally println("db.close")//db.close
    
}    