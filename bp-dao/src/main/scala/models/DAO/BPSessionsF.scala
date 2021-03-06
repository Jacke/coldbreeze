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

class BPSessionsF(tag: Tag) extends Table[BPSession](tag, "bpsessions") {
  def id = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def process = column[Int]("process_id")

  def created_at = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at = column[Option[org.joda.time.DateTime]]("updated_at")
  def active_listed = column[Boolean]("active_listed", O.Default(true))

  def * = (id.?, process, created_at, updated_at, active_listed) <> (BPSession.tupled, BPSession.unapply)

  def bpFK = foreignKey("sess_bprocess_fk", process, models.DAO.BPDAOF.bprocesses)(_.id, onDelete = ForeignKeyAction.Cascade)
}





import main.scala.utils.InputParamProc

object BPSessionDAOF {
  import akka.actor.ActorSystem
  import slick.backend.{StaticDatabaseConfig, DatabaseConfig}

  import slick.jdbc.meta.MTable
  import scala.concurrent.ExecutionContext.Implicits.global
  import scala.concurrent.duration.Duration
  import scala.concurrent.{ExecutionContext, Awaitable, Await, Future}
  import scala.util.Try



  import slick.jdbc._

  //import dbConfig.driver.api._ //
  def await[T](a: Awaitable[T])(implicit ec: ExecutionContext) = Await.result(a, Duration.Inf)
  val bpsessions = TableQuery[BPSessionsF]

  implicit val getBPSessionResult = GetResult(r => BPSession(r.<<, r.<<, r.<<, r.<<, r.<<))
  //private def filterQueryByProcess(process: Int): Query[ProcessHistoriesF, ProcessHistoryDTO, Seq] =
  //  bpsessions.filter(_.process === process)
  private def filterQuery(id: Int): Query[BPSessionsF, BPSession, Seq] =
    bpsessions.filter(_.id === id)
  private def filterQueryByIds(ids: List[Int]): Query[BPSessionsF, BPSession, Seq] =
    bpsessions.filter(_.id inSetBind ids)
  private def filterByProcessQuery(id: Int): Query[BPSessionsF, BPSession, Seq] =
    bpsessions.filter(_.process === id)
  private def filterByProcessesQuery(ids: List[Int]): Query[BPSessionsF, BPSession, Seq] =
    bpsessions.filter(_.process inSetBind ids)

  /***
   * TODO: Pagination
   * Bug with limit
   * Ignore that
   -**/
  private def filterByProcessesTimestampQuery(ids: List[Int], timestamp: Option[String], offset: Int = 0, limit: Int = 900): DBIO[Seq[BPSession]] = {
    val sInt: String = timestamp.getOrElse("0")
    val datetime = new org.joda.time.DateTime(sInt.toLong)
    val ts = datetime.getMillis() / 1000
    var cnames: String = ""
    if (ids.length > 0) {
      cnames = ids.mkString(",")
    } else {
      cnames = "0"
    }
    println("cnames: " + cnames)
    timestamp match {
      case Some(t) => {
        val s = sql"SELECT * from bpsessions where bpsessions.created_at > to_timestamp(${ts}) AND bpsessions.process_id IN (#${cnames}   )"
          .as[BPSession]
        s
      }
      case _ => {
        val s = sql"SELECT * from bpsessions where bpsessions.process_id IN (#${cnames}   ) offset #${offset} limit #${limit}"
          .as[BPSession]
        s
      }
    }
  }

  def pull(s: BPSession):Future[Int] = {
    LaunchCounterDAO.invokeCounterForProcess(process_id = s.process)
    db.run(bpsessions returning bpsessions.map(_.id) += s.copy(created_at = Some(org.joda.time.DateTime.now())) )
  }
  private def filterByProcessesAndIdsQuery(processes_ids: List[Int], session_ids: List[Int]): Query[BPSessionsF, BPSession, Seq] =
    bpsessions.filter(c => (c.process inSetBind processes_ids) && (c.id inSetBind session_ids))


  def getByProcesses(ids: List[Int], offset: Int = 0, limit: Int = 9) =
    db.run(filterByProcessesTimestampQuery(ids, None))


