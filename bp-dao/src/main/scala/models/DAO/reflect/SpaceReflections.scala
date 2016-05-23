package models.DAO.reflect


import slick.driver.PostgresDriver.api._
import com.github.nscala_time.time.Imports._
import com.github.tototoshi.slick.PostgresJodaSupport._
import slick.model.ForeignKeyAction
import models.DAO.BPDAO._
import models.DAO.resources.BusinessDTO._
import com.github.tminglei.slickpg.composite._
import models.DAO.conversion.{DatabaseCred, Implicits}
import main.scala.simple_parts.process.Units._

import main.scala.bprocesses.refs.UnitRefs._

class SpaceReflections(tag: Tag) extends Table[UnitSpaceRef](tag, "space_refs") {

  def id          = column[Int]("id", O.PrimaryKey, O.AutoInc) // This is the primary key column
  def reflection  = column[Int]("reflection_id")
  def index       = column[Int]("index")
  def container   = column[Boolean]("container")
  def subbrick    = column[Boolean]("subbrick")
  def brick_front = column[Option[Int]]("brick_front")
  def brick_nested= column[Option[Int]]("brick_nested")

  def nestingLevel= column[Int]("nestingLevel")


  def created_at  = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at  = column[Option[org.joda.time.DateTime]]("updated_at")


  def reflectFK   = foreignKey("sp_ref_reflect_fk", reflection, models.DAO.reflect.RefDAO.refs)(_.id, onDelete = ForeignKeyAction.Cascade)


  def * = (id.?,
          reflection,
          index,
          container,
          subbrick,
          brick_front,
          brick_nested,
          nestingLevel,
          created_at,
          updated_at) <> (UnitSpaceRef.tupled, UnitSpaceRef.unapply)

}

import main.scala.simple_parts.process._
import main.scala.bprocesses._




object SpaceReflectionDAOF {
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
  val space_refs = TableQuery[SpaceReflections]

  private def filterByIdsQuery(ids: List[Int]): Query[SpaceReflections, UnitSpaceRef, Seq] =
    space_refs.filter(_.id inSetBind ids)
  private def filterByReflection(reflection: Int): Query[SpaceReflections, UnitSpaceRef, Seq] =
    space_refs.filter(_.reflection === reflection)
  private def filterByReflections(reflections: List[Int]): Query[SpaceReflections, UnitSpaceRef, Seq] =
    space_refs.filter(_.reflection inSetBind reflections)
  private def filterByFronts(fronts: List[Int]): Query[SpaceReflections, UnitSpaceRef, Seq] =
    space_refs.filter(_.brick_front inSetBind fronts)


  def findByElemRefs(ids: List[Int]) = {
       db.run(filterByFronts(ids).result)
  }

  def findByRef(reflection: Int):Future[Seq[UnitSpaceRef]] = {
    db.run(filterByReflection(reflection).result)
  }
  def findByRef(reflections: List[Int]):Future[Seq[UnitSpaceRef]] = {
    db.run(filterByReflections(reflections).result)
  }
  def retrive(k: Int, process: Int, brick_front:Option[Int]=None,brick_nested:Option[Int]=None):Future[List[UnitSpace]] = {
      findByRef(k).map { elems =>
        elems.map(e => e.reflect(process, brick_front, brick_nested)).toList
      }
  }
}

/**
 * Actions
 */
object SpaceReflectionDAO {
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
  val space_refs = TableQuery[SpaceReflections]

  private def filterByIdsQuery(ids: List[Int]): Query[SpaceReflections, UnitSpaceRef, Seq] =
    space_refs.filter(_.id inSetBind ids)
  private def filterByReflection(reflection: Int): Query[SpaceReflections, UnitSpaceRef, Seq] =
    space_refs.filter(_.reflection === reflection)
  private def filterByReflections(reflections: List[Int]): Query[SpaceReflections, UnitSpaceRef, Seq] =
    space_refs.filter(_.reflection inSetBind reflections)
  private def filterByFronts(fronts: List[Int]): Query[SpaceReflections, UnitSpaceRef, Seq] =
    space_refs.filter(_.brick_front inSetBind fronts)
  private def filterQuery(id: Int): Query[SpaceReflections, UnitSpaceRef, Seq] =
    space_refs.filter(_.id === id)



  def pull_object(s: UnitSpaceRef) =   {
    await(db.run( space_refs returning space_refs.map(_.id) += s ))
  }

  def lastIndexOfSpace(id: Int) =   {
      val q3 = await(db.run(filterQuery(id).result))
      val xs = q3.map(_.index)
      if (xs.isEmpty) 1
      else xs.max + 1
  }

  def findById(id: Int) = {
    await(db.run(filterQuery(id).result.headOption))
  }
  def findByRef(id: Int) = {
    await(db.run(filterByReflection(id).result)).toList
  }
  def findByElemRefs(ids: List[Int]) = {
    await(db.run(filterByFronts(ids).result)).toList
  }

  def retrive(k: Int, process: Int, brick_front:Option[Int]=None,brick_nested:Option[Int]=None):List[UnitSpace] =   {
      findByRef(k).map(e => e.reflect(process, brick_front, brick_nested))
  }

  def retrive_obj(obj: List[UnitSpaceRef], process: Int, brick_front:Option[Int]=None,
    brick_nested:Option[Int]=None):List[UnitSpace] = {
      obj.map(e => e.reflect(process, brick_front, brick_nested))
  }

  def update(id: Int, entity: UnitSpaceRef):Boolean = {
      findById(id) match {
      case Some(e) => {
        await(db.run( space_refs.filter(_.id === id).update(entity) ))
        true
      }
      case None => false
      }
  }


  def delete(id: Int) = {
    val sp = get(id)
    val res = await(db.run( space_refs.filter(_.id === id).delete ))
    res
  }

  val create: DBIO[Unit] = space_refs.schema.create
  val drop: DBIO[Unit] = space_refs.schema.drop
  def ddl_create = db.run(create)
  def ddl_drop = db.run(drop)

}

// TODO: Simple unified selectors that not include basic selectors
