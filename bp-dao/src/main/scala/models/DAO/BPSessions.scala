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

class BPSessions(tag: Tag) extends Table[BPSession](tag, "bpsessions") {
  def id = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def process = column[Int]("process_id")

  def created_at = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at = column[Option[org.joda.time.DateTime]]("updated_at")
  def active_listed = column[Boolean]("active_listed", O.Default(true))

  def * = (id.?, process, created_at, updated_at, active_listed) <> (BPSession.tupled, BPSession.unapply)

  def bpFK = foreignKey("sess_bprocess_fk", process, models.DAO.BPDAOF.bprocesses)(_.id, onDelete = ForeignKeyAction.Cascade)
}

case class SessionPeoples(launched_by: String, participators: List[String])

case class SessionStatus(var percent: Int = 0,
  process: BProcessDTO,
  session: BPSession,
  station: Option[BPStationDTO],
  around: Option[ElemAround] = None,
  peoples: Option[SessionPeoples] = None,
  created_at: Option[org.joda.time.DateTime] = None,
  updated_at: Option[org.joda.time.DateTime] = None)
//,                         interactions: List[Interaction] = List())
case class SessionContainer(process: BProcessDTO,
  var sessions: List[SessionStatus]) {

}
import main.scala.utils.InputParamProc






object BPSessionDAO {
  import akka.actor.ActorSystem
  import slick.backend.{StaticDatabaseConfig, DatabaseConfig}

  import slick.jdbc.meta.MTable
  import scala.concurrent.ExecutionContext.Implicits.global
  import scala.concurrent.duration.Duration
  import scala.concurrent.{ExecutionContext, Awaitable, Await, Future}
  import scala.util.Try



  import slick.jdbc._

  def await[T](a: Awaitable[T])(implicit ec: ExecutionContext) = Await.result(a, Duration.Inf)
  val bpsessions = TableQuery[BPSessions]


  private def filterQuery(id: Int): Query[BPSessions, BPSession, Seq] =
    bpsessions.filter(_.id === id)


  private def filterQueryProcesses(ids: List[Int]): Query[BPSessions, BPSession, Seq] =
    bpsessions.filter(_.process inSetBind ids)


  def pull_object(s: BPSession) = {
    BPSessionDAOF.await(BPSessionDAOF.pull(s.copy( created_at = Some(org.joda.time.DateTime.now()  ) )) )
  }
  def countByProcess(p: Int) = {
    LaunchCounterDAO.await( LaunchCounterDAO.getCountByProcess(p) )
  }
  def updateMeta(id: Int, step: Double) = {
    val obj = get(id)
     obj match {
      case Some(ses) => {
        val launchToUpdate: BPSession = ses.copy(Option(id),
                                                 updated_at = Some(org.joda.time.DateTime.now()))
        val procF = BPDAOF.get(ses.process).map { procOpt =>
          procOpt match {
            case Some(proc) => {
              val element_quantityF = SessionProcElementDAOF.findBySessionLength(ses.id.get)
              element_quantityF.map { element_quantity =>
                val percent = BPSessionDAOF.percentDecorator(step, element_quantity)
                CachedRemovedResourcesDAO.makeResourceUpdateEntity(
                  scope = proc.business.toString,
                  action = "updated",
                  resourceTitle = "launches",
                  resourceId = s"$id",
                  updatedEntity = Map("percent" -> percent.toString,
                                      "step" -> step.toString
                                    )
                )
                BPSessionDAOF.await( db.run( bpsessions.filter(_.id === id).update(launchToUpdate) ) )
              }
            }
            case _ => -1
          }
        }
      }
      case _ => -1
    }
  }
  def getByProcesses(processes: List[Int]) = {
    await(db.run(filterQueryProcesses(processes).result) )
  }

  def get(k: Int): Option[BPSession] = {
    await(db.run(filterQuery(k).result.headOption) )
  }

