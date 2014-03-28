package models.DAO



import models.DAO.driver.MyPostgresDriver.simple._
import java.sql.{Timestamp, Time, Date}
import java.util.Calendar
import java.text.SimpleDateFormat
import javax.xml.bind.DatatypeConverter
import com.github.tminglei.slickpg.date.PgDateJavaTypes

class BPLoggers(tag: Tag) extends Table[
  (Option[Int],
   Int,
   Int,
   Int,
   Option[Int],
   Int,
   Boolean,
   Boolean,
   Boolean,
   Date
   )](tag, "bploggers") {
  def id = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def process = column[Int]("process_id")

  def element   = column[Int]("proc_element_id")
  def order     = column[Int]("order")
  def space     = column[Option[Int]]("space_id", O.Nullable)
  def station   = column[Int]("station_id")
  def invoked   = column[Boolean]("invoked")
  def expanded  = column[Boolean]("expanded")
  def container = column[Boolean]("container")
  def date      = column[Date]("date")


  def * = (id.?,
           process,
           element,
           order,
           space,
           station,
           invoked,
           expanded,
           container,
           date
          ) //<> (Supplier.tupled, Supplier.unapply)

}
case class BPLoggerDTO1(
id: Option[Int],
process: Int,
element: Int,
order: Int,    
space: Option[Int],    
station: Int,  
invoked: Boolean,  
expanded: Boolean, 
container: Boolean,
date: Date)

object BPLoggerDTO {
  val bploggers = TableQuery[BPLoggers]

  import models.DAO.FirstExample.database
  import models.DAO.BPDTO.bprocesses
  import main.scala.bprocesses.BPLogger
  def from_origin_lgr(logger: BPLogger, bp_dto: BProcessDTO, station:Int = 1):Option[List[BPLoggerDTO1]] = {
    val result = logger.logs.map(lgr => 
      BPLoggerDTO1(
        None,
        bp_dto.id.get,
        lgr.element.id,
        lgr.element.order,    
        None,//lgr.element.space,    
        station,  
        lgr.invoked,  
        lgr.expanded, 
        lgr.container,
        new java.sql.Date(lgr.date.getTime())
        )
     )
    if (result.isEmpty) {
      None
    } else {
      Option(result.toList)
    }
  }


  val proc_elements = TableQuery[ProcElements]


  def pull_object(s: BPLoggerDTO1) = database withSession {
    implicit session ⇒
      bploggers returning bploggers.map(_.id) += BPLoggerDTO1.unapply(s).get
  }

  def pull_object(s: List[BPLoggerDTO1]) = database withSession {
    implicit session ⇒
      s.foreach(log => 
      bploggers returning bploggers.map(_.id) += BPLoggerDTO1.unapply(log).get
      )
  }

  /**
   * Find a specific entity by id.
   */
  def findByBPId(id: Int) = {
    database withSession { implicit session =>
     val q3 = for { logger ← bploggers if logger.process === id } yield logger <> (BPLoggerDTO1.tupled, BPLoggerDTO1.unapply _)
      q3.list 
    }
  }

}


