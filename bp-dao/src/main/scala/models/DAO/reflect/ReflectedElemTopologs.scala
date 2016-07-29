package models.DAO.reflect

import slick.driver.PostgresDriver.api._
import com.github.nscala_time.time.Imports._
import com.github.tototoshi.slick.PostgresJodaSupport._
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
  import com.github.tototoshi.slick.PostgresJodaSupport._
  import scala.concurrent.duration.Duration
  import scala.concurrent.{ExecutionContext, Awaitable, Await, Future}
  import scala.util.Try
  import models.DAO.conversion.DatabaseFuture._
  //import dbConfig.driver.api._ //
  def await[T](a: Awaitable[T])(implicit ec: ExecutionContext) = Await.result(a, Duration.Inf)
  def awaitAndPrint[T](a: Awaitable[T])(implicit ec: ExecutionContext) = println(await(a))
  val reflected_elem_topologs = TableQuery[ReflectElemTopologs]

  private def filterByIdsQuery(ids: List[Int]): Query[ReflectElemTopologs, RefElemTopology, Seq] =
    reflected_elem_topologs.filter(_.id inSetBind ids)
  private def filterByReflection(reflection: Int): Query[ReflectElemTopologs, RefElemTopology, Seq] =
    reflected_elem_topologs.filter(_.reflection === reflection)
  private def filterByFrontId(id: Int): Query[ReflectElemTopologs, RefElemTopology, Seq] =
    reflected_elem_topologs.filter(_.front_elem_id === id)


  def findByFrontId(id: Int):Future[Option[RefElemTopology]] = {
    db.run(filterByFrontId(id).result.headOption)
  }

  def findByRef(reflection: Int):Future[Seq[RefElemTopology]] = {
    db.run(filterByReflection(reflection).result)
  }

}

object ReflectElemTopologDAO {
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
  val reflected_elem_topologs = TableQuery[ReflectElemTopologs]

  private def filterQuery(id: Int): Query[ReflectElemTopologs, RefElemTopology, Seq] =
    reflected_elem_topologs.filter(_.id === id)
  private def filterByIdsQuery(ids: List[Int]): Query[ReflectElemTopologs, RefElemTopology, Seq] =
    reflected_elem_topologs.filter(_.id inSetBind ids)
  private def filterByReflection(reflection: Int): Query[ReflectElemTopologs, RefElemTopology, Seq] =
    reflected_elem_topologs.filter(_.reflection === reflection)
  private def filterByReflections(reflections: List[Int]): Query[ReflectElemTopologs, RefElemTopology, Seq] =
    reflected_elem_topologs.filter(_.reflection inSetBind reflections)


  def pull_object(s: RefElemTopology) =   {
      await(db.run( reflected_elem_topologs returning reflected_elem_topologs.map(_.id) += s ))
  }

  def findByRef(id: Int):List[RefElemTopology] =   {
    await(db.run(filterByReflection(id).result)).toList
  }

  def findByRef(ids: List[Int]):List[RefElemTopology] =   {
    await(db.run(filterByReflections(ids).result)).toList
  }

  def get(k: Int):Option[RefElemTopology] =   {
    await(db.run(filterQuery(k).result.headOption))
  }

  def isFront(k: Int):Boolean =   {
      val q3 = get(k)
      q3 match {
        case Some(el) => el.front_elem_id.isDefined
        case _ => false
      }
  }

  def isNested(k: Int):Boolean =   {
      val q3 = get(k)
      q3 match {
        case Some(el) => el.space_elem_id.isDefined
        case _ => false
      }
  }




  def update(id: Int, topology: RefElemTopology) =   {
    val topologyToUpdate: RefElemTopology = topology.copy(Option(id))
    await(db.run( reflected_elem_topologs.filter(_.id === id).update(topologyToUpdate) ))
  }
  def delete(id: Int) =   {
    await(db.run( reflected_elem_topologs.filter(_.id === id).delete ))
  }


  val create: DBIO[Unit] = reflected_elem_topologs.schema.create
  val drop: DBIO[Unit] = reflected_elem_topologs.schema.drop
  def ddl_create = db.run(create)
  def ddl_drop = db.run(drop)


}
