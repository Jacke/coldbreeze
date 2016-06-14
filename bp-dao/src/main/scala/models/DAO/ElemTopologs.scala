package models.DAO
import main.scala.bprocesses.{BProcess, BPLoggerResult}
import main.scala.simple_parts.process.ProcElems
import models.DAO.ProcElemDAO._
import models.DAO.BPDAO._
import models.DAO.BPStationDAO._
import models.DAO.conversion.DatabaseCred
import main.scala.simple_parts.process.Units._

import com.github.tototoshi.slick.PostgresJodaSupport._

object ElemTopologDAOF {
  import akka.actor.ActorSystem
  import slick.backend.{StaticDatabaseConfig, DatabaseConfig}
  //import slick.driver.JdbcProfile
  import slick.jdbc.meta.MTable
  import scala.concurrent.ExecutionContext.Implicits.global
  import com.github.tototoshi.slick.PostgresJodaSupport._
  import scala.concurrent.duration.Duration
  import scala.concurrent.{ExecutionContext, Awaitable, Await, Future}
  import scala.util.Try
  import models.DAO.conversion.DatabaseFuture._
  import dbConfig.driver.api._
  def await[T](a: Awaitable[T])(implicit ec: ExecutionContext) = Await.result(a, Duration.Inf)
  def awaitAndPrint[T](a: Awaitable[T])(implicit ec: ExecutionContext) = println(await(a))
  val elem_topologs = TableQuery[ElemTopologs]

  private def filterQuery(id: Int): Query[ElemTopologs, ElemTopology, Seq] =
    elem_topologs.filter(_.id === id)

  def pull_object(s: ElemTopology):Future[Int] = {
    val insertion = (elem_topologs returning elem_topologs.map(_.id)) += s
    db.run(insertion)
    //  db.run ( elem_topologs returning elem_topologs.map(_.id) += s )
  }
}


import slick.driver.PostgresDriver.api._
import com.github.nscala_time.time.Imports._
//import com.github.tminglei.slickpg.date.PgDateJdbcTypes
import slick.model.ForeignKeyAction
case class EitherTypeElement(front: Option[UndefElement] = None,
                                    nested: Option[SpaceElementDTO] = None,
                                    title: String = "")

class ElemTopologs(tag: Tag) extends Table[ElemTopology](tag, "elem_topologs") {
  def id            = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def process       = column[Int]("process_id")
  def hash          = column[String]("hash")

  def front_elem_id = column[Option[Int]]("front_elem_id")
  def space_elem_id = column[Option[Int]]("space_elem_id")
  def space_id      = column[Option[Int]]("space_id")

  def created_at = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at = column[Option[org.joda.time.DateTime]]("updated_at")

  def * = (id.?, process,
          front_elem_id,
          space_elem_id,
          hash,
           created_at, updated_at, space_id) <> (ElemTopology.tupled, ElemTopology.unapply)

  def bpFK        = foreignKey("topo_bprocess_fk", process, models.DAO.BPDAOF.bprocesses)(_.id, onDelete = ForeignKeyAction.Cascade)
  def procelemFK  = foreignKey("topo_procelem_fk", front_elem_id, proc_elements)(_.id, onDelete = ForeignKeyAction.Cascade)
  def spaceelemFK = foreignKey("topo_spaceelem_fk", space_elem_id, SpaceElemDAO.space_elements)(_.id, onDelete = ForeignKeyAction.Cascade)
  def spaceFK     = foreignKey("topo_bpspace_fk", space_id, models.DAO.BPSpaceDAO.bpspaces)(_.id, onDelete = ForeignKeyAction.Cascade)

}



