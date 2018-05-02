package models.DAO


//import slick.driver.PostgresDriver.api._
//import com.github.tminglei.slickpg.composite._
import models.DAO.conversion.{DatabaseCred, Implicits}
import org.joda.time.DateTime
//import slick.driver.PostgresDriver.api._
import scala.concurrent.Future
import slick.driver.PostgresDriver.api._
import com.github.nscala_time.time.Imports._
import com.github.tototoshi.slick.PostgresJodaSupport._
import com.github.tminglei.slickpg.composite._
//import com.github.tototoshi.slick.PostgresJodaSupport._
import scala.concurrent._
import ExecutionContext.Implicits.global
//  import slick.model.ForeignKeyAction
/*
 Try implement this shit, for nested objects, like slats and entities
object Foo {
  def fromRow(id: Int, myInt: Int, myString: String): Foo = Foo(id, Bar(myInt, myString))
  def toRow(f: Foo) = Some((f.id, f.myBar.myInt, f.myBar.myString))
}

Then in your table schema:

def * = id ~ myInt ~ myString <> (Foo.fromRow _, Foo.toRow _)
*/

case class ElementResourceDTO(
  var id: Option[Int],
  element_id: Int,
  process_id:Int,
  resource_id: Int,
  entities: String = "",
  created_at: Option[org.joda.time.DateTime] = None,
  updated_at: Option[org.joda.time.DateTime] = None
) {
  def fetchEntities:List[String] = {
    entities.split(",").toList
  }
}
case class SessionElementResourceDTO(
  var id: Option[Int],
  element_id: Int,
  process_id:Int,
  session_id:Int,
  resource_id: Int,
  entities: String = "",
  created_at: Option[org.joda.time.DateTime] = None,
  updated_at: Option[org.joda.time.DateTime] = None) {
  def fetchEntities:List[String] = {
    entities.split(",").toList
  }
}


class ElementResources(tag: Tag) extends Table[ElementResourceDTO](tag, "element_resources"){
  def id         = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def element    = column[Int]("element_id")
  def process    = column[Int]("process_id")
  def resource   = column[Int]("resource_id")
  def entities   = column[String]("entities", O.Default(""))
  def created_at = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at = column[Option[org.joda.time.DateTime]]("updated_at")
  def elementFK  = foreignKey("el_res_fk", element, models.DAO.ElemTopologDAO.elem_topologs)(_.id, onDelete = ForeignKeyAction.Cascade)
  def resFK      = foreignKey("res_fk", resource, models.DAO.ResourceDAO.resources)(_.id, onDelete = ForeignKeyAction.Cascade)
  def bpFK       = foreignKey("el_res_sp_bprocess_fk", process, models.DAO.BPDAOF.bprocesses)(_.id, onDelete = ForeignKeyAction.Cascade)

  def * = (id.?, element, process, resource,entities,
           created_at,
           updated_at) <> (ElementResourceDTO.tupled, ElementResourceDTO.unapply)
}
class SessionElementResources(tag: Tag) extends Table[SessionElementResourceDTO](tag, "session_element_resources"){
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
  def bpFK       = foreignKey("s_res_sp_bprocess_fk", process, models.DAO.BPDAOF.bprocesses)(_.id, onDelete = ForeignKeyAction.Cascade)
  def sessionFK  = foreignKey("s_res_s_sp_session_fk", session, models.DAO.BPSessionDAOF.bpsessions)(_.id, onDelete = ForeignKeyAction.Cascade)

  def * = (id.?, element, process, session, resource,entities,
           created_at,
           updated_at) <> (SessionElementResourceDTO.tupled, SessionElementResourceDTO.unapply)
}



object ElementResourceDAO {
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


  val element_resources = TableQuery[ElementResources]
  def pull_object(s: ElementResourceDTO) =   {
      await(db.run( element_resources returning element_resources.map(_.id) += s.copy(
      created_at = Some(org.joda.time.DateTime.now),
      updated_at = Some(org.joda.time.DateTime.now)) )) }


  def get(k: Int) =   {
      val q3 = for { s ← element_resources if s.id === k } yield s
      await(db.run(q3.result.headOption))
  }

  def getByProcess(k: Int) =   {
      val q3 = for { s ← element_resources if s.process === k } yield s
      await(db.run(q3.result)).toList
  }

  def getByProcesses(k: List[Int]) =   {
      val q3 = for { s ← element_resources if s.process inSetBind k } yield s
      await(db.run(q3.result)).toList
  }

  def getAllByElement(k: Int):List[ElementResourceDTO] =   {
      val q3 = for { s ← element_resources if s.element === k } yield s
      await(db.run(q3.result)).toList
  }
  def update(id: Int, annotation: ElementResourceDTO) =   {
    val element_resourcesUpdate: ElementResourceDTO = annotation.copy(id = Option(id), updated_at = Some(org.joda.time.DateTime.now) )
    await(db.run( element_resources.filter(_.id === id).update(element_resourcesUpdate) ))
  }

  def delete(id: Int) =   {
    await(db.run( element_resources.filter(_.id === id).delete ))
  }

  def getAll =   {
      val q3 = for { s ← element_resources } yield s
      await(db.run(q3.result)).toList.sortBy(_.id)
  }

  val create: DBIO[Unit] = element_resources.schema.create
  val drop: DBIO[Unit] = element_resources.schema.drop

  def ddl_create = db.run(create)
  def ddl_drop = db.run(drop)
}


object SessionElementResourceDAO {
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

  val session_element_resources = TableQuery[SessionElementResources]
  def pull_object(s: SessionElementResourceDTO) =   {
       await(db.run( session_element_resources returning session_element_resources.map(_.id) += s.copy(
      created_at = Some(org.joda.time.DateTime.now),
      updated_at = Some(org.joda.time.DateTime.now)) ))

    }


  def get(k: Int) =   {
      val q3 = for { s ← session_element_resources if s.id === k } yield s
      await(db.run(q3.result.headOption))
  }
  def getByProcess(k: Int) =   {

      val q3 = for { s ← session_element_resources if s.process === k } yield s
      await(db.run(q3.result)).toList
  }
  def getAllByElement(k: Int):List[SessionElementResourceDTO] =   {

      val q3 = for { s ← session_element_resources if s.element === k } yield s
      await(db.run(q3.result)).toList
  }
  def getBySession(k: Int) =   {

      val q3 = for { s ← session_element_resources if s.session === k } yield s
      await(db.run(q3.result)).toList
  }
  def update(id: Int, annotation: SessionElementResourceDTO) =   {
    val element_resourcesUpdate: SessionElementResourceDTO = annotation.copy(id = Option(id),
      updated_at = Some(org.joda.time.DateTime.now))
    await(db.run( session_element_resources.filter(_.id === id).update(element_resourcesUpdate) ))
  }
  def delete(id: Int) =   {
    await(db.run( session_element_resources.filter(_.id === id).delete ))
  }
  val create: DBIO[Unit] = session_element_resources.schema.create
  val drop: DBIO[Unit] = session_element_resources.schema.drop

  def ddl_create = db.run(create)
  def ddl_drop = db.run(drop)
}
