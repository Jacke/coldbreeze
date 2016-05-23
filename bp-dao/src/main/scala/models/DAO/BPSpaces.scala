package models.DAO

//import slick.driver.PostgresDriver.simple._
import slick.driver.PostgresDriver.api._
import com.github.tototoshi.slick.PostgresJodaSupport._
import com.github.nscala_time.time.Imports._
import models.DAO.conversion.DatabaseCred
import slick.model.ForeignKeyAction
import main.scala.simple_parts.process.Units._
import main.scala.bprocesses.refs.UnitRefs._

class BPSpaces(tag: Tag) extends Table[BPSpaceDTO](tag, "bpspaces") {
  def id        = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def bprocess  = column[Int]("process_id")
  def index     = column[Int]("index")
  def container = column[Boolean]("container", O.Default(false))
  def subbrick  = column[Boolean]("subbrick",  O.Default(false))

  def brick_front  = column[Option[Int]]("brick_front_id")
  def brick_nested = column[Option[Int]]("brick_nested_id")
  def nestingLevel = column[Int]("nesting_level")


  def created_at = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at = column[Option[org.joda.time.DateTime]]("updated_at")


  def * = (id.?, bprocess, index, container, subbrick, brick_front, brick_nested, nestingLevel,
           created_at, updated_at) <> (BPSpaceDTO.tupled, BPSpaceDTO.unapply)
  def bpFK = foreignKey("sp_bprocess_fk", bprocess, models.DAO.BPDAOF.bprocesses)(_.id, onDelete = ForeignKeyAction.Cascade)

}
case class BPSpaceDTO(id: Option[Int],
                      bprocess: Int,
                      index:Int,
                      container:Boolean,
                      subbrick:Boolean,
                      brick_front:Option[Int]=None,
                      brick_nested:Option[Int]=None,
                      nestingLevel: Int = 1,
created_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now),
updated_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now)) {

import main.scala.utils._
import main.scala.bprocesses._

  // @example method, did not fully implemented. primary implementation in Builder object.
  def cast_nested(bprocess: BProcess, space_elems: List[SpaceElementDTO]):Option[Space] = {
    val brick = bprocess.findNestedBricks().find(brick => brick.space_parent_id == id)
    if (brick.isDefined) {
    this match {
      case x => { // find front stuff
        Option(
          Space.apply(index, brick.get, subbrick, container, false, id)
        )
      }
      case y => { // find nested stuff
       None
      }
      case _ => None
    }

  } else {
    None
  }
  }
  def castFront(bprocess: BProcess, space_elems: List[SpaceElementDTO]):Option[Space] = {
// TODO: to space casting
// TODO: Refactor

    this match {
      case x => { // find front stuff
        Option(
          Space.apply(index, bprocess.findFrontBrickById(brick_front).get, subbrick, container, false, id)
        )
      }
      case y => { // find nested stuff
       None
      }
      case _ => None
    }

  }
}
object SpaceDCO {
  def conv(el: UnitSpaceRef, business: Int, process: Int, index: Int, brick_front: Int): BPSpaceDTO = {
    BPSpaceDTO(
None,
                      process,
                      index,
                      container = true,
                      subbrick = false,
                      brick_front = Some(brick_front),
                      brick_nested=None,
                      nestingLevel = 1,
el.created_at,
el.updated_at
)
  }
}

object BPSpaceDAO {
  import models.DAO.conversion.DatabaseCred._
  val bpspaces = TableQuery[BPSpaces]


}