object ElemTopologDAO {
  import akka.actor.ActorSystem
  import slick.backend.{StaticDatabaseConfig, DatabaseConfig}
  //import slick.driver.JdbcProfile
  import slick.jdbc.meta.MTable
  import scala.concurrent.ExecutionContext.Implicits.global
  import com.github.tototoshi.slick.PostgresJodaSupport._
  import scala.concurrent.duration.Duration
  import scala.concurrent.{ExecutionContext, Awaitable, Await, Future}
  import scala.util.Try
  import models.DAO.conversion.DatabaseFuture._
  import dbConfig.driver.api._
  def await[T](a: Awaitable[T])(implicit ec: ExecutionContext) = Await.result(a, Duration.Inf)
  def awaitAndPrint[T](a: Awaitable[T])(implicit ec: ExecutionContext) = println(await(a))
  val elem_topologs = TableQuery[ElemTopologs]

  private def filterQuery(id: Int): Query[ElemTopologs, ElemTopology, Seq] =
    elem_topologs.filter(_.id === id)
  private def filterQueryByFrontElements(ids: List[Int]): Query[ElemTopologs, ElemTopology, Seq] =
    elem_topologs.filter(_.front_elem_id inSetBind ids)
  private def filterQueryBySpaceElements(ids: List[Int]): Query[ElemTopologs, ElemTopology, Seq] =
    elem_topologs.filter(_.space_elem_id inSetBind ids)
  private def filterQueryBySpaces(ids: List[Int]): Query[ElemTopologs, ElemTopology, Seq] =
    elem_topologs.filter(_.space_id inSetBind ids)

  def findByFrontElements(ids: List[Int]):List[ElemTopology] =   {
    await( db.run(filterQueryByFrontElements(ids).result) ).toList
  }
  def findBySpaceElements(ids: List[Int]):List[ElemTopology] =   {
    await( db.run(filterQueryBySpaceElements(ids).result) ).toList
  }
  def findBySpaces(ids: List[Int]):List[ElemTopology] =   {
    await( db.run(filterQueryBySpaces(ids).result) ).toList
  }    




  private def filterQueryProcess(id: Int): Query[ElemTopologs, ElemTopology, Seq] =
    elem_topologs.filter(_.process === id)

  def pull_object(s: ElemTopology) =   {
      await(db.run( elem_topologs returning elem_topologs.map(_.id) += s))
  }

  def findByBP(id: Int):List[ElemTopology] =   {
    await( db.run(filterQueryProcess(id).result) ).toList
  }

  def getIdentityById(k: Int):Option[EitherTypeElement] = {
    get(k) match {
      case Some(topo) => {
        if (topo.front_elem_id.isDefined) {
          val front_el = ProcElemDAO.findById(topo.front_elem_id.get).get
          Some(EitherTypeElement(front = Some(front_el),
                                 nested = None,
                                 title = front_el.title))
        } else if (topo.space_elem_id.isDefined) {
          val nested_el = SpaceElemDAO.findById(topo.space_elem_id.get).get
          Some(EitherTypeElement(front = None,
                                 nested = Some(nested_el),
                                 title = nested_el.title))
        } else {
          None
        }

      }
      case _ => None
    }
  }

  def get(id: Int):Option[ElemTopology] =   {
    await( db.run(filterQuery(id).result.headOption) )
  }


  def isFront(k: Int):Boolean = {
    get(k) match {
        case Some(el) => el.front_elem_id.isDefined
        case _ => false
      }
  }
  def isNested(k: Int):Boolean = {
        get(k) match {
        case Some(el) => el.space_elem_id.isDefined
        case _ => false
      }
  }




  def update(id: Int, topology: ElemTopology) =   {
    val topologyToUpdate: ElemTopology = topology.copy(Option(id))
    await( db.run( elem_topologs.filter(_.id === id).update(topologyToUpdate) ))
  }
  def delete(id: Int) =   {
    await( db.run( elem_topologs.filter(_.id === id).delete ))
  }



    val create: DBIO[Unit] = elem_topologs.schema.create
    val drop: DBIO[Unit] = elem_topologs.schema.drop

    def ddl_create = db.run(create)
    def ddl_drop = db.run(drop)

}
