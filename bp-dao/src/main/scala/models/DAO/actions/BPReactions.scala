package models.DAO

import main.scala.bprocesses.{ BProcess, BPLoggerResult }
import main.scala.simple_parts.process.ProcElems

import models.DAO.conversion.DatabaseCred
import models.DAO._
import models.DAO.conversion.DatabaseFuture._
import com.github.nscala_time.time.Imports._
import models.DAO.conversion.DatabaseCred.dbConfig.driver.api._
import com.github.tototoshi.slick.PostgresJodaSupport._


import models.DAO.ProcElemDAO._
import models.DAO.BPDAO._
import models.DAO.BPStationDAO._
import models.DAO.conversion.DatabaseCred
import models.DAO._
import models.DAO.sessions._
import builders._
import main.scala.bprocesses.BPSession
import main.scala.simple_parts.process._

case class CurrentReactionContainer(reaction: UnitReaction,
                                    title: String,
                                    front: Option[UndefElement] = None,
                                    nested: Option[SpaceElementDTO] = None,
                                    session_id: Int)
class ReactionRefs(tag: Tag) extends Table[UnitReaction](tag, "reactions") {
  def id          = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def bprocess    = column[Int]("bprocess_id")
  def autostart   = column[Boolean]("autostart")
  def element     = column[Int]("element_id")
  def from_state  = column[Option[Int]]("state_ref_id")
  def title       = column[String]("title")

  def created_at  = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at  = column[Option[org.joda.time.DateTime]]("updated_at")

  def elementFK   = foreignKey("react_element_fk", element, models.DAO.ElemTopologDAO.elem_topologs)(_.id, onDelete = ForeignKeyAction.Cascade)
  def bpFK        = foreignKey("react_bprocess_fk", bprocess, models.DAO.BPDAOF.bprocesses)(_.id, onDelete = ForeignKeyAction.Cascade)
  def state_FK    = foreignKey("react_state_fk", from_state, models.DAO.BPStateDAOF.bpstates)(_.id, onDelete = ForeignKeyAction.Cascade)

  def * = (id.?,
           bprocess,
           autostart,
           element,
           from_state,
           title,
           created_at, updated_at) <> (UnitReaction.tupled, UnitReaction.unapply)
}

object ReactionDAO {
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
  
  val reactions = TableQuery[ReactionRefs]
  private def filterQuery(id: Int): Query[ReactionRefs, UnitReaction, Seq] =
    reactions.filter(_.id === id)

  private def filterQueryBP(id: Int): Query[ReactionRefs, UnitReaction, Seq] =
    reactions.filter(_.bprocess === id)

  def pull_object(s: UnitReaction) =   {
    await(db.run( reactions returning reactions.map(_.id) += s ))
  }
  def get(k: Int):Option[UnitReaction] =   {
    await(db.run(filterQuery(k).result.headOption))
  }
  def findByBP(id: Int):List[UnitReaction] = {
    await(db.run(filterQueryBP(id).result)).toList
  }
  /**
   * Find reactions that are not executed in specific session(they may have executed,
   * but state out cant be equeal to session state)
   */
  def findUnapplied(id: Int, session_id: Int):List[UnitReaction] = {
       {
       val session_states = BPSessionStateDAOF.await( BPSessionStateDAOF.findByBPAndSession(id, session_id) )
       val reactions:List[UnitReaction] = findByBP(id)
       val state_outs = ReactionStateOutDAO.findByReactions(reactions.flatMap(_.id))

       val unapplied_reactions = reactions.filter { reaction =>
          val state_out = state_outs.filter(out => Some(out.reaction) == reaction.id)
          val session_state = session_states.find(state => state_out.map(_.state_ref).contains(state.origin_state.getOrElse(0)))//reaction.from_state == state.origin_state)
          session_state match {
            case Some(state) => {
              state_out.map { out =>
                state.on != out.on
                state.on_rate != out.on_rate
              }.reduce(_||_) // OR for multiple state outs
            }
            case _ => {
              false
            }
          }
       }
       unapplied_reactions
    }
  }
  def findCurrentUnappliedContainer(id: Int, session_id: Int):Option[CurrentReactionContainer] = {
       {
       val session_states = BPSessionStateDAOF.await( BPSessionStateDAOF.findByBPAndSession(id, session_id) )
       val reactions:List[UnitReaction] = findByBP(id)
       val state_outs = ReactionStateOutDAO.findByReactions(reactions.flatMap(_.id))

       val unapplied_reactions = reactions.filter { reaction =>
          val state_out = state_outs.filter(out => Some(out.reaction) == reaction.id)
          val session_state = session_states.find(state => state_out.map(_.state_ref).contains(state.origin_state.getOrElse(0)))//reaction.from_state == state.origin_state)
          session_state match {
            case Some(state) => {
              state_out.map { out =>
                state.on != out.on
                state.on_rate != out.on_rate
              }.reduce(_||_) // OR for multiple state outs
            }
            case _ => {
              false
            }
          }
       }
       /**
        * Iterate over reactions for geting first current reaction
        */
       unapplied_reactions.headOption match {
        case Some(reaction) => {
            models.DAO.ElemTopologDAO.getIdentityById(reaction.element) match {
              case Some(identity) => Some(CurrentReactionContainer(reaction, identity.title, identity.front, identity.nested, session_id ))
              case _ => None
            }
        }
        case _ => None
       }

    }
  }


  def update(id: Int, switcher: UnitReaction) =   {
    val switcherToUpdate: UnitReaction = switcher.copy(Option(id))
    await(db.run(  reactions.filter(_.id === id).update(switcherToUpdate) ))
  }
  def delete(id: Int) =   {
    await(db.run( reactions.filter(_.id === id).delete ))
  }

  val create: DBIO[Unit] = reactions.schema.create
  val drop: DBIO[Unit] = reactions.schema.drop

  def ddl_create = db.run(create)
  def ddl_drop = db.run(drop)


}
