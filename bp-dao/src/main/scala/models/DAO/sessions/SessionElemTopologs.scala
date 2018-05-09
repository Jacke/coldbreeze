package models.DAO


import main.scala.bprocesses.{BProcess, BPLoggerResult}
import main.scala.simple_parts.process.ProcElems
import slick.driver.PostgresDriver.api._
import com.github.nscala_time.time.Imports._
import com.github.tototoshi.slick.PostgresJodaSupport._
//import com.github.tminglei.slickpg.date.PgDateJdbcTypes
import slick.model.ForeignKeyAction

import models.DAO._
import models.DAO.sessions._
import models.DAO.conversion.DatabaseCred
import main.scala.simple_parts.process._

case class SessionEitherTypeElement(front: Option[SessionUndefElement] = None,
                                    nested: Option[SessionSpaceElementDTO] = None,
                                    title: String = "",
                                    topoId: Int = -1)

class SessionTopologs(tag: Tag) extends Table[SessionElemTopology](tag, "session_elem_topologs") {
  def id            = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def process       = column[Int]("process_id")
  def hash          = column[String]("hash")
  def session       = column[Int]("session_id")

  def front_elem_id = column[Option[Int]]("front_elem_id")
  def space_elem_id = column[Option[Int]]("space_elem_id")
  def space_id      = column[Option[Int]]("space_id")

  def created_at = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at = column[Option[org.joda.time.DateTime]]("updated_at")

  def * = (id.?, process, session,
          front_elem_id,
          space_elem_id,
          hash,
           created_at, updated_at, space_id) <> (SessionElemTopology.tupled, SessionElemTopology.unapply)

  def bpFK        = foreignKey("topo_bprocess_fk", process, models.DAO.BPDAOF.bprocesses)(_.id, onDelete = ForeignKeyAction.Cascade)
  def procelemFK  = foreignKey("topo_procelem_fk", front_elem_id, models.DAO.sessions.SessionProcElementDAO.session_proc_elements)(_.id, onDelete = ForeignKeyAction.Cascade)
  def spaceelemFK = foreignKey("topo_spaceelem_fk", space_elem_id, models.DAO.sessions.SessionSpaceElemDAO.space_elements)(_.id, onDelete = ForeignKeyAction.Cascade)
  def spaceFK     = foreignKey("topo_bpspace_fk", space_id, models.DAO.sessions.SessionSpaceDAO.session_spaces)(_.id, onDelete = ForeignKeyAction.Cascade)
  def sessionFK   = foreignKey("topo_s_sp_session_fk", session,  models.DAO.BPSessionDAOF.bpsessions)(_.id, onDelete = ForeignKeyAction.Cascade)

}
object SessionElemTopologDAOF {
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
  
  val session_elem_topologs = TableQuery[SessionTopologs]

  private def filterQuery(id: Int): Query[SessionTopologs, SessionElemTopology, Seq] =
    session_elem_topologs.filter(_.id === id)
  private def filterQueryByIds(ids: List[Int]): Query[SessionTopologs, SessionElemTopology, Seq] =
    session_elem_topologs.filter(_.id inSetBind ids)
  private def filterBySession(session: Int): Query[SessionTopologs, SessionElemTopology, Seq] =
    session_elem_topologs.filter(_.session === session)
  private def filterBySessionIds(sessions: List[Int]): Query[SessionTopologs, SessionElemTopology, Seq] =
    session_elem_topologs.filter(_.session inSetBind sessions)


  def get(k: Int):Future[Option[SessionElemTopology]] = {
    db.run(filterQuery(k).result.headOption)
  }
  def getBySession(k: Int):Future[Option[SessionElemTopology]] = {
    db.run(filterBySession(k).result.headOption)
  }
  def getBySessions(k: List[Int]):Future[Seq[SessionElemTopology]] = {
    db.run(filterBySessionIds(k).result)
  }
  def getAllBySession(k: Int):Future[Seq[SessionElemTopology]] = {
    db.run(filterBySession(k).result)
  }

  def getByIds(k: List[Int]):Future[Seq[SessionElemTopology]] =
     db.run(filterQueryByIds(k).result)

  def getIdentityById(k: Int):Future[Option[SessionEitherTypeElement]] = {
    get(k).flatMap { identity =>
      identity match {
      case Some(topo) => {
        if (topo.front_elem_id.isDefined) {
          SessionProcElementDAOF.findById(topo.front_elem_id.get).map { front_el =>
            Some(SessionEitherTypeElement(front = front_el,
                                          nested = None,
                                          title = front_el.get.title))
          }
        } else if (topo.space_elem_id.isDefined) {
          SessionSpaceElemDAOF.findById(topo.space_elem_id.get).map { nested_el =>
            Some(SessionEitherTypeElement(front = None,
                                          nested = nested_el,
                                          title = nested_el.get.title))
          }
        } else {
          Future.successful(None)
        }

      }
      case _ => Future.successful(None)
    }
   }
  }
  def getIdentityByIds(k: List[Int]):Future[Seq[SessionEitherTypeElement]] = { /*
    getByIds(k).flatMap { identity =>
        val computed:Future[Seq[Option[SessionEitherTypeElement]]] = identity.map { topo =>
        if (topo.front_elem_id.isDefined) {
          SessionProcElementDAOF.findById(topo.front_elem_id.get).map { front_el =>
            Some( SessionEitherTypeElement(front = front_el,
                                          nested = None,
                                          title = front_el.get.title,
                                          topoId = topo.id.get))
          }
        } else if (topo.space_elem_id.isDefined) {
          SessionSpaceElemDAOF.findById(topo.space_elem_id.get).map { nested_el =>
            Some( SessionEitherTypeElement(front = None,
                                          nested = nested_el,
                                          title = nested_el.get.title,
                                          topoId = topo.id.get))
          }
        } else { None }
      }
      computed.map { c =>
        c.flatten
      }

   } */
   Future(Seq())
  }

}

