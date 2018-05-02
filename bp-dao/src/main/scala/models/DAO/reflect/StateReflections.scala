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

import main.scala.bprocesses.refs.{BPStateRef}
import main.scala.bprocesses.refs._
import main.scala.bprocesses._
class StateRefs(tag: Tag) extends Table[BPStateRef](tag, "state_refs") {
  def id          = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def reflection  = column[Int]("reflection_id")
  def title       = column[String]("title")
  def neutral     = column[String]("neutral")
  def process_state = column[Boolean]("process_state", O.Default(false))
  def on          = column[Boolean]("on", O.Default(false))
  def on_rate     = column[Int]("on_rate", O.Default(0))

  def space_id      = column[Option[Int]]("ref_space_id")
  def front_elem_id = column[Option[Int]]("ref_front_elem_id")
  def space_elem_id = column[Option[Int]]("ref_space_elem_id")


  def middle      = column[String]("middle", O.Default(""))
  def middleable  = column[Boolean]("middleable", O.Default(false))
  def oposite     = column[String]("oposite", O.Default(""))
  def opositable  = column[Boolean]("opositable", O.Default(false))

  def created_at  = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at  = column[Option[org.joda.time.DateTime]]("updated_at")

  def reflectFK       = foreignKey("st_ref_reflect_fk", reflection, models.DAO.reflect.RefDAO.refs)(_.id, onDelete = ForeignKeyAction.Cascade)
  def ref_procelemFK  = foreignKey("st_ref_ref_procelem_fk", front_elem_id, ProcElemReflectionDAO.proc_element_reflections)(_.id, onDelete = ForeignKeyAction.Cascade)
  def ref_spaceelemFK = foreignKey("st_ref_ref_spaceelem_fk", space_elem_id, SpaceElementReflectionDAO.space_element_reflections)(_.id, onDelete = ForeignKeyAction.Cascade)
  def spaceFK         = foreignKey("st_ref_ref_space_fk", space_elem_id, SpaceReflectionDAO.space_refs)(_.id, onDelete = ForeignKeyAction.Cascade)

  def lang        = column[String]("lang", O.Default("en"))
/*

var id:Option[Int],
  reflection:   Int,
  title:        String,
  var neutral: String = "",
  process_state:Boolean = false,
  front_elem_id:Option[Int],
  space_elem_id:Option[Int],
  created_at:   Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now),
  updated_at:   Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now),
  lang:         String = "en"*/

  def * = (id.?,
          reflection,
          title,
          neutral,
          process_state,
          on,
          on_rate,
          front_elem_id,
          space_elem_id,
          space_id,
          created_at, updated_at,
          lang,
          middle,
          middleable,
          oposite,
          opositable) <> (BPStateRef.tupled, BPStateRef.unapply)
}

object BPStateRefDAOF {
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
  val state_refs = TableQuery[StateRefs]

  private def filterByIdsQuery(ids: List[Int]): Query[StateRefs, BPStateRef, Seq] =
    state_refs.filter(_.id inSetBind ids)
  private def filterByReflection(reflection: Int): Query[StateRefs, BPStateRef, Seq] =
    state_refs.filter(_.reflection === reflection)

  def findByRef(reflection: Int):Future[Seq[BPStateRef]] = {
    db.run(filterByReflection(reflection).result)
  }
  def retrive(k: Int, process: Int, front_elem_id:Option[Int],
  space_elem_id:Option[Int], state_id:Option[Int]):Future[List[BPState]] = {
      findByRef(k).map { elems =>
        elems.map(e => e.reflect(process, front_elem_id, space_elem_id, state_id)).toList
      }
  }
}

object BPStateRefDAO {
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

  private def filterByIdsQuery(ids: List[Int]): Query[StateRefs, BPStateRef, Seq] =
    state_refs.filter(_.id inSetBind ids)
  private def filterByReflection(reflection: Int): Query[StateRefs, BPStateRef, Seq] =
    state_refs.filter(_.reflection === reflection)
  private def filterQuery(id: Int): Query[StateRefs, BPStateRef, Seq] =
    state_refs.filter(_.id === id)

  private def findOrCreateForElemQuery(titles:List[String], k: List[BPStateRef], front_elem_id:Option[Int], space_elem_id:Option[Int]): Query[StateRefs, BPStateRef, Seq] =
    state_refs.filter(s => (s.title inSetBind titles) && (s.front_elem_id === front_elem_id) && (s.space_elem_id === space_elem_id) )

  private def findOrCreateForSpaceQuery(titles:List[String], k: List[BPStateRef], space_id:Int): Query[StateRefs, BPStateRef, Seq] =
    state_refs.filter(s => (s.title inSetBind titles) && (s.space_id === space_id) )

  val state_refs = TableQuery[StateRefs]

  def pull_object(s: BPStateRef) =   {
    await(db.run( state_refs returning state_refs.map(_.id) += s ))
  }

  def get(k: Int):Option[BPStateRef] =   {
    await(db.run(filterQuery(k).result.headOption))
  }

  def findByRef(id: Int) = {
    await(db.run(filterByReflection(id).result)).toList
  }

  def findOrCreateForElem(k: List[BPStateRef], front_elem_id:Option[Int], space_elem_id:Option[Int]):List[Int] =   {
     val titles = k.map(state => state.title)
     val existed = await(db.run(findOrCreateForElemQuery(titles,k,front_elem_id, space_elem_id).result )).toList
     val filtereds = k.filter(state => existed.map(_.title).contains(state.title) )
     filtereds.map(filtered => pull_object(filtered))
  }

  def findOrCreateForSpace(k: List[BPStateRef], space_id:Int):List[Int] =   {
     val titles = k.map(state => state.title)
     val existed = await(db.run(findOrCreateForSpaceQuery(titles,k, space_id).result ) ).toList
     val filtereds = k.filter(state => existed.map(_.title).contains(state.title) )
     filtereds.map(filtered => pull_object(filtered))
  }

  def retrive(k: Int, process: Int, front_elem_id:Option[Int],
    space_elem_id:Option[Int], state_id:Option[Int]):List[BPState] =   {
      findByRef(k).map(e => e.reflect(process, front_elem_id, space_elem_id, state_id))
  }

  def update(id: Int, bpsession: BPStateRef) =   {
    val bpToUpdate: BPStateRef = bpsession.copy(Option(id))
    await(db.run( state_refs.filter(_.id === id).update(bpToUpdate) ))
  }

  def delete(id: Int) =   {
    await(db.run( state_refs.filter(_.id === id).delete ))
  }


  val create: DBIO[Unit] = state_refs.schema.create
  val drop: DBIO[Unit] = state_refs.schema.drop
  def ddl_create = db.run(create)
  def ddl_drop = db.run(drop)

}
