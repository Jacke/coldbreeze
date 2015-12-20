package models.DAO

import models.DAO.driver.MyPostgresDriver.simple._
import slick.model.ForeignKeyAction
import com.github.nscala_time.time.Imports._
import models.DAO.BPDAO._
import models.DAO.resources.BusinessDTO._
//import com.github.tminglei.slickpg.composite._
import models.DAO.conversion.{DatabaseCred, Implicits}
import main.scala.simple_parts.process.Units._
import main.scala.simple_parts.process.data.{Confirm, Constant}

class ProcElements(tag: Tag) extends Table[UndefElement](tag, "proc_elements") {

  def id        = column[Int]("id", O.PrimaryKey, O.AutoInc) // This is the primary key column
  def title     = column[String]("title")
  def desc      = column[String]("desc")
  def business  = column[Int]("business_id")
  def bprocess  = column[Int]("bprocess_id")
  def b_type    = column[String]("b_type")
  def type_title= column[String]("type_title")

  def space_own = column[Option[Int]]("space_id")

  def order     = column[Int]("order")
  //def comps = column[Option[List[CompositeValues]]]("comps", O.DBType("compositevalues[]"))
    
  def created_at= column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at= column[Option[org.joda.time.DateTime]]("updated_at")  
    
  def * = (id.?, title, desc, business, bprocess, b_type, type_title, space_own, order,
           created_at, updated_at) <> (UndefElement.tupled, UndefElement.unapply)

  def businessFK = foreignKey("pr_elem_business_fk", business, models.DAO.resources.BusinessDAO.businesses)(_.id, onDelete = ForeignKeyAction.Cascade)
  def bpFK       = foreignKey("pr_elem_bprocess_fk", bprocess, models.DAO.BPDAO.bprocesses)(_.id, onDelete = ForeignKeyAction.Cascade)
}

 case class CompositeValues(
                              a_string: Option[String] = None,
                              b_string: Option[String] = None,
                              a_int: Option[Int] = None,
                              b_int: Option[Int] = None,
                              a_bool: Option[Boolean] = None,
                              b_bool: Option[Boolean] = None
                           )// extends Struct
import main.scala.simple_parts.process._
import main.scala.bprocesses._

/*
  Case class
 */
case class UndefElement(id: Option[Int],
                        title:String,
                        desc:String,
                        business:Int,
                        bprocess:Int,
                        b_type:String,
                        type_title:String,
                        space_own:Option[Int],
                        order:Int,
                        
created_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now),
updated_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now)) {
  
  

  def cast(process: BProcess):Option[ProcElems] = { 
// TODO: to space casting 
// TODO: Refactor
    this match {
      case y if (y.b_type == "brick" && y.type_title == "container_brick") => {
        Option(
            new ContainerBrick(id.get, title, desc,None, process, b_type, type_title, order, space_parent_id = space_own)
          )
      }
      case constant if (constant.b_type == "block" && constant.type_title == "constant") => {
        Option(
           new Constant[Boolean](id.get, true, process, order, space_id = None, values = None)
        )
      }
      case x if (x.b_type == "block" && x.type_title == "test block") => {
        Option(
          new Block(id.get,title,desc,None,process,b_type,type_title,order)
        )
      }
      case conf if (conf.b_type == "block" && conf.type_title == "confirm") => {
        Option(
          new Confirm(id.get,title,desc,None,process,b_type,type_title,order))
      }
      case _ => Option(
          new Block(id.get,title,desc,None,process,b_type,type_title,order)
        )
    }
  
  }
}

/*
  DataConversion
 */
object ProcElemDCO {
  def conv(el: UnitElement): UndefElement = {
    UndefElement(None,
                        el.title,
                        el.desc,
                        el.business,
                        el.bprocess,
                        el.b_type,
                        el.type_title,
                        el.space_own,
                        el.order,
                        el.created_at,
                        el.updated_at)
  }
  def conv_nested(el: UnitElement, space_own:Option[Int], space_owned:Int): SpaceElementDTO = {
    SpaceElementDTO(None,
                        el.title,
                        el.desc,
                        el.business,
                        el.bprocess,
                        el.b_type,
                        el.type_title,
                        space_own,
                        space_owned,
                        space_role = None, // TODO: May change sometime
                        el.order,
                        el.created_at,
                        el.updated_at)
  }
  
}


case class KeeprDAO(eltype:String, elname:String, desc:String)

/**
 * Actions
 */

object ProcElemDAOF {
  import akka.actor.ActorSystem
  import akka.stream.ActorFlowMaterializer
  import akka.stream.scaladsl.Source
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
  val proc_elements = ProcElemDAO.proc_elements

  private def filterQuery(id: Int): Query[ProcElements, UndefElement, Seq] =
    proc_elements.filter(_.id === id)
  private def filterByBPQuery(id: Int): Query[ProcElements, UndefElement, Seq] =
    proc_elements.filter(_.bprocess === id)
  def findByBPId(bpId: Int) = db.run(filterByBPQuery(bpId).result)

}
object ProcElemDAO {
  import DatabaseCred.database
  import models.DAO.BPDAO.bprocesses


