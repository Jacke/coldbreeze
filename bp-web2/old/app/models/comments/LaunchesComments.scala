package models.comments
import models.DAO.conversion.DatabaseCred
import models.DAO._
import models.DAO.conversion.DatabaseFuture._
import com.github.nscala_time.time.Imports._
import models.DAO.conversion.DatabaseCred.dbConfig.driver.api._
import com.github.tototoshi.slick.PostgresJodaSupport._

class LaunchesComments(tag: Tag) extends Table[LaunchComment](tag, "launches_comments") {
  def id             = column[Long]("id", O.PrimaryKey, O.AutoInc)
  def comment        = column[Long]("comment_id")
  def launch         = column[Int]("launch_id")

  def created_at     = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at     = column[Option[org.joda.time.DateTime]]("updated_at")

  def launchFK  = foreignKey("launch_warps_launch_fk", launch, models.DAO.BPSessionDAOF.bpsessions)(_.id, onDelete = ForeignKeyAction.Cascade)
  def commentFK  = foreignKey("launch_warps_comment_fk", comment, models.comments.CommentsDAOF.comments)(_.id, onDelete = ForeignKeyAction.Cascade)


  def * = (id.?, comment, launch, created_at, updated_at) <> (LaunchComment.tupled, LaunchComment.unapply)
}
case class LaunchComment(
						var id: Option[Long],
						comment:Long,
            launch:Int,
						created_at: Option[org.joda.time.DateTime] = None,
	    			updated_at: Option[org.joda.time.DateTime] = None)
object LaunchCommentDAOF {
  import akka.actor.ActorSystem


  import slick.backend.{StaticDatabaseConfig, DatabaseConfig}

  import slick.jdbc.meta.MTable
  import scala.concurrent.ExecutionContext.Implicits.global
  import scala.concurrent.duration.Duration
  import scala.concurrent.{ExecutionContext, Awaitable, Await, Future}
  import scala.util.Try


  def await[T](a: Awaitable[T])(implicit ec: ExecutionContext) = Await.result(a, Duration.Inf)
  def awaitAndPrint[T](a: Awaitable[T])(implicit ec: ExecutionContext) = println(await(a))
  val launches_comments = TableQuery[LaunchesComments]

  //private def filterQueryByProcess(process: Int): Query[ProcessHistoriesF, ProcessHistoryDTO, Seq] =
  //  bpsessions.filter(_.process === process)
  private def filterQuery(id: Long): Query[LaunchesComments, LaunchComment, Seq] =
    launches_comments.filter(_.id === id)
  private def filterLaunchQuery(id: Int): Query[LaunchesComments, LaunchComment, Seq] =
    launches_comments.filter(_.launch === id)

  val create: DBIO[Unit] = launches_comments.schema.create
  val drop: DBIO[Unit] = launches_comments.schema.drop

  def getAll =  {
    val q3 = for { s ← launches_comments } yield s
    db.run(q3.result)
  }


  def get(id: Long):Future[Option[LaunchComment]] = {
     db.run(filterQuery(id).result.headOption)
  }

  def getAllByLaunch(id: Int):Future[Seq[LaunchComment]] = {
     db.run(filterLaunchQuery(id).result)
  }
  def update(id: Long, launches_comment: LaunchComment) =   {
    val commentToUpdate: LaunchComment = launches_comment.copy(Option(id))
    db.run( launches_comments.filter(_.id === id).update(commentToUpdate) )
  } 

  def ddl_create = db.run(create)
  def ddl_drop = db.run(drop)

  def delete(id: Long) = db.run( launches_comments.filter(_.id === id).delete )

  def pull(s: LaunchComment) = {
  	db.run(launches_comments returning launches_comments.map(_.id) += s)
  }

}
