package models.DAO.sessions
import main.scala.bprocesses.BProcess
import main.scala.simple_parts.process.{Block, ProcElems}
import slick.driver.PostgresDriver.api._
import com.github.nscala_time.time.Imports._
import com.github.tototoshi.slick.PostgresJodaSupport._

import slick.model.ForeignKeyAction
import models.DAO.conversion.{DatabaseCred, Implicits}

import main.scala.simple_parts.process.data.{Confirm, Note, Constant}
import main.scala.simple_parts.process.Block
import main.scala.simple_parts.process.ContainerBrick
import main.scala.utils.Space
import main.scala.simple_parts.process.Units._

class SessionSpaceElements(tag: Tag) extends Table[SessionSpaceElementDTO](tag, "session_space_elements") {
  def id        = column[Int]("id", O.PrimaryKey, O.AutoInc) // This is the primary key column
  def title     = column[String]("title")
  def desc      = column[String]("desc")
  def business  = column[Int]("business_id")
  def bprocess  = column[Int]("bprocess_id")
  def session   = column[Int]("session_id")
  def b_type    = column[String]("b_type")
  def type_title= column[String]("type_title")

  def space_own = column[Option[Int]]("own_space_id")
  def space_owned = column[Int]("owned_space_id")
  def space_role= column[Option[String]]("space_role")

  def order     = column[Int]("order")
  //def comps = column[Option[List[CompositeValues]]]("comps", O.DBType("compositevalues[]"))

  def created_at= column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at= column[Option[org.joda.time.DateTime]]("updated_at")

  def * = (id.?, title, desc,  business,
           bprocess, session,  b_type, type_title,
           space_own,  space_owned,
           space_role, order,
           created_at, updated_at) <> (SessionSpaceElementDTO.tupled, SessionSpaceElementDTO.unapply)

  def businessFK = foreignKey("s_sp_el_business_fk", business, models.DAO.resources.BusinessDAO.businesses)(_.id, onDelete = ForeignKeyAction.Cascade)
  def bpFK       = foreignKey("s_sp_el_bprocess_fk", bprocess, models.DAO.BPDAOF.bprocesses)(_.id, onDelete = ForeignKeyAction.Cascade)
  def spaceFK    = foreignKey("s_sp_el_session_space_fk", space_owned, models.DAO.sessions.SessionSpaceDAO.session_spaces)(_.id, onDelete = ForeignKeyAction.Cascade)
  def sessionFK  = foreignKey("s_sp_el_session_fk", session,  models.DAO.BPSessionDAOF.bpsessions)(_.id, onDelete = ForeignKeyAction.Cascade)

}

/*
  Case class
 */

case class SessionSpaceElementDTO(id: Option[Int],
                        title:String,
                        desc:String,
                        business:Int,
                        bprocess:Int,
                        session: Int,
                        b_type:String,
                        type_title:String,
                        space_own:Option[Int],
                        space_owned: Int,
                        space_role:Option[String],
                        order:Int,
                        created_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now),
                        updated_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now)) {
	/*

  def cast(process: BProcess, space_dto: BPSpaceDTO):Option[ProcElems] = {
    this match {
      case x if (x.b_type == "block" && x.type_title == "test block") => {
        Option(
          new Block(id.get,title,desc,None,process,b_type,type_title,order)
        )
      }
      case constant if (constant.b_type == "block" && constant.type_title == "constant") => {
        Option(
          new Constant[Boolean](id.get, true, process, order, space_id = process.spaces.find(space => space.index == space_dto.index))
        )
      }
      case note if (note.b_type == "block" && note.type_title == "note") => Option(new Note( id.get,
        title,
        desc,
        None,
        process,
        b_type,
        type_title,
        order,
        None))
      case confirm if (confirm.b_type == "block" && confirm.type_title == "confirm") => Option(new Confirm( id.get,
        title,
        desc,
        None,
        process,
        b_type,
        type_title,
        order,
        space_parent = process.spaces.find(_.id == Some(space_owned)),
        space_role = Some("container")))
      case _ => Option(
          new Block(id.get,title,desc,None,process,b_type,type_title,order)
        )
    }

  }

  def castToSpace(process: BProcess, space: Space):Option[ProcElems] = {
    this match {
      case x if (x.b_type == "brick" | x.type_title == "container_brick") => {
        println("space_parent REFACTOR!!!!!!!" + space_own)
        // TODO REFACTOR space_parent in brick
        Option(
          new ContainerBrick(id.get, title, desc, None, process, b_type, type_title, order,
            None, space_role.getOrElse("container"), space_own) // Default space role is Container
          //new Block(id.get,title,desc,Implicits.fetch_cv(comps),process,b_type,type_title,order, space_parent = Some(space), space_role)
        )
      }
      case constant if (constant.b_type == "block" && constant.type_title == "constant") => {
        Option(
          new Constant[Boolean](id.get, true, process, order, space_id = Some(space))
        )
      }
      case note if (note.b_type == "block" && note.type_title == "note") => Option(new Note( id.get,
        title,
        desc,
        None,
        process,
        b_type,
        type_title,
        order,
        None))
      case confirm if (confirm.b_type == "block" && confirm.type_title == "confirm") => Option(new Confirm( id.get,
        title,
        desc,
        None,
        process,
        b_type,
        type_title,
        order,
        space_parent = Some(space),
        space_id = Some(space),
        space_role = Some("container")
        ))
      case _ => Option(
          new Block(id.get,title,desc,None,process,b_type,type_title,order, space_parent = Some(space))
        )
    }

  }
*/
}

