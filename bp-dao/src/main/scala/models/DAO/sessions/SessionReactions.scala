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
import models.DAO.sessions._
import main.scala.bprocesses.refs.UnitRefs.{UnitReactionRef, UnitReactionStateOutRef}
import main.scala.simple_parts.process.Units._  
import main.scala.bprocesses.{BPState, BPSessionState} 


case class CurrentSessionReactionContainer(reaction: SessionUnitReaction, 
                                    title: String, 
                                    front: Option[SessionUndefElement] = None, 
                                    nested: Option[SessionSpaceElementDTO] = None,
                                    session_id: Int)
class SessionReactionRefs(tag: Tag) extends Table[SessionUnitReaction](tag, "session_reactions") {
  def id          = column[Int]("id", O.PrimaryKey, O.AutoInc) 
  def bprocess    = column[Int]("bprocess_id")
  def session   = column[Int]("session_id")

  def autostart   = column[Boolean]("autostart")
  def element     = column[Int]("element_id")
  def from_state  = column[Option[Int]]("state_ref_id")
  def title       = column[String]("title")  
    
  def created_at  = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at  = column[Option[org.joda.time.DateTime]]("updated_at")  

  def elementFK   = foreignKey("ses_react_element_fk", element, SessionElemTopologDAO.session_elem_topologs)(_.id, onDelete = ForeignKeyAction.Cascade)
  def bpFK        = foreignKey("ses_react_bprocess_fk", bprocess, bprocesses)(_.id, onDelete = ForeignKeyAction.Cascade)
  def state_FK    = foreignKey("ses_react_state_fk", from_state, models.DAO.SessionInitialStateDAO.session_initial_states)(_.id, onDelete = ForeignKeyAction.Cascade)
  def sessionFK  = foreignKey("react_topo_s_sp_session_fk", session, models.DAO.BPSessionDAO.bpsessions)(_.id, onDelete = ForeignKeyAction.Cascade)

  def * = (id.?, 
           bprocess, 
           session,
           autostart, 
           element,
           from_state,
           title,
           created_at, updated_at) <> (SessionUnitReaction.tupled, SessionUnitReaction.unapply)
}
import scala.concurrent.{ExecutionContext, Awaitable, Await, Future}

case class SessionUnitFutureContainer(units: List[SessionUnitReaction],
    state_outs: List[SessionUnitReactionStateOut],
  session_states:List[BPSessionState]
  )

case class SessionUnitReactionContainer(units: Future[Seq[SessionUnitReaction]], 
  state_outs: List[SessionUnitReactionStateOut],
  session_states:List[BPSessionState])

object SessionReactionDAOF {
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
  import scala.util.Try
  import models.DAO.conversion.DatabaseFuture._
    //import dbConfig.driver.api._ //
  def await[T](a: Awaitable[T])(implicit ec: ExecutionContext) = Await.result(a, Duration.Inf)
  def awaitAndPrint[T](a: Awaitable[T])(implicit ec: ExecutionContext) = println(await(a))
  val session_reactions = SessionReactionDAO.session_reactions

  //private def filterQueryByProcess(process: Int): Query[ProcessHistoriesF, ProcessHistoryDTO, Seq] =
  //  bpsessions.filter(_.process === process)
  private def filterQuery(id: Int): Query[SessionReactionRefs, SessionUnitReaction, Seq] =
    session_reactions.filter(_.id === id)
  private def filterBySessionQuery(id: Int): Query[SessionReactionRefs, SessionUnitReaction, Seq] =
    session_reactions.filter(_.session === id)
  private def filterByProcessQuery(id: Int): Query[SessionReactionRefs, SessionUnitReaction, Seq] =
    session_reactions.filter(_.bprocess === id)
  private def filterByProcessesQuery(id: List[Int]): Query[SessionReactionRefs, SessionUnitReaction, Seq] =
    session_reactions.filter(_.bprocess inSetBind id)

  def findBySession(session_id: Int):Future[Seq[SessionUnitReaction]] = {
     try db.run(filterBySessionQuery(session_id).result)
     finally println("db.close")//db.close
  }
  def findByBP(id: Int):Future[Option[SessionUnitReaction]] = 
    db.run(filterByProcessQuery(id).result.headOption)
  def findAllByBP(id: Int):Future[Seq[SessionUnitReaction]] = 
    db.run(filterByProcessQuery(id).result)
  def findAllByBPS(id: List[Int]):Future[Seq[SessionUnitReaction]] = 
    db.run(filterByProcessesQuery(id).result)

