package models.DAO


import models.DAO.driver.MyPostgresDriver.api._
import com.github.nscala_time.time.Imports._
import com.github.tototoshi.slick.PostgresJodaSupport._
import slick.model.ForeignKeyAction
import models.DAO.BPDAO._
import models.DAO.resources.BusinessDTO._
import com.github.tminglei.slickpg.composite._
import models.DAO.conversion.{DatabaseCred, Implicits}


class BPStations(tag: Tag) extends Table[BPStationDTO](tag, "bpstations") {
  def id            = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def process       = column[Int]("process_id")

  def state         = column[Boolean]("state")
  def step          = column[Int]("step")
  def space         = column[Int]("space")
  def container_step= column[List[Int]]("container_step")
  def expand_step   = column[List[Int]]("expand_step")
  def spaces_ids    = column[List[Int]]("spaces_ids")
  def started       = column[Boolean]("started")
  def finished      = column[Boolean]("finished")
  def inspace       = column[Boolean]("inspace")
  def incontainer   = column[Boolean]("incontainer")
  def inexpands     = column[Boolean]("inexpands")
  def paused        = column[Boolean]("paused")

  def note          = column[Option[String]]("note")
  def canceled      = column[Boolean]("canceled", O.Default(false))

  def created_at    = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at    = column[Option[org.joda.time.DateTime]]("updated_at")
  def session       = column[Int]("session_id")
  def front         = column[Boolean]("front")
  def sesFK         = foreignKey("station_session_fk", session,  models.DAO.BPSessionDAOF.bpsessions)(_.id, onDelete = ForeignKeyAction.Cascade)

  def * = (id.?,
    process,
    state,
    step,
    space,
    container_step,
    expand_step,
    spaces_ids,
    started,
    finished,
    inspace,
    incontainer,
    inexpands,
    paused,
    note,
    canceled,
    created_at, updated_at,session, front) <> (BPStationDTO.tupled, BPStationDTO.unapply)

}

/*
  Case class
 */
case class BPStationDTO(
id: Option[Int],
process: Int,
state:Boolean,
step:Int,
space:Int,
container_step: List[Int],
expand_step: List[Int],
spaces_ids: List[Int],
started: Boolean,
finished: Boolean,
inspace: Boolean,
incontainer: Boolean,
inexpands: Boolean,
paused: Boolean,
note: Option[String] = None,
canceled: Boolean = false,
created_at:Option[org.joda.time.DateTime] = None,
updated_at:Option[org.joda.time.DateTime] = None, session: Int = 1, front: Boolean = true) // Front par for parallels
                                                                                           //  TODO: Avoid default value
object BPStationDAOF {

  import akka.actor.ActorSystem
  import slick.backend.{StaticDatabaseConfig, DatabaseConfig}
  //import slick.driver.JdbcProfile
  import slick.driver.PostgresDriver.api._
  import slick.jdbc.meta.MTable
  import scala.concurrent.ExecutionContext.Implicits.global
  import com.github.tototoshi.slick.PostgresJodaSupport._
  import scala.concurrent.duration.Duration
  import scala.concurrent.{ExecutionContext, Awaitable, Await, Future}
  import models.DAO.conversion.DatabaseFuture._

  def await[T](a: Awaitable[T])(implicit ec: ExecutionContext) = Await.result(a, Duration.Inf)
  
  val stations = BPStationDAO.bpstations

  private def filterQueryBySessions(session_ids: List[Int]): Query[BPStations, BPStationDTO, Seq] =
    stations.filter(_.session inSetBind session_ids)

  private def filterActiveQueryBySessions(session_ids: List[Int]): Query[BPStations, BPStationDTO, Seq] =
    stations.filter(s => (s.session inSetBind session_ids) && s.paused === true)
  private def filterNotActiveQueryBySessions(session_ids: List[Int]): Query[BPStations, BPStationDTO, Seq] =
    stations.filter(s => (s.session inSetBind session_ids) && s.paused === false)

