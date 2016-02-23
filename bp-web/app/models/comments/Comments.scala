package models.comments
import models.DAO.conversion.DatabaseCred
import models.DAO._
import models.DAO.conversion.DatabaseFuture._  
import com.github.nscala_time.time.Imports._
import models.DAO.conversion.DatabaseCred.dbConfig.driver.api._
import com.github.tototoshi.slick.JdbcJodaSupport._

class Comments(tag: Tag) extends Table[Comment](tag, "comments") {
  def id             = column[Long]("id", O.PrimaryKey, O.AutoInc)
  def author         = column[String]("author")
  def body           = column[String]("body")
  def created_at     = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at     = column[Option[org.joda.time.DateTime]]("updated_at")

  def maccFK      = foreignKey("commentAuthor_macc_fk", author, models.AccountsDAO.accounts)(_.userId, onDelete = ForeignKeyAction.Cascade)

//  def launchFK  = foreignKey("launch_warps_launch_fk", launch, models.DAO.BPSessionDAO.bpsessions)(_.id, onDelete = ForeignKeyAction.Cascade)  

  def * = (id.?, body, created_at, updated_at) <> (Comment.tupled, Comment.unapply)
}
case class Comment(
						var id: Option[Long],
						body:String = "",
						created_at: Option[org.joda.time.DateTime] = None,
	    				updated_at: Option[org.joda.time.DateTime] = None)
object CommentsDAOF {
  import akka.actor.ActorSystem
  import akka.stream.ActorFlowMaterializer
  import akka.stream.scaladsl.Source
  import slick.backend.{StaticDatabaseConfig, DatabaseConfig}

  import slick.jdbc.meta.MTable
  import scala.concurrent.ExecutionContext.Implicits.global
  import scala.concurrent.duration.Duration
  import scala.concurrent.{ExecutionContext, Awaitable, Await, Future}
  import scala.util.Try


  def await[T](a: Awaitable[T])(implicit ec: ExecutionContext) = Await.result(a, Duration.Inf)
  def awaitAndPrint[T](a: Awaitable[T])(implicit ec: ExecutionContext) = println(await(a))
  val comments = TableQuery[Comments]

  private def filterQuery(id: Long): Query[Comments, Comment, Seq] =
    comments.filter(_.id === id)

  val create: DBIO[Unit] = comments.schema.create
  val drop: DBIO[Unit] = comments.schema.drop
  
  def get(id: Long):Future[Option[Comment]] = {
     db.run(filterQuery(id).result.headOption)
  }
  def ddl_create = db.run(create)
  def ddl_drop = db.run(drop)

  def pull(s: Comment) = {
  	db.run(comments returning comments.map(_.id) += s)
  }

}