  val proc_elements = TableQuery[ProcElements]
  /**
   * Find a specific entity by id.
   */
  def findByBPId(id: Int) = {
    database withSession { implicit session =>
     val q3 = for { el ← proc_elements if el.bprocess === id } yield el
      q3.list 
    }
  }
  def lastOrderOfBP(id: Int):Int = {
    database withSession { implicit session =>
       val q3 = for { el ← proc_elements if el.bprocess === id } yield el
       val xs = q3.list.map(_.order)
      if (xs.isEmpty) 1
      else xs.max + 1
    }
  }
  def findLengthByBPId(id: Int):Int = {
    database withSession { implicit session => 
       val q3 = for { el ← proc_elements if el.bprocess === id } yield el
      Query(q3.length).first
    }
  }
  def findById(id: Int):Option[UndefElement] = {
    database withSession { implicit session =>
     val q3 = for { el ← proc_elements if el.id === id } yield el 
      q3.list.headOption
    }
  }
  def findByBPanOrder(id: Int, order: Int) = {
    database withSession { implicit session =>
     val q3 = for { el ← proc_elements if el.bprocess === id; if el.order === order } yield el
      q3.list.headOption 
    }
  }
  def pull_object(s: UndefElement) = database withSession {
    implicit session ⇒
      proc_elements returning proc_elements.map(_.id) += s
  }
  def update(id: Int, entity: UndefElement):Int = {
    database withSession { implicit session =>
      findById(id) match {
      case Some(e) => {
        proc_elements.filter(_.id === id).update(entity)
      }
      case None => -1
      }
    }
  }
  def getAll = database withSession {
    implicit session ⇒ 
      val q3 = for { s ← proc_elements } yield s
      q3.list.sortBy(_.id)
  }
  def delete(id: Int) = { 
    database withSession { implicit session ⇒

    val elem = findById(id)
    val res = proc_elements.filter(_.id === id).delete
    elem match {
       case Some(el) => renewOrder(el.bprocess, el.order)
       case _ =>
    }
    res
    }
  }
  def moveUp(bprocess: Int, element_id: Int) = {
    database withSession { implicit session =>
      val minimum = findByBPId(bprocess).sortBy(_.order)
      findById(element_id) match {
        case Some(e) => { 
          if (e.order > 1 && e.order != minimum.head.order) {
            proc_elements.filter(_.id === element_id).update(e.copy(order = e.order - 1))
            val ch = findById(minimum.find(_.order == (e.order - 1)).get.id.get).get
            proc_elements.filter(_.id === minimum.find(_.order == (e.order - 1)).get.id.get).update(ch.copy(order = ch.order + 1))
          }
          true 
        }
        case None => false
      }
    }
  }
  def moveDown(bprocess: Int, element_id: Int) = {
    database withSession { implicit session =>
      val maximum = findByBPId(bprocess).sortBy(_.order)
      findById(element_id) match {
        case Some(e) => { 
          if (e.order < maximum.last.order && e.order != maximum.last.order) {
            proc_elements.filter(_.id === element_id).update(e.copy(order = e.order + 1))
            val ch = findById(maximum.find(_.order == (e.order + 1)).get.id.get).get
            proc_elements.filter(_.id === maximum.find(_.order == (e.order + 1)).get.id.get).update(ch.copy(order = ch.order - 1))
          }
          true 
        }
        case None => false
      }
    }
  }
/*
(1,Some(16))
(3,Some(17))
(4,Some(18))
(6,Some(19))
.renewOrder(bprocess, 5)
(1,Some(16))
(3,Some(17))
(4,Some(18))
(5,Some(19))
*/
  def renewOrder(bprocess: Int, order_num: Int) = {
    database withSession { implicit session ⇒
      val q3 = for { el ← proc_elements if el.bprocess === bprocess && el.order > order_num } yield el
      val ordered = q3.list.zipWithIndex.map(el => el._1.copy(order = (el._2 + 1) + (order_num - 1)))
      ordered.foreach { el => 
         update(el.id.get, el)
      }
    }
    
/*

    proc_elements.filter(_.bprocess === bprocess && _.order > order_num)
     .map(x => x.order)
     .update(_ + 1)

    */
  }


  def ddl_create = {
    database withSession {
      implicit session =>
      proc_elements.ddl.create
    }
  }
  def ddl_drop = {
    database withSession {
      implicit session =>
        proc_elements.ddl.drop
    }
  }
  /**
   * Delete a specific entity by id. If successfully completed return true, else false
   */
  //def delete(id: Int):Boolean =
  //  database withSession { implicit session =>
  //  findById(id) match {
  //    case Some(entity) => { proc_elements.filter(_.id === id).delete; true }
  //    case None => false
  //  }
  //  }

  /**
   * Update a specific entity by id. If successfully completed return true, else false
   */
  //def update(id: Int, entity: (Option[Int], String, String, Int, Int, String, String, Int)):Boolean = {
  //  database withSession { implicit session =>
  //    findById(id) match {
  //    case Some(e) => { proc_elements.filter(_.id === id).update(entity); true }
  //    case None => false
  //    }
  //  }
  //}
}