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
import models.DAO._
import models.DAO.sessions._
import builders._
import main.scala.bprocesses.BPSession

class BPSessions(tag: Tag) extends Table[BPSession](tag, "bpsessions") {
  def id            = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def process       = column[Int]("process_id")

  def created_at    = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at    = column[Option[org.joda.time.DateTime]]("updated_at")
  def active_listed = column[Boolean]("active_listed", O.Default(true))

  def *    = (id.?, process, created_at, updated_at, active_listed) <> (BPSession.tupled, BPSession.unapply)

  def bpFK = foreignKey("sess_bprocess_fk", process, models.DAO.BPDAO.bprocesses)(_.id, onDelete = ForeignKeyAction.Cascade)
}

case class SessionPeoples(launched_by: String, participators: List[String])

case class SessionStatus(var percent: Int = 0,
                         process:BProcessDTO,
                         session: BPSession,
                         station: Option[BPStationDTO],
                         around: Option[ElemAround] = None,
                         peoples: Option[SessionPeoples] = None)
//,                         interactions: List[Interaction] = List())
case class SessionContainer(process: BProcessDTO,
                            var sessions: List[SessionStatus]) {

}
import main.scala.utils.InputParamProc


object BPSessionDAOF {
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
  import slick.jdbc._

  //import dbConfig.driver.api._ //
  def await[T](a: Awaitable[T])(implicit ec: ExecutionContext) = Await.result(a, Duration.Inf)
  def awaitAndPrint[T](a: Awaitable[T])(implicit ec: ExecutionContext) = println(await(a))
  val bpsessions = BPSessionDAO.bpsessions

implicit val getBPSessionResult = GetResult(r => BPSession(r.<<, r.<<))
  //private def filterQueryByProcess(process: Int): Query[ProcessHistoriesF, ProcessHistoryDTO, Seq] =
  //  bpsessions.filter(_.process === process)
  private def filterQuery(id: Int): Query[BPSessions, BPSession, Seq] =
    bpsessions.filter(_.id === id)
  private def filterQueryByIds(ids: List[Int]): Query[BPSessions, BPSession, Seq] =
    bpsessions.filter(_.id inSetBind ids)
  private def filterByProcessQuery(id: Int): Query[BPSessions, BPSession, Seq] =
    bpsessions.filter(_.process === id)
  private def filterByProcessesQuery(ids: List[Int]): Query[BPSessions, BPSession, Seq] =
    bpsessions.filter(_.process inSetBind ids)

  private def filterByProcessesTimestampQuery(ids: List[Int], timestamp: Option[String]): DBIO[Seq[BPSession]] = {
      val sInt:String = timestamp.getOrElse("0")
      val datetime = new org.joda.time.DateTime(sInt.toLong)
      val ts = datetime.getMillis() / 1000
      var cnames: String = ""
      if (ids.length > 0) {
        cnames = ids.mkString(",")
      } else {
        cnames = "0"
      }
      println("cnames: "+cnames)
val s = sql"SELECT * from bpsessions where bpsessions.created_at > to_timestamp(${ts}) AND bpsessions.process_id IN (#${cnames}   )"
  .as[BPSession]
      s
}

  private def filterByProcessesAndIdsQuery(processes_ids: List[Int], session_ids: List[Int]): Query[BPSessions, BPSession, Seq] =
    bpsessions.filter(c => (c.process inSetBind processes_ids) && (c.id inSetBind session_ids) )


def findByBusiness(bid: Int, timestamp: Option[String] = None):Future[Seq[SessionContainer]] = {
    val pF = BPDAOF.findByBusiness(bid)
    pF.flatMap { processes =>
      val processIds:List[Int] = processes.map(_.id.get).toList
      val sessF = db.run(filterByProcessesTimestampQuery(processIds, timestamp))
      sessF.flatMap { sess =>
        println("sess result ")
        val allStationsF = BPStationDAOF.findBySessions(sess.map(s => s.id.get).toList)
        allStationsF.flatMap { stations =>
          Future.sequence( processes.map { process =>
              val sesStatusF = prepareSessionStatusWithStations(process,
                                                                sess.filter(ses => ses.process == process.id.get),
                                                                stations)
              sesStatusF.map { ses_status =>
                SessionContainer(process, ses_status.toList)
              }
          }
          )
        }
      }
    }
}







def findByBusinessAndIds(bid: Int, session_ids: List[Int], withArroundVal:Boolean=false):Future[Seq[SessionContainer]] = {
    val pF = BPDAOF.findByBusiness(bid)
    pF.flatMap { processes =>
      val processIds:List[Int] = processes.map(_.id.get).toList
      val sessF = db.run(filterByProcessesAndIdsQuery(processIds, session_ids).result)
      sessF.flatMap { sess =>
        println("findByBusinessAndIds")
        println("findByBusinessAndIds sessions.length: " + sess.length)
        val allStationsF = BPStationDAOF.findBySessions(sess.map(s => s.id.get).toList)
        allStationsF.flatMap { stations =>
          println("findByBusinessAndIds")
          println("findByBusinessAndIds stations.length: " + stations.length)
          Future.sequence( processes.map { process =>
              val sesStatusF = prepareSessionStatusWithStations(process,
                                                sess.filter(ses => ses.process == process.id.get),
                                                                stations, withArroundVal)
              sesStatusF.map { ses_status =>
                SessionContainer(process, ses_status.toList)
              }
          }
          )
        }
      }
    }
}