  def findCurrentUnappliedContainer(id: Int, session_id: Int):Future[Option[CurrentSessionReactionContainer]] = {
       val session_statesF = BPSessionStateDAOF.findByBPAndSession(id, session_id)
       val session_reactionsF:Future[Seq[SessionUnitReaction]] = findAllByBP(id)
       session_reactionsF.flatMap { session_reactions =>
       val state_outsF = SessionReactionStateOutDAOF.findByReactions(session_reactions.flatMap(_.id).toList)
       state_outsF.flatMap { state_outs => 
        session_statesF.flatMap { session_states =>
       val unapplied_reactions = session_reactions.filter { reaction =>
          val state_out = state_outs.filter(out => Some(out.reaction) == reaction.id).toList
          val session_state = session_states.find(state => state_out.map(_.state_ref).contains(state.origin_state.getOrElse(0)))//reaction.from_state == state.origin_state)
          session_state match {
            case Some(state) => {
              state_out.map { out =>
                state.on != out.on
                state.on_rate != out.on_rate
              }.reduce(_||_) // OR for multiple state outs
            }
            case _ => false
          }
       }
       /*** Iterate over session_reactions for geting first current reaction*/
       unapplied_reactions.headOption match {
        case Some(reaction) => {
            models.DAO.SessionElemTopologDAOF.getIdentityById(reaction.element).map { identity => 
              identity match {
                case Some(identity) => Some(
                    CurrentSessionReactionContainer(reaction, 
                      identity.title, 
                      identity.front, 
                      identity.nested, 
                      session_id))
                case _ => None
              }        
            }  
        }
        case _ => Future.successful(None)
       }
       }
      }                   
    } 
}
  def findCurrentUnappliedContainerBatch(idz: List[Int], 
                                         session_idz: List[Int]):Future[List[Option[CurrentSessionReactionContainer]]] = {
       //val id = idz.head
       //val session_id = session_idz.head
       val session_statesF = BPSessionStateDAOF.findByBPSAndSessions(idz, session_idz)
       val session_reactionsF:Future[Seq[SessionUnitReaction]] = findAllByBPS(idz)
       val state_outsF = session_reactionsF.flatMap { session_reactions =>
        SessionReactionStateOutDAOF.findByReactions(session_reactions.map { reaction => reaction.id.get }.toList)
       }

       session_reactionsF.flatMap { session_reactions =>
         state_outsF.flatMap { state_outs => 
          session_statesF.flatMap { session_states =>
       val unapplied_reactions = session_reactions.filter { reaction =>
          val state_out = state_outs.filter(out => Some(out.reaction) == reaction.id).toList
          val session_state = session_states.find(state => state_out.map(_.state_ref).contains(state.origin_state.getOrElse(0)))//reaction.from_state == state.origin_state)
          session_state match {
            case Some(state) => {
              state_out.map { out =>
                state.on != out.on
                state.on_rate != out.on_rate
              }.reduce(_||_) // OR for multiple state outs
            }
            case _ => false
          }
       }
       /*** Iterate over session_reactions for geting first current reaction*/
       val reaction_sets = unapplied_reactions.map { reaction => 
         //reaction match {
          //case Some(reaction) => {
            
              models.DAO.SessionElemTopologDAOF.getIdentityById(reaction.element).map { identity => 
                identity match {
                  case Some(identity) => Some(
                      CurrentSessionReactionContainer(reaction, 
                        identity.title, 
                        identity.front, 
                        identity.nested, 
                        reaction.session))
                  case _ => None
                }        
              }  
          //}
          //case _ => Future.successful(None)
         //}
       }.toList
       Future.sequence( reaction_sets )
       }
      }                   
    } 
}



def findUnapplied(id: Int, session_id: Int):Future[SessionUnitFutureContainer] = {
       val session_statesF = BPSessionStateDAOF.findByBPAndSession(id, session_id)
       val session_reactionsF:Future[Seq[SessionUnitReaction]] = findBySession(session_id)

       val state_outsF = SessionReactionStateOutDAOF.findByReactions(await(session_reactionsF).flatMap(_.id).toList)
       state_outsF.flatMap { state_outs => 
        session_reactionsF.flatMap { session_reactions => 
          session_statesF.map { session_states =>
          val unapplied_reactions:Seq[SessionUnitReaction] = session_reactions.filter { reaction =>
              val state_out = state_outs.filter(out => Some(out.reaction) == reaction.id).toList
              val session_state = session_states.find(state => 
                 state_out.map(_.state_ref).contains(state.origin_state.getOrElse(0)))//reaction.from_state == state.origin_state)
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
        SessionUnitFutureContainer(unapplied_reactions.toList,
                                    state_outs.toList,
                                  session_states.toList
                                    )        
        }
       }
      }
} 
/*
       val unapplied_reactions = session_reactions.filter { reaction =>
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
*/



}




















object SessionReactionDAO {
  import scala.util.Try
  import DatabaseCred.database
  import models.DAO.conversion.Implicits._
  val session_reactions = TableQuery[SessionReactionRefs]

