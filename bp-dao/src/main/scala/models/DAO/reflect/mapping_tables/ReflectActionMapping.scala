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


class ReflectActionMappings(tag: Tag) extends Table[ReflectedActionMap](tag, "reflect_action_mappings") {
  def id               = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def reflection       = column[Int]("reflection_id")
  def ref_action       = column[Option[Int]]("ref_action")

  def element_action = column[Int]("element_action")

  def created_at = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at = column[Option[org.joda.time.DateTime]]("updated_at")

  def * = (id.?, reflection,
          ref_action,
          element_action,
          created_at, updated_at) <> (ReflectedActionMap.tupled, ReflectedActionMap.unapply)

  def reflectFK          = foreignKey("reflect_action_mappings_reflect_fk", 
      reflection, models.DAO.reflect.RefDAO.refs)(_.id, onDelete = ForeignKeyAction.Cascade)
  def ref_actionFK          = foreignKey("reflect_action_mappings_ref_action_fk", 
      ref_action, models.DAO.reflect.ReactionRefDAOF.reaction_refs)(_.id, onDelete = ForeignKeyAction.SetNull)
  def elementActionFK = foreignKey("reflect_action_mappings_element_action_fk", 
      element_action, models.DAO.ReactionDAO.reactions)(_.id, onDelete = ForeignKeyAction.Cascade)

}
case class ReflectedActionMap(id: Option[Int],
  reflection: Int,
  ref_action: Option[Int],
  element_action: Int,
  created_at: Option[org.joda.time.DateTime] = None,
  updated_at: Option[org.joda.time.DateTime] = None)


object ReflectActionMappingsDAO {
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
  val reflect_action_mappings = TableQuery[ReflectActionMappings]

  private def filterQuery(id: Int): Query[ReflectActionMappings, ReflectedActionMap, Seq] =
    reflect_action_mappings.filter(_.id === id)
  private def filterByIdsQuery(ids: List[Int]): Query[ReflectActionMappings, ReflectedActionMap, Seq] =
    reflect_action_mappings.filter(_.id inSetBind ids)

  private def filterByElementAction(element_action: Int): Query[ReflectActionMappings, ReflectedActionMap, Seq] =
    reflect_action_mappings.filter(_.element_action === element_action) 
  private def filterByElementActions(element_actions: Seq[Int]): Query[ReflectActionMappings, ReflectedActionMap, Seq] =
    reflect_action_mappings.filter(_.element_action inSetBind element_actions) 


  private def filterByReflection(reflection: Int): Query[ReflectActionMappings, ReflectedActionMap, Seq] =
    reflect_action_mappings.filter(_.reflection === reflection)
  private def filterByReflections(reflections: List[Int]): Query[ReflectActionMappings, ReflectedActionMap, Seq] =
    reflect_action_mappings.filter(_.reflection inSetBind reflections)


  def pull_object(s: ReflectedActionMap) =   {
      await(db.run( reflect_action_mappings returning reflect_action_mappings.map(_.id) += s ))
  }
  def pull(s: ReflectedActionMap) = 
    db.run( reflect_action_mappings returning reflect_action_mappings.map(_.id) += s )
    
  def findByElementAction(element_action: Int):Future[Option[ReflectedActionMap]] = 
    db.run(filterByElementAction(element_action).result.headOption)

  def findByElementActions(element_actions: Seq[Int]):Future[Seq[ReflectedActionMap]] = 
    db.run(filterByElementActions(element_actions).result)  


  def findByRef(id: Int):List[ReflectedActionMap] =   {
    await(db.run(filterByReflection(id).result)).toList
  }

  def findByRef(ids: List[Int]):List[ReflectedActionMap] =   {
    await(db.run(filterByReflections(ids).result)).toList
  }

  def get(k: Int):Option[ReflectedActionMap] =   {
    await(db.run(filterQuery(k).result.headOption))
  }


  def update(id: Int, topology: ReflectedActionMap) =   {
    val topologyToUpdate: ReflectedActionMap = topology.copy(Option(id))
    await(db.run( reflect_action_mappings.filter(_.id === id).update(topologyToUpdate) ))
  }
  def delete(id: Int) =   {
    await(db.run( reflect_action_mappings.filter(_.id === id).delete ))
  }


  val create: DBIO[Unit] = reflect_action_mappings.schema.create
  val drop: DBIO[Unit] = reflect_action_mappings.schema.drop
  def ddl_create = db.run(create)
  def ddl_drop = db.run(drop)


}