object SessionSpaceElemDAOF {
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
  val space_elements = TableQuery[SessionSpaceElements]

  private def filterByLaunchesQuery(ids: List[Int]): Query[SessionSpaceElements, SessionSpaceElementDTO, Seq] =
    space_elements.filter(_.session inSetBind ids)
  def findByLaunchesIds(bpsId: List[Int]) = db.run(filterByLaunchesQuery(bpsId).result)


  private def filterQuery(id: Int): Query[SessionSpaceElements, SessionSpaceElementDTO, Seq] =
    space_elements.filter(_.id === id)

  def findById(id: Int):Future[Option[SessionSpaceElementDTO]] = {
        db.run(filterQuery(id).result.headOption)
  }

   private def filterQueryBySession(id: Int): Query[SessionSpaceElements, SessionSpaceElementDTO, Seq] =
    space_elements.filter(_.session === id)

  def findBySession(k: Int):Future[Seq[SessionSpaceElementDTO]] =  {
      db.run(filterQueryBySession(k).result)
  }

}
object SessionSpaceElemDAO {
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
  val space_elements = TableQuery[SessionSpaceElements]

  private def filterQuery(id: Int): Query[SessionSpaceElements, SessionSpaceElementDTO, Seq] =
    space_elements.filter(_.id === id)
  private def filterQuerys(ids: List[Int]): Query[SessionSpaceElements, SessionSpaceElementDTO, Seq] =
    space_elements.filter(_.id inSetBind ids)


  private def filterBySessionQuery(id: Int): Query[SessionSpaceElements, SessionSpaceElementDTO, Seq] =
    space_elements.filter(_.session === id)
  private def filterByBPQuery(id: Int): Query[SessionSpaceElements, SessionSpaceElementDTO, Seq] =
    space_elements.filter(_.bprocess === id)
  private def filterByBPSessionQuery(id: Int, session_id: Int): Query[SessionSpaceElements, SessionSpaceElementDTO, Seq] =
    space_elements.filter(e => (e.bprocess === id) && (e.session === session_id ))
  private def findByBPanOrderQuery(id: Int,order: Int): Query[SessionSpaceElements, SessionSpaceElementDTO, Seq] =
    space_elements.filter(e => e.bprocess === id && e.order === order)

  private def lastOrderOfBPQuery(id: Int, space_id: Int): Query[SessionSpaceElements, SessionSpaceElementDTO, Seq] =
      space_elements.filter(el => el.space_owned === space_id && el.bprocess === id)
  private def findBySpaceQuery(space_id: Int): Query[SessionSpaceElements, SessionSpaceElementDTO, Seq] =
      space_elements.filter(el => el.space_owned === space_id)

