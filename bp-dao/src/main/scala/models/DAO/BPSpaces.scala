package models.DAO

import slick.driver.PostgresDriver.simple._
import models.DAO.conversion.DatabaseCred
import scala.slick.model.ForeignKeyAction

class BPSpaces(tag: Tag) extends Table[BPSpaceDTO](tag, "bpspaces") {
  def id        = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def bprocess   = column[Int]("process_id")
  def index     = column[Int]("index")
  def container = column[Boolean]("container", O.Default(false))
  def subbrick  = column[Boolean]("subbrick",  O.Default(false))

  def brick_front  = column[Option[Int]]("brick_front_id")
  def brick_nested = column[Option[Int]]("brick_nested_id")
  def nestingLevel = column[Int]("nesting_level")



  def * = (id.?, bprocess, index, container, subbrick, brick_front, brick_nested, nestingLevel) <> (BPSpaceDTO.tupled, BPSpaceDTO.unapply)
  def bpFK = foreignKey("bprocess_fk", bprocess, models.DAO.BPDAO.bprocesses)(_.id, onDelete = ForeignKeyAction.Cascade)

}
case class BPSpaceDTO(id: Option[Int], bprocess: Int, index:Int, container:Boolean, subbrick:Boolean, brick_front:Option[Int]=None,brick_nested:Option[Int]=None, nestingLevel: Int = 1) {
  import main.scala.utils._
import main.scala.bprocesses._


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
  def cast(bprocess: BProcess, space_elems: List[SpaceElementDTO]):Option[Space] = { 
// TODO: to space casting 
// TODO: Refactor

    this match {
      case x => { // find front stuff
        Option(
          Space.apply(index, bprocess.findFrontBrick()(bprocess.spaces.length), subbrick, container, false, id)
        )
      }
      case y => { // find nested stuff
       None
      }
      case _ => None
    }
  
  }
}


object BPSpaceDAO {
  import models.DAO.conversion.DatabaseCred._
  val bpspaces = TableQuery[BPSpaces]

  def pull_object(s: BPSpaceDTO) = database withSession {
    implicit session ⇒
      bpspaces returning bpspaces.map(_.id) += s
  }


  def get(k: Int) = database withSession {
    implicit session ⇒
      val q3 = for { s ← bpspaces if s.id === k } yield s
      println(q3.selectStatement)
      println(q3.list)
      q3.list.headOption //.map(Supplier.tupled(_))
  }
  def findByBPId(id: Int) = {
    database withSession { implicit session =>
     val q3 = for { sp ← bpspaces if sp.bprocess === id } yield sp// <> (UndefElement.tupled, UndefElement.unapply _)
      q3.list 
    }
  }
  /**
   * Update a bpspace
   * @param id
   * @param bpspace
   */
  def update(id: Int, bpspace: BPSpaceDTO) = database withSession { implicit session ⇒
    val spToUpdate: BPSpaceDTO = bpspace.copy(Option(id))
    bpspaces.where(_.id === id).update(spToUpdate)
  }
  /**
   * Delete a bpspace
   * @param id
   */
  def delete(id: Int) = database withSession { implicit session ⇒

    bpspaces.where(_.id === id).delete
  }
  /**
   * Count all bpspaces
   */
  def count: Int = database withSession { implicit session ⇒
    Query(bpspaces.length).first
  }

  def ddl_create = {
    database withSession {
      implicit session =>
      bpspaces.ddl.create
    }
  }

  def getAll = database withSession {
    implicit session ⇒ // TODO: s.service === 1 CHANGE DAT
      val q3 = for { s ← bpspaces } yield s
      q3.list.sortBy(_.id)
    //suppliers foreach {
    //  case (id, title, address, city, state, zip) ⇒
    //    Supplier(id, title, address, city, state, zip)
    //}
  }

}