  def delete(id: Int, scope: String): Future[Int] = {
    BPSessionDAO.get(id) match {
      case Some(launch) => {
        val procF = BPDAOF.get(launch.process)
        procF.map { procOpt =>
          procOpt match {
            case Some(proc) => {
              CachedRemovedResourcesDAO.makeResourceRemoveEntity(
                scope = scope,
                action = "removed",
                resourceTitle = "launches",
                resourceId = s"$id")
              bpsessions.filter(_.id === id).delete
              id
            }
            case _ => -1
          }
        }
      }
      case _ => Future.successful(-1)
    }
  }

/*
  def findByBusiness(bid: Int): List[SessionContainer] =   {

      val p = BPDAO.findByBusiness(bid)
      val ids = p.map(_.id.get)
      val q3 = for { s <- bpsessions if s.process inSetBind ids } yield s
      val sess = q3.list

      p.map { p =>
        SessionContainer(p,
          sess.filter(ses => ses.process == p.id.get).map { ses =>
            val station = BPStationDAO.findBySession(ses.id.get)
            val element_quantity = SessionProcElementDAO.findBySession(ses.id.get).length //+ SessionSpaceElemDAO.findFlatBySession(ses.id.get).length
            val step = station match {
              case Some(station) => station.step.toDouble
              case _ => element_quantity.toDouble
            }
            val percent = percentDecorator(step, element_quantity)
            SessionStatus(percent, p, ses, station, None,
              created_at = ses.created_at,
              updated_at = ses.updated_at) //Some(AroundProcessElementsBuilder.detect(p.id.get, station.get.id.get)))
          })
      }
  }
  def findById(id: Int): Option[SessionContainer] =   {

      val q3 = for { s <- bpsessions if s.id === id } yield s
      val sess = q3.list.headOption

      sess match {
        case Some(ses) => {
          val stationF = BPStationDAOF.findBySessionF(ses.id.get)
          val element_quantity = SessionProcElementDAO.findBySession(ses.id.get).length //+ SessionSpaceElemDAO.findFlatBySession(ses.id.get).length
          val process = BPDAO.get(ses.process).get
          val people = SessionPeoples("not@found.com", List()) // placeholder for peoples

          val station = BPStationDAOF.await(stationF)
          val step = station match {
            case Some(station) => station.step.toDouble
            case _ => element_quantity.toDouble
          }
          val percent = percentDecorator(step, element_quantity)

          Some(SessionContainer(process,
            List(SessionStatus(percent,
              process,
              ses,
              station,
              Some(AroundProcessElementsBuilder.detectByStation(ses.process,
                station,
                Some(process))),
              Some(people),
              created_at = ses.created_at,
              updated_at = ses.updated_at))))

        }
        case _ => None
      }
  }
  /*
  def findByIdF(id: Int):Option[SessionContainer] = {
    val q3 = for { s <- bpsessions if s.id === id } yield s
    val sess = q3.list.headOption

    sess match {
      case Some(ses) => {
        val station = BPStationDAO.findBySession(ses.id.get)
        val element_quantity = SessionProcElementDAO.findBySession(ses.id.get).length //+ SessionSpaceElemDAO.findFlatBySession(ses.id.get).length
        val process = BPDAO.get(ses.process).get
        val people = SessionPeoples("not@found.com", List()) // placeholder for peoples

        val step = station match {
          case Some(station) => station.step.toDouble
          case _ => element_quantity.toDouble
        }
        val percent = percentDecorator(step, element_quantity)

      Some(SessionContainer(process,
        List(SessionStatus(percent, process, ses, station, Some(AroundProcessElementsBuilder.detect(ses.process, station.get.id.get)),
          Some(people)))
      ))

      }
      case _ => None
  }
  */
  def findListedByBusiness(bid: Int): List[SessionContainer] =   {

      val p = BPDAO.findByBusiness(bid)
      val ids = p.flatMap(_.id)
      val q3 = for { s <- bpsessions if (s.process inSetBind ids) && s.active_listed === true } yield s
      val sess = q3.list
      val people = SessionPeoples("not@found.com", List()) // placeholder for peoples

      p.map { p =>
        SessionContainer(p,
          sess.filter(ses => ses.process == p.id.get).map { ses =>
            val station = BPStationDAO.findBySession(ses.id.get)
            val element_quantity = SessionProcElementDAO.findBySession(ses.id.get).length //+ SessionSpaceElemDAO.findFlatBySession(ses.id.get).length
            val step = station match {
              case Some(station) => station.step.toDouble
              case _ => element_quantity.toDouble
            }
            val percent = percentDecorator(step, element_quantity)
            SessionStatus(percent, p, ses, station, None, Some(people), created_at = ses.created_at,
              updated_at = ses.updated_at) //Some(AroundProcessElementsBuilder.detect(p.id.get, station.get.id.get)))
          })
      }
  }
  def makeUnlisted(id: Int) =   {
      get(id) match {
        case Some(session) => {
          update(id, session.copy(active_listed = false))
          id
        }
        case _ => -1
      }
  }
  def makeListed(id: Int) =   {

      get(id) match {
        case Some(session) => {
          update(id, session.copy(active_listed = true))
          id
        }
        case _ => -1
      }
  }