  def findListedByBusiness(bid: Int):Future[Seq[SessionContainer]] = {
    val pF:Future[Seq[BProcessDTO]] = BPDAOF.findByBusiness(bid)

    pF.flatMap { p =>
      val ids = p.flatMap(_.id)
      val sessF:Future[Seq[BPSession]] = db.run(filterByProcessesQuery(ids.toList).result)

      sessF.flatMap { sess =>
        val sessionContainers = Future.sequence(
          p.map { p =>
        val sessionsStasusF:Future[Seq[SessionStatus]] = prepareSessionStatus(p, sess)

      sessionsStasusF.map { sessions =>
          SessionContainer(p,
          // \|/ Second argument of session container
          sessions = sessions.toList  )
        }
      } )
      sessionContainers
    }
  }
}
  def prepareSessionStatusWithStations(p:BProcessDTO,
    sess: Seq[BPSession], stations:Seq[BPStationDTO],
    withArroundVal:Boolean=false):Future[Seq[SessionStatus]] = {
//    println("prepareSessionStatusWithStations")
//    println("prepareSessionStatusWithStations session.length: " + sess.length)
     val people = SessionPeoples("not@found.com", List()) // placeholder for peoples
     Future.sequence(
     sess.filter(ses => ses.process == p.id.get).map { ses =>
        val station = stations.find(station => station.session == ses.id.get)
        val element_quantityF = SessionProcElementDAOF.findBySessionLength(ses.id.get)
          element_quantityF.map { element_quantity =>

            val step = station match {
              case Some(station) => station.step.toDouble
              case _ => element_quantity.toDouble
            }
            val percent = percentDecorator(step, element_quantity)
            withArround(withArroundVal, Some(ses), station, Some(p) ) match {
             case Some(futureAr) => {
              //futureAr.flatMap { arr =>
                SessionStatus(percent, p, ses, station, Some(await(futureAr) ), Some(people))
              //}
             }
             case _ => SessionStatus(percent, p, ses, station, None, Some(people))
            }


          }

      } )
  }
  def prepareSessionStatus(p:BProcessDTO,sess: Seq[BPSession], withArroundVal:Boolean=false):Future[Seq[SessionStatus]] = {
     val people = SessionPeoples("not@found.com", List()) // placeholder for peoples
     Future.sequence(
     sess.filter(ses => ses.process == p.id.get).map { ses =>
        val stationF = BPStationDAOF.findBySessionF(ses.id.get)
        val element_quantityF = SessionProcElementDAOF.findBySessionLength(ses.id.get)
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
                SessionStatus(percent, p, ses, station, Some( ar ), Some(people))
             //}
             }
             case _ => SessionStatus(percent, p, ses, station, None, Some(people))
            }
          }
        }
      } )
  }
  def withArround(yes:Boolean = true,
    sesOpt: Option[BPSession] = None,
    stationOpt: Option[BPStationDTO] = None,
    processOpt: Option[models.DAO.BProcessDTO] = None):Option[Future[ElemAround]] = {
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

  def findById(id: Int):Future[Option[SessionContainer]] = {
    val sessF:Future[Option[BPSession]] =
      db.run(filterQuery(id).result.headOption)
      //finally println("db.close")//db.close
    sessF.flatMap { sess =>
    sess match {
      case Some(ses) => {
        val stationF = BPStationDAOF.findBySessionF(ses.id.get)
        val element_quantityF = SessionProcElementDAOF.findBySessionLength(ses.id.get)
        val pF:Future[Option[BProcessDTO]] = BPDAOF.get(ses.process)
        val people = SessionPeoples("not@found.com", List()) // placeholder for peoples
      pF.flatMap { process =>
          stationF.flatMap { station =>
        val aroundF = AroundProcessElementsBuilder.detectByStationF(process_id = ses.process,
                                                                  station = station,
                                                                  process = process)

        element_quantityF.flatMap { element_quantity =>
        val step:Double = station match {
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
                  Some(people)))
            ))
        }
        }
          }
      }
      }
        case _ => Future(None)
      }
    }
  }
  def findByIds(ids: List[Int]):Future[Seq[SessionContainer]] = {
    val sessF:Future[Seq[BPSession]] =
      db.run(filterQueryByIds(ids).result)
      //finally println("db.close")//db.close
    sessF.flatMap { sessSeq =>
    Future.sequence( sessSeq.map { ses =>
        val stationF = BPStationDAOF.findBySessionF(ses.id.get)
        val element_quantityF = SessionProcElementDAOF.findBySessionLength(ses.id.get)
        val pF:Future[Option[BProcessDTO]] = BPDAOF.get(ses.process)
        val people = SessionPeoples("not@found.com", List()) // placeholder for peoples
      pF.flatMap { process =>
          stationF.flatMap { station =>
              val aroundF = AroundProcessElementsBuilder.detectByStationF(process_id = ses.process,
                                                                          station = station,
                                                                          process = process)
              element_quantityF.flatMap { element_quantity =>
              val step:Double = station match {
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
                          Some(people)))
                    )
                }
              }
          }
      }


      })
    }
  }


  def percentDecorator(step: Double, element_quantity:Int):Int = {
    if (step == 1 && element_quantity == 1) {
        0
    } else {
      ( step / element_quantity.toDouble * 100).toInt
    }
  }


} // Future Impl