  private def filterQueryBySession(session_id: Int): Query[BPStations, BPStationDTO, Seq] =
    stations.filter(_.session === session_id)
  private def filterQueryByBPIds(bpIds: List[Int]): Query[BPStations, BPStationDTO, Seq] =
    stations.filter(_.process inSetBind bpIds)

  private def areActiveForBPQuery(id: Int):Query[BPStations, BPStationDTO, Seq] =
    stations.filter(st => (st.process === id) && (st.finished === false))
  private def findActiveByBPIdsQuery(ids: List[Int]):Query[BPStations, BPStationDTO, Seq] =
      stations.filter(st => (st.process inSetBind ids) && (st.paused === true) )

  def findBySessions(ids: List[Int], active: Option[Boolean] = None):Future[Seq[BPStationDTO]] = {
    active match {
      case Some(bool) => {
        bool match {
          case true => db.run(filterActiveQueryBySessions(ids).result)
          case false => db.run(filterNotActiveQueryBySessions(ids).result)
        }
      }
      case _ => db.run(filterQueryBySessions(ids).result)
    }
  }

  def findBySessionF(id: Int): Future[Option[BPStationDTO]] =
    db.run(filterQueryBySession(id).result.headOption)

  def findByBPIds(ids: List[Int]):Future[Seq[BPStationDTO]] = {
    db.run(filterQueryByBPIds(ids).result)
  }


}

object BPStationDAO {
  import models.DAO.BPDAOF.bprocesses
  import main.scala.bprocesses.BPStation

  import akka.actor.ActorSystem
  import slick.backend.{StaticDatabaseConfig, DatabaseConfig}
  //import slick.driver.JdbcProfile
  import slick.driver.PostgresDriver.api._
  import slick.jdbc.meta.MTable
  import scala.concurrent.ExecutionContext.Implicits.global
  import com.github.tototoshi.slick.PostgresJodaSupport._
  import scala.concurrent.duration.Duration
  import scala.concurrent.{ExecutionContext, Awaitable, Await, Future}
  import models.DAO.conversion.DatabaseFuture._

  def await[T](a: Awaitable[T])(implicit ec: ExecutionContext) = Await.result(a, Duration.Inf)
  

  val bpstations = TableQuery[BPStations]

  private def filterQuerySession(id: Int): Query[BPStations, BPStationDTO, Seq] =
    bpstations.filter(_.session === id)
  private def filterQueryProcess(id: Int): Query[BPStations, BPStationDTO, Seq] =
    bpstations.filter(_.process === id)
  private def filterQuery(id: Int): Query[BPStations, BPStationDTO, Seq] =
    bpstations.filter(_.id === id)
  private def filterQuerys(ids: List[Int]): Query[BPStations, BPStationDTO, Seq] =
    bpstations.filter(_.id inSetBind ids)
  private def findActiveByBPIdsQuery(ids: List[Int]):Query[BPStations, BPStationDTO, Seq] =
    bpstations.filter(st => (st.process inSetBind ids) && (st.paused === true) )


  private def filterQuerysProcesses(ids: List[Int]): Query[BPStations, BPStationDTO, Seq] =
    bpstations.filter(_.process inSetBind ids)
  private def haltByBPIdQuery(id: Int): Query[BPStations, BPStationDTO, Seq] =
    bpstations.filter(st => (st.process === id) && (st.paused === true) && (st.state === true) )
  private def areActiveForBPQuery(id: Int):Query[BPStations, BPStationDTO, Seq] =
    bpstations.filter(st => (st.process === id) && (st.finished === false))

  def from_origin_station(station: BPStation, bp_dto: BProcessDTO, session_id: Int = 1, front: Boolean = true):BPStationDTO = {
    BPStationDTO(
        None,
        bp_dto.id.get,
        station.state,
        station.step,
        station.space,
        station.container_step.toList,
        station.expand_step.toList,
        station.spaces_ids.toList,
        station.started,
        station.finished,
        station.inspace,
        station.incontainer,
        station.inexpands,
        station.paused,
        note = Some("1"),
        created_at = station.created_at,
        updated_at = station.updated_at,
        session = session_id)
  }
  //def to_origin_station(station: BPStationDTO1):BPStation = {

