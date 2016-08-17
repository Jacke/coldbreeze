package models.DAO.reflect
import main.scala.bprocesses.{BProcess, BPLoggerResult}
import main.scala.simple_parts.process.ProcElems
import models.DAO.ProcElemDAO._
import models.DAO.BPDAO._
import models.DAO.BPStationDAO._
import models.DAO.conversion.DatabaseCred
import main.scala.bprocesses.{BPState, BPSessionState}
import models.DAO._
import models.DAO.projections._
import main.scala.simple_parts.process._
import main.scala.bprocesses.refs._
import play.api.libs.json._


/**
 * BaseContainer
 * base_req_type: json
 * base_content_string: json body
 */
case class BaseContainer(
  base_id: Long,
  base_req_type: String = "string",
  base_content_string: String = "",
  base_content_number: Long = 0L,
  base_content_boolean: Boolean = false,
  base_json_opt: Option[JsValue] = None
)
case class ActionInputContainer(
  input_id: Long,
  input_req_type: String = "string",
  input_content_string: String = "",
  input_content_number: Long = 0L,
  input_content_boolean: Boolean = false,
  input_json_opt: Option[JsValue] = None
)
case class ActionOutputContainer(
  output_id: Long,
  output_req_type: String = "string",
  output_content_string: String = "",
  output_content_number: Long = 0L,
  output_content_boolean: Boolean = false,
  output_json_opt: Option[JsValue] = None
)



case class RefActionContainer(
  action_id: Int,
  middleware_id: Long,
  strategy_id: Long,
  bases: List[BaseContainer] = List(),
  inputs: List[ActionInputContainer]=List(),
  outputs: List[ActionOutputContainer]=List()
)

case class Ref(id: Option[Int],
              title: String,
              host: String = "",
              desc: Option[String] = None,
              created_at:Option[org.joda.time.DateTime] = None,
              updated_at:Option[org.joda.time.DateTime] = None,
              category: String = "Base",
              hidden:Boolean = false)


case class RetrivedRef(
  proc_elems: List[UnitElement],
  spaces: List[UnitSpace], // change to DTO
  space_elems: List[UnitSpaceElement], // change to DTO
  states: List[BPState],
  switches: List[UnitSwitcher],
  reactions: List[UnitReaction],
  reaction_state_outs: List[UnitReactionStateOut])

case class RefMapResult(oldId: Int, 
  newId:Int,
  oldIdLong: Long = -1L,
  newIdLong: Long = -1L)
case class RefResulted(
  proc_elems: List[RefMapResult]=List.empty,
  space_elems: List[RefMapResult]=List.empty,
  spaces:List[RefMapResult]=List.empty,
  states: List[RefMapResult]=List.empty,
  switches: List[RefMapResult]=List.empty,
  reactions: List[RefMapResult]=List.empty,
  reaction_state_outs: List[RefMapResult]=List.empty,
  topoElem:List[RefMapResult]=List.empty,
  topoSpaceElem:List[RefMapResult]=List.empty,
  middlewares:List[RefMapResult]=List.empty,
  strategies:List[RefMapResult]=List.empty,
  inputs:List[RefMapResult]=List.empty,
  bases:List[RefMapResult]=List.empty,
  outputs:List[RefMapResult]=List.empty
)



object RefDAOF {
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
  val refs = RefDAO.refs

  private def filterQuery(id: Int): Query[Refs, Ref, Seq] =
    refs.filter(_.id === id)

  /**
   *  Search for ref
   *  If ref existed create element
   *  @return In success return RefResulted otherwise return Nothing
   */
  def retrieveAndCreateElement(refId: Int,
              process: Int,
              business: Int, in: String = "front",
              title: String, desc:String = "",
              space_id: Option[Int] = None,
              refActionContainer: List[RefActionContainer] = List() ):Future[Option[RefResulted]] = {
      val refResultOptF = in match {
        // Creating front element
        case "front" => 
          RefProjectorF.projecting(refId, process, business, 
                                   title,desc, "front", None, refActionContainer)
        // Creating nested element
        case _ => 
          RefProjectorF.projecting(refId, process, business, 
                                   title,desc, "nested", space_id)
      }
      // Record mapping operation for element based on RefResult topology ids
      refResultOptF.map { refResultOpt =>
        refResultOpt match {
          case Some(refResult) => {
            Future.sequence( 
              refResult.topoElem.map { topo =>
                  createTopoElementMappingRecord(refId, topo)
                })
          }
          case _ => Future.successful(List())
        }
      }
      refResultOptF
  }