object SessionElemTopologDAO {
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
  
  val session_elem_topologs = TableQuery[SessionTopologs]

  private def filterQuery(id: Int): Query[SessionTopologs, SessionElemTopology, Seq] =
    session_elem_topologs.filter(_.id === id)
  private def filterProcessQuery(id: Int): Query[SessionTopologs, SessionElemTopology, Seq] =
    session_elem_topologs.filter(_.process === id)

  private def filterQueryByIds(ids: List[Int]): Query[SessionTopologs, SessionElemTopology, Seq] =
    session_elem_topologs.filter(_.id inSetBind ids)
  private def filterBySession(session: Int): Query[SessionTopologs, SessionElemTopology, Seq] =
    session_elem_topologs.filter(_.session === session)
  private def filterBySessionIds(sessions: List[Int]): Query[SessionTopologs, SessionElemTopology, Seq] =
    session_elem_topologs.filter(_.session inSetBind sessions)



  private def filterQueryByFrontElements(ids: List[Int]): Query[SessionTopologs, SessionElemTopology, Seq] =
    session_elem_topologs.filter(_.front_elem_id inSetBind ids)
  private def filterQueryBySpaceElements(ids: List[Int]): Query[SessionTopologs, SessionElemTopology, Seq] =
    session_elem_topologs.filter(_.space_elem_id inSetBind ids)
  private def filterQueryBySpaces(ids: List[Int]): Query[SessionTopologs, SessionElemTopology, Seq] =
    session_elem_topologs.filter(_.space_id inSetBind ids)

  def findByFrontElements(ids: List[Int]):List[SessionElemTopology] =   {
    await( db.run(filterQueryByFrontElements(ids).result) ).toList
  }
  def findBySpaceElements(ids: List[Int]):List[SessionElemTopology] =   {
    await( db.run(filterQueryBySpaceElements(ids).result) ).toList
  }
  def findBySpaces(ids: List[Int]):List[SessionElemTopology] =   {
    await( db.run(filterQueryBySpaces(ids).result) ).toList
  }   



  def pull_object(s: SessionElemTopology) =   {
    await( db.run( session_elem_topologs returning session_elem_topologs.map(_.id) += s ))
  }

  def findByBP(id: Int):List[SessionElemTopology] =   {
    await(db.run(filterProcessQuery(id).result)).toList
  }

  def findBySession(id: Int):List[SessionElemTopology] =   {
    await(db.run(filterBySession(id).result)).toList
  }

  def getIdentityById(k: Int):Option[SessionEitherTypeElement] = {
    get(k) match {
      case Some(topo) => {
        if (topo.front_elem_id.isDefined) {
          val front_el = SessionProcElementDAO.findById(topo.front_elem_id.get).get
          Some(SessionEitherTypeElement(front = Some(front_el),
                                 nested = None,
                                 title = front_el.title))
        } else if (topo.space_elem_id.isDefined) {
          val nested_el = SessionSpaceElemDAO.findById(topo.space_elem_id.get).get
          Some(SessionEitherTypeElement(front = None,
                                 nested = Some(nested_el),
                                 title = nested_el.title))
        } else {
          None
        }

      }
      case _ => None
    }
  }

  def get(k: Int):Option[SessionElemTopology] =   {
    await(db.run(filterQuery(k).result.headOption))
  }

  def isFront(k: Int):Boolean =   {
      get(k) match {
        case Some(el) => el.front_elem_id.isDefined
        case _ => false
      }
  }

  def isNested(k: Int):Boolean =   {
      get(k)match {
        case Some(el) => el.space_elem_id.isDefined
        case _ => false
      }
  }




  def update(id: Int, topology: SessionElemTopology) =   {
    val topologyToUpdate: SessionElemTopology = topology.copy(Option(id))
    await( db.run( session_elem_topologs.filter(_.id === id).update(topologyToUpdate) ))
  }
  def delete(id: Int) =   {
    await( db.run( session_elem_topologs.filter(_.id === id).delete ))
  }


  val create: DBIO[Unit] = session_elem_topologs.schema.create
  val drop: DBIO[Unit] = session_elem_topologs.schema.drop
  def ddl_create = db.run(create)
  def ddl_drop = db.run(drop)


}
