package models.DAO.sessions
import slick.driver.PostgresDriver.api._
import com.github.nscala_time.time.Imports._
import com.github.tototoshi.slick.PostgresJodaSupport._
import models.DAO.conversion.DatabaseCred
import slick.model.ForeignKeyAction
import main.scala.simple_parts.process._
import main.scala.bprocesses.refs._

class SessionSpaces(tag: Tag) extends Table[SessionSpaceDTO](tag, "session_spaces") {
  def id        = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def bprocess  = column[Int]("process_id")
  def session   = column[Int]("session_id")
  def index     = column[Int]("index")
  def container = column[Boolean]("container", O.Default(false))
  def subbrick  = column[Boolean]("subbrick",  O.Default(false))

  def brick_front  = column[Option[Int]]("brick_front_id")
  def brick_nested = column[Option[Int]]("brick_nested_id")
  def nestingLevel = column[Int]("nesting_level")


  def created_at = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at = column[Option[org.joda.time.DateTime]]("updated_at")


  def * = (id.?, bprocess, session, index, container, subbrick, brick_front, brick_nested, nestingLevel,
           created_at, updated_at) <> (SessionSpaceDTO.tupled, SessionSpaceDTO.unapply)
  def bpFK       = foreignKey("s_sp_bprocess_fk", bprocess, models.DAO.BPDAOF.bprocesses)(_.id, onDelete = ForeignKeyAction.Cascade)
  def sessionFK  = foreignKey("s_sp_session_fk", session,  models.DAO.BPSessionDAOF.bpsessions)(_.id, onDelete = ForeignKeyAction.Cascade)

}
case class SessionSpaceDTO(id: Option[Int],
                      bprocess: Int,
                      session: Int,
                      index:Int,
                      container:Boolean,
                      subbrick:Boolean,
                      brick_front:Option[Int]=None,
                      brick_nested:Option[Int]=None,
                      nestingLevel: Int = 1,
                      created_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now),
                      updated_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now)) {

import main.scala.utils._
import main.scala.bprocesses._
/*
  // @example method, did not fully implemented. primary implementation in Builder object.
  def cast_nested(bprocess: BProcess, space_elems: List[SpaceElementDTO]):Option[Space] = {
    val brick = bprocess.findNestedBricks().find(brick => brick.space_parent_id == id)
    if (brick.isDefined) {
    this match {
      case x => { // find front stuff
        Option(
          Space.apply(index, brick.get, subbrick, container, false, id)
        )
      }
      case y => { // find nested stuff
       None
      }
      case _ => None
    }

  } else {
    None
  }
  }
  def castFront(bprocess: BProcess, space_elems: List[SpaceElementDTO]):Option[Space] = {
// TODO: to space casting
// TODO: Refactor

    this match {
      case x => { // find front stuff
        Option(
          Space.apply(index, bprocess.findFrontBrickById(brick_front).get, subbrick, container, false, id)
        )
      }
      case y => { // find nested stuff
       None
      }
      case _ => None
    }

  }
*/

}

/*
object SpaceDCO {
  def conv(el: UnitSpaceRef, business: Int, process: Int, index: Int, brick_front: Int): BPSpaceDTO = {
    BPSpaceDTO(
                      None,
                      process,
                      index,
                      container = true,
                      subbrick = false,
                      brick_front = Some(brick_front),
                      brick_nested=None,
                      nestingLevel = 1,
                      el.created_at,
                      el.updated_at)
  }
}
*/
object SessionSpaceDAOF {
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
  val session_spaces = TableQuery[SessionSpaces]


  private def filterQuery(id: Int): Query[SessionSpaces, SessionSpaceDTO, Seq] =
    session_spaces.filter(_.id === id)
  private def filterQueryBySession(id: Int): Query[SessionSpaces, SessionSpaceDTO, Seq] =
    session_spaces.filter(_.session === id)
  private def filterByLaunchesQuery(ids: List[Int]): Query[SessionSpaces, SessionSpaceDTO, Seq] =
    session_spaces.filter(_.session inSetBind ids)

  def findByLaunchesIds(bpsId: List[Int]) = db.run(filterByLaunchesQuery(bpsId).result)

