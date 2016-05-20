package models.DAO

import main.scala.bprocesses.{BProcess, BPLoggerResult}
import main.scala.simple_parts.process.ProcElems
import slick.driver.PostgresDriver.api._
import com.github.tototoshi.slick.JdbcJodaSupport._
import com.github.nscala_time.time.Imports._
//import com.github.tminglei.slickpg.date.PgDateJdbcTypes
import slick.model.ForeignKeyAction
import models.DAO.ProcElemDAO._
import models.DAO.BPDAO._
import models.DAO.BPStationDAO._
import models.DAO.conversion.DatabaseCred
import main.scala.bprocesses._
import main.scala.bprocesses.{BPState, BPSessionState}

class BPStates(tag: Tag) extends Table[BPState](tag, "bpstates") {
  def id            = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def process       = column[Int]("process_id")
  def title         = column[String]("title")
  def neutral       = column[String]("neutral")
  def process_state = column[Boolean]("is_process_state", O.Default(false))
  def on            = column[Boolean]("on", O.Default(false))
  def on_rate       = column[Int]("on_rate", O.Default(0))

  def space_id      = column[Option[Int]]("space_id")
  def front_elem_id = column[Option[Int]]("front_elem_id")
  def space_elem_id = column[Option[Int]]("space_elem_id")


  def created_at = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at = column[Option[org.joda.time.DateTime]]("updated_at")


  def middle      = column[String]("middle", O.Default(""))
  def middleable  = column[Boolean]("middleable", O.Default(false))
  def oposite     = column[String]("oposite", O.Default(""))
  def opositable  = column[Boolean]("opositable", O.Default(false))

  def lang        = column[String]("lang", O.Default("en"))
  def * = (id.?, process, title, neutral,
                                          process_state,
                                          on, on_rate,
                                          front_elem_id,
                                          space_elem_id,
                                          space_id,
           created_at, updated_at, lang, middle, middleable, oposite, opositable) <> (BPState.tupled, BPState.unapply)

  def bpFK        = foreignKey("state_bprocess_fk", process, models.DAO.BPDAOF.bprocesses)(_.id, onDelete = ForeignKeyAction.Cascade)
  def procelemFK  = foreignKey("state_procelem_fk", front_elem_id, proc_elements)(_.id, onDelete = ForeignKeyAction.Cascade)
  def spaceelemFK = foreignKey("state_spaceelem_fk", space_elem_id, SpaceElemDAO.space_elements)(_.id, onDelete = ForeignKeyAction.Cascade)
  def spaceFK     = foreignKey("state_space_fk", space_id, BPSpaceDAO.bpspaces)(_.id, onDelete = ForeignKeyAction.Cascade)

}

object BPStateDAO {
  import scala.util.Try
  import DatabaseCred.database
  import models.DAO.conversion.Implicits._

  val bpstates = TableQuery[BPStates]

}
