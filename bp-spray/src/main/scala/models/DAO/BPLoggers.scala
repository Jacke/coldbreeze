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
   Int,
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
  def space     = column[Int]("space_id")
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
space: Int,    
station: Int,  
invoked: Boolean,  
expanded: Boolean, 
container: Boolean,
date: Date)

object BPLoggerDTO {
  val bploggers = TableQuery[BPLoggers]

  import models.DAO.FirstExample.database
  import models.DAO.BPDTO.bprocesses


  val proc_elements = TableQuery[ProcElements]
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