  def pull_object(s: SessionUnitReaction) = database withSession {
    implicit session ⇒
      session_reactions returning session_reactions.map(_.id) += s
  }
  def get(k: Int):Option[SessionUnitReaction] = database withSession {
    implicit session ⇒
      val q3 = for { s ← session_reactions if s.id === k } yield s
      q3.list.headOption 
  }
  def findByBP(id: Int):List[SessionUnitReaction] = {
     database withSession { implicit session =>
       val q3 = for { s ← session_reactions if s.bprocess === id } yield s
       q3.list                   
    } 
  }
  def findBySession(id: Int):List[SessionUnitReaction] = {
     database withSession { implicit session =>
       val q3 = for { s ← session_reactions if s.session === id } yield s
       q3.list                   
    } 
  }  
  /**
   * Find session_reactions that are not executed in specific session(they may have executed, 
   * but state out cant be equeal to session state)
   */
  def findUnapplied(id: Int, session_id: Int):List[SessionUnitReaction] = {
     database withSession { implicit session =>
       val session_states = BPSessionStateDAO.findByBPAndSession(id, session_id)
       val session_reactions:List[SessionUnitReaction] = findBySession(session_id)
       val state_outs = SessionReactionStateOutDAO.findByReactions(session_reactions.flatMap(_.id))

       val unapplied_reactions = session_reactions.filter { reaction =>
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
  def findCurrentUnappliedContainer(id: Int, session_id: Int):Option[CurrentSessionReactionContainer] = {
     database withSession { implicit session =>
       val session_states = BPSessionStateDAO.findByBPAndSession(id, session_id)
       val session_reactions:List[SessionUnitReaction] = findByBP(id)
       val state_outs = SessionReactionStateOutDAO.findByReactions(session_reactions.flatMap(_.id))

       val unapplied_reactions = session_reactions.filter { reaction =>
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
        * Iterate over session_reactions for geting first current reaction
        */
       unapplied_reactions.headOption match {
        case Some(reaction) => {
            models.DAO.SessionElemTopologDAO.getIdentityById(reaction.element) match {
              case Some(identity) => Some(CurrentSessionReactionContainer(reaction, identity.title, identity.front, identity.nested, session_id ))
              case _ => None
            }          
        }
        case _ => None
       }
                   
    } 
  }


  def update(id: Int, switcher: SessionUnitReaction) = database withSession { implicit session ⇒
    val switcherToUpdate: SessionUnitReaction = switcher.copy(Option(id))
    session_reactions.filter(_.id === id).update(switcherToUpdate)
  }
  def delete(id: Int) = database withSession { implicit session ⇒
    session_reactions.filter(_.id === id).delete
  }
  def count: Int = database withSession { implicit session ⇒
    Query(session_reactions.length).first
  }

  def ddl_create = {
    database withSession {
      implicit session =>
      session_reactions.ddl.create
    }
  }
  def ddl_drop = {
    database withSession {
      implicit session =>
       session_reactions.ddl.drop
    }
  }
  def getAll = database withSession {
    implicit session ⇒
      val q3 = for { s ← session_reactions } yield s
      q3.list.sortBy(_.id)
  }
}







class SessionReactionStateOuts(tag: Tag) extends Table[SessionUnitReactionStateOut](tag, "session_reaction_state_outs") {
  def id = column[Int]("id", O.PrimaryKey, O.AutoInc) 
  def reaction = column[Int]("reaction_id")
  def state = column[Int]("session_state_id")
  def on = column[Boolean]("on")
  def on_rate = column[Int]("on_rate")

    
  def created_at = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at = column[Option[org.joda.time.DateTime]]("updated_at")  


  def * = (id.?,
    state,
    reaction,
    on,
    on_rate,
    created_at, updated_at) <> (SessionUnitReactionStateOut.tupled, SessionUnitReactionStateOut.unapply)

  def reaction_FK = foreignKey("ses_react_out_reaction_fk", reaction, models.DAO.SessionReactionDAO.session_reactions)(_.id, onDelete = ForeignKeyAction.Cascade)
  def state_FK    = foreignKey("ses_react_out_state_fk", state, models.DAO.SessionInitialStateDAO.session_initial_states)(_.id, onDelete = ForeignKeyAction.Cascade)
//def session_state_refFK = foreignKey("session_state_ref_fk", session_state_ref, SpaceElementReflectionDAO.space_element_reflections)(_.id, onDelete = ForeignKeyAction.Cascade)

}

object SessionReactionStateOutDAOF {
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