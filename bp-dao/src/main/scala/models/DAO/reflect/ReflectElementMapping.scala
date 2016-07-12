package models.DAO.reflect

import slick.driver.PostgresDriver.api._
import com.github.nscala_time.time.Imports._
import com.github.tototoshi.slick.PostgresJodaSupport._
//import com.github.tminglei.slickpg.date.PgDateJdbcTypes
import slick.model.ForeignKeyAction
import models.DAO.conversion.DatabaseCred

/*
   This part is mapping ref with topology elemenets 
   RefMaping 1-many> TopoElement (real, non ref topo element)
 */


class ReflectElementMappings(tag: Tag) extends Table[ReflectElementMap](tag, "reflect_element_mappings") {
  def id               = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def reflection       = column[Int]("reflection_id")
  def topology_element = column[Int]("topology_element_id")

  def created_at = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at = column[Option[org.joda.time.DateTime]]("updated_at")

  def * = (id.?, reflection,
          topology_element,
          created_at, updated_at) <> (ReflectElementMap.tupled, ReflectElementMap.unapply)

  def reflectFK          = foreignKey("reflect_element_mappings_reflect_fk", 
  		reflection, models.DAO.reflect.RefDAO.refs)(_.id, onDelete = ForeignKeyAction.Cascade)
  def topology_elementFK = foreignKey("reflect_element_mappings_topology_element_fk", 
  		topology_element, models.DAO.ElemTopologDAO.elem_topologs)(_.id, onDelete = ForeignKeyAction.Cascade)

}
case class ReflectElementMap(id: Option[Int],
  reflection: Int,
  topology_element: Int,
  created_at: Option[org.joda.time.DateTime] = None,
  updated_at: Option[org.joda.time.DateTime] = None)


object ReflectElementMappingsDAO {
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
  val reflect_element_mappings = TableQuery[ReflectElementMappings]

  private def filterQuery(id: Int): Query[ReflectElementMappings, ReflectElementMap, Seq] =
    reflect_element_mappings.filter(_.id === id)
  private def filterByIdsQuery(ids: List[Int]): Query[ReflectElementMappings, ReflectElementMap, Seq] =
    reflect_element_mappings.filter(_.id inSetBind ids)
  private def filterByReflection(reflection: Int): Query[ReflectElementMappings, ReflectElementMap, Seq] =
    reflect_element_mappings.filter(_.reflection === reflection)
  private def filterByReflections(reflections: List[Int]): Query[ReflectElementMappings, ReflectElementMap, Seq] =
    reflect_element_mappings.filter(_.reflection inSetBind reflections)


  def pull_object(s: ReflectElementMap) =   {
      await(db.run( reflect_element_mappings returning reflect_element_mappings.map(_.id) += s ))
  }

  def findByRef(id: Int):List[ReflectElementMap] =   {
    await(db.run(filterByReflection(id).result)).toList
  }

  def findByRef(ids: List[Int]):List[ReflectElementMap] =   {
    await(db.run(filterByReflections(ids).result)).toList
  }

  def get(k: Int):Option[ReflectElementMap] =   {
    await(db.run(filterQuery(k).result.headOption))
  }


  def update(id: Int, topology: ReflectElementMap) =   {
    val topologyToUpdate: ReflectElementMap = topology.copy(Option(id))
    await(db.run( reflect_element_mappings.filter(_.id === id).update(topologyToUpdate) ))
  }
  def delete(id: Int) =   {
    await(db.run( reflect_element_mappings.filter(_.id === id).delete ))
  }


  val create: DBIO[Unit] = reflect_element_mappings.schema.create
  val drop: DBIO[Unit] = reflect_element_mappings.schema.drop
  def ddl_create = db.run(create)
  def ddl_drop = db.run(drop)


}


