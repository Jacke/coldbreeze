package models.DAO

import main.scala.bprocesses.{BProcess, BPLoggerResult}
import main.scala.simple_parts.process.ProcElems
import models.DAO.driver.MyPostgresDriver.simple._
import com.github.nscala_time.time.Imports._
//import com.github.tminglei.slickpg.date.PgDateJdbcTypes
import slick.model.ForeignKeyAction

import models.DAO.ProcElemDAO._
import models.DAO.BPDAO._
import models.DAO.BPStationDAO._
import models.DAO.conversion.DatabaseCred
import main.scala.simple_parts.process.Units._  
  
import main.scala.bprocesses.refs.UnitRefs.{UnitReactionRef, UnitReactionStateOutRef}
import main.scala.simple_parts.process.Units._  

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
  val reactions = ReactionDAO.reactions

  private def filterQuery(id: Int): Query[ReactionRefs, UnitReaction, Seq] =
    reactions.filter(_.id === id)

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
  val reaction_state_outs = ReactionStateOutDAO.reaction_state_outs

  private def filterQuery(id: Int): Query[ReactionStateOuts, UnitReactionStateOut, Seq] =
    reaction_state_outs.filter(_.id === id)

}
object ReactionDAO {
  import scala.util.Try
  import DatabaseCred.database
  import models.DAO.conversion.Implicits._
  val reactions = TableQuery[ReactionRefs]

  def pull_object(s: UnitReaction) = database withSession {
    implicit session ⇒
      reactions returning reactions.map(_.id) += s
  }
  def get(k: Int):Option[UnitReaction] = database withSession {
    implicit session ⇒
      val q3 = for { s ← reactions if s.id === k } yield s
      q3.list.headOption 
  }
  def findByBP(id: Int):List[UnitReaction] = {
     database withSession { implicit session =>
       val q3 = for { s ← reactions if s.bprocess === id } yield s
       q3.list                   
    } 
  }
  /**
   * Find reactions that are not executed in specific session(they may have executed, 
   * but state out cant be equeal to session state)
   */
  def findUnapplied(id: Int, session_id: Int):List[UnitReaction] = {
     database withSession { implicit session =>
       val session_states = BPSessionStateDAO.findByBPAndSession(id, session_id)
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
     database withSession { implicit session =>
       val session_states = BPSessionStateDAO.findByBPAndSession(id, session_id)
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


  def update(id: Int, switcher: UnitReaction) = database withSession { implicit session ⇒
    val switcherToUpdate: UnitReaction = switcher.copy(Option(id))
    reactions.filter(_.id === id).update(switcherToUpdate)
  }
  def delete(id: Int) = database withSession { implicit session ⇒
    reactions.filter(_.id === id).delete
  }
  def count: Int = database withSession { implicit session ⇒
    Query(reactions.length).first
  }

  def ddl_create = {
    database withSession {
      implicit session =>
      reactions.ddl.create
    }
  }
  def ddl_drop = {
    database withSession {
      implicit session =>
       reactions.ddl.drop
    }
  }
  def getAll = database withSession {
    implicit session ⇒
      val q3 = for { s ← reactions } yield s
      q3.list.sortBy(_.id)
  }
}




class ReactionStateOuts(tag: Tag) extends Table[UnitReactionStateOut](tag, "reaction_state_outs") {
  def id = column[Int]("id", O.PrimaryKey, O.AutoInc) 
  def reaction = column[Int]("reaction_id")
  def state = column[Int]("state_id")
  def on = column[Boolean]("on")
  def on_rate = column[Int]("on_rate")

    
  def created_at = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at = column[Option[org.joda.time.DateTime]]("updated_at")  


  def * = (id.?,
    state,
    reaction,
    on,
    on_rate,
    created_at, updated_at) <> (UnitReactionStateOut.tupled, UnitReactionStateOut.unapply)

  def reaction_FK = foreignKey("react_out_reaction_fk", reaction, models.DAO.ReactionDAO.reactions)(_.id, onDelete = ForeignKeyAction.Cascade)
  def state_FK    = foreignKey("react_out_state_fk", state, models.DAO.BPStateDAO.bpstates)(_.id, onDelete = ForeignKeyAction.Cascade)
//def session_state_refFK = foreignKey("session_state_ref_fk", session_state_ref, SpaceElementReflectionDAO.space_element_reflections)(_.id, onDelete = ForeignKeyAction.Cascade)

}


object ReactionStateOutDAO {
  import scala.util.Try
  import DatabaseCred.database
  import models.DAO.conversion.Implicits._
  val reaction_state_outs = TableQuery[ReactionStateOuts]

  def pull_object(s: UnitReactionStateOut) = database withSession {
    implicit session ⇒
      reaction_state_outs returning reaction_state_outs.map(_.id) += s
  }
  def get(k: Int):Option[UnitReactionStateOut] = database withSession {
    implicit session ⇒
      val q3 = for { s ← reaction_state_outs if s.id === k } yield s
      q3.list.headOption 
  }
  def findByReaction(id: Int):List[UnitReactionStateOut] = {
     database withSession { implicit session =>
       val q3 = for { s ← reaction_state_outs if s.reaction === id } yield s
       q3.list                   
    } 
  }
  def findByReactions(ids: List[Int]):List[UnitReactionStateOut] = {
     database withSession { implicit session =>
       val q3 = for { s ← reaction_state_outs if s.reaction inSetBind ids } yield s
       q3.list                   
    } 
  }
  def update(id: Int, switcher: UnitReactionStateOut) = database withSession { implicit session ⇒
    val switcherToUpdate: UnitReactionStateOut = switcher.copy(Option(id))
    reaction_state_outs.filter(_.id === id).update(switcherToUpdate)
  }
  def delete(id: Int) = database withSession { implicit session ⇒
    reaction_state_outs.filter(_.id === id).delete
  }
  def count: Int = database withSession { implicit session ⇒
    Query(reaction_state_outs.length).first
  }

  def ddl_create = {
    database withSession {
      implicit session =>
      reaction_state_outs.ddl.create
    }
  }
  def ddl_drop = {
    database withSession {
      implicit session =>
       reaction_state_outs.ddl.drop
    }
  }
  def getAll = database withSession {
    implicit session ⇒
      val q3 = for { s ← reaction_state_outs } yield s
      q3.list.sortBy(_.id)
  }
}