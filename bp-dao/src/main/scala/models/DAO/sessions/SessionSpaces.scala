package models.DAO.sessions
import models.DAO.driver.MyPostgresDriver1.simple._
import com.github.nscala_time.time.Imports._
import models.DAO.conversion.DatabaseCred
import slick.model.ForeignKeyAction
import main.scala.simple_parts.process.Units._
import main.scala.bprocesses.refs.UnitRefs._  

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
  def bpFK       = foreignKey("s_sp_bprocess_fk", bprocess, models.DAO.BPDAO.bprocesses)(_.id, onDelete = ForeignKeyAction.Cascade)
  def sessionFK  = foreignKey("s_sp_session_fk", session, models.DAO.BPSessionDAO.bpsessions)(_.id, onDelete = ForeignKeyAction.Cascade)

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
  import akka.stream.ActorFlowMaterializer
  import akka.stream.scaladsl.Source
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
  val session_spaces = SessionSpaceDAO.session_spaces

  private def filterQuery(id: Int): Query[SessionSpaces, SessionSpaceDTO, Seq] =
    session_spaces.filter(_.id === id)
  private def filterQueryBySession(id: Int): Query[SessionSpaces, SessionSpaceDTO, Seq] =
    session_spaces.filter(_.session === id)

  def findBySession(k: Int):Future[Seq[SessionSpaceDTO]] =  {
      db.run(filterQueryBySession(k).result)
  }  

}
object SessionSpaceDAO {
  import models.DAO.conversion.DatabaseCred._
  val session_spaces = TableQuery[SessionSpaces]

  def pull_object(s: SessionSpaceDTO) = database withSession {
    implicit session ⇒
      session_spaces returning session_spaces.map(_.id) += s
  }

  def lastIndexOfSpace(id: Int) = database withSession {
    implicit session =>
      val q3 = for { s ← session_spaces if s.id === id } yield s
      val xs = q3.list.map(_.index)

      if (xs.isEmpty) 1
      else xs.max + 1
  }
  def get(k: Int) = database withSession {
    implicit session ⇒
      val q3 = for { s ← session_spaces if s.id === k } yield s
      q3.list.headOption 
  }
  def findBySession(k: Int) = database withSession {
    implicit session ⇒
      val q3 = for { s ← session_spaces if s.session === k } yield s
      q3.list
  }  
  def getAllByFront(k: Int) = database withSession {
    implicit session ⇒
      val q3 = for { s ← session_spaces if s.brick_front === k } yield s
      q3.list 
  }
  def getAllByNested(k: Int) = database withSession {
    implicit session ⇒
      val q3 = for { s ← session_spaces if s.brick_nested === k } yield s
      q3.list 
  }
  def findByBPId(id: Int) = {
    database withSession { implicit session =>
     val q3 = for { sp ← session_spaces if sp.bprocess === id } yield sp// <> (UndefElement.tupled, UndefElement.unapply _)
      q3.list 
    }
  }
  def findByBPSessionId(id: Int, session_id: Int) = {
    database withSession { implicit session =>
     val q3 = for { sp ← session_spaces if sp.bprocess === id && sp.session === session_id } yield sp// <> (UndefElement.tupled, UndefElement.unapply _)
      q3.list 
    }
  }  
  def deleteOwnedSpace(elem_id:Option[Int],spelem_id:Option[Int]) {
  if (elem_id.isDefined) {
      getAllByFront(elem_id.get).map(_.id.get).foreach{ id => delete(id) }
  }
  if (spelem_id.isDefined) {
      getAllByNested(spelem_id.get).map(_.id.get).foreach{ id => delete(id) }
  }
}
  /**
   * Update a bpspace
   * @param id
   * @param bpspace
   */
  def update(id: Int, bpspace: SessionSpaceDTO) = database withSession { implicit session ⇒
    val spToUpdate: SessionSpaceDTO = bpspace.copy(Option(id))
    session_spaces.filter(_.id === id).update(spToUpdate)
  }
  /**
   * Delete a bpspace
   * @param id
   */
  def delete(id: Int) = {
   database withSession { implicit session ⇒

    val sp = get(id)
    val res = session_spaces.filter(_.id === id).delete
    sp match {
       case Some(space) => renewIndex(space.bprocess, space.index)
       case _ =>
    }
    res
  }
  
  }
  /**
   * Count all session_spaces
   */
  def count: Int = database withSession { implicit session ⇒
    Query(session_spaces.length).first
  }

  def ddl_create = {
    database withSession {
      implicit session =>
      session_spaces.ddl.create
    }
  }
  def ddl_drop = {
    database withSession {
      implicit session =>
        session_spaces.ddl.drop
    }
  }

  def renewIndex(bprocess: Int, index_num: Int) = {
    database withSession { implicit session ⇒
      val q3 = for { sp ← session_spaces if sp.bprocess === bprocess && sp.index > index_num } yield sp
      val ordered = q3.list.zipWithIndex.map(sp => sp._1.copy(index = (sp._2 + 1) + (index_num - 1)))
      //val ordered = q3.list.zipWithIndex.map(sp => sp._1.copy(index = sp._2+index_num))
      ordered.foreach { sp => 
         update(sp.id.get, sp)
      }
    }
  }

  def getAll = database withSession {
    implicit session ⇒ // TODO: s.service === 1 CHANGE DAT
      val q3 = for { s ← session_spaces } yield s
      q3.list.sortBy(_.id)
    //suppliers foreach {
    //  case (id, title, address, city, state, zip) ⇒
    //    Supplier(id, title, address, city, state, zip)
    //}
  }

}
