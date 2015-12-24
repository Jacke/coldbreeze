package models



//import slick.driver.PostgresDriver.simple._
import models.DAO.conversion.DatabaseCred
import models.DAO.driver.MyPostgresDriver.simple._
import models.DAO._
import com.github.nscala_time.time.Imports._

class LaunchWarps(tag: Tag) extends Table[LaunchWarpDTO](tag, "launch_warps") {
  def id             = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def launch         = column[Int]("launch_id")
  def launch_element = column[Option[Int]]("launch_element_id")
  def board          = column[String]("board_id")
  def created_at     = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at     = column[Option[org.joda.time.DateTime]]("updated_at")


  def launchFK  = foreignKey("launch_warps_launch_fk", launch, models.DAO.BPSessionDAO.bpsessions)(_.id, onDelete = ForeignKeyAction.Cascade)
  def launchelementFK  = foreignKey("launch_warps_launch_elem_fk", launch_element, models.DAO.SessionElemTopologDAO.session_elem_topologs)(_.id, onDelete = ForeignKeyAction.Cascade)

  def * = (id.?, launch, launch_element,  board, created_at, updated_at) <> (LaunchWarpDTO.tupled, LaunchWarpDTO.unapply)
}
case class LaunchWarpDTO(
						var id: Option[Int],
						launch:Int,
						launch_element:Option[Int],
						board:String,
						created_at: Option[org.joda.time.DateTime] = None,
    				updated_at: Option[org.joda.time.DateTime] = None)
object LaunchWarpDAOF {
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
  def await[T](a: Awaitable[T])(implicit ec: ExecutionContext) = Await.result(a, Duration.Inf)
  def awaitAndPrint[T](a: Awaitable[T])(implicit ec: ExecutionContext) = println(await(a))
  val launch_warps = TableQuery[LaunchWarps]

  //private def filterQueryByProcess(process: Int): Query[ProcessHistoriesF, ProcessHistoryDTO, Seq] =
  //  bpsessions.filter(_.process === process)
  private def filterQuery(id: Int): Query[LaunchWarps, LaunchWarpDTO, Seq] =
    launch_warps.filter(_.id === id)
  def get(id: Int):Future[Option[LaunchWarpDTO]] = {
     db.run(filterQuery(id).result.headOption)
  }
  def ddl_create = {
      //db.run(DBIO.seq((launch_warps.schema).create))
  }
  def ddl_drop = {
      //db.run(DBIO.seq((launch_warps.schema).drop))
  }

}
