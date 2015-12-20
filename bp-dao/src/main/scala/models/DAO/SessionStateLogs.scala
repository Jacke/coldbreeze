package models.DAO
  
import main.scala.bprocesses.{BProcess, BPLoggerResult}
import main.scala.simple_parts.process.ProcElems
import models.DAO.driver.MyPostgresDriver.simple._
import com.github.nscala_time.time.Imports._
//import com.github.tminglei.slickpg.date.PgDateJdbcTypes
import slick.model.ForeignKeyAction
import models.DAO.ProcElemDAO._
import models.DAO.BPDAO._
import models.DAO.BPStationDAO._
import models.DAO.conversion.DatabaseCred
import main.scala.bprocesses._
import main.scala.bprocesses.{BPState, BPSessionState} 

class SessionStateLogs(tag: Tag) extends Table[SessionStateLog](tag, "session_state_logs") {
  def id        = column[Int]("id", O.PrimaryKey, O.AutoInc) 
  def session   = column[Int]("session_id")
  def state_id  = column[Int]("state_id")

  def on        = column[Boolean]("on", O.Default(false))  
  def on_rate   = column[Int]("on_rate", O.Default(0))  

  def reason    = column[String]("reason")  
  def created_at= column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at= column[Option[org.joda.time.DateTime]]("updated_at")  

  def lang      = column[String]("lang", O.Default("en"))  
  def *         = (id.?, session, state_id, on, on_rate,reason,
                   created_at, updated_at) <> (SessionStateLog.tupled, SessionStateLog.unapply)
  def sesFK     = foreignKey("s_state_log_session_fk", session, models.DAO.BPSessionDAO.bpsessions)(_.id, onDelete = ForeignKeyAction.Cascade)
  def stateFK   = foreignKey("s_state_log_state_fk", state_id, BPSessionStateDAO.sessionstates)(_.id, onDelete = ForeignKeyAction.Cascade)

} 

object SessionStateLogDAOF {
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
  val session_state_logs = SessionStateLogDAO.session_state_logs

  private def filterQuery(id: Int): Query[SessionStateLogs, SessionStateLog, Seq] =
    session_state_logs.filter(_.id === id)

}
object SessionStateLogDAO {
  import scala.util.Try
  import DatabaseCred.database
  import models.DAO.conversion.Implicits._

val session_state_logs = TableQuery[SessionStateLogs]

def getBySession(id: Int):Option[SessionStateLog] = database withSession {
    implicit session =>
    val q3 = for { s <- session_state_logs if s.session === id } yield s
    q3.list.headOption
}
def getAllBySession(id: Int):List[SessionStateLog] = database withSession {
    implicit session =>
    val q3 = for { s <- session_state_logs if s.session === id } yield s
    q3.list
}
def getAllBySessions(ids: List[Int]):List[SessionStateLog] = database withSession {
    implicit session =>
    val q3 = for { s <- session_state_logs if s.session inSetBind ids } yield s
    q3.list
}
 def ddl_create = {
    database withSession {
      implicit session =>
      session_state_logs.ddl.create
    }
  }
  def pull_object(s: SessionStateLog) = database withSession {
    implicit session ⇒
      session_state_logs returning session_state_logs.map(_.id) += s
  }
  def ddl_drop = {
    database withSession {
      implicit session =>
       session_state_logs.ddl.drop
    }
  }
}

