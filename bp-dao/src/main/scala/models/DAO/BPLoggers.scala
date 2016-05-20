package models.DAO


import main.scala.bprocesses.{BProcess, BPLoggerResult}
import main.scala.simple_parts.process.ProcElems
import slick.driver.PostgresDriver.api._
import com.github.nscala_time.time.Imports._
import com.github.tototoshi.slick.JdbcJodaSupport._
//import com.github.tminglei.slickpg.date.PgDateJdbcTypes
import slick.model.ForeignKeyAction

import models.DAO.ProcElemDAO._
import models.DAO.BPDAO._
import models.DAO.BPStationDAO._
import models.DAO.conversion.DatabaseCred

class BPLoggers(tag: Tag) extends Table[BPLoggerDTO](tag, "bploggers") {
  def id = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def bprocess = column[Int]("process_id")

  def element   = column[Option[Int]]("proc_element_id")
  def space_elem= column[Option[Int]]("space_element_id")
  def order     = column[Int]("order")
  def space     = column[Option[Int]]("space_id")
  def station   = column[Int]("station_id")
  def invoked   = column[Boolean]("invoked")
  def expanded  = column[Boolean]("expanded")
  def container = column[Boolean]("container")
  def date      = column[org.joda.time.DateTime]("date")
  def step      = column[Int]("step")

  def * = (id.?,
           bprocess,
           element,
           space_elem,
           order,
           space,
           station,
           invoked,
           expanded,
           container,
           date,
           step
          ) <> (BPLoggerDTO.tupled, BPLoggerDTO.unapply)

def bpFK       = foreignKey("lg_bprocess_fk", bprocess, bprocesses)(_.id, onDelete = ForeignKeyAction.Cascade)
def procelemFK = foreignKey("lg_procelem_fk", element, proc_elements)(_.id, onDelete = ForeignKeyAction.Cascade)
def spaceelemFK= foreignKey("lg_spaceelem_fk", space_elem, SpaceElemDAO.space_elements)(_.id, onDelete = ForeignKeyAction.Cascade)
def stationFK  = foreignKey("lg_b_fk", station, bpstations)(_.id, onDelete = ForeignKeyAction.Cascade)
def spaceFK    = foreignKey("lg_sp_fk", space, models.DAO.BPSpaceDAO.bpspaces)(_.id, onDelete = ForeignKeyAction.Cascade)
}

case class BPLoggerDTO(
                      id: Option[Int],
                      bprocess: Int,
                      element: Option[Int],
                      space_elem: Option[Int],
                      order: Int,
                      space: Option[Int],
                      station: Int,
                      invoked: Boolean,
                      expanded: Boolean,
                      container: Boolean,
                      date: org.joda.time.DateTime,
                      step: Int = 0)

/*
  Data Conversion
 */
object BPLoggerDCO {

}
object BPLoggerDAOF {
  import akka.actor.ActorSystem
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
  val bploggers = TableQuery[BPLoggers]

  private def filterQuery(id: Int): Query[BPLoggers, BPLoggerDTO, Seq] =
    bploggers.filter(_.id === id)
    private def filterQueryByProcess(id: Int): Query[BPLoggers, BPLoggerDTO, Seq] =
      bploggers.filter(_.process === id)
    private def filterQueryByStation(id: Int): Query[BPLoggers, BPLoggerDTO, Seq] =
      bploggers.filter(_.station === id)




    def spElemId(target: ProcElems): Option[Int] = {
      target.space_id match {
        case Some(space) => Some(target.id)
        case _ => None
      }
    }
    def elemId(target: ProcElems, mean: String): Option[Int] = {
      if (mean == "space") {
        /*target.space_id match {
          case Some(space) => {
            space.id
          }
          case _ => None
        }*/
        target.space_id match {
          case Some(space) => {
            Some(target.id)
          }
          case None => None
        }
      } else if (mean == "front") {

        target.space_id match {
          case None => Some(target.id)
          case _    => None
        }
      } else {
        None
      }
    }

