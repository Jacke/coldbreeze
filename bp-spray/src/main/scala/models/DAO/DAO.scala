package models.DAO

/**
 * Case classes for casting
 */

case class MessagesList(title: String, container: List[Message])
case class Message(process: String, test: List[Int]) {
  // val typeof = getClass.toString
}
case class BProcess(var id: Option[Int], title: String, business: Int)
case class BProcessesDTO(suppliers: List[BProcess])

case class UndefElement(id: Option[Int],
                        title:String,
                        desc:String,
                        business:Int,
                        bprocess:Int,
                        b_type:String,
                        type_title:String,
                        space:Option[Int],
                        space_role:Option[String],
                        order:Int)

/**
 * DAO
 */

object FirstExample {
  import scala.slick.driver.PostgresDriver.simple._
  val database = Database.forURL("jdbc:postgresql://localhost/minority", driver = "org.postgresql.Driver", user = "postgres", password = "12344321")

/**
 * BProcess DAO
 */
class BProcesses(tag: Tag) extends Table[(Option[Int], String, Int)](tag, "bprocesses") {
  def id = column[Int]("id", O.PrimaryKey, O.AutoInc) // This is the primary key column
  def title = column[String]("title")
  def business = column[Int]("business_id")
  // Every table needs a * projection with the same type as the table's type parameter
  def * = (id.?, title, business) //<> (Supplier.tupled, Supplier.unapply)

}
val bprocesses = TableQuery[BProcesses]



class ProcElements(tag: Tag) extends Table[(Option[Int], String, String, Int, Int, String, String, Option[Int], Option[String], Int)](tag, "proc_elements") {
  def id = column[Int]("id", O.PrimaryKey, O.AutoInc) // This is the primary key column
  def title = column[String]("title")
  def desc  = column[String]("desc")
  def business = column[Int]("business_id")
  def bprocess = column[Int]("bprocess_id")
  def b_type = column[String]("b_type")
  def type_title = column[String]("type_title")
  def order = column[Int]("order")
  def space = column[Option[Int]]("space_id")
  def space_role = column[Option[String]]("space_role")
  //values: CompositeValues,

  def * = (id.?, title, desc, business, bprocess, b_type, type_title, space, space_role, order)// <> (UndefElement.tupled, UndefElement.unapply)

}
val proc_elements = TableQuery[ProcElements]


/**
 * Actions
 */
import scala.util.Try

def pull_object(s: BProcess) = Try(database withSession {
  implicit session ⇒
    bprocesses returning bprocesses.map(_.id) += BProcess.unapply(s).get
})

def pull(id: Option[Int] = None, title: String, business: Int) = Try(database withSession {
  implicit session ⇒

    bprocesses += (id, title, business)
}).isSuccess

/**
 * Find a specific entity by id.
 */
//def findById(id: Int):Boolean = {
//  database withSession { implicit session =>
//  val byId = proc_elements.findBy(_.id)
//  byId(id).list.headOption
//  }
//}

/**
 * Delete a specific entity by id. If successfully completed return true, else false
 */
//def delete(id: Int):Boolean =
//  database withSession { implicit session =>
//  findById(id) match {
//    case Some(entity) => { proc_elements.where(_.id === id).delete; true }
//    case None => false
//  }
//  }

/**
 * Update a specific entity by id. If successfully completed return true, else false
 */
//def update(id: Int, entity: (Option[Int], String, String, Int, Int, String, String, Int)):Boolean = {
//  database withSession { implicit session =>
//    findById(id) match {
//    case Some(e) => { proc_elements.where(_.id === id).update(entity); true }
//    case None => false
//    }
//  }
//}

def get(k: Int) = database withSession {
  implicit session ⇒
    val q3 = for { s ← bprocesses if s.id === k } yield s <> (BProcess.tupled, BProcess.unapply _)
    println(q3.selectStatement)
    println(q3.list)
    q3.list //.map(Supplier.tupled(_))
}
println(get(222))
def getAll = database withSession {
  implicit session ⇒
    val q3 = for { s ← bprocesses } yield s <> (BProcess.tupled, BProcess.unapply _)
    q3.list.sortBy(_.id)
  //suppliers foreach {
  //  case (id, title, address, city, state, zip) ⇒
  //    Supplier(id, title, address, city, state, zip)
  //}
}

}