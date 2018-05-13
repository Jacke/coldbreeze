package models.DAO



import slick.driver.PostgresDriver.api._
import com.github.nscala_time.time.Imports._
import com.github.tototoshi.slick.PostgresJodaSupport._
import slick.model.ForeignKeyAction
import models.DAO.conversion.{DatabaseCred, Implicits}
import slick.model.ForeignKeyAction


class Annotations(tag: Tag) extends Table[AnnotationDTO](tag, "annotations"){
  def id         = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def title      = column[String]("title")
  def content    = column[String]("content")
  def process    = column[Int]("process")
  def station    = column[Int]("station")
  def is_private = column[Boolean]("is_private")
  def created_at = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at = column[Option[org.joda.time.DateTime]]("updated_at")


  def * = (id.?, title,
           content,
           process,
           station,
           is_private,
           created_at,
           updated_at) <> (AnnotationDTO.tupled, AnnotationDTO.unapply)

}
case class AnnotationDTO(
  var id: Option[Int],
  title: String,
  content: String,
  process: Int,
  station: Int,
  is_private: Boolean,
  created_at: Option[org.joda.time.DateTime],
  updated_at: Option[org.joda.time.DateTime] )

object AnnotationDAO {
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

  val annotations = TableQuery[Annotations]


  def pull_object(s: AnnotationDTO) =   {
      await(db.run( annotations returning annotations.map(_.id) += s ))
  }
  def get(k: Int) =   {
      val q3 = for { s ← annotations if s.id === k } yield s
      await(db.run(q3.result.headOption))
  }

  def update(id: Int, annotation: AnnotationDTO) =   {
    val annotationsUpdate: AnnotationDTO = annotation.copy(Option(id))
    await(db.run( annotations.filter(_.id === id).update(annotationsUpdate) ))
  }

  def delete(id: Int) =   {
    await(db.run( annotations.filter(_.id === id).delete ))
  }

  def getAll =   {
      val q3 = for { s ← annotations } yield s
      await(db.run(q3.result)).toList.sortBy(_.id)
  }

  val create: DBIO[Unit] = annotations.schema.create
  val drop: DBIO[Unit] = annotations.schema.drop

  def ddl_create = db.run(create)
  def ddl_drop = db.run(drop)

}







class UserAnnotations(tag: Tag) extends Table[UserAnnotationDTO](tag, "user_annotations"){
  def id            = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def annotation_id = column[Int]("annotation_id")
  def uid           = column[String]("uid")

  def * = (id.?, annotation_id, uid) <> (UserAnnotationDTO.tupled, UserAnnotationDTO.unapply)
}
case class UserAnnotationDTO(
  var id: Option[Int],
  annotation_id: Int,
  uid: String
)

object UserAnnotationDAO {
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

  val userannotations = TableQuery[UserAnnotations]

  def pull_object(s: UserAnnotationDTO) =   {
      await(db.run( userannotations returning userannotations.map(_.id) += s ))
  }

  def get(k: Int) =   {
      val q3 = for { s ← userannotations if s.id === k } yield s
      await(db.run(q3.result.headOption))
  }

  def update(id: Int, userannotation: UserAnnotationDTO) =   {
    val annotation_rangesUpdate: UserAnnotationDTO = userannotation.copy(Option(id))
    await(db.run( userannotations.filter(_.id === id).update(annotation_rangesUpdate) ))
  }


  def delete(id: Int) =   {
    await(db.run( userannotations.filter(_.id === id).delete ))
  }

  def getAll =   {
      val q3 = for { s ← userannotations } yield s
      await(db.run(q3.result)).toList.sortBy(_.id)
  }

  val create: DBIO[Unit] = userannotations.schema.create
  val drop: DBIO[Unit] = userannotations.schema.drop

  def ddl_create = db.run(create)
  def ddl_drop = db.run(drop)


}












class AnnotationRanges(tag: Tag) extends Table[AnnotationRangeDTO](tag, "annotation_ranges"){
  def id               = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def annotation_id    = column[Int]("annotation_id")
  def proc_elem_start  = column[Option[Int]]("proc_elem_start")
  def proc_elem_end    = column[Option[Int]]("proc_elem_end")
  def space_elem_start = column[Option[Int]]("space_elem_start")
  def space_elem_end   = column[Option[Int]]("space_elem_end")

  def * = (id.?, annotation_id,
           proc_elem_start,
           proc_elem_end,
           space_elem_start,
           space_elem_end) <> (AnnotationRangeDTO.tupled, AnnotationRangeDTO.unapply)
}
case class AnnotationRangeDTO(
  var id:           Option[Int],
  annotation_id:    Int,
  proc_elem_start:  Option[Int],
  proc_elem_end:    Option[Int],
  space_elem_start: Option[Int],
  space_elem_end:   Option[Int]
)

object AnnotationRangeDAO {
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


  val annotation_ranges = TableQuery[AnnotationRanges]

  def pull_object(s: AnnotationRangeDTO) =   {
      await(db.run( annotation_ranges returning annotation_ranges.map(_.id) += s ))
  }

  def get(k: Int) =   {
      val q3 = for { s ← annotation_ranges if s.id === k } yield s
      await(db.run(q3.result.headOption))
  }
  
  def update(id: Int, annotation_range: AnnotationRangeDTO) =   {
    val annotation_rangesUpdate: AnnotationRangeDTO = annotation_range.copy(Option(id))
    await(db.run( annotation_ranges.filter(_.id === id).update(annotation_rangesUpdate) ))
  }


  def delete(id: Int) =   {
    await(db.run( annotation_ranges.filter(_.id === id).delete ))
  }


  val create: DBIO[Unit] = annotation_ranges.schema.create
  val drop: DBIO[Unit] = annotation_ranges.schema.drop

  def ddl_create = db.run(create)
  def ddl_drop = db.run(drop)


}
