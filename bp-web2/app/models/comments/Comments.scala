package models.comments
import models.DAO.conversion.DatabaseCred
import models.DAO._
import models.DAO.conversion.DatabaseFuture._
import com.github.nscala_time.time.Imports._
import models.DAO.conversion.DatabaseCred.dbConfig.driver.api._
import com.github.tototoshi.slick.PostgresJodaSupport._

import com.mohiva.play.silhouette.api.LoginInfo
import slick.driver.JdbcProfile
import slick.lifted.ProvenShape.proveShapeOf
import models._
import models.daos._

class Users(tag: Tag) extends Table[DBUser](tag, "user") {
  def id = column[String]("userID", O.PrimaryKey)
  def firstName = column[Option[String]]("firstName")
  def lastName = column[Option[String]]("lastName")
  def fullName = column[Option[String]]("fullName")
  def email = column[Option[String]]("email")
  def avatarURL = column[Option[String]]("avatarURL")
  def * = (id, firstName, lastName, fullName, email, avatarURL) <> (DBUser.tupled, DBUser.unapply)
}

class Comments(tag: Tag) extends Table[Comment](tag, "comments") {
  def id             = column[Long]("id", O.PrimaryKey, O.AutoInc)
  def author         = column[String]("author")
  def body           = column[String]("body")
  def created_at     = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at     = column[Option[org.joda.time.DateTime]]("updated_at")

  def maccFK      = foreignKey("commentAuthor_macc_fk", author, CommentsDAOF.users)(_.id, onDelete = ForeignKeyAction.Cascade)

//  def launchFK  = foreignKey("launch_warps_launch_fk", launch, models.DAO.BPSessionDAOF.bpsessions)(_.id, onDelete = ForeignKeyAction.Cascade)

  def * = (id.?, author, body, created_at, updated_at) <> (Comment.tupled, Comment.unapply)
}
case class Comment(
						var id: Option[Long],
            author: String,
						body:String = "",
						created_at: Option[org.joda.time.DateTime] = None,
	    			updated_at: Option[org.joda.time.DateTime] = None)

object CommentsDAOF {
  import akka.actor.ActorSystem


  import slick.backend.{StaticDatabaseConfig, DatabaseConfig}

  import slick.jdbc.meta.MTable
  import scala.concurrent.ExecutionContext.Implicits.global
  import scala.concurrent.duration.Duration
  import scala.concurrent.{ExecutionContext, Awaitable, Await, Future}
  import scala.util.Try


  def await[T](a: Awaitable[T])(implicit ec: ExecutionContext) = Await.result(a, Duration.Inf)
  def awaitAndPrint[T](a: Awaitable[T])(implicit ec: ExecutionContext) = println(await(a))
  val comments = TableQuery[Comments]
  val users = TableQuery[Users]

  private def filterQuery(id: Long): Query[Comments, Comment, Seq] =
    comments.filter(_.id === id)
  private def filterQueryIds(ids: Seq[Long]): Query[Comments, Comment, Seq] =
    comments.filter(_.id inSetBind ids)

  val create: DBIO[Unit] = comments.schema.create
  val drop: DBIO[Unit] = comments.schema.drop

  def getAllByIds(ids: Seq[Long]):Future[Seq[Comment]] = {
     db.run(filterQueryIds(ids).result)
  }
  def get(id: Long):Future[Option[Comment]] = {
     db.run(filterQuery(id).result.headOption)
  }
  def update(id: Long, comment: Comment) =   {
    val commentToUpdate: Comment = comment.copy(Option(id))
    db.run( comments.filter(_.id === id).update(commentToUpdate) )
  } 

  def getAll =  {
    val q3 = for { s ← comments } yield s
    db.run(q3.result)
  }

  def ddl_create = db.run(create)
  def ddl_drop = db.run(drop)

  def pull(s: Comment) = {
  	db.run(comments returning comments.map(_.id) += s)
  }

}