object BPSessionDAO {
  import scala.util.Try
  import DatabaseCred.database
  import models.DAO.conversion.Implicits._
  import scala.concurrent.ExecutionContext.Implicits.global
  import scala.concurrent.duration.Duration
  import scala.concurrent.{ExecutionContext, Awaitable, Await, Future}


  val bpsessions = TableQuery[BPSessions]

  def pull_object(s: BPSession) = database withSession {
    implicit session ⇒
      bpsessions returning bpsessions.map(_.id) += s
  }

  def findByBusiness(bid: Int):List[SessionContainer] = database withSession {
    implicit session =>
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
        SessionStatus(percent, p, ses, station, None)//Some(AroundProcessElementsBuilder.detect(p.id.get, station.get.id.get)))
      })
    }
  }
  def findById(id: Int):Option[SessionContainer] = database withSession {
    implicit session =>
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
          Some(people)))
      ))

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
  def findListedByBusiness(bid: Int):List[SessionContainer] = database withSession {
    implicit session =>
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
        SessionStatus(percent, p, ses, station, None, Some(people))//Some(AroundProcessElementsBuilder.detect(p.id.get, station.get.id.get)))
      })
    }
  }
  def makeUnlisted(id: Int) = database withSession {
    implicit session =>
    get(id) match {
      case Some(session) => {
        update(id, session.copy(active_listed = false))
        id
      }
      case _ => -1
    }
  }
  def makeListed(id: Int) = database withSession {
    implicit session =>
    get(id) match {
      case Some(session) => {
        update(id, session.copy(active_listed = true))
        id
      }
      case _ => -1
    }
  }

  def findByProcess(pid: Int):Option[SessionContainer] = database withSession {
    implicit session =>
    val p = BPDAO.get(pid)
    p match {
      case Some(process) => {
      val process_id = process.id.get
      val q3 = for { s <- bpsessions if s.process === process_id } yield s
      val sess = q3.list
      val people = SessionPeoples("iamjacke@gmail.com", List("iamjacke@gmail.com", "tete@gga.ru"))


        Some(
          SessionContainer(process,
          sess.filter(ses => ses.process == process_id && ses.id != Some(-1) ).map { ses =>
          val station = BPStationDAO.findBySession(ses.id.get)
          val element_quantity = SessionProcElementDAO.findBySession(ses.id.get).length //+ SessionSpaceElemDAO.findFlatBySession(ses.id.get).length
          val step = station match {
            case Some(station) => station.step.toDouble
            case _ => element_quantity.toDouble
          }
          val percent = percentDecorator(step, element_quantity)
          SessionStatus(percent, process, ses, station,
            Some(AroundProcessElementsBuilder.detect(process_id, station.get.id.get)),
            Some(people)
            )
          })
        )
      }
      case _ => None
    }
  }

  def findByBP(id: Int):List[BPSession] = database withSession {
    implicit session =>
    val q3 = for { s <- bpsessions if s.process === id } yield s
    q3.list
  }
  def getByProcesses(processes: List[Int]) = database withSession {
    implicit session =>
      val q3 = for { s ← bpsessions if s.process inSetBind processes } yield s
      q3.list
  }


  def get(k: Int):Option[BPSession] = database withSession {
    implicit session ⇒
      val q3 = for { s ← bpsessions if s.id === k } yield s
      q3.list.headOption
  }

  def update(id: Int, bpsession: BPSession) = database withSession { implicit session ⇒
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

  def delete(id: Int):Future[Int] = database withSession { implicit session ⇒
    BPSessionDAO.get(id) match {
      case Some(launch) => {
        val procF = BPDAOF.get(launch.process)
        procF.map { procOpt =>
          procOpt match {
            case Some(proc) => {
              CachedRemovedResourcesDAO.makeResourceRemoveEntity(
                scope = "",
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

  def count: Int = database withSession { implicit session ⇒
    Query(bpsessions.length).first
  }

  def ddl_create = {
    database withSession {
      implicit session =>
      bpsessions.ddl.create
    }
  }
  def ddl_drop = {
    database withSession {
      implicit session =>
       bpsessions.ddl.drop
    }
  }

  def getAll = database withSession {
    implicit session ⇒
      val q3 = for { s ← bpsessions } yield s
      q3.list.sortBy(_.id)
  }

  def percentDecorator(step: Double, element_quantity:Int):Int = {
    if (step == 1 && element_quantity == 1) {
        0
    } else {
      ( step / element_quantity.toDouble * 100).toInt
    }
  }
}