  /**
   *  Search for ref
   *  If ref existed create element with specific order number
   *  @return In success return RefResulted otherwise return Nothing
   */
  def retrieveAndCreateElementWithOrder(refId: Int,
              process: Int,
              order: Int,
              business: Int, 
              in: String = "front",
              title: String, 
              desc:String = "",
              space_id: Option[Int] = None,
              refActionContainer: List[RefActionContainer] = List() ):Future[Option[RefResulted]] = {
      val refResultOptF = in match {
        // Creating front element
        case "front" => 
          RefProjectorF.projecting(refId, process, business, 
                                   title,desc, "front", None, refActionContainer, Some(order))
        // Creating nested element
        case _ => 
          RefProjectorF.projecting(refId, process, business, 
                                   title,desc, "nested", space_id, List(), Some(order) )
      }
      // Record mapping operation for element based on RefResult topology ids
      refResultOptF.map { refResultOpt =>
        refResultOpt match {
          case Some(refResult) => {
            Future.sequence( 
              refResult.topoElem.map { topo =>
                  createTopoElementMappingRecord(refId, topo)
                })
          }
          case _ => Future.successful(List())
        }
      }
      refResultOptF
  }

  /**
   *  Partial ref maker // Strategy creation
   *  Search for ref
   *  If ref existed create strategy for the element
   *  @return In success return RefResulted otherwise return Nothing
   */
  def retrieveAndCreateStrategy(refStrategyId: Long,
                                elementTopoId: Int,
                                trueMiddlewareId: Long,
                refActionContainer: RefActionContainer ):Future[Option[RefResulted]] = {
      ReplaceProjectionF.projectingStrategy(refStrategyId, elementTopoId,trueMiddlewareId, refActionContainer)
  }




  /** 
   * Create mapping betwer ref topo, ref -> element topo
   */
  private def createTopoElementMappingRecord(refId: Int, elem: RefMapResult) = {
                    ReflectElementMappingsDAO.pull(
                                              ReflectElementMap(None,
                                                reflection = refId,
                                                topology_element = elem.newId,
                                                ref_topo_element = Some(elem.oldId),
                                                created_at = Some(org.joda.time.DateTime.now()),
                                                updated_at = Some(org.joda.time.DateTime.now()))
                                                    )
  }


  def get(k: Int):Future[Option[Ref]] = {
    db.run(filterQuery(k).result.headOption)
  }

}


import slick.driver.PostgresDriver.api._
import com.github.nscala_time.time.Imports._
import com.github.tototoshi.slick.PostgresJodaSupport._
//import com.github.tminglei.slickpg.date.PgDateJdbcTypes
import slick.model.ForeignKeyAction

class Refs(tag: Tag) extends Table[Ref](tag, "refs") {
  def id      = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def title   = column[String]("title")
  def host    = column[String]("host")
  def desc    = column[Option[String]]("desc")
  def category= column[String]("category", O.Default("Base"))
  def hidden  = column[Boolean]("hidden", O.Default(false))

  def created_at = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at = column[Option[org.joda.time.DateTime]]("updated_at")

  def * = (id.?, title, host, desc,
           created_at, updated_at, category, hidden) <> (Ref.tupled, Ref.unapply)

}




object RefDAO {
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
  val refs = TableQuery[Refs]
  private def filterQuery(id: Int): Query[Refs, Ref, Seq] =
    refs.filter(_.id === id)
  private def filterQueryTitle(title: String): Query[Refs, Ref, Seq] =
    refs.filter(_.title === title)
  private def getAllVisibleQuery(): Query[Refs, Ref, Seq] =
    refs.filter(_.hidden === false)


  def pull_object(s: Ref) =   {
     await(db.run(refs returning refs.map(_.id) += s))
  }

  def get(k: Int):Option[Ref] =   {
    await(db.run(filterQuery(k).result.headOption) )
  }

  def getByTitle(title: String):List[Ref] =   {
    await(db.run(filterQueryTitle(title).result)).toList
  }
  def deleteByTitle(title: String) =   {
    getByTitle(title).map(el => el.id.get).foreach { id =>
      delete(id)
    }
  }

  /**
  * Project ref to existed elements and states
  */
  def retrieve(k: Int, process: Int,
              business: Int, in: String = "front",
              title: String, desc:String = "",
              space_id: Option[Int] = None):Option[RefResulted] =   {
    //logger.debug(k, process, business, title, desc, space_id)
    val results = in match {
      case "front" => RefProjectorF.projecting(k, process, business, title,desc, "front")
      case _ => RefProjectorF.projecting(k, process, business, title,desc, "nested", space_id)
    }
    await(results)
  }


  def update(id: Int, ref: Ref) =   {
    val refToUpdate: Ref = ref.copy(Option(id))
    await(db.run(refs.filter(_.id === id).update(refToUpdate)))
  }
  def delete(id: Int) =   {
    await(db.run(refs.filter(_.id === id).delete))
  }

  val create: DBIO[Unit] = refs.schema.create
  val drop: DBIO[Unit] = refs.schema.drop
  def ddl_create = db.run(create)
  def ddl_drop = db.run(drop)

  def getAllVisible =   {
      await(db.run(getAllVisibleQuery().result) ).sortBy(_.id)
  }

}