  def countByBusiness(bid: Int, active: Option[Boolean]= None): Future[Int] = {
    val pF = BPDAOF.findByBusiness(bid)
    pF.flatMap { processes =>
      val processIds: List[Int] = processes.map(_.id.get).toList
      val sessF = db.run(filterByProcessesTimestampQuery(processIds, None, limit = 10000))
      sessF.flatMap { sess =>
        println("sess result "+sess.length)
        val allStationsF = BPStationDAOF.findBySessions(sess.map(s => s.id.get).toList, active)
        allStationsF.map { stations =>
          stations.length
        }
      }
    }
  }


  def findByProcess(pid: Int): Option[SessionContainer] =   {
      val p = BPDAO.get(pid)
      p match {
        case Some(process) => {
          val process_id = process.id.get
          val q3 = for { s <- bpsessions if s.process === process_id } yield s
          val sess = await(db.run(q3.result)).toList
          val active = None
          val people = SessionPeoples("iamjacke@gmail.com", List("iamjacke@gmail.com", "tete@gga.ru"))
          val allStationsF = BPStationDAOF.findBySessions(sess.map(s => s.id.get).toList, active)
          val allStations = await(allStationsF)
          Some(
            SessionContainer(process,
              sess.filter(ses => ses.process == process_id && ses.id != Some(-1)).map { ses =>
                val station = allStations.find(s => s.session == ses.id.get)
                //BPStationDAO.findBySession(ses.id.get)
                val element_quantity = SessionProcElementDAO.findBySession(ses.id.get).length //+ SessionSpaceElemDAO.findFlatBySession(ses.id.get).length
                val step = station match {
                  case Some(station) => station.step.toDouble
                  case _ => element_quantity.toDouble
                }
                val percent = percentDecorator(step, element_quantity)
                SessionStatus(percent, process, ses, station,
                  Some(
                    await(AroundProcessElementsBuilder.detectByStationF(
                      process_id = ses.process,
                      station = station,
                      process = Some( process) ) )
                    ),
                  //None,//Some(AroundProcessElementsBuilder.detect(process_id, stationIdDeRef(station) )),
                  Some(people),
                  created_at = ses.created_at,
                  updated_at = ses.updated_at)

              }))
        }
        case _ => None
      }
  }