  //}
  var noteFunction: (String => String) = { lang =>
    lang match {
      case "ru" => "Заметка о станции"
      case "en" => "Station's note"
      case _ => "Station's note"
    }

  }


  def defineNoteFN(fn: String => String) = {
    noteFunction = fn
  }

  def pull_object(s: BPStationDTO, lang: Option[String] = Some("en")):Int =   {
      val num = BPSessionDAO.countByProcess(s.process)
      val pullThis = s.copy(note = Some(s"Launch ${num}"),
      created_at = Some(org.joda.time.DateTime.now()) )

      await( db.run(bpstations returning bpstations.map(_.id) += pullThis) )
  }
  def saveOrUpdate(s: BPStationDTO, lang: Option[String] = Some("en"), run_proc: Boolean = true):Int =   {
      findBySession(s.session) match {
        case Some(sess) => {
          val num = BPSessionDAO.countByProcess(s.process)
          if (run_proc == false) {
            sess.id.get
          } else {
            if (update(sess.id.get, s.copy(id = sess.id,
            note = Some(s"Launch ${num}") ))) // TODO: Switch to LaunchCounterDAO
              sess.id.get
            else
              -1
          }
        }
        case _ =>  {
          val num = BPSessionDAO.countByProcess(s.process)
          val pullThis = s.copy(note = Some(s"Launch ${num}"),
          created_at = Some(org.joda.time.DateTime.now()) )
          pull_object(pullThis)
        }
      }
  }


  def updateNote(id: Int, msg: String) = {
      val obj = findById(id)
      obj match {
        case Some(station) => update(id, station.copy(note = Some(msg)))
        case _ => -1
      }
  }

def findBySession(id: Int) = {
  await( db.run(filterQuerySession(id).result.headOption) )
}

def findByBPId(id: Int) = {
  await(db.run( filterQueryProcess(id).result) )
}
def haltByBPId(id: Int) = {
    val obj = await( db.run(haltByBPIdQuery(id).result) )
    obj.map(station => update(station.id.get, station.copy(state = false, paused = false)))
}

def getAll = {
    await( db.run(bpstations.result) )
}

def update(id: Int, entity: BPStationDTO):Boolean = {
      findById(id) match {
      case Some(e) => {
        await( db.run(
          bpstations.filter(_.id === id).update(entity.copy(id = Some(id), updated_at = Some(org.joda.time.DateTime.now()) ))
        ) )
        BPSessionDAO.updateMeta(entity.session, entity.step)
        true
      }
      case None => false
      }
}

def areActiveForBP(id: Int):List[BPStationDTO] =
      await( db.run(areActiveForBPQuery(id).result) ).toList

def findActiveByBPIds(ids: List[Int]):List[BPStationDTO] =
    await( db.run(findActiveByBPIdsQuery(ids).result ) ).toList


def findById(id: Int):Option[BPStationDTO] =
    await( db.run(filterQuery(id).result.headOption) )

def findByIds(ids: List[Int]):List[BPStationDTO] =
    await( db.run(filterQuerys(ids).result) ).toList

def findByBPIds(ids: List[Int]):List[BPStationDTO] =
    await(db.run(filterQuerysProcesses(ids).result)).toList


def haltUpdate(id: Int, scope:String):Boolean = {
      findById(id) match {
      case Some(e) => {
        BPSessionDAO.delete(e.session, scope)
        true
      }
      case None => false
      }
}

val create: DBIO[Unit] = bpstations.schema.create
val drop: DBIO[Unit] = bpstations.schema.drop

def ddl_create = db.run(create)
def ddl_drop = db.run(drop)


}
