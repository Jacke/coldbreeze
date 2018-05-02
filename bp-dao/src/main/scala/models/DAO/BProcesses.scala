package models.DAO


import slick.driver.PostgresDriver.api._
import com.github.nscala_time.time.Imports._
import com.github.tototoshi.slick.PostgresJodaSupport._
//import com.github.tminglei.slickpg.date.PgDateJdbcTypes
import slick.model.ForeignKeyAction

import slick.model.ForeignKeyAction
import models.DAO.resources.BusinessDTO._
import models.DAO.conversion.DatabaseCred

/**
 * BProcess Scheme
 */
class BProcesses(tag: Tag) extends Table[BProcessDTO](tag, "bprocesses") {
  def id          = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def title       = column[String]("title")
  def service     = column[Int]("service_id")
  def business    = column[Int]("business_id")

  def created_at  = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at  = column[Option[org.joda.time.DateTime]]("updated_at")

  def version     = column[Long]("version", O.Default(1L))
  def state_machine_type = column[String]("state_machine_type", O.Default("base"))
  // Every table needs a * projection with the same type as the table's type parameter
  def * = (id.?, title, service, business ,created_at, updated_at, version, state_machine_type) <> (BProcessDTO.tupled, BProcessDTO.unapply)

  def businessFK  = foreignKey("proc_business_fk", business, models.DAO.resources.BusinessDAO.businesses)(_.id, onDelete = ForeignKeyAction.Cascade)
  def serviceFK   = foreignKey("proc_service_fk", service, models.DAO.resources.BusinessServiceDAO.business_services)(_.id, onDelete = ForeignKeyAction.Cascade)
}


/*
  Case class
 */
case class BProcessDTO(var id: Option[Int], title: String,
                       service: Int, business: Int ,
                       created_at:Option[org.joda.time.DateTime] = None,
                       updated_at:Option[org.joda.time.DateTime] = None,
                       version: Long = 1L, state_machine_type: String = "base")

/*
  DataConversion
 */
object BPDCO {

}

object BPDAOF {
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
  import slick.jdbc._


  //import dbConfig.driver.api._ //
  def await[T](a: Awaitable[T])(implicit ec: ExecutionContext) = Await.result(a, Duration.Inf)
  def awaitAndPrint[T](a: Awaitable[T])(implicit ec: ExecutionContext) = println(await(a))
  val bprocesses = TableQuery[BProcesses]
  implicit val getBProcessDTOResult = GetResult(r => BProcessDTO(r.<<, r.<<,r.<<,r.<<,r.<<,r.<<,r.<<,r.<< ))

  private def filterByIdsQuery(ids: List[Int]): Query[BProcesses, BProcessDTO, Seq] =
    bprocesses.filter(_.id inSetBind ids)

  private def filterQuery(id: Int): Query[BProcesses, BProcessDTO, Seq] =
    bprocesses.filter(_.id === id)
  private def filterByWorkbenchQuery(id: Int): Query[BProcesses, BProcessDTO, Seq] =
    bprocesses.filter(_.business === id)
  private def filterByServicesQuery(services: List[Int]): Query[BProcesses, BProcessDTO, Seq] =
    bprocesses.filter(_.service inSetBind services)

  private def filterByProcessesTimestampQuery(ids: List[Int], timestamp: Option[String]): DBIO[Seq[BProcessDTO]] = {
          val sInt:String = timestamp.getOrElse("0")
          val datetime = new org.joda.time.DateTime(sInt.toLong)
          val ts = datetime.getMillis() / 1000
          var cnames: String = ""
          if (ids.length > 0) {
            cnames = ids.mkString(",")
          } else {
            cnames = "0"
          }
          println("cnames: "+cnames)
    val s = sql"SELECT * from bprocesses where bprocesses.created_at > to_timestamp(${ts}) AND bprocesses.service_id IN (#${cnames}   )"
      .as[BProcessDTO]
          s
  }

