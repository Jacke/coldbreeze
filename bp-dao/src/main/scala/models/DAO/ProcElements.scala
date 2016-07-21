package models.DAO

import main.scala.bprocesses.{ BProcess, BPLoggerResult }
import main.scala.simple_parts.process.ProcElems

import models.DAO.conversion.DatabaseCred
import models.DAO._
import models.DAO.conversion.DatabaseFuture._
import com.github.nscala_time.time.Imports._
import models.DAO.conversion.DatabaseCred.dbConfig.driver.api._
import com.github.tototoshi.slick.PostgresJodaSupport._


import models.DAO.ProcElemDAO._
import models.DAO.BPDAO._
import models.DAO.BPStationDAO._
import models.DAO.conversion.DatabaseCred
import models.DAO._
import models.DAO.sessions._
import builders._
import main.scala.bprocesses.BPSession
import main.scala.simple_parts.process._

import main.scala.simple_parts.process._
import main.scala.simple_parts.process.data.{Confirm, Constant}
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


object ProcElemDAO {
  import akka.actor.ActorSystem
  import slick.backend.{StaticDatabaseConfig, DatabaseConfig}
  //import slick.driver.JdbcProfile
  import slick.driver.PostgresDriver.api._
  import slick.jdbc.meta.MTable
  import scala.concurrent.ExecutionContext.Implicits.global
  import com.github.tototoshi.slick.PostgresJodaSupport._
  import scala.concurrent.duration.Duration
  import scala.concurrent.{ExecutionContext, Awaitable, Await, Future}
  import scala.util.Try
  import models.DAO.conversion.DatabaseFuture._

  //import dbConfig.driver.api._ //
  def await[T](a: Awaitable[T])(implicit ec: ExecutionContext) = Await.result(a, Duration.Inf)
  def awaitAndPrint[T](a: Awaitable[T])(implicit ec: ExecutionContext) = println(await(a))
  val proc_elements = TableQuery[ProcElementsF]
  private def filterQuery(id: Int): Query[ProcElementsF, UndefElement, Seq] =
    proc_elements.filter(_.id === id)
  private def filterByBPQuery(id: Int): Query[ProcElementsF, UndefElement, Seq] =
    proc_elements.filter(_.bprocess === id)
  private def filterByBPSQuery(ids: List[Int]): Query[ProcElementsF, UndefElement, Seq] =
    proc_elements.filter(_.bprocess inSetBind ids)

    private def findByBPanOrderQuery(id: Int, order: Int): Query[ProcElementsF, UndefElement, Seq] =
      proc_elements.filter(el => el.bprocess === id && el.order === order)

    private def renewOrderQuery(bprocess: Int, order_num: Int): Query[ProcElementsF, UndefElement, Seq] =
      proc_elements.filter(el => el.bprocess === bprocess && el.order > order_num)

  /**
   * Find a specific entity by id.
   */
  def findByBPId(id: Int, timestamp: Option[String] = None) = {
    await(db.run(filterByBPQuery(id).result)).toList
  }
  def findById(id: Int) = {
    await(db.run(filterQuery(id).result.headOption))
  }

  def lastOrderOfBP(id: Int):Int = {
     val q3 = await(db.run(filterByBPQuery(id).result))
     val xs = q3.map(_.order)
      if (xs.isEmpty) 1
      else xs.max + 1
  }

  def findLengthByBPId(id: Int):Int = {
      await(db.run(filterByBPQuery(id).length.result))
    }


  def getAll:List[UndefElement] = {
      await(db.run(proc_elements.result)).toList
  }

  def findByBPanOrder(id: Int, order: Int) = {
    await(db.run(findByBPanOrderQuery(id, order).result.headOption) )
  }

  def pull_object(s: UndefElement) =   {
    await(db.run(  proc_elements returning proc_elements.map(_.id) += s ))
  }
  def update(id: Int, entity: UndefElement):Int = {
      findById(id) match {
      case Some(e) => {
        await(db.run( proc_elements.filter(_.id === id).update(entity) ))
      }
      case None => -1
      }
  }


  def delete(id: Int) = {
    val elem = findById(id)
    val res = await(db.run( proc_elements.filter(_.id === id).delete ) )
    elem match {
       case Some(el) => renewOrder(el.bprocess, el.order)
       case _ =>
    }
    res
  }

  def moveUp(bprocess: Int, element_id: Int) = {
      val minimum = findByBPId(bprocess).sortBy(_.order)
      findById(element_id) match {
        case Some(e) => {
          if (e.order > 1 && e.order != minimum.head.order) {
            await(db.run(
              proc_elements.filter(_.id === element_id).update(e.copy(order = e.order - 1)) ))
            val ch = findById(minimum.find(_.order == (e.order - 1)).get.id.get).get
            await(db.run(
              proc_elements.filter(_.id === minimum.find(_.order == (e.order - 1)).get.id.get).update(ch.copy(order = ch.order + 1)) ))
          }
          true
        }
        case None => false
      }
  }

  def moveDown(bprocess: Int, element_id: Int) = {
      val maximum = findByBPId(bprocess).sortBy(_.order)
      findById(element_id) match {
        case Some(e) => {
          if (e.order < maximum.last.order && e.order != maximum.last.order) {
            await(
              db.run(
                proc_elements.filter(_.id === element_id).update(e.copy(order = e.order + 1))
              ))
            val ch = findById(maximum.find(_.order == (e.order + 1)).get.id.get).get
            await(
              db.run(
                proc_elements.filter(_.id === maximum.find(_.order == (e.order + 1)).get.id.get).update(ch.copy(order = ch.order - 1))
              ))
          }
          true
        }
        case None => false
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
      val q3 = await(db.run(renewOrderQuery(bprocess, order_num).result))
      val ordered = q3.zipWithIndex.map(el => el._1.copy(order = (el._2 + 1) + (order_num - 1)))
      ordered.foreach { el =>
         update(el.id.get, el)
      }
  }

  val create: DBIO[Unit] = proc_elements.schema.create
  val drop: DBIO[Unit] = proc_elements.schema.drop

  def ddl_create = db.run(create)
  def ddl_drop = db.run(drop)




}
