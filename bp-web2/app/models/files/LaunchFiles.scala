package models.DAO

import akka.actor.ActorSystem
 
  
import slick.backend.{StaticDatabaseConfig, DatabaseConfig}
//import slick.driver.JdbcProfile
import slick.driver.PostgresDriver.api._

import slick.jdbc.meta.MTable
import scala.concurrent.ExecutionContext.Implicits.global

import com.github.tototoshi.slick.PostgresJodaSupport._
import scala.concurrent.duration.Duration
import scala.concurrent.{ExecutionContext, Awaitable, Await, Future}

class LaunchFiles(tag: Tag) extends Table[LaunchFile](tag, "launch_files") {
//Table[(Int,String,String,Option[Int],Option[String],Option[Int], org.joda.time.DateTime)](tag, "process_histories") {
  def id             = column[Long]("id", O.PrimaryKey, O.AutoInc)
  def fileId         = column[Long]("file_id")
  def launch         = column[Int]("launch_id")
  def element        = column[Option[Int]]("element_id")

  def created_at     = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at     = column[Option[org.joda.time.DateTime]]("updated_at")

  def fileFK      = foreignKey("launch_files_file_id_pkey", fileId, models.DAO.FilesDAO.files)(_.id, onDelete = ForeignKeyAction.Cascade)

// launch_files_file_id_pkey

  def * = (id.?, fileId, launch, element, created_at, updated_at) <> (LaunchFile.tupled, LaunchFile.unapply _)

//<> (ProcessHistoryDTO.tupled, ProcessHistoryDTO.unapply)

}

case class LaunchFile(id: Option[Long],
          fileId: Long,
          launch: Int,
          element: Option[Int],
          created_at: Option[org.joda.time.DateTime] = None,
          updated_at: Option[org.joda.time.DateTime] = None)

object LaunchFilesDAO {
  import scala.util.Try
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


  val launch_files = TableQuery[LaunchFiles]


  private def filterQuery(id: Long): Query[LaunchFiles, LaunchFile, Seq] =
    launch_files.filter(_.id === id)


  def findById(id: Long): Future[Option[LaunchFile]] =
    db.run(filterQuery(id).result.headOption)

  private def filterQueryByLaunch(id: Int): Query[LaunchFiles, LaunchFile, Seq] =
      launch_files.filter(_.launch === id)


  def findByLaunchId(id: Int): Future[Seq[LaunchFile]] =
      db.run(filterQueryByLaunch(id).result)

  private def filterQueryByLaunchElement(id: Int, element_id: Int): Query[LaunchFiles, LaunchFile, Seq] =
      launch_files.filter(c => (c.launch === id) && (c.element === element_id ) )


  def findByLaunchElementId(id: Int, element_id: Int): Future[Seq[LaunchFile]] =
      db.run(filterQueryByLaunchElement(id, element_id).result)


  def delete(id: Long) = db.run(launch_files.filter(_.id === id).delete)

  val create: DBIO[Unit] = launch_files.schema.create
  val drop: DBIO[Unit] = launch_files.schema.drop

  def ddl_create = db.run(create)
  def ddl_drop = db.run(drop)

  def pull(s: LaunchFile):Future[Long] = {
    	db.run(launch_files returning launch_files.map(_.id) += s)
  }

  def getAll:Future[Int] = db.run(launch_files.length.result)
  //println("db.close")//db.close

}