  def getAll = {
    await(db.run(bprocesses.result)).toList
  }

  def findByBusiness(business: Int):Future[Seq[BProcessDTO]] = {
    db.run(filterByWorkbenchQuery(business).result)
  }

  def get(id: Int):Future[Option[BProcessDTO]] = {
     db.run(filterQuery(id).result.headOption)
  }
  def gets(ids: List[Int]):Future[Seq[BProcessDTO]] = {
     db.run(filterByIdsQuery(ids).result)
  }

  def getByServices(services: List[Int], timestamp: Option[String]=None):Future[Seq[BProcessDTO]] = {
    db.run(filterByProcessesTimestampQuery(services, timestamp))
  }


}

object BPDAO {
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
  import slick.jdbc._

  def await[T](a: Awaitable[T])(implicit ec: ExecutionContext) = Await.result(a, Duration.Inf)
  def awaitAndPrint[T](a: Awaitable[T])(implicit ec: ExecutionContext) = println(await(a))

  val bprocesses = TableQuery[BProcesses]

  def get(id: Int):Option[BProcessDTO] = {
    BPDAOF.await(BPDAOF.get(id))
  }
  def getAll = {
    BPDAOF.await(db.run(bprocesses.result)).toList
  }
  def pull_object(s: BProcessDTO) = {
     val process = s.copy(created_at = Some(org.joda.time.DateTime.now()),updated_at = Some(org.joda.time.DateTime.now()) )
     BPDAOF.await(db.run( bprocesses returning bprocesses.map(_.id) += process ))
  }

  def delete(id: Int) =   {
    get(id) match {
      case Some(proc) => {
        CachedRemovedResourcesDAO.makeResourceRemoveEntity(
        scope = proc.business.toString,
        action = "removed",
        resourceTitle = "processes",
        resourceId = s"$id")
        await(db.run(bprocesses.filter(_.id === id).delete ))
      }
      case _ => -1
    }
  }


  def findOwnerByBP(BPid: Int) =   {
      val q3 = for { bp ← bprocesses
                     srv <- models.DAO.resources.BusinessServiceDAO.business_services
        if bp.id === BPid && srv.id === bp.service  } yield srv
      await(db.run(q3.result.headOption)).get.master_acc

  }
  def findByBusiness(business: Int):List[BProcessDTO] =   {
    val q3 = for { s ← bprocesses if s.business === business } yield s
    await(db.run(q3.result)).toList
  }
  def getByServices(services: List[Int]) =   {
      val q3 = for { s ← bprocesses if s.service inSetBind services } yield s
      await(db.run(q3.result)).toList
  }
  def checkTitle(title: String) = {
     val q3 = for { s ← bprocesses if s.title === title } yield s
     await(db.run(q3.result.headOption))
  }

  def pull(id: Option[Int] = None, title: String, service: Int, business: Int) = Try(  {
      bprocesses += BProcessDTO(id, title, service, business, created_at = Some(org.joda.time.DateTime.now()) )
  }).isSuccess


  def update(id: Int, bprocess: BProcessDTO) =   {
    val bpToUpdate: BProcessDTO = bprocess.copy(Option(id))
    CachedRemovedResourcesDAO.makeResourceUpdateEntity(
    scope = bpToUpdate.business.toString,
    action = "updated",
    resourceTitle = "processes",
    resourceId = s"$id",
    updatedEntity = Map("title" -> bprocess.title,
      "service" -> bprocess.service.toString,
      "version" -> bprocess.version.toString,
      "state_machine_type" -> bprocess.state_machine_type.toString
    ))

    await(db.run( bprocesses.filter(_.id === id).update(bpToUpdate) ))
  }



  val create: DBIO[Unit] = bprocesses.schema.create
  val drop: DBIO[Unit] = bprocesses.schema.drop

  def ddl_create = db.run(create)
  def ddl_drop = db.run(drop)


}
