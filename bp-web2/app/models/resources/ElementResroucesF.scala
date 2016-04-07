package models.DAO

import models.DAO.conversion.DatabaseCred
import models.DAO._
import models.DAO.conversion.DatabaseFuture._
import com.github.nscala_time.time.Imports._
import models.DAO.conversion.DatabaseCred.dbConfig.driver.api._
import com.github.tototoshi.slick.JdbcJodaSupport._


/*
 Try implement this shit, for nested objects, like slats and entities
object Foo {
  def fromRow(id: Int, myInt: Int, myString: String): Foo = Foo(id, Bar(myInt, myString))
  def toRow(f: Foo) = Some((f.id, f.myBar.myInt, f.myBar.myString))
}

Then in your table schema:

def * = id ~ myInt ~ myString <> (Foo.fromRow _, Foo.toRow _)
*/

class ElementResourcesF(tag: Tag) extends Table[ElementResourceDTO](tag, "element_resources"){
  def id         = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def element    = column[Int]("element_id")
  def process    = column[Int]("process_id")
  def resource   = column[Int]("resource_id")
  def entities   = column[String]("entities", O.Default(""))
  def created_at = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at = column[Option[org.joda.time.DateTime]]("updated_at")
  def elementFK  = foreignKey("el_res_fk", element, models.DAO.ElemTopologDAO.elem_topologs)(_.id, onDelete = ForeignKeyAction.Cascade)
  def resFK      = foreignKey("res_fk", resource, models.DAO.ResourceDAO.resources)(_.id, onDelete = ForeignKeyAction.Cascade)
  def bpFK       = foreignKey("el_res_sp_bprocess_fk", process, models.DAO.BPDAO.bprocesses)(_.id, onDelete = ForeignKeyAction.Cascade)

  def * = (id.?, element, process, resource,entities,
           created_at,
           updated_at) <> (ElementResourceDTO.tupled, ElementResourceDTO.unapply)
}
class SessionElementResourcesF(tag: Tag) extends Table[SessionElementResourceDTO](tag, "session_element_resources"){
  def id         = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def element    = column[Int]("session_element_id")
  def process    = column[Int]("process_id")
  def session    = column[Int]("session_id")
  def resource   = column[Int]("resource_id")
  def entities   = column[String]("entities", O.Default(""))
  def created_at = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at = column[Option[org.joda.time.DateTime]]("updated_at")
  def sesElementFK  = foreignKey("ses_el_res_fk", element, models.DAO.SessionElemTopologDAO.session_elem_topologs)(_.id, onDelete = ForeignKeyAction.Cascade)
  def resFK      = foreignKey("ses_res_fk", resource, models.DAO.ResourceDAO.resources)(_.id, onDelete = ForeignKeyAction.Cascade)
  def bpFK       = foreignKey("s_res_sp_bprocess_fk", process, models.DAO.BPDAO.bprocesses)(_.id, onDelete = ForeignKeyAction.Cascade)
  def sessionFK  = foreignKey("s_res_s_sp_session_fk", session, models.DAO.BPSessionDAO.bpsessions)(_.id, onDelete = ForeignKeyAction.Cascade)

  def * = (id.?, element, process, session, resource,entities,
           created_at,
           updated_at) <> (SessionElementResourceDTO.tupled, SessionElementResourceDTO.unapply)
}



object ElementResourceDAOF {
  import akka.actor.ActorSystem
  import akka.stream.ActorFlowMaterializer
  import akka.stream.scaladsl.Source
  import slick.backend.{StaticDatabaseConfig, DatabaseConfig}

  import slick.jdbc.meta.MTable
  import scala.concurrent.ExecutionContext.Implicits.global
  import scala.concurrent.duration.Duration
  import scala.concurrent.{ExecutionContext, Awaitable, Await, Future}
  import scala.util.Try
  //import dbConfig.driver.api._ //
  def await[T](a: Awaitable[T])(implicit ec: ExecutionContext) = Await.result(a, Duration.Inf)
  def awaitAndPrint[T](a: Awaitable[T])(implicit ec: ExecutionContext) = println(await(a))

  val element_resources = TableQuery[ElementResourcesF]
  private def filterQueryByProcess(process: Int): Query[ElementResourcesF, ElementResourceDTO, Seq] =
    element_resources.filter(_.process === process)
  private def filterQuery(id: Int): Query[ElementResourcesF, ElementResourceDTO, Seq] =
    element_resources.filter(_.id === id)


  def getByProcess(k: Int): Future[Seq[ElementResourceDTO]] = db.run(filterQueryByProcess(k).result)

  def findById(id: Int): Future[ElementResourceDTO] = db.run(filterQuery(id).result.head)
  val create: DBIO[Unit] = element_resources.schema.create
  val drop: DBIO[Unit] = element_resources.schema.drop
  def ddl_create = db.run(create)
  def ddl_drop = db.run(drop)
  def pull(s: ElementResourceDTO):Future[Int] = db.run(element_resources returning element_resources.map(_.id) += s)
}


object SessionElementResourceDAOF {
  import akka.actor.ActorSystem
  import akka.stream.ActorFlowMaterializer
  import akka.stream.scaladsl.Source
  import slick.backend.{StaticDatabaseConfig, DatabaseConfig}

  import slick.jdbc.meta.MTable
  import scala.concurrent.ExecutionContext.Implicits.global
  import scala.concurrent.duration.Duration
  import scala.concurrent.{ExecutionContext, Awaitable, Await, Future}
  import scala.util.Try
  //import dbConfig.driver.api._ //
  def await[T](a: Awaitable[T])(implicit ec: ExecutionContext) = Await.result(a, Duration.Inf)
  def awaitAndPrint[T](a: Awaitable[T])(implicit ec: ExecutionContext) = println(await(a))

  val session_element_resources = TableQuery[SessionElementResourcesF]
  private def filterQueryByProcess(process: Int): Query[SessionElementResourcesF, SessionElementResourceDTO, Seq] =
    session_element_resources.filter(_.process === process)
  private def filterQuery(id: Int): Query[SessionElementResourcesF, SessionElementResourceDTO, Seq] =
    session_element_resources.filter(_.id === id)


  def findById(id: Int): Future[SessionElementResourceDTO] = db.run(filterQuery(id).result.head)
  val create: DBIO[Unit] = session_element_resources.schema.create
  val drop: DBIO[Unit] = session_element_resources.schema.drop
  def ddl_create = db.run(create)
  def ddl_drop = db.run(drop)
  def pull(s: SessionElementResourceDTO):Future[Int] = db.run(session_element_resources returning session_element_resources.map(_.id) += s)
}
