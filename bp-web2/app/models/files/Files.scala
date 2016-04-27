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

class Files(tag: Tag) extends Table[File](tag, "files") {
//Table[(Int,String,String,Option[Int],Option[String],Option[Int], org.joda.time.DateTime)](tag, "process_histories") {
  def id             = column[Long]("id", O.PrimaryKey, O.AutoInc)
  def workbench      = column[Int]("workbench")
  def azureId        = column[String]("azureId")
  def fileName       = column[String]("file_name")
  def description    = column[String]("description")
  def external       = column[Boolean]("external")
  def externalUrl    = column[Option[String]]("external_url")

  def created_at     = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at     = column[Option[org.joda.time.DateTime]]("updated_at")

  def * = (id.?, workbench, azureId, fileName, description,external,externalUrl, created_at, updated_at) <> (File.tupled, File.unapply _)

//<> (ProcessHistoryDTO.tupled, ProcessHistoryDTO.unapply)

}

case class File(id: Option[Long],
          workbench: Int,
          azureId: String,
          fileName: String,
          description: String = "",
          external: Boolean = false,
          externalUrl: Option[String] = None,
          created_at: Option[org.joda.time.DateTime] = None,
          updated_at: Option[org.joda.time.DateTime] = None)

object FilesDAO {
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




  val files = TableQuery[Files]


  private def filterQuery(id: Long): Query[Files, File, Seq] =
    files.filter(_.id === id)
  private def filterQueryByIds(ids: Seq[Long]): Query[Files, File, Seq] =
    files.filter(_.id inSetBind ids)



  def findById(id: Long): Future[Option[File]] = db.run(filterQuery(id).result.headOption)

  val create: DBIO[Unit] = files.schema.create
  val drop: DBIO[Unit] = files.schema.drop

  def ddl_create = db.run(create)
  def ddl_drop = db.run(drop)

  def pull(s: File):Future[Long] = {
    	db.run(files returning files.map(_.id) += s)
  }

  def getByIds(ids: Seq[Long]): Future[Seq[File]] = db.run(filterQueryByIds(ids).result)


  def delete(id: Long) = db.run(files.filter(_.id === id).delete)


  def getAll:Future[Seq[File]] = db.run(files.result)
  //println("db.close")//db.close

}
