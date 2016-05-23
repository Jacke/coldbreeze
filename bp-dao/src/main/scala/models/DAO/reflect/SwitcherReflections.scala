package models.DAO.reflect

import main.scala.bprocesses.{BProcess, BPLoggerResult}
import main.scala.simple_parts.process.ProcElems
import slick.driver.PostgresDriver.api._
import com.github.nscala_time.time.Imports._
import com.github.tototoshi.slick.PostgresJodaSupport._
//import com.github.tminglei.slickpg.date.PgDateJdbcTypes
import slick.model.ForeignKeyAction

import models.DAO.ProcElemDAO._
import models.DAO.BPDAO._
import models.DAO.BPStationDAO._
import models.DAO.conversion.DatabaseCred
import main.scala.simple_parts.process.Units._

import main.scala.bprocesses.refs.UnitRefs.{UnitSwitcherRef}

class SwitcherRefs(tag: Tag) extends Table[UnitSwitcherRef](tag, "switcher_refs") {
  def id          = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def reflection  = column[Int]("reflection_id")
  def switch_type = column[String]("switch_type")
  def priority    = column[Int]("priority", O.Default(2))
  def state_ref   = column[Int]("state_ref_id")
  def fn          = column[String]("fn")
  def target      = column[String]("target")
  def override_group = column[Int]("override_group", O.Default(0))

  def created_at = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at = column[Option[org.joda.time.DateTime]]("updated_at")

  def reflectFK = foreignKey("sw_ref_reflect_fk", reflection, models.DAO.reflect.RefDAO.refs)(_.id, onDelete = ForeignKeyAction.Cascade)

  def * = (id.?,
          reflection,
          switch_type,
          priority,
          state_ref,
          fn,
          target,
          override_group,
          created_at, updated_at) <> (UnitSwitcherRef.tupled, UnitSwitcherRef.unapply)

  def state_refFK = foreignKey("state_ref_fk", state_ref, models.DAO.reflect.BPStateRefDAO.state_refs)(_.id, onDelete = ForeignKeyAction.Cascade)
//def session_state_refFK = foreignKey("session_state_ref_fk", session_state_ref, SpaceElementReflectionDAO.space_element_reflections)(_.id, onDelete = ForeignKeyAction.Cascade)
}


object SwitcherRefDAOF {
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
  val switcher_refs = TableQuery[SwitcherRefs]

  private def filterByIdsQuery(ids: List[Int]): Query[SwitcherRefs, UnitSwitcherRef, Seq] =
    switcher_refs.filter(_.id inSetBind ids)
  private def filterByReflection(reflection: Int): Query[SwitcherRefs, UnitSwitcherRef, Seq] =
    switcher_refs.filter(_.reflection === reflection)

  def findByRef(reflection: Int):Future[Seq[UnitSwitcherRef]] = {
    db.run(filterByReflection(reflection).result)
  }

  def retrive(k: Int, process: Int, state_ref: Int, sess: Option[Int] = None):Future[List[UnitSwitcher]] = {
      findByRef(k).map { elems =>
        elems.map(e => e.reflect(process, state_ref, sess)).toList
      }
  }
}


object SwitcherRefDAO {
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
  val switcher_refs = TableQuery[SwitcherRefs]

  private def filterByIdsQuery(ids: List[Int]): Query[SwitcherRefs, UnitSwitcherRef, Seq] =
    switcher_refs.filter(_.id inSetBind ids)
  private def filterByReflection(reflection: Int): Query[SwitcherRefs, UnitSwitcherRef, Seq] =
    switcher_refs.filter(_.reflection === reflection)
  private def filterQuery(id: Int): Query[SwitcherRefs, UnitSwitcherRef, Seq] =
    switcher_refs.filter(_.id === id)

  def pull_object(s: UnitSwitcherRef) =   {
      await(db.run( switcher_refs returning switcher_refs.map(_.id) += s ))
  }

  def get(k: Int):Option[UnitSwitcherRef] =   {
    await(db.run(filterQuery(k).result.headOption))
  }
  def findByRef(id: Int) = {
    await(db.run(filterByReflection(id).result)).toList
  }

  def retrive(k: Int, process: Int, state_ref: Int, sess: Option[Int] = None):List[UnitSwitcher] =   {
      findByRef(k).map(e => e.reflect(process, state_ref, sess))
  }

  def update(id: Int, switcher: UnitSwitcherRef) =   {
    val switcherToUpdate: UnitSwitcherRef = switcher.copy(Option(id))
    await(db.run( switcher_refs.filter(_.id === id).update(switcherToUpdate) ))
  }
  def delete(id: Int) =   {
    await(db.run( switcher_refs.filter(_.id === id).delete ))
  }


  val create: DBIO[Unit] = switcher_refs.schema.create
  val drop: DBIO[Unit] = switcher_refs.schema.drop
  def ddl_create = db.run(create)
  def ddl_drop = db.run(drop)

}
