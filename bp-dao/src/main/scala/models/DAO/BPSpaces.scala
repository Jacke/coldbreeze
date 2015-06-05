package models.DAO

//import slick.driver.PostgresDriver.simple._
import models.DAO.driver.MyPostgresDriver1.simple._

import com.github.nscala_time.time.Imports._
import models.DAO.conversion.DatabaseCred
import scala.slick.model.ForeignKeyAction
import main.scala.simple_parts.process.Units._
import main.scala.bprocesses.refs.UnitRefs._  

class BPSpaces(tag: Tag) extends Table[BPSpaceDTO](tag, "bpspaces") {
  def id        = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def bprocess   = column[Int]("process_id")
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
  def bpFK = foreignKey("bprocess_fk", bprocess, models.DAO.BPDAO.bprocesses)(_.id, onDelete = ForeignKeyAction.Cascade)

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

  def pull_object(s: BPSpaceDTO) = database withSession {
    implicit session ⇒
      bpspaces returning bpspaces.map(_.id) += s
  }

  def lastIndexOfSpace(id: Int) = database withSession {
    implicit session =>
      val q3 = for { s ← bpspaces if s.id === id } yield s
      val xs = q3.list.map(_.index)

      if (xs.isEmpty) 1
      else xs.max + 1
  }
  def get(k: Int) = database withSession {
    implicit session ⇒
      val q3 = for { s ← bpspaces if s.id === k } yield s
      q3.list.headOption //.map(Supplier.tupled(_))
  }
  def getAllByFront(k: Int) = database withSession {
    implicit session ⇒
      val q3 = for { s ← bpspaces if s.brick_front === k } yield s
      q3.list //.map(Supplier.tupled(_))
  }
  def getAllByNested(k: Int) = database withSession {
    implicit session ⇒
      val q3 = for { s ← bpspaces if s.brick_nested === k } yield s
      q3.list //.map(Supplier.tupled(_))
  }
  def findByBPId(id: Int) = {
    database withSession { implicit session =>
     val q3 = for { sp ← bpspaces if sp.bprocess === id } yield sp// <> (UndefElement.tupled, UndefElement.unapply _)
      q3.list 
    }
  }
  def deleteOwnedSpace(elem_id:Option[Int],spelem_id:Option[Int]) {
  if (elem_id.isDefined) {
      getAllByFront(elem_id.get).map(_.id.get).foreach{ id => delete(id) }
  }
  if (spelem_id.isDefined) {
      getAllByNested(spelem_id.get).map(_.id.get).foreach{ id => delete(id) }
  }
}
  /**
   * Update a bpspace
   * @param id
   * @param bpspace
   */
  def update(id: Int, bpspace: BPSpaceDTO) = database withSession { implicit session ⇒
    val spToUpdate: BPSpaceDTO = bpspace.copy(Option(id))
    bpspaces.filter(_.id === id).update(spToUpdate)
  }
  /**
   * Delete a bpspace
   * @param id
   */
  def delete(id: Int) = {
   database withSession { implicit session ⇒

    val sp = get(id)
    val res = bpspaces.filter(_.id === id).delete
    sp match {
       case Some(space) => renewIndex(space.bprocess, space.index)
       case _ =>
    }
    res
  }
  
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
  def ddl_drop = {
    database withSession {
      implicit session =>
        bpspaces.ddl.drop
    }
  }
/*
(1,Some(16))
(3,Some(17))
(4,Some(18))
(6,Some(19))
.renewIndex(bprocess, 5)
(1,Some(16))
(3,Some(17))
(4,Some(18))
(5,Some(19))
*/
  def renewIndex(bprocess: Int, index_num: Int) = {
    database withSession { implicit session ⇒
      val q3 = for { sp ← bpspaces if sp.bprocess === bprocess && sp.index > index_num } yield sp
      val ordered = q3.list.zipWithIndex.map(sp => sp._1.copy(index = (sp._2 + 1) + (index_num - 1)))
      //val ordered = q3.list.zipWithIndex.map(sp => sp._1.copy(index = sp._2+index_num))
      ordered.foreach { sp => 
         update(sp.id.get, sp)
      }
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
