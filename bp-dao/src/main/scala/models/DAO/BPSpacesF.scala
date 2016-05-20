package models.DAO

import main.scala.bprocesses.{ BProcess, BPLoggerResult }
import main.scala.simple_parts.process.ProcElems

import models.DAO.conversion.DatabaseCred
import models.DAO._
import models.DAO.conversion.DatabaseFuture._
import com.github.nscala_time.time.Imports._
import models.DAO.conversion.DatabaseCred.dbConfig.driver.api._
import com.github.tototoshi.slick.JdbcJodaSupport._


import models.DAO.ProcElemDAO._
import models.DAO.BPDAO._
import models.DAO.BPStationDAO._
import models.DAO.conversion.DatabaseCred
import models.DAO._
import models.DAO.sessions._
import builders._
import main.scala.bprocesses.BPSession
import main.scala.simple_parts.process.Units._


class BPSpacesF(tag: Tag) extends Table[BPSpaceDTO](tag, "bpspaces") {
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

object BPSpaceDAOF {
  import akka.actor.ActorSystem
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
  val bpspaces = TableQuery[BPSpacesF]

  private def filterQuery(id: Int): Query[BPSpacesF, BPSpaceDTO, Seq] =
    bpspaces.filter(_.id === id)
  private def filterByBPQuery(id: Int): Query[BPSpacesF, BPSpaceDTO, Seq] =
    bpspaces.filter(_.bprocess === id)
  def findByBPId(bpId: Int) = db.run(filterByBPQuery(bpId).result)

  private def filterByBPSQuery(ids: List[Int]): Query[BPSpacesF, BPSpaceDTO, Seq] =
    bpspaces.filter(_.bprocess inSetBind ids)
  def findByBPSId(bpsId: List[Int]) = db.run(filterByBPSQuery(bpsId).result)
  def pull(s: BPSpaceDTO):Future[Int] = {
     db.run(bpspaces returning bpspaces.map(_.id) += s).map { id =>
         models.utils.IdAfterBurner.elSpaceOwn(s.copy(id = Some(id)))
         id
     }
  }


  def pull_object(s: BPSpaceDTO, timestamp: Option[String] = None) = {
    pull(s)
  }

  def lastIndexOfSpace(id: Int) = {
      val q3 = for { s ← bpspaces if s.id === id } yield s
      val xs = q3.list.map(_.index)

      if (xs.isEmpty) 1
      else xs.max + 1
  }
  def get(k: Int) =   {

      val q3 = for { s ← bpspaces if s.id === k } yield s
      q3.list.headOption //.map(Supplier.tupled(_))
  }
  def getAllByFront(k: Int) =   {

      val q3 = for { s ← bpspaces if s.brick_front === k } yield s
      q3.list //.map(Supplier.tupled(_))
  }
  def getAllByNested(k: Int) =   {

      val q3 = for { s ← bpspaces if s.brick_nested === k } yield s
      q3.list //.map(Supplier.tupled(_))
  }
  def findByBPId(id: Int) = {
      { implicit session =>
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
  def update(id: Int, bpspace: BPSpaceDTO) =   {
    val spToUpdate: BPSpaceDTO = bpspace.copy(Option(id))
    bpspaces.filter(_.id === id).update(spToUpdate)
  }
  /**
   * Delete a bpspace
   * @param id
   */
  def delete(id: Int) = {
    val sp = get(id)
    val res = db.run(bpspaces.filter(_.station === station_id).delete)
    spF.map { sp =>
      sp match {
        case Some(space) => renewIndex(space.bprocess, space.index)
        case _ =>
      }
      res.flatMap { r =>
        r
      }
    }
  }

  def count: Int =   {
    db.run(bpspaces.length)
  }

  val create: DBIO[Unit] = bpspaces.schema.create
  val drop: DBIO[Unit] = bpspaces.schema.drop

  def ddl_create = db.run(create)
  def ddl_drop = db.run(drop)

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
      {
      val q3 = for { sp ← bpspaces if sp.bprocess === bprocess && sp.index > index_num } yield sp
      val ordered = q3.list.zipWithIndex.map(sp => sp._1.copy(index = (sp._2 + 1) + (index_num - 1)))
      //val ordered = q3.list.zipWithIndex.map(sp => sp._1.copy(index = sp._2+index_num))
      ordered.foreach { sp =>
         update(sp.id.get, sp)
      }
    }
  }

  def getAll:Future[Seq[BPSpaceDTO]] = {
    db.run(bpspaces.result)
  }








}