  def findByProcess(pid: Int): Option[SessionContainer] =   {

      val p = BPDAO.get(pid)
      p match {
        case Some(process) => {
          val process_id = process.id.get
          val q3 = for { s <- bpsessions if s.process === process_id } yield s
          val sess = q3.list
          val people = SessionPeoples("iamjacke@gmail.com", List("iamjacke@gmail.com", "tete@gga.ru"))

          Some(
            SessionContainer(process,
              sess.filter(ses => ses.process == process_id && ses.id != Some(-1)).map { ses =>
                val station = BPStationDAO.findBySession(ses.id.get)
                val element_quantity = SessionProcElementDAO.findBySession(ses.id.get).length //+ SessionSpaceElemDAO.findFlatBySession(ses.id.get).length
                val step = station match {
                  case Some(station) => station.step.toDouble
                  case _ => element_quantity.toDouble
                }
                val percent = percentDecorator(step, element_quantity)
                SessionStatus(percent, process, ses, station,
                  Some(AroundProcessElementsBuilder.detect(process_id, stationIdDeRef(station) )),
                  Some(people),
                  created_at = ses.created_at,
                  updated_at = ses.updated_at)

              }))
        }
        case _ => None
      }
  }
  private def stationIdDeRef(station: Option[BPStationDTO]) = {
    station match {
      case Some(station) => station.id.get
      case _ => -1
    }
  }

  def findByBP(id: Int): List[BPSession] =   {

      val q3 = for { s <- bpsessions if s.process === id } yield s
      q3.list
  }
  def getByProcesses(processes: List[Int]) =   {

      val q3 = for { s ← bpsessions if s.process inSetBind processes } yield s
      q3.list
  }

  def get(k: Int): Option[BPSession] =   {

      val q3 = for { s ← bpsessions if s.id === k } yield s
      q3.list.headOption
  }

  def update(id: Int, bpsession: BPSession) =   {
    val bpToUpdate: BPSession = bpsession.copy(Option(id))
    val procF = BPDAOF.get(bpsession.process).map { procOpt =>
      procOpt match {
        case Some(proc) => {
          CachedRemovedResourcesDAO.makeResourceUpdateEntity(
            scope = proc.business.toString,
            action = "updated",
            resourceTitle = "launches",
            resourceId = s"$id",
            updatedEntity = Map("active_listed" -> bpToUpdate.active_listed.toString))
          bpsessions.filter(_.id === id).update(bpToUpdate)
        }
        case _ => -1
      }
    }
  }

  def updateMeta(id: Int, step: Double) =   {
    get(id) match {
      case Some(ses) => {
        val launchToUpdate: BPSession = ses.copy(Option(id),
                                                 updated_at = Some(org.joda.time.DateTime.now()))
        val procF = BPDAOF.get(ses.process).map { procOpt =>
          procOpt match {
            case Some(proc) => {
              val element_quantityF = SessionProcElementDAOF.findBySessionLength(ses.id.get)
              element_quantityF.map { element_quantity =>
                val percent = BPSessionDAOF.percentDecorator(step, element_quantity)
                CachedRemovedResourcesDAO.makeResourceUpdateEntity(
                  scope = proc.business.toString,
                  action = "updated",
                  resourceTitle = "launches",
                  resourceId = s"$id",
                  updatedEntity = Map("percent" -> percent.toString,
                                      "step" -> step.toString
                                    )
                )
                bpsessions.filter(_.id === id).update(launchToUpdate)
              }
            }
            case _ => -1
          }
        }
      }
      case _ => -1
    }
  }

  def delete(id: Int, scope: String): Future[Int] =   {
    BPSessionDAO.get(id) match {
      case Some(launch) => {
        val procF = BPDAOF.get(launch.process)
        procF.map { procOpt =>
          procOpt match {
            case Some(proc) => {
              CachedRemovedResourcesDAO.makeResourceRemoveEntity(
                scope = scope,
                action = "removed",
                resourceTitle = "launches",
                resourceId = s"$id")
              bpsessions.filter(_.id === id).delete
              id
            }
            case _ => -1
          }
        }
      }
      case _ => Future.successful(-1)
    }
  }

  def count: Int =   {
    Query(bpsessions.length).first
  }
  def countByProcess(p: Int) = {
    LaunchCounterDAO.await( LaunchCounterDAO.getCountByProcess(p) )
  }

  val create: DBIO[Unit] = bpsessions.schema.create
  val drop: DBIO[Unit] = bpsessions.schema.drop

  def ddl_create = db.run(create)
  def ddl_drop = db.run(drop)


  def getAll =   {

      val q3 = for { s ← bpsessions } yield s
      q3.list.sortBy(_.id)
  }

  def percentDecorator(step: Double, element_quantity: Int): Int = {
    if (step == 1 && element_quantity == 1) {
      0
    } else {
      (step / element_quantity.toDouble * 100).toInt
    }
  }

*/

}
