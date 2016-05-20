package models.DAO



import slick.driver.PostgresDriver.api._
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
  import scala.util.Try
  import DatabaseCred.database

  val annotations = TableQuery[Annotations]
    
    
  def pull_object(s: AnnotationDTO) = database withSession {
    implicit session ⇒
      annotations returning annotations.map(_.id) += s
  }
  def get(k: Int) = database withSession {
    implicit session ⇒
      val q3 = for { s ← annotations if s.id === k } yield s 
      q3.list.headOption
  }
  def update(id: Int, annotation: AnnotationDTO) = database withSession { implicit session ⇒
    val annotationsUpdate: AnnotationDTO = annotation.copy(Option(id))
    annotations.filter(_.id === id).update(annotationsUpdate)
  } 


  def delete(id: Int) = database withSession { implicit session ⇒
    annotations.filter(_.id === id).delete
  }
  def count: Int = database withSession { implicit session ⇒
    Query(annotations.length).first
  }
  def getAll = database withSession {
    implicit session ⇒
      val q3 = for { s ← annotations } yield s 
      q3.list.sortBy(_.id)
  }
  def ddl_create = {
    database withSession {
      implicit session =>
      annotations.ddl.create
    }
  }
  def ddl_drop = {
    database withSession {
      implicit session =>
        annotations.ddl.drop
    }
  }  
      
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
  import scala.util.Try
  import DatabaseCred.database
    
  val userannotations = TableQuery[UserAnnotations]
    

    
  def pull_object(s: UserAnnotationDTO) = database withSession {
    implicit session ⇒
      userannotations returning userannotations.map(_.id) += s
  }
  def get(k: Int) = database withSession {
    implicit session ⇒
      val q3 = for { s ← userannotations if s.id === k } yield s 
      q3.list.headOption
  }
  def update(id: Int, userannotation: UserAnnotationDTO) = database withSession { implicit session ⇒
    val annotation_rangesUpdate: UserAnnotationDTO = userannotation.copy(Option(id))
    userannotations.filter(_.id === id).update(annotation_rangesUpdate)
  } 


  def delete(id: Int) = database withSession { implicit session ⇒
    userannotations.filter(_.id === id).delete
  }
  def count: Int = database withSession { implicit session ⇒
    Query(userannotations.length).first
  }
  def getAll = database withSession {
    implicit session ⇒
      val q3 = for { s ← userannotations } yield s 
      q3.list.sortBy(_.id)
  }
  def ddl_create = {
    database withSession {
      implicit session =>
      userannotations.ddl.create
    }
  }
  def ddl_drop = {
    database withSession {
      implicit session =>
        userannotations.ddl.drop
    }
  }  
    
    
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
  import scala.util.Try
  import DatabaseCred.database

  val annotation_ranges = TableQuery[AnnotationRanges]
    
  def pull_object(s: AnnotationRangeDTO) = database withSession {
    implicit session ⇒
      annotation_ranges returning annotation_ranges.map(_.id) += s
  }
  def get(k: Int) = database withSession {
    implicit session ⇒
      val q3 = for { s ← annotation_ranges if s.id === k } yield s 
      q3.list.headOption
  }
  def update(id: Int, annotation_range: AnnotationRangeDTO) = database withSession { implicit session ⇒
    val annotation_rangesUpdate: AnnotationRangeDTO = annotation_range.copy(Option(id))
    annotation_ranges.filter(_.id === id).update(annotation_rangesUpdate)
  } 


  def delete(id: Int) = database withSession { implicit session ⇒
    annotation_ranges.filter(_.id === id).delete
  }
  def count: Int = database withSession { implicit session ⇒
    Query(annotation_ranges.length).first
  }
  def getAll = database withSession {
    implicit session ⇒
      val q3 = for { s ← annotation_ranges } yield s 
      q3.list.sortBy(_.id)
  }
  def ddl_create = {
    database withSession {
      implicit session =>
      annotation_ranges.ddl.create
    }
  }
  def ddl_drop = {
    database withSession {
      implicit session =>
        annotation_ranges.ddl.drop

    }
  }  
    
    
}
