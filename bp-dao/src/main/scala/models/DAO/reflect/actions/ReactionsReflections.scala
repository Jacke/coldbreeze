package models.DAO.reflect

import main.scala.bprocesses.{BProcess, BPLoggerResult}
import main.scala.simple_parts.process.ProcElems
import slick.driver.PostgresDriver.api._
import com.github.nscala_time.time.Imports._
import com.github.tototoshi.slick.JdbcJodaSupport._
import slick.model.ForeignKeyAction
import models.DAO.ProcElemDAO._
import models.DAO.BPDAO._
import models.DAO.BPStationDAO._
import models.DAO.conversion.DatabaseCred
import main.scala.simple_parts.process.Units._
import main.scala.bprocesses.refs.UnitRefs.{UnitReactionRef, UnitReactionStateOutRef}

class ReactionRefs(tag: Tag) extends Table[UnitReactionRef](tag, "reaction_refs") {
  def id          = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def reflection  = column[Int]("reflection_id")
  def autostart   = column[Boolean]("autostart")
  def element     = column[Int]("element_id")
  def from_state  = column[Option[Int]]("state_ref_id")
  def title       = column[String]("title")

  def created_at  = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at  = column[Option[org.joda.time.DateTime]]("updated_at")

  def elementFK   = foreignKey("react_ref_element_fk", element, models.DAO.reflect.ReflectElemTopologDAO.reflected_elem_topologs)(_.id, onDelete = ForeignKeyAction.Cascade)
  def reflectFK   = foreignKey("react_ref_reflect_fk", reflection, models.DAO.reflect.RefDAO.refs)(_.id, onDelete = ForeignKeyAction.Cascade)
  def stateFK     = foreignKey("react_ref_state_fk", from_state, models.DAO.reflect.BPStateRefDAO.state_refs)(_.id, onDelete = ForeignKeyAction.Cascade)

  def * = (id.?,
           reflection,
           autostart,
           element,
           from_state,
           title,
           created_at, updated_at) <> (UnitReactionRef.tupled, UnitReactionRef.unapply)

}


object ReactionRefDAOF {
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
  val reaction_refs = ReactionRefDAO.reaction_refs

  private def filterByIdsQuery(ids: List[Int]): Query[ReactionRefs, UnitReactionRef, Seq] =
    reaction_refs.filter(_.id inSetBind ids)
  private def filterByReflection(reflection: Int): Query[ReactionRefs, UnitReactionRef, Seq] =
    reaction_refs.filter(_.reflection === reflection)

  def findByRef(reflection: Int):Future[Seq[UnitReactionRef]] = {
    db.run(filterByReflection(reflection).result)
  }

  def retrive(k: Int, process: Int, element: Int, from_state: Option[Int]):Future[List[UnitReaction]] = {
      findByRef(k).map { elems =>
        elems.map(e => e.reflect(process, element, from_state)).toList
      }
  }
}


object ReactionRefDAO {
  import scala.util.Try
  import DatabaseCred.database
  import models.DAO.conversion.Implicits._
  val reaction_refs = TableQuery[ReactionRefs]

  def pull_object(s: UnitReactionRef) = database withSession {
    implicit session ⇒
      reaction_refs returning reaction_refs.map(_.id) += s
  }
  def get(k: Int):Option[UnitReactionRef] = database withSession {
    implicit session ⇒
      val q3 = for { s ← reaction_refs if s.id === k } yield s
      q3.list.headOption
  }
  def findByRef(id: Int) = {
     database withSession { implicit session =>
       val q3 = for { s ← reaction_refs if s.reflection === id } yield s
       q3.list
    }
  }
  def retrive(k: Int, process: Int, element: Int, from_state: Option[Int]):List[UnitReaction] = database withSession {
    implicit session =>
      findByRef(k).map(e => e.reflect(process, element, from_state))

  }
  def update(id: Int, switcher: UnitReactionRef) = database withSession { implicit session ⇒
    val switcherToUpdate: UnitReactionRef = switcher.copy(Option(id))
    reaction_refs.filter(_.id === id).update(switcherToUpdate)
  }
  def delete(id: Int) = database withSession { implicit session ⇒
    reaction_refs.filter(_.id === id).delete
  }
  def count: Int = database withSession { implicit session ⇒
    Query(reaction_refs.length).first
  }

  def ddl_create = {
    database withSession {
      implicit session =>
      reaction_refs.ddl.create
    }
  }
  def ddl_drop = {
    database withSession {
      implicit session =>
       reaction_refs.ddl.drop
    }
  }
  def getAll = database withSession {
    implicit session ⇒
      val q3 = for { s ← reaction_refs } yield s
      q3.list.sortBy(_.id)
  }
}
