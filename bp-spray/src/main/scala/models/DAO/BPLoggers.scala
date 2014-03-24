package models.DAO

import scala.slick.driver.PostgresDriver.simple._
import java.sql.{Timestamp, Time, Date}
import java.util.Calendar
import java.text.SimpleDateFormat
import javax.xml.bind.DatatypeConverter
import com.github.tminglei.slickpg.date.PgDateJavaTypes

class BPLoggers(tag: Tag) extends Table[(Option[Int], Int)](tag, "bploggers") {
  def id = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def process = column[Int]("process_id")

  def element = column[Int]("proc_element_id")
  def order = column[Int]("order")
  def space = column[Int]("space_id")
  def station = column[Int]("station_id")
  def invoked = column[Boolean]("invoked")
  def expanded = column[Boolean]("expanded")
  def container = column[Boolean]("container")
  def date = column[Date]("date")


  def * = (id.?, process) //<> (Supplier.tupled, Supplier.unapply)

}

object BPLoggerDTO {
  val bploggers = TableQuery[BPLoggers]


}