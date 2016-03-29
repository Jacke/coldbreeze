package models.messages
import models.DAO.conversion.DatabaseCred
import models.DAO._
import models.DAO.conversion.DatabaseFuture._  
import com.github.nscala_time.time.Imports._
import models.DAO.conversion.DatabaseCred.dbConfig.driver.api._
import com.github.tototoshi.slick.JdbcJodaSupport._


class Messages(tag: Tag) extends Table[Message](tag, "messages") {
  def id             = column[Long]("id", O.PrimaryKey, O.AutoInc)
  def from           = column[String]("from")
  def to             = column[String]("to")
  def body           = column[String]("body")
  def created_at     = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at     = column[Option[org.joda.time.DateTime]]("updated_at")

  def fromMsgFK   = foreignKey("msgFrom_macc_fk", from, models.AccountsDAO.accounts)(_.userId, onDelete = ForeignKeyAction.Cascade)
  def toMsgFK     = foreignKey("msgTo_macc_fk", to, models.AccountsDAO.accounts)(_.userId, onDelete = ForeignKeyAction.Cascade)

  def * = (id.?, body, created_at, updated_at) <> (Message.tupled, Message.unapply)
}
case class Message(
						var id: Option[Long],
						body:String = "",
						created_at: Option[org.joda.time.DateTime] = None,
	    				updated_at: Option[org.joda.time.DateTime] = None)
object MessagesDAOF {
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
  val messages = TableQuery[Messages]

  private def filterQuery(id: Long): Query[Messages, Message, Seq] =
    messages.filter(_.id === id)

  val create: DBIO[Unit] = messages.schema.create
  val drop: DBIO[Unit] = messages.schema.drop
  
  def get(id: Long):Future[Option[Message]] = {
     db.run(filterQuery(id).result.headOption)
  }
  def ddl_create = db.run(create)
  def ddl_drop = db.run(drop)

  def pull(s: Message) = {
  	db.run(messages returning messages.map(_.id) += s)
  }

}
