package models.DAO.reflect

import main.scala.bprocesses.{BProcess, BPLoggerResult}
import main.scala.simple_parts.process.ProcElems
import slick.driver.PostgresDriver.api._
import com.github.nscala_time.time.Imports._
import com.github.tototoshi.slick.PostgresJodaSupport._
import slick.model.ForeignKeyAction
import models.DAO.ProcElemDAO._
import models.DAO.BPDAO._
import models.DAO.BPStationDAO._
import models.DAO.conversion.DatabaseCred
import main.scala.simple_parts.process._
import main.scala.bprocesses.refs._

class ReactionStateOutRefs(tag: Tag) extends Table[UnitReactionStateOutRef](tag, "reaction_state_out_refs") {
  def id          = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def reaction    = column[Int]("reaction_id")
  def state_ref   = column[Int]("state_ref")
  def on          = column[Boolean]("on")
  def on_rate     = column[Int]("on_rate")
  def is_input    = column[Boolean]("input", O.Default(false))

  def created_at  = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at  = column[Option[org.joda.time.DateTime]]("updated_at")


  def * = (id.?,
    state_ref,
    reaction,
    on,
    on_rate,
    is_input,
    created_at, updated_at) <> (UnitReactionStateOutRef.tupled, UnitReactionStateOutRef.unapply)

  def reaction_refFK = foreignKey("react_out_reaction_ref_fk", reaction, models.DAO.reflect.ReactionRefDAO.reaction_refs)(_.id, onDelete = ForeignKeyAction.Cascade)
  def state_refFK = foreignKey("react_out_state_ref_fk", state_ref, models.DAO.reflect.BPStateRefDAO.state_refs)(_.id, onDelete = ForeignKeyAction.Cascade)
//def session_state_refFK = foreignKey("session_state_ref_fk", session_state_ref, SpaceElementReflectionDAO.space_element_reflections)(_.id, onDelete = ForeignKeyAction.Cascade)

}

object ReactionStateOutRefDAOF {
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
  
  val reaction_state_out_refs = TableQuery[ReactionStateOutRefs]

  private def filterByIdsQuery(ids: List[Int]): Query[ReactionStateOutRefs, UnitReactionStateOutRef, Seq] =
    reaction_state_out_refs.filter(_.id inSetBind ids)

  private def filterByReactionsQuery(ids: List[Int]): Query[ReactionStateOutRefs, UnitReactionStateOutRef, Seq] =
    reaction_state_out_refs.filter(_.reaction inSetBind ids)
  private def filterByReactionQuery(id: Int): Query[ReactionStateOutRefs, UnitReactionStateOutRef, Seq] =
    reaction_state_out_refs.filter(_.reaction === id)



  def findByReactionRefs(ids: List[Int]) = {
     db.run(filterByReactionsQuery(ids).result)
  }

  def findByReactionRef(id: Int) = {
    db.run(filterByReactionQuery(id).result)
  }

  def retrive(k: Int, state_ref: Int, reaction: Int):Future[List[UnitReactionStateOut]] = {
      findByReactionRef(k).map { res =>
        res.map(e => e.reflect(state_ref, reaction)).toList
      }
  }


}



object ReactionStateOutRefDAO {
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
  
  val reaction_state_out_refs = TableQuery[ReactionStateOutRefs]

  private def filterByIdsQuery(ids: List[Int]): Query[ReactionStateOutRefs, UnitReactionStateOutRef, Seq] =
    reaction_state_out_refs.filter(_.id inSetBind ids)
  private def filterQuery(id: Int): Query[ReactionStateOutRefs, UnitReactionStateOutRef, Seq] =
    reaction_state_out_refs.filter(_.id === id)

  private def filterByReactionsQuery(ids: List[Int]): Query[ReactionStateOutRefs, UnitReactionStateOutRef, Seq] =
    reaction_state_out_refs.filter(_.reaction inSetBind ids)
  private def filterByReactionQuery(id: Int): Query[ReactionStateOutRefs, UnitReactionStateOutRef, Seq] =
    reaction_state_out_refs.filter(_.reaction === id)

  def pull_object(s: UnitReactionStateOutRef) =   {
      await(db.run( reaction_state_out_refs returning reaction_state_out_refs.map(_.id) += s ))
  }
  
  def get(k: Int):Option[UnitReactionStateOutRef] =   {
      await(db.run(filterQuery(k).result.headOption))
  }

  def findByReactionRef(id: Int) = {
    await(db.run(filterByReactionQuery(id).result)).toList
  }

  def findByReactionRefs(ids: List[Int]) = {
    await(db.run(filterByReactionsQuery(ids).result)).toList
  }

  def retrive(k: Int, state_ref: Int, reaction: Int):List[UnitReactionStateOut] =   {
      findByReactionRef(k).map(e => e.reflect(state_ref, reaction))
  }

  def update(id: Int, switcher: UnitReactionStateOutRef) =   {
    val switcherToUpdate: UnitReactionStateOutRef = switcher.copy(Option(id))
    await(db.run( reaction_state_out_refs.filter(_.id === id).update(switcherToUpdate) ))
  }
  def delete(id: Int) =   {
    await(db.run( reaction_state_out_refs.filter(_.id === id).delete ))
  }


  val create: DBIO[Unit] = reaction_state_out_refs.schema.create
  val drop: DBIO[Unit] = reaction_state_out_refs.schema.drop
  def ddl_create = db.run(create)
  def ddl_drop = db.run(drop)


}