  def findBySession(k: Int):Future[Seq[SessionSpaceDTO]] =  {
      db.run(filterQueryBySession(k).result)
  }

}
object SessionSpaceDAO {
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
  val session_spaces = TableQuery[SessionSpaces]
  private def filterQuery(id: Int): Query[SessionSpaces, SessionSpaceDTO, Seq] =
    session_spaces.filter(_.id === id)

  private def filterSessionQuery(id: Int): Query[SessionSpaces, SessionSpaceDTO, Seq] =
    session_spaces.filter(_.session === id)
  private def filterBrickFrontQuery(id: Int): Query[SessionSpaces, SessionSpaceDTO, Seq] =
    session_spaces.filter(_.brick_front === id)
  private def filterBrickNestedQuery(id: Int): Query[SessionSpaces, SessionSpaceDTO, Seq] =
    session_spaces.filter(_.brick_nested === id)
  private def filterProcessQuery(id: Int): Query[SessionSpaces, SessionSpaceDTO, Seq] =
    session_spaces.filter(_.bprocess === id)
  private def filterProcessSessionQuery(id: Int, session_id: Int): Query[SessionSpaces, SessionSpaceDTO, Seq] =
    session_spaces.filter(sp => sp.bprocess === id && sp.session === session_id)

  private def renewIndexQuery(bprocess: Int, index_num: Int): Query[SessionSpaces, SessionSpaceDTO, Seq] =
    session_spaces.filter(sp => sp.bprocess === bprocess && sp.index > index_num)




  def pull_object(s: SessionSpaceDTO) =   {
      await( db.run(session_spaces returning session_spaces.map(_.id) += s))
  }


  def lastIndexOfSpace(id: Int) =   {
      val q3 = await(db.run(filterQuery(id).result)).toList
      val xs = q3.map(_.index)
      if (xs.isEmpty) 1
      else xs.max + 1
  }
  def get(k: Int) =   {
      await(db.run(filterQuery(k).result.headOption))
  }

  def findBySession(k: Int) =   {
      await(db.run(filterSessionQuery(k).result)).toList
  }

  def getAllByFront(k: Int) =   {
      await(db.run(filterBrickFrontQuery(k).result)).toList
  }

  def getAllByNested(k: Int) =   {
      await(db.run(filterBrickNestedQuery(k).result)).toList
  }

  def findByBPId(id: Int) = {
     await(db.run(filterProcessQuery(id).result)).toList
  }

  def findByBPSessionId(id: Int, session_id: Int) = {
    await(db.run(filterProcessSessionQuery(id, session_id).result)).toList
  }

  def deleteOwnedSpace(elem_id:Option[Int],spelem_id:Option[Int]) = {
    if (elem_id.isDefined) {
        getAllByFront(elem_id.get).map(_.id.get).foreach{ id => delete(id) }
    }
    if (spelem_id.isDefined) {
        getAllByNested(spelem_id.get).map(_.id.get).foreach{ id => delete(id) }
    }
  }


  def update(id: Int, bpspace: SessionSpaceDTO) = {
      val spToUpdate: SessionSpaceDTO = bpspace.copy(Option(id))
      await( db.run(session_spaces.filter(_.id === id).update(spToUpdate) ))
  }


  def delete(id: Int) = {
    val sp = get(id)
    val res = session_spaces.filter(_.id === id).delete
    sp match {
       case Some(space) => renewIndex(space.bprocess, space.index)
       case _ =>
    }
    res
  }


  val create: DBIO[Unit] = session_spaces.schema.create
  val drop: DBIO[Unit] = session_spaces.schema.drop
  def ddl_create = db.run(create)
  def ddl_drop = db.run(drop)


  def renewIndex(bprocess: Int, index_num: Int) = {
      val q3 = await(db.run(renewIndexQuery(bprocess, index_num).result)).toList
      val ordered = q3.zipWithIndex.map(sp => sp._1.copy(index = (sp._2 + 1) + (index_num - 1)))
      //val ordered = q3.list.zipWithIndex.map(sp => sp._1.copy(index = sp._2+index_num))
      ordered.foreach { sp =>
         update(sp.id.get, sp)
      }
  }



}
