package models.DAO

import main.scala.bprocesses.{BProcess, BPLoggerResult}
import main.scala.simple_parts.process.ProcElems
import slick.driver.PostgresDriver.api._
import com.github.nscala_time.time.Imports._
import com.github.tototoshi.slick.JdbcJodaSupport._
//import com.github.tminglei.slickpg.date.PgDateJdbcTypes
import slick.model.ForeignKeyAction

import models.DAO.ProcElemDAO._
import models.DAO.BPDAO._
import models.DAO.BPStationDAO._
import models.DAO.conversion.DatabaseCred
import main.scala.simple_parts.process.Units._
import models.DAO.sessions._
import main.scala.bprocesses.refs.UnitRefs.{UnitReactionRef, UnitReactionStateOutRef}
import main.scala.simple_parts.process.Units._
import main.scala.bprocesses.{BPState, BPSessionState}

class SessionReactionStateOuts(tag: Tag) extends Table[SessionUnitReactionStateOut](tag, "session_reaction_state_outs") {
  def id 		  = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def reaction 	  = column[Int]("reaction_id")
  def state 	  = column[Int]("session_state_id")
  def on 		  = column[Boolean]("on")
  def on_rate 	  = column[Int]("on_rate")
  def is_input    = column[Boolean]("input", O.Default(false))


  def created_at = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at = column[Option[org.joda.time.DateTime]]("updated_at")


  def * = (id.?,
    state,
    reaction,
    on,
    on_rate,
    is_input,
    created_at, updated_at) <> (SessionUnitReactionStateOut.tupled, SessionUnitReactionStateOut.unapply)

  def reaction_FK = foreignKey("ses_react_out_reaction_fk", reaction, models.DAO.SessionReactionDAO.session_reactions)(_.id, onDelete = ForeignKeyAction.Cascade)
  def state_FK    = foreignKey("ses_react_out_state_fk", state, models.DAO.SessionInitialStateDAO.session_initial_states)(_.id, onDelete = ForeignKeyAction.Cascade)
//def session_state_refFK = foreignKey("session_state_ref_fk", session_state_ref, SpaceElementReflectionDAO.space_element_reflections)(_.id, onDelete = ForeignKeyAction.Cascade)

}

object SessionReactionStateOutDAOF {
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
  val session_reaction_state_outs = SessionReactionStateOutDAO.session_reaction_state_outs

  //private def filterQueryByProcess(process: Int): Query[ProcessHistoriesF, ProcessHistoryDTO, Seq] =
  //  bpsessions.filter(_.process === process)
  private def filterQuery(id: Int): Query[SessionReactionStateOuts, SessionUnitReactionStateOut, Seq] =
    session_reaction_state_outs.filter(_.id === id)
  private def filterByReactionIdsQuery(ids: List[Int]): Query[SessionReactionStateOuts, SessionUnitReactionStateOut, Seq] =
    session_reaction_state_outs.filter(_.reaction inSetBind ids)

  def findByReactions(ids: List[Int]):Future[Seq[SessionUnitReactionStateOut]] = {
      db.run(filterByReactionIdsQuery(ids).result)
  }

}











object SessionReactionStateOutDAO {
  import scala.util.Try
  import DatabaseCred.database
  import models.DAO.conversion.Implicits._
  val session_reaction_state_outs = TableQuery[SessionReactionStateOuts]

  def pull_object(s: SessionUnitReactionStateOut) = database withSession {
    implicit session ⇒
      session_reaction_state_outs returning session_reaction_state_outs.map(_.id) += s
  }
  def get(k: Int):Option[SessionUnitReactionStateOut] = database withSession {
    implicit session ⇒
      val q3 = for { s ← session_reaction_state_outs if s.id === k } yield s
      q3.list.headOption
  }
  def findByReaction(id: Int):List[SessionUnitReactionStateOut] = {
     database withSession { implicit session =>
       val q3 = for { s ← session_reaction_state_outs if s.reaction === id } yield s
       q3.list
    }
  }
  def findByReactions(ids: List[Int]):List[SessionUnitReactionStateOut] = {
     database withSession { implicit session =>
       val q3 = for { s ← session_reaction_state_outs if s.reaction inSetBind ids } yield s
       q3.list
    }
  }
  def update(id: Int, switcher: SessionUnitReactionStateOut) = database withSession { implicit session ⇒
    val switcherToUpdate: SessionUnitReactionStateOut = switcher.copy(Option(id))
    session_reaction_state_outs.filter(_.id === id).update(switcherToUpdate)
  }
  def delete(id: Int) = database withSession { implicit session ⇒
    session_reaction_state_outs.filter(_.id === id).delete
  }
  def count: Int = database withSession { implicit session ⇒
    Query(session_reaction_state_outs.length).first
  }

  def ddl_create = {
    database withSession {
      implicit session =>
      session_reaction_state_outs.ddl.create
    }
  }
  def ddl_drop = {
    database withSession {
      implicit session =>
       session_reaction_state_outs.ddl.drop
    }
  }
  def getAll = database withSession {
    implicit session ⇒
      val q3 = for { s ← session_reaction_state_outs } yield s
      q3.list.sortBy(_.id)
  }
}
