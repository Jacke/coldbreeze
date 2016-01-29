package models



//import slick.driver.PostgresDriver.simple._
import models.DAO.conversion.DatabaseCred
//import models.DAO.driver.MyPostgresDriver.simple._
import models.DAO._
//import models.DAO.driver.MyPostgresDriver.simple._
import models.DAO.conversion.DatabaseFuture._  
import com.github.nscala_time.time.Imports._
import models.DAO.conversion.DatabaseCred.dbConfig.driver.api._
import com.github.tototoshi.slick.JdbcJodaSupport._

class LaunchShares(tag: Tag) extends Table[LaunchShareDTO](tag, "launch_shares") {
  def id    = column[Long]("id", O.PrimaryKey, O.AutoInc)
  def launch_id = column[Int]("title")
  def workbench_id = column[Int]("price")
  def share_hash = column[String]("description")

  def * = (id.?, launch_id,
			workbench_id,
			share_hash) <> (LaunchShareDTO.tupled, LaunchShareDTO.unapply)
  def wbFK  = foreignKey("launch_shares_biz_business_fk", workbench_id, models.DAO.resources.BusinessDAO.businesses)(_.id, onDelete = ForeignKeyAction.Cascade)
  def sessionFK   = foreignKey("launch_shares_sp_session_fk", launch_id, models.DAO.BPSessionDAO.bpsessions)(_.id, onDelete = ForeignKeyAction.Cascade)

}

/*
  Case class
 */
case class LaunchShareDTO(var id: Option[Long], 
                    launch_id:Int,
					workbench_id:Int,
					share_hash:String)

object LaunchSharesDAOF {
  import akka.actor.ActorSystem
  import akka.stream.ActorFlowMaterializer
  import akka.stream.scaladsl.Source
  import slick.backend.{StaticDatabaseConfig, DatabaseConfig}
  //import slick.driver.JdbcProfile
  //import slick.driver.PostgresDriver.api._
  import slick.jdbc.meta.MTable
  import scala.concurrent.ExecutionContext.Implicits.global
  import scala.concurrent.duration.Duration
  import scala.concurrent.{ExecutionContext, Awaitable, Await, Future}
  import scala.util.Try
//import slick.driver.PostgresDriver.api._


  def await[T](a: Awaitable[T])(implicit ec: ExecutionContext) = Await.result(a, Duration.Inf)
  def awaitAndPrint[T](a: Awaitable[T])(implicit ec: ExecutionContext) = println(await(a))
  val launch_shares = TableQuery[LaunchShares]


  val create: DBIO[Unit] = launch_shares.schema.create
  val drop: DBIO[Unit] = launch_shares.schema.drop

  private def filterQuery(id: Long): Query[LaunchShares, LaunchShareDTO, Seq] =
    launch_shares.filter(_.id === id) 
  private def filterQueryByLaunch(id: Int): Query[LaunchShares, LaunchShareDTO, Seq] =
    launch_shares.filter(_.launch_id === id)     
  private def filterQueryByShareHash(share_hash: String): Query[LaunchShares, LaunchShareDTO, Seq] =
    launch_shares.filter(_.share_hash === share_hash)     

  def get(id: Long):Future[Option[LaunchShareDTO]] = {
     db.run(filterQuery(id).result.headOption)
  }
  def getByLaunch(id: Int):Future[Option[LaunchShareDTO]] = {
     db.run(filterQueryByLaunch(id).result.headOption)
  }  
  def getByHash(hash: String):Future[Option[LaunchShareDTO]] = {
     db.run(filterQueryByShareHash(hash).result.headOption)
  }    
  def generateForLaunch(launch_id: Int, workbench_id: Int):Future[LaunchShareDTO] = {
  	getByLaunch(launch_id).flatMap { opt =>
  		opt match {
  		  case Some(share) => Future.successful(share)
  		  case _ => {
	  		  val obj = LaunchShareDTO(None,
	  		  		launch_id,
	  		  		workbench_id,
	  		  		shareLinkGenerator())
	  		  val idF = pull(obj)
	  		  idF.map { id =>
		  		  obj.copy(id = Some(id))
	  		  }
  		  }
  		}
  	}
  }
  def ddl_create = db.run(create)
  def ddl_drop = db.run(drop)
/*
scala> 04:26:33[minoritydbF.db-1][DEBUG] SlickLogger.debug:32 - Preparing statement: create table "launch_shares" ("id" BIGSERIAL NOT NULL PRIMARY KEY,"title" INTEGER NOT NULL,"price" INTEGER NOT NULL,"description" VARCHAR NOT NULL)
04:26:39[minoritydbF.db-1][DEBUG] SlickLogger.debug:32 - Preparing statement: alter table "launch_shares" add constraint "launch_shares_biz_business_fk" foreign key("price") references "businesses"("id") on update NO ACTION on delete CASCADE
04:26:40[minoritydbF.db-1][DEBUG] SlickLogger.debug:32 - Preparing statement: alter table "launch_shares" add constraint "launch_shares_sp_session_fk" foreign key("title") references "bpsessions"("id") on update NO ACTION on delete CASCADE
*/
 
  def pull(s: LaunchShareDTO) = {
  	db.run(launch_shares returning launch_shares.map(_.id) += s)
  }

  def shareLinkGenerator():String = {
  	java.util.UUID.randomUUID.toString
  }

}