    /**
     * OriginLogger to BPLoggerDTO
     * @param logger
     * @param bp_dto
     * @param station_id
     * @param spaces
     * @return
     */
    def from_origin_lgr(logger: BPLogger, bp_dto: BProcessDTO, station_id:Int = 1, spaces: List[BPSpaceDTO] = List.empty[BPSpaceDTO]):Option[List[BPLoggerDTO]] = {

      val result:List[BPLoggerDTO] = logger.logs.toList.map { lgr =>

            BPLoggerDTO(
              None, // id
              bp_dto.id.get, // bprocess
              element = elemId(lgr.element,"front"), // element
              space_elem = elemId(lgr.element, "space"), // space_element
              lgr.element.order, // order
              lgr.space,  // space
              station_id, // station
              lgr.invoked, // invoked
              lgr.expanded, // expanded
              lgr.container, // container
              lgr.date, // date
              lgr.step) // comps


      }

      if (result.length == 0) {
        None
      } else {
        Option(result)
      }
    }

    import models.DAO.conversion.Implicits

    /**
     * BPLoggerDTO 2 OriginLogger
     * @param logger
     * @param bp_dto
     * @param bp
     * @param spaces
     * @return
     */
    def fromDTOtoOrg(logger: List[BPLoggerDTO],
                     bp_dto: BProcessDTO,
                     bp: BProcess,
                     spaces: List[BPSpaceDTO] = List.empty[BPSpaceDTO]
                    ):List[BPLoggerResult] = {

      val space_indx:Map[Option[Int], Int] = spaces.map(space => (space.id, space.index)) toMap

       logger.map { lgr =>

          BPLoggerResult(
            element = bp.findEverywhereByOrder(lgr.order, lgr.space).get,
            order   = lgr.order,
            space   = space_indx.get(lgr.space),

            // Runtime information
            station   = bp.station,
            invoked   = lgr.invoked,
            expanded  = false,
            container = lgr.container,
            date      = lgr.date,
            composite = None,
            step      = lgr.step
          )
      }
    }

   /** *************************
    *  *************************
     ***************************/

    val proc_elements = TableQuery[ProcElements]


    def pull_object(s: BPLoggerDTO) = database withSession {
      implicit session ⇒
        bploggers returning bploggers.map(_.id) += s //BPLoggerDTO.unapply(s).get
    }

    def pull_object(s: List[BPLoggerDTO]) = database withSession {
      implicit session ⇒
        s.foreach(log =>
        bploggers returning bploggers.map(_.id) += log //BPLoggerDTO.unapply(log).get
        )
    }

    def lastRunOfBP(id: Int):Option[org.joda.time.DateTime] = database withSession {
      implicit session ⇒
      val q3 = (for { logger ← bploggers if logger.bprocess === id } yield logger).take(1)
      q3.firstOption.foreach {
        case a:BPLoggerDTO => return Some(a.date)

      }
      return None
       // BPLoggerDTO1.tupled(q3.firstOption) //<> (BPLoggerDTO1.tupled, BPLoggerDTO1.unapply _)
    }

    def findById(id: Int):Future[Option[BPLoggerDTO]] = {
      db.run(filterByQuery(id).result.headOption)
    }
    def findByStation(id: Int):List[BPLoggerDTO] = {
      db.run(filterQueryByStation(id).result)
    }
    def pull_new_object(s: BPLoggerDTO, station_id:Int) = {
     //   ???
     //   FIND LOGS BY STATION
     //   ESCAPE THEM AND ADD ONLY NEW
      db.run(bploggers returning bploggers.map(_.id) += s)
    }

    def pull_object_from(station_id: Int, ss:List[BPLoggerDTO]) = {
        db.run(bploggers.filter(_.station === station_id).delete).map {
          Future.sequence( ss.map { s =>
            db.run(bploggers returning bploggers.map(_.id) += s)
          })
        }
    }

    def findByBPId(id: Int):Future[List[BPLoggerDTO]] = {
      db.run(filterQueryByProcess(id).result)
    }



    val create: DBIO[Unit] = bploggers.schema.create
    val drop: DBIO[Unit] = bploggers.schema.drop

    def ddl_create = db.run(create)
    def ddl_drop = db.run(drop)




}