  def get(k: Int): Option[BPSession] = {
    await(db.run(filterQuery(k).result.headOption) )
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
          await(db.run( bpsessions.filter(_.id === id).update(bpToUpdate) ))
        }
        case _ => -1
      }
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
              await(db.run( bpsessions.filter(_.id === id).delete ))
              id
            }
            case _ => -1
          }
        }
      }
      case _ => Future.successful(-1)
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

  def findByBusiness(bid: Int, timestamp: Option[String] = None, 
                     active: Option[Boolean]= None, 
                     offset:Int = 0): Future[Seq[SessionContainer]] = {
    val pF = BPDAOF.findByBusiness(bid)
    pF.flatMap { processes =>
      val processIds: List[Int] = processes.map(_.id.get).toList

      val sessF = db.run(filterByProcessesTimestampQuery(processIds, timestamp, offset))
      sessF.flatMap { sess =>
        val allStationsF = BPStationDAOF.findBySessions(sess.map(s => s.id.get).toList, active)
        allStationsF.flatMap { stations =>

          Future.sequence(processes.map { process =>
            val stationSessions = stations.map(_.session)
            val clSessions = sess.filter(ses => ses.process == process.id.get)
            val sessionsForProcess = sess.filter(ses => ses.process == process.id.get && stationSessions.contains(ses.id.get) )
            val sessionLength = sessionsForProcess.length
            if (process.id.get == 125) {
              println(s"sessionsForProcess ${process.id.get} - length ${sessionsForProcess.length} ${clSessions.length}")
            }
            val sesStatusF = prepareSessionStatusWithStations(
              process,
              sessionsForProcess,
              stations)

            sesStatusF.map { ses_status =>
              SessionContainer(process, ses_status.toList)
            }

          })
        }
      }
    }
  }

  def findByBusinessAndIds(bid: Int, session_ids: List[Int], withArroundVal: Boolean = false): Future[Seq[SessionContainer]] = {
    val pF = BPDAOF.findByBusiness(bid)
    pF.flatMap { processes =>
      val processIds: List[Int] = processes.map(_.id.get).toList
      val sessF = db.run(filterByProcessesAndIdsQuery(processIds, session_ids).result)
      sessF.flatMap { sess =>
        println("findByBusinessAndIds")
        println("findByBusinessAndIds sessions.length: " + sess.length)
        val allStationsF = BPStationDAOF.findBySessions(sess.map(s => s.id.get).toList)
        allStationsF.flatMap { stations =>
          println("findByBusinessAndIds")
          println("findByBusinessAndIds stations.length: " + stations.length)
          Future.sequence(processes.map { process =>
            val sesStatusF = prepareSessionStatusWithStations(process,
              sess.filter(ses => ses.process == process.id.get),
              stations, withArroundVal)
            sesStatusF.map { ses_status =>
              SessionContainer(process, ses_status.toList)
            }
          })
        }
      }
    }
  }

  def findByProcesses(pids: Seq[Int]): Future[Seq[BPSession]] = 
    db.run(filterByProcessesQuery(pids.toList).result)

  def findListedByBusiness(bid: Int): Future[Seq[SessionContainer]] = {
    val pF: Future[Seq[BProcessDTO]] = BPDAOF.findByBusiness(bid)

    pF.flatMap { p =>
      val ids = p.flatMap(_.id)
      val sessF: Future[Seq[BPSession]] = db.run(filterByProcessesQuery(ids.toList).result)

      sessF.flatMap { sess =>
        val sessionContainers = Future.sequence(
          p.map { p =>
            val sessionsStasusF: Future[Seq[SessionStatus]] = prepareSessionStatus(p, sess)

            sessionsStasusF.map { sessions =>
              SessionContainer(p,
                // \|/ Second argument of session container
                sessions = sessions.toList)
            }
          })
        sessionContainers
      }
    }
  }

  def prepareSessionStatusWithStations(p: BProcessDTO,
    sess: Seq[BPSession], stations: Seq[BPStationDTO],
    withArroundVal: Boolean = false): Future[Seq[SessionStatus]] = {
    //    println("prepareSessionStatusWithStations")
    //    println("prepareSessionStatusWithStations session.length: " + sess.length)
    val people = SessionPeoples("not@found.com", List()) // placeholder for peoples
    Future.sequence(
      sess.filter(ses => ses.process == p.id.get).map { ses =>
        println(s"ses ${ses.created_at}")
        val station = stations.find(station => station.session == ses.id.get)
        val element_quantityF = SessionProcElementDAOF.findBySessionLength(ses.id.get)
        element_quantityF.map { element_quantity =>

          val step = station match {
            case Some(station) => station.step.toDouble
            case _ => element_quantity.toDouble
          }
          val percent = percentDecorator(step, element_quantity)
          withArround(withArroundVal, Some(ses), station, Some(p)) match {
            case Some(futureAr) => {
              //futureAr.flatMap { arr =>
              SessionStatus(percent, p, ses, station, Some(await(futureAr)), Some(people),
                created_at = ses.created_at,
                updated_at = ses.updated_at)
              //}
            }
            case _ => SessionStatus(percent, p, ses, station, None, Some(people),
              created_at = ses.created_at,
              updated_at = ses.updated_at)
          }

        }

      })
  }

  def prepareSessionStatus(p: BProcessDTO, sess: Seq[BPSession], withArroundVal: Boolean = false): Future[Seq[SessionStatus]] = {
    val people = SessionPeoples("not@found.com", List()) // placeholder for peoples
    Future.sequence(
      sess.filter(ses => ses.process == p.id.get).map { ses =>
        val stationF = BPStationDAOF.findBySessionF(ses.id.get)
        val element_quantityF = SessionProcElementDAOF.findBySessionLength(ses.id.get)
        println(s"ses ${ses.created_at}")
        stationF.flatMap { station =>
          element_quantityF.map { element_quantity =>
            val step = station match {
              case Some(station) => station.step.toDouble
              case _ => element_quantity.toDouble
            }
            val percent = percentDecorator(step, element_quantity)
            withArround(withArroundVal) match {
              case Some(futureAr) => { //futureAr.flatMap { arr =>
                println("withArround")
                val ar = await(futureAr)
                println(ar)
                SessionStatus(percent, p, ses, station, Some(ar), Some(people),
                  created_at = ses.created_at,
                  updated_at = ses.updated_at)
                //}
              }
              case _ => SessionStatus(percent, p, ses, station, None, Some(people),
                created_at = ses.created_at,
                updated_at = ses.updated_at)
            }
          }
        }
      })
  }
  def withArround(yes: Boolean = true,
    sesOpt: Option[BPSession] = None,
    stationOpt: Option[BPStationDTO] = None,
    processOpt: Option[models.DAO.BProcessDTO] = None): Option[Future[ElemAround]] = {
    if (yes) {
      val aroundF = AroundProcessElementsBuilder.detectByStationF(process_id = sesOpt.get.process,
        station = stationOpt,
        process = processOpt)
      println("withArround:")
      Some(aroundF)
    } else {
      None
    }
  }

  def findById(id: Int): Future[Option[SessionContainer]] = {
    val sessF: Future[Option[BPSession]] =
      db.run(filterQuery(id).result.headOption)
    //finally println("db.close")//db.close
    sessF.flatMap { sess =>
      sess match {
        case Some(ses) => {
          println(s"ses ${ses.created_at}")
          val stationF = BPStationDAOF.findBySessionF(ses.id.get)
          val element_quantityF = SessionProcElementDAOF.findBySessionLength(ses.id.get)
          val pF: Future[Option[BProcessDTO]] = BPDAOF.get(ses.process)
          val people = SessionPeoples("not@found.com", List()) // placeholder for peoples
          pF.flatMap { process =>
            stationF.flatMap { station =>
              val aroundF = AroundProcessElementsBuilder.detectByStationF(process_id = ses.process,
                station = station,
                process = process)

              element_quantityF.flatMap { element_quantity =>
                val step: Double = station match {
                  case Some(station) => station.step.toDouble
                  case _ => element_quantity.toDouble
                }
                aroundF.map { around =>
                  val percent = percentDecorator(step, element_quantity)
                  Some(SessionContainer(process.get,
                    List(SessionStatus(percent,
                      process.get,
                      ses,
                      station,
                      Some(around),
                      Some(people),
                      created_at = ses.created_at,
                      updated_at = ses.updated_at))))
                }
              }
            }
          }
        }
        case _ => Future(None)
      }
    }
  }

  def findByIds(ids: List[Int]): Future[Seq[SessionContainer]] = {
    val sessF: Future[Seq[BPSession]] =
      db.run(filterQueryByIds(ids).result)
    //finally println("db.close")//db.close
    sessF.flatMap { sessSeq =>
      Future.sequence(sessSeq.map { ses =>
        println(s"ses ${ses.created_at}")
        val stationF = BPStationDAOF.findBySessionF(ses.id.get)
        val element_quantityF = SessionProcElementDAOF.findBySessionLength(ses.id.get)
        val pF: Future[Option[BProcessDTO]] = BPDAOF.get(ses.process)
        val people = SessionPeoples("not@found.com", List()) // placeholder for peoples
        pF.flatMap { process =>
          stationF.flatMap { station =>
            val aroundF = AroundProcessElementsBuilder.detectByStationF(process_id = ses.process,
              station = station,
              process = process)
            element_quantityF.flatMap { element_quantity =>
              val step: Double = station match {
                case Some(station) => station.step.toDouble
                case _ => element_quantity.toDouble
              }
              aroundF.map { around =>
                val percent = percentDecorator(step, element_quantity)
                SessionContainer(process.get,
                  List(SessionStatus(percent,
                    process.get,
                    ses,
                    station,
                    Some(around),
                    Some(people),
                    created_at = ses.created_at,
                    updated_at = ses.updated_at)))
              }
            }
          }
        }

      })
    }
  }

  private def stationIdDeRef(station: Option[BPStationDTO]) = {
    station match {
      case Some(station) => station.id.get
      case _ => -1
    }
  }

  def percentDecorator(step: Double, element_quantity: Int): Int = {
    if (step == 1 && element_quantity == 1) { // Temp fix for process with ONE finished  element
      100
    } else {
      (step / element_quantity.toDouble * 100).toInt
    }
  }

} // Future Impl
