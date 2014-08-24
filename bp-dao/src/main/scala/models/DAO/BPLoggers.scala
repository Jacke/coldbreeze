package models.DAO


import main.scala.bprocesses.{BProcess, BPLoggerResult}
import main.scala.simple_parts.process.ProcElems
import models.DAO.driver.MyPostgresDriver.simple._
import com.github.nscala_time.time.Imports._
//import com.github.tminglei.slickpg.date.PgDateJdbcTypes
import scala.slick.model.ForeignKeyAction

import models.DAO.ProcElemDAO._
import models.DAO.BPDAO._
import models.DAO.BPStationDAO._
import models.DAO.conversion.DatabaseCred

class BPLoggers(tag: Tag) extends Table[BPLoggerDTO](tag, "bploggers") {
  def id = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def bprocess = column[Int]("process_id")

  def element   = column[Option[Int]]("proc_element_id", O.Nullable)
  def space_elem= column[Option[Int]]("space_element_id", O.Nullable)
  def order     = column[Int]("order")
  def space     = column[Option[Int]]("space_id", O.Nullable)
  def station   = column[Int]("station_id")
  def invoked   = column[Boolean]("invoked")
  def expanded  = column[Boolean]("expanded")
  def container = column[Boolean]("container")
  def date      = column[org.joda.time.DateTime]("date")
  def comps     = column[Option[List[CompositeValues]]]("comps", O.DBType("compositevalues[]"))
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
           comps,
           step
          ) <> (BPLoggerDTO.tupled, BPLoggerDTO.unapply)

def bpFK = foreignKey("bprocess_fk", bprocess, bprocesses)(_.id, onDelete = ForeignKeyAction.Cascade)
def procelemFK = foreignKey("procelem_fk", element, proc_elements)(_.id, onDelete = ForeignKeyAction.Cascade)
def stationFK = foreignKey("b_fk", station, bpstations)(_.id, onDelete = ForeignKeyAction.Cascade)
def spaceFK = foreignKey("sp_fk", space, models.DAO.BPSpaceDAO.bpspaces)(_.id, onDelete = ForeignKeyAction.Cascade)
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
comps: Option[List[CompositeValues]],
step: Int = 0
)

/*
  Data Conversion
 */
object BPLoggerDCO {

}

object BPLoggerDAO {
  val bploggers = TableQuery[BPLoggers]

  import DatabaseCred.database
  import models.DAO.BPDAO.bprocesses
  import main.scala.bprocesses.BPLogger
  import models.DAO.conversion.Implicits._

  /**
   * Retrive element(front, space) id from logger
   * @param logger
   * @param target
   * @return
   */
  def spElemId(target: ProcElems): Option[Int] = {
    target.space_id match {
      case Some(space) => Some(target.id)
      case _ => None
    }
  }
  def elemId(target: ProcElems, mean: String): Option[Int] = {
    if (mean == "space") {
      println("mean == space")
      println("")      
      println(target.id)
      println(target.space_id)
      println("********")
      println("")   
 
      target.space_id match {
        case Some(space) => { 
          space.id
        }
        case _ => None
      }
    }

    if (mean == "front") {

      target.space_id match {
        case None => Some(target.id)
        case _    => None
      }
    } else { None }
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
            elemId(lgr.element,"front"), // element
            spElemId(lgr.element), // space_element
            lgr.element.order, // order
            lgr.space,  // space
            station_id, // station
            lgr.invoked, // invoked
            lgr.expanded, // expanded
            lgr.container, // container
            lgr.date, // date
            pull_cv(lgr.composite),
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
          composite = Implicits.fetch_cv(lgr.comps),
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

  def findById(id: Int):Option[BPLoggerDTO] = {
    database withSession { implicit session =>
      val q3 = for { logger ← bploggers if logger.id === id } yield logger// <> (BPLoggerDTO.tupled, BPLoggerDTO.unapply _)
      q3.list.headOption
    }
  }
  def findByStation(id: Int):List[BPLoggerDTO] = {
    database withSession { implicit session =>
    val q3 = for { logger <- bploggers if logger.station === id } yield logger
    q3.list
    }
  }
  def pull_new_object(s: BPLoggerDTO, station_id:Int) = database withSession {
    implicit session ⇒
   //   ???
   //   FIND LOGS BY STATION
   //   ESCAPE THEM AND ADD ONLY NEW

      bploggers returning bploggers.map(_.id) += s //BPLoggerDTO.unapply(s).get
  }
  /**
   * Find a specific entity by id.
   */
  def findByBPId(id: Int) = {
    database withSession { implicit session =>
     val q3 = for { logger ← bploggers if logger.bprocess === id } yield logger// <> (BPLoggerDTO.tupled, BPLoggerDTO.unapply _)
      q3.list 
    }
  }

  def ddl_create = {
    database withSession {
      implicit session =>
        bploggers.ddl.create
    }
  }
}


