package models.DAO

import main.scala.bprocesses.{ BProcess, BPLoggerResult }
import main.scala.simple_parts.process.ProcElems

import models.DAO.conversion.DatabaseCred
import models.DAO._
import models.DAO.conversion.DatabaseFuture._
import com.github.nscala_time.time.Imports._
import models.DAO.conversion.DatabaseCred.dbConfig.driver.api._
import com.github.tototoshi.slick.JdbcJodaSupport._


import models.DAO.ProcElemDAO._
import models.DAO.BPDAO._
import models.DAO.BPStationDAO._
import models.DAO.conversion.DatabaseCred
import models.DAO._
import models.DAO.sessions._
import builders._
import main.scala.bprocesses.BPSession
import main.scala.simple_parts.process.Units._

class ReactionRefsF(tag: Tag) extends Table[UnitReaction](tag, "reactions") {
  def id          = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def bprocess    = column[Int]("bprocess_id")
  def autostart   = column[Boolean]("autostart")
  def element     = column[Int]("element_id")
  def from_state  = column[Option[Int]]("state_ref_id")
  def title       = column[String]("title")

  def created_at  = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at  = column[Option[org.joda.time.DateTime]]("updated_at")

  def elementFK   = foreignKey("react_element_fk", element, models.DAO.ElemTopologDAO.elem_topologs)(_.id, onDelete = ForeignKeyAction.Cascade)
  def bpFK        = foreignKey("react_bprocess_fk", bprocess, bprocesses)(_.id, onDelete = ForeignKeyAction.Cascade)
  def state_FK    = foreignKey("react_state_fk", from_state, models.DAO.BPStateDAO.bpstates)(_.id, onDelete = ForeignKeyAction.Cascade)

  def * = (id.?,
           bprocess,
           autostart,
           element,
           from_state,
           title,
           created_at, updated_at) <> (UnitReaction.tupled, UnitReaction.unapply)
}
class ReactionStateOutsF(tag: Tag) extends Table[UnitReactionStateOut](tag, "reaction_state_outs") {
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
  def state_FK    = foreignKey("react_out_state_fk", state, models.DAO.BPStateDAO.bpstates)(_.id, onDelete = ForeignKeyAction.Cascade)
//def session_state_refFK = foreignKey("session_state_ref_fk", session_state_ref, SpaceElementReflectionDAO.space_element_reflections)(_.id, onDelete = ForeignKeyAction.Cascade)

}


object ReactionDAOF {
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
  val reactions = TableQuery[ReactionRefsF]

  private def filterQuery(id: Int): Query[ReactionRefsF, UnitReaction, Seq] =
    reactions.filter(_.id === id)
    def pull(s: UnitReaction):Future[Int] = db.run(reactions returning reactions.map(_.id) += s)

}
object ReactionStateOutDAOF {
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
  val reaction_state_outs = TableQuery[ReactionStateOutsF]

  private def filterQuery(id: Int): Query[ReactionStateOutsF, UnitReactionStateOut, Seq] =
    reaction_state_outs.filter(_.id === id)
    def pull(s: UnitReactionStateOut):Future[Int] = db.run(reaction_state_outs returning reaction_state_outs.map(_.id) += s)

}
