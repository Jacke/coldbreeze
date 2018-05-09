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

import main.scala.bprocesses.refs._
import main.scala.simple_parts.process._


class ReactionStateOuts(tag: Tag) extends Table[UnitReactionStateOut](tag, "reaction_state_outs") {
  def id          = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def reaction    = column[Int]("reaction_id")
  def state       = column[Int]("state_id")
  def on          = column[Boolean]("on")
  def on_rate     = column[Int]("on_rate")
  def is_input    = column[Boolean]("input", O.Default(false))


  def created_at = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at = column[Option[org.joda.time.DateTime]]("updated_at")


  def * = (id.?,
    state,
    reaction,
    on,
    on_rate,
    is_input,
    created_at, updated_at) <> (UnitReactionStateOut.tupled, UnitReactionStateOut.unapply)

  def reaction_FK = foreignKey("react_out_reaction_fk", reaction, models.DAO.ReactionDAO.reactions)(_.id, onDelete = ForeignKeyAction.Cascade)
  def state_FK    = foreignKey("react_out_state_fk", state, models.DAO.BPStateDAOF.bpstates)(_.id, onDelete = ForeignKeyAction.Cascade)
//def session_state_refFK = foreignKey("session_state_ref_fk", session_state_ref, SpaceElementReflectionDAO.space_element_reflections)(_.id, onDelete = ForeignKeyAction.Cascade)

}


object ReactionStateOutDAO {
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
  
  val reaction_state_outs = TableQuery[ReactionStateOuts]
  private def filterQuery(id: Int): Query[ReactionStateOuts, UnitReactionStateOut, Seq] =
    reaction_state_outs.filter(_.id === id)
  private def filterQueryByReaction(id: Int): Query[ReactionStateOuts, UnitReactionStateOut, Seq] =
    reaction_state_outs.filter(_.reaction === id)
  private def filterQueryByReactions(ids: List[Int]): Query[ReactionStateOuts, UnitReactionStateOut, Seq] =
    reaction_state_outs.filter(_.reaction inSetBind ids)



  def pull_object(s: UnitReactionStateOut) =   {
      await(db.run( reaction_state_outs returning reaction_state_outs.map(_.id) += s ))
  }

  def get(k: Int):Option[UnitReactionStateOut] =   {
      await(db.run(filterQuery(k).result.headOption))
  }

  def findByReaction(id: Int):List[UnitReactionStateOut] = {
      await(db.run(filterQueryByReaction(id).result)).toList
  }

  def findByReactions(ids: List[Int]):List[UnitReactionStateOut] = {
    await(db.run(filterQueryByReactions(ids).result)).toList
  }

  def update(id: Int, switcher: UnitReactionStateOut) =   {
    val switcherToUpdate: UnitReactionStateOut = switcher.copy(Option(id))
    await(db.run( reaction_state_outs.filter(_.id === id).update(switcherToUpdate) ))
  }

  def delete(id: Int) =   {
    await(db.run( reaction_state_outs.filter(_.id === id).delete ))
  }


  val create: DBIO[Unit] = reaction_state_outs.schema.create
  val drop: DBIO[Unit] = reaction_state_outs.schema.drop
  def ddl_create = db.run(create)
  def ddl_drop = db.run(drop)


}
