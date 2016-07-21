package models.DAO

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
import main.scala.simple_parts.process._
import models.DAO.sessions._
import main.scala.bprocesses.refs._
import main.scala.simple_parts.process._
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
  import com.github.tototoshi.slick.PostgresJodaSupport._
  import scala.concurrent.duration.Duration
  import scala.concurrent.{ExecutionContext, Awaitable, Await, Future}
  import scala.util.Try
  import models.DAO.conversion.DatabaseFuture._

  //import dbConfig.driver.api._ //
  def await[T](a: Awaitable[T])(implicit ec: ExecutionContext) = Await.result(a, Duration.Inf)
  def awaitAndPrint[T](a: Awaitable[T])(implicit ec: ExecutionContext) = println(await(a))
  val session_reaction_state_outs = TableQuery[SessionReactionStateOuts]

  private def filterQuery(id: Int): Query[SessionReactionStateOuts, SessionUnitReactionStateOut, Seq] =
    session_reaction_state_outs.filter(_.id === id)
  private def filterByReactionIdsQuery(ids: List[Int]): Query[SessionReactionStateOuts, SessionUnitReactionStateOut, Seq] =
    session_reaction_state_outs.filter(_.reaction inSetBind ids)

  def findByReactions(ids: List[Int]):Future[Seq[SessionUnitReactionStateOut]] = {
      db.run(filterByReactionIdsQuery(ids).result)
  }

}











object SessionReactionStateOutDAO {
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
  val session_reaction_state_outs = TableQuery[SessionReactionStateOuts]

  private def filterQuery(id: Int): Query[SessionReactionStateOuts, SessionUnitReactionStateOut, Seq] =
    session_reaction_state_outs.filter(_.id === id)
  private def filterByReactionQuery(id: Int): Query[SessionReactionStateOuts, SessionUnitReactionStateOut, Seq] =
    session_reaction_state_outs.filter(_.reaction === id)

  private def filterByReactionIdsQuery(ids: List[Int]): Query[SessionReactionStateOuts, SessionUnitReactionStateOut, Seq] =
    session_reaction_state_outs.filter(_.reaction inSetBind ids)

  def pull_object(s: SessionUnitReactionStateOut) =   {
      await( db.run( session_reaction_state_outs returning session_reaction_state_outs.map(_.id) += s ))
  }

  def get(k: Int):Option[SessionUnitReactionStateOut] =   {
      await(db.run(filterQuery(k).result.headOption))
  }

  def findByReaction(id: Int):List[SessionUnitReactionStateOut] = {
    await(db.run(filterByReactionQuery(id).result)).toList
  }

  def findByReactions(ids: List[Int]):List[SessionUnitReactionStateOut] = {
    await(db.run(filterByReactionIdsQuery(ids).result)).toList
  }

  def update(id: Int, switcher: SessionUnitReactionStateOut) =   {
    val switcherToUpdate: SessionUnitReactionStateOut = switcher.copy(Option(id))
    await( db.run( session_reaction_state_outs.filter(_.id === id).update(switcherToUpdate) ))
  }

  def delete(id: Int) =   {
    await( db.run( session_reaction_state_outs.filter(_.id === id).delete ))
  }

  val create: DBIO[Unit] = session_reaction_state_outs.schema.create
  val drop: DBIO[Unit] = session_reaction_state_outs.schema.drop
  def ddl_create = db.run(create)
  def ddl_drop = db.run(drop)

}
