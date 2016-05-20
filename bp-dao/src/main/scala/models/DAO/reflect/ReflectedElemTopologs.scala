package models.DAO.reflect

import slick.driver.PostgresDriver.api._
import com.github.nscala_time.time.Imports._
import com.github.tototoshi.slick.JdbcJodaSupport._
//import com.github.tminglei.slickpg.date.PgDateJdbcTypes
import slick.model.ForeignKeyAction
import models.DAO.conversion.DatabaseCred

class ReflectElemTopologs(tag: Tag) extends Table[RefElemTopology](tag, "reflected_elem_topologs") {
  def id          = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def reflection  = column[Int]("reflection_id")
  def hash        = column[String]("hash")

  def front_elem_id = column[Option[Int]]("front_elem_id")
  def space_elem_id = column[Option[Int]]("space_elem_id")
  def space_id      = column[Option[Int]]("space_id")


  def created_at = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at = column[Option[org.joda.time.DateTime]]("updated_at")

  def * = (id.?, reflection,
          front_elem_id,
          space_elem_id,
          hash,
           created_at, updated_at,space_id) <> (RefElemTopology.tupled, RefElemTopology.unapply)

  def reflectFK      = foreignKey("ref_topo_reflect_fk", reflection, models.DAO.reflect.RefDAO.refs)(_.id, onDelete = ForeignKeyAction.Cascade)
  def ref_procelemFK = foreignKey("ref_topo_procelem_fk", front_elem_id, ProcElemReflectionDAO.proc_element_reflections)(_.id, onDelete = ForeignKeyAction.Cascade)
  def ref_spaceelemFK= foreignKey("ref_topo_spaceelem_fk", space_elem_id, SpaceElementReflectionDAO.space_element_reflections)(_.id, onDelete = ForeignKeyAction.Cascade)
  def spaceFK        = foreignKey("ref_topo_space_fk", space_id, SpaceReflectionDAO.space_refs)(_.id, onDelete = ForeignKeyAction.Cascade)

}
case class RefElemTopology(id: Option[Int],
  reflection: Int,
  front_elem_id: Option[Int],
  space_elem_id: Option[Int],
  hash: String = "",
  created_at: Option[org.joda.time.DateTime] = None,
  updated_at: Option[org.joda.time.DateTime] = None,
  space_id: Option[Int] = None)


object ReflectElemTopologDAOF {
  import akka.actor.ActorSystem


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
  val reflected_elem_topologs = ReflectElemTopologDAO.reflected_elem_topologs

  private def filterByIdsQuery(ids: List[Int]): Query[ReflectElemTopologs, RefElemTopology, Seq] =
    reflected_elem_topologs.filter(_.id inSetBind ids)
  private def filterByReflection(reflection: Int): Query[ReflectElemTopologs, RefElemTopology, Seq] =
    reflected_elem_topologs.filter(_.reflection === reflection)

  def findByRef(reflection: Int):Future[Seq[RefElemTopology]] = {
    db.run(filterByReflection(reflection).result)
  }

}

object ReflectElemTopologDAO {
  /**
   * Actions
   */
  import scala.util.Try

  import DatabaseCred.database
  import models.DAO.conversion.Implicits._



  val reflected_elem_topologs = TableQuery[ReflectElemTopologs]

  def pull_object(s: RefElemTopology) = database withSession {
    implicit session ⇒
      reflected_elem_topologs returning reflected_elem_topologs.map(_.id) += s
  }

  def findByRef(id: Int):List[RefElemTopology] = database withSession {
    implicit session =>
    val q3 = for { s <- reflected_elem_topologs if s.reflection === id } yield s
    q3.list
  }
  def findByRef(ids: List[Int]):List[RefElemTopology] = database withSession {
    implicit session =>
    val q3 = for { s <- reflected_elem_topologs if s.reflection inSetBind ids } yield s
    q3.list
  }

  def get(k: Int):Option[RefElemTopology] = database withSession {
    implicit session ⇒
      val q3 = for { s ← reflected_elem_topologs if s.id === k } yield s
      q3.list.headOption
  }
  def isFront(k: Int):Boolean = database withSession {
    implicit session ⇒
      val q3 = for { s ← reflected_elem_topologs if s.id === k } yield s
      q3.list.headOption match {
        case Some(el) => el.front_elem_id.isDefined
        case _ => false
      }
  }
  def isNested(k: Int):Boolean = database withSession {
    implicit session ⇒
      val q3 = for { s ← reflected_elem_topologs if s.id === k } yield s
      q3.list.headOption match {
        case Some(el) => el.space_elem_id.isDefined
        case _ => false
      }
  }




  def update(id: Int, topology: RefElemTopology) = database withSession { implicit session ⇒
    val topologyToUpdate: RefElemTopology = topology.copy(Option(id))
    reflected_elem_topologs.filter(_.id === id).update(topologyToUpdate)
  }
  def delete(id: Int) = database withSession { implicit session ⇒
    reflected_elem_topologs.filter(_.id === id).delete
  }
  def count: Int = database withSession { implicit session ⇒
    Query(reflected_elem_topologs.length).first
  }

  def ddl_create = {
    database withSession {
      implicit session =>
      reflected_elem_topologs.ddl.create
    }
  }
  def ddl_drop = {
    database withSession {
      implicit session =>
       reflected_elem_topologs.ddl.drop
    }
  }

  def getAll = database withSession {
    implicit session ⇒
      val q3 = for { s ← reflected_elem_topologs } yield s
      q3.list.sortBy(_.id)
  }
}