  private def renewOrderQuery(bprocess: Int, space_id: Int, order_num:Int): Query[SessionSpaceElements, SessionSpaceElementDTO, Seq] =
      space_elements.filter(el => el.bprocess === bprocess && el.space_owned === space_id && el.order > order_num)




  /**
   * Find a specific entity by id.
   */
  def findByBPId(id: Int) = {
    await(db.run(filterByBPQuery(id).result)).toList
  }

  def findByBPSessionId(id: Int, session_id: Int) = {
    await(db.run(filterByBPSessionQuery(id, session_id).result)).toList
  }

  def findBySession(session_id: Int) = {
      await(db.run(filterBySessionQuery(session_id).result)).toList
  }

  def findFlatBySession(session_id: Int) = {
    val sp_ids = SessionSpaceDAO.findBySession(session_id).filter(space => space.brick_front.isDefined).map(sp => sp.id.get)
    sp_ids.map(id => findBySpace(id))
  }

  def lastOrderOfBP(id: Int, space_id: Int):Int = {
      val q3 = await(db.run(lastOrderOfBPQuery(id, space_id).result)).toList
      val xs = q3.map(_.order)
      if (xs.isEmpty) 1
      else xs.max + 1
  }

  def findBySpace(space_id: Int) = {
     await(db.run(findBySpaceQuery(space_id).result)).toList
  }

  def findById(id: Int):Option[SessionSpaceElementDTO] = {
      await(db.run(filterQuery(id).result.headOption))
  }

  def findByIds(ids: List[Int]) = {
      await(db.run(filterQuerys(ids).result)).toList
  }
  def findByBPanOrder(id: Int, order: Int) = {
      await(db.run(findByBPanOrderQuery(id, order).result)).toList
  }
  def pull_object(s: SessionSpaceElementDTO) =   {
      await(db.run(space_elements returning space_elements.map(_.id) += s) )
  }


  val create: DBIO[Unit] = space_elements.schema.create
  val drop: DBIO[Unit] = space_elements.schema.drop
  def ddl_create = db.run(create)
  def ddl_drop = db.run(drop)

  def update(id: Int, entity: SessionSpaceElementDTO):Boolean = {
      findById(id) match {
        case Some(e) => { await( db.run(space_elements.filter(_.id === id).update(entity))); true }
        case None => false
      }
  }

  def delete(id: Int) = {
    val elem = findById(id)
    val res = await( db.run(space_elements.filter(_.id === id).delete))
    elem match {
       case Some(el) => renewOrder(el.bprocess, el.space_owned, el.order)
       case _ =>
    }
    res
  }

def moveUp(bprocess: Int, element_id: Int, space_id: Int) = {
      val minimum = findByBPId(bprocess).sortBy(_.order)
      findById(element_id) match {
        case Some(e) => {
          if (e.order > 1 && e.order != minimum.head.order) {
            await( db.run(
              space_elements.filter(_.id === element_id).update(e.copy(order = e.order - 1))
            ))
            val ch = findById(minimum.find(_.order == (e.order - 1)).get.id.get).get
            await( db.run(
              space_elements.filter(_.id === minimum.find(_.order == (e.order - 1)).get.id.get).update(ch.copy(order = ch.order + 1))
            ))
          }
          true
        }
        case None => false
      }

}

  def moveDown(bprocess: Int, element_id: Int, space_id: Int) = {
      val maximum = findBySpace(space_id).sortBy(_.order)
      findById(element_id) match {
        case Some(e) => {
          if (e.order < maximum.last.order && e.order != maximum.last.order) {
            await( db.run(
              space_elements.filter(_.id === element_id).update(e.copy(order = e.order + 1))
            ))
            val ch = findById(maximum.find(_.order == (e.order + 1)).get.id.get).get
            await( db.run(
              space_elements.filter(_.id === maximum.find(_.order == (e.order + 1)).get.id.get).update(ch.copy(order = ch.order - 1))
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
  def renewOrder(bprocess: Int, space_id: Int, order_num: Int) = {
      val q3 = await(db.run( renewOrderQuery(bprocess, space_id, order_num).result )).toList
      val ordered = q3.zipWithIndex.map(el => el._1.copy(order = (el._2 + 1) + (order_num - 1)))
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
