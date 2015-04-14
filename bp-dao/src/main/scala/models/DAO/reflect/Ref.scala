package models.DAO.reflect

import main.scala.bprocesses.{BProcess, BPLoggerResult}
import main.scala.simple_parts.process.ProcElems
import models.DAO.driver.MyPostgresDriver.simple._
import com.github.nscala_time.time.Imports._
//import com.github.tminglei.slickpg.date.PgDateJdbcTypes
import scala.slick.model.ForeignKeyAction

import models.DAO.ProcElemDAO._
import models.DAO.BPDAO._
import models.DAO.BPStationDAO._
import models.DAO.conversion.DatabaseCred
import main.scala.bprocesses.{BPState, BPSessionState} 
import models.DAO._
import main.scala.simple_parts.process.Units._
import main.scala.bprocesses.refs.UnitRefs._  
import com.typesafe.scalalogging._

class Refs(tag: Tag) extends Table[Ref](tag, "refs") {
  def id = column[Int]("id", O.PrimaryKey, O.AutoInc) 
  def title = column[String]("title", O.PrimaryKey)
  def host = column[String]("host")
  def desc = column[Option[String]]("desc")

  def created_at = column[Option[org.joda.time.DateTime]]("created_at")
  def updated_at = column[Option[org.joda.time.DateTime]]("updated_at")  

  def * = (id.?, title, host, desc,
           created_at, updated_at) <> (Ref.tupled, Ref.unapply)

}

case class Ref(id: Option[Int], title: String, host: String = "", desc: Option[String] = None,
created_at:Option[org.joda.time.DateTime] = None, updated_at:Option[org.joda.time.DateTime] = None)


  case class RetrivedRef(
    proc_elems: List[UnitElement], 
    spaces: List[UnitSpace], // change to DTO
    space_elems: List[UnitSpaceElement], // change to DTO
    states: List[BPState],
    switches: List[UnitSwitcher],
    reactions: List[UnitReaction],
    reaction_state_outs: List[UnitReactionStateOut])

  case class RefResulted(proc_elems: List[Int], 
    space_elems: List[Int], 
    spaces:List[Int],
    states: List[Int], 
    switches: List[Int], 
    reactions: List[Int], 
    reaction_state_outs: List[Int])

  
object RefDAO {
  /**
   * Actions
   */
  import scala.util.Try

  import DatabaseCred.database
  import models.DAO.conversion.Implicits._

  //val logger = Logger(LoggerFactory.getLogger("name"))

  val refs = TableQuery[Refs]

  def pull_object(s: Ref) = database withSession {
    implicit session ⇒
      refs returning refs.map(_.id) += s
  }

  def get(k: Int):Option[Ref] = database withSession {
    implicit session ⇒
      val q3 = for { s ← refs if s.id === k } yield s
      q3.list.headOption 
  }
  def getByTitle(title: String):List[Ref] = database withSession {
    implicit session ⇒
      val q3 = for { s ← refs if s.title === title } yield s
      q3.list
  }
  def deleteByTitle(title: String) = database withSession {
    implicit session =>
    getByTitle(title).map(el => el.id.get).foreach { id =>
      delete(id)
    }
  }

private def makeTopolog(process: Int, front_elem_id: Option[Int], 
  space_elem_id: Option[Int]):Int = {
    ElemTopologDAO.pull_object(ElemTopology(None, 
  process, 
  front_elem_id, 
  space_elem_id, 
  "", 
  None))
}

  def retrive(k: Int, process: Int, business: Int, in: String = "front", title: String, desc:String = "", space_id: Option[Int] = None):Option[RefResulted] = database withSession {
    //logger.debug(k, process, business, title, desc, space_id)
    implicit session ⇒
      in match {
        case "front" => in_front(k, process, business, title,desc)
        case _ => in_nested(k, process, business, space_id.get, title,desc)
      }
  }
  def in_front(k: Int, process: Int, business: Int, title: String, desc:String = ""):Option[RefResulted] = {
 get(k) match {
     case Some(ref) => {
       val last_order = ProcElemDAO.lastOrderOfBP(process)
       val last_index = BPSpaceDAO.lastIndexOfSpace(process)

       val elements:List[UnitElement] = ProcElemReflectionDAO.retrive(k, business, process)
       val ref_ids = elements.map(_.id.get)
       val all_orders = Range(last_order, last_order + elements.length).toList
       val first_order = all_orders.head
       val idToRefId:Map[Int,Int] = elements.zip(all_orders).map { 
        el => 
          val el2 = if(el._2 == first_order) ProcElemDCO.conv(el._1.copy(title = title, desc = desc, order = el._2)) else ProcElemDCO.conv(el._1.copy(order = el._2)) 
          el._1.id.get -> ProcElemDAO.pull_object(el2)

       }.toMap


       // Space fetching
       val spaces:List[UnitSpaceRef] = SpaceReflectionDAO.findByElemRefs(ref_ids)
       val conv_spaces:Map[Int,Int] = spaces.map { space => 
          val sp = SpaceDCO.conv(space, business, process, index = last_index, space.brick_front.get)
          space.id.get -> BPSpaceDAO.pull_object(sp)
       }.toMap

       val sp_elems_refs:List[UnitSpaceElementRef] = SpaceElementReflectionDAO.findByElemRefs(conv_spaces.keys.toList)
       val conv_sp_elems:Map[Int, Int] =  sp_elems_refs.map { spelem =>
          val spel = SpaceElemDCO.conv2(spelem, business, process, space_own = None, space_owned = conv_spaces(spelem.ref_space_owned))
          spelem.id.get -> SpaceElemDAO.pull_object(spel)
       }.toMap
       /**
        * TODO:
        * Deep nesting       
        **/
 

        // State, switcher, reaction
        val states = BPStateRefDAO.findByRef(k)
        val switcher = SwitcherRefDAO.findByRef(k)
        val reactions:List[UnitReactionRef] = ReactionRefDAO.findByRef(k)
        val reaction_state_out = ReactionStateOutRefDAO.findByReactionRefs(reactions.map(_.id.get))

        val stateIdToRefId:Map[Int, Int] = ((idToRefId.map { m =>
                states.filter(pred => pred.front_elem_id == Some(m._1)).map { el => 
                 el.id.get -> BPStateDAO.pull_object(el.reflect(process, front_elem_id = Some(m._2), space_elem_id = None, space_id = None))
                }

        }) ++ (conv_spaces.map { m =>
                states.filter(pred => pred.space_id == Some(m._1)).map { el => 
                 el.id.get -> BPStateDAO.pull_object(el.reflect(process, space_id = Some(m._2), space_elem_id = None, front_elem_id = None))
                }
        }) ++ (conv_sp_elems.map { m =>

            states.filter(pred => pred.space_elem_id == Some(m._1)).map { el => 
                 el.id.get -> BPStateDAO.pull_object(el.reflect(process, space_elem_id = Some(m._2), space_id = None, front_elem_id = None))
                }
        })).flatten.toMap 


        val switcherIdToRefId:Map[Int, Int] = stateIdToRefId.map( m =>
                switcher.filter(pred => pred.state_ref == m._1).map( sw =>
                  sw.id.get -> SwitcherDAO.pull_object(sw.reflect(process, m._2, session = None))
                )).flatten.toMap


       val topos = ReflectElemTopologDAO.findByRef(k)  
       val topoElem = idToRefId.map(idd => 
                          topos.find(t => t.front_elem_id == Some(idd._1)).get.id.get -> makeTopolog(process, front_elem_id = Some(idd._2), space_elem_id=None)
                          )
       val topoSpaceElem = conv_sp_elems.map(idd => 
                          topos.find(t => t.space_elem_id == Some(idd._1)).get.id.get -> makeTopolog(process, space_elem_id = Some(idd._2), front_elem_id=None)
                          )
       // TOPOLOGY MAKING  
        val reactionsIdToRefId:Map[Int, Int] = (topoElem.map ( m =>
                reactions.filter(pred => pred.element == m._1).map ( react => 
             react.id.get -> ReactionDAO.pull_object(react.reflect(process, m._2, from_state = None)) // TODO: Make that work from state
            )
            ).flatten ++
            topoSpaceElem.map ( m =>
                reactions.filter(pred => pred.element == m._1).map ( react => 
             react.id.get -> ReactionDAO.pull_object(react.reflect(process, m._2, from_state = None)) // TODO: Make that work from state
            )
           ).flatten
         ).toMap

        val reaction_state_outIdToRefId:Map[Int, Int] = reactionsIdToRefId.map { m =>
                reaction_state_out.filter(pred => pred.state_ref == m._1).map { out => 
        out.id.get -> ReactionStateOutDAO.pull_object(out.reflect(state_ref = stateIdToRefId.find(s => s._1 == out.state_ref).get._2, reaction = m._2))
            }
         }.flatten.toMap
             

        Some(RefResulted(
proc_elems = idToRefId.values.toList,
space_elems = conv_sp_elems.values.toList,
spaces = conv_spaces.values.toList,
states = stateIdToRefId.values.toList,
switches = switcherIdToRefId.values.toList,
reactions = reactionsIdToRefId.values.toList,
reaction_state_outs = reaction_state_outIdToRefId.values.toList
          )) 
     } 
      
      case _ => None
    }
  }
  def in_nested(k: Int, process: Int, business: Int, space_id: Int, title: String, desc:String = ""):Option[RefResulted] = {
    get(k) match {
      case Some(ref) => {
       val last_order = SpaceElemDAO.lastOrderOfBP(process, space_id)
       val last_index = BPSpaceDAO.lastIndexOfSpace(process)
       //val elements = SpaceElementReflectionDAO.retrive(k, business, process, space_own = None, ref_space_owned = space_id)
       val elements:List[UnitElement] = ProcElemReflectionDAO.retrive(k, business, process)
       val ref_ids = elements.map(_.id.get)
       val all_orders = Range(last_order, last_order + elements.length).toList
       val first_order = all_orders.head

       val idToRefId:Map[Int,Int] = elements.zip(all_orders).map { 
        el => 
          val el2 = if(el._2 == first_order) ProcElemDCO.conv_nested(el._1.copy(title = title, desc = desc, order = el._2), space_own = None, space_owned = space_id) else ProcElemDCO.conv_nested(el._1.copy(order = el._2), space_own = None, space_owned = space_id) 
          el._1.id.get -> SpaceElemDAO.pull_object(el2)
          
       }.toMap

                
       val spaces:List[UnitSpaceRef] = SpaceReflectionDAO.findByElemRefs(ref_ids)
       val conv_spaces:Map[Int,Int] = spaces.map { space => 
          val sp = SpaceDCO.conv(space, business, process, index = last_index, space.brick_front.get)
          space.id.get -> BPSpaceDAO.pull_object(sp)
       }.toMap

       val sp_elems_refs:List[UnitSpaceElementRef] = SpaceElementReflectionDAO.findByElemRefs(conv_spaces.keys.toList)
       val conv_sp_elems:Map[Int, Int] =  sp_elems_refs.map { spelem =>
          val spel = SpaceElemDCO.conv2(spelem, business, process, space_own = None, space_owned = conv_spaces(spelem.ref_space_owned))
          spelem.id.get -> SpaceElemDAO.pull_object(spel)
       }.toMap



        // State, switcher, reaction
        val states = BPStateRefDAO.findByRef(k)
        val switcher = SwitcherRefDAO.findByRef(k)
        val reactions:List[UnitReactionRef] = ReactionRefDAO.findByRef(k)
        val reaction_state_out = ReactionStateOutRefDAO.findByReactionRefs(reactions.map(_.id.get))

        val stateIdToRefId:Map[Int, Int] = ((idToRefId.map { m =>
                states.filter(pred => pred.front_elem_id == Some(m._1)).map { el => 
                 el.id.get -> BPStateDAO.pull_object(el.reflect(process, front_elem_id = Some(m._2), space_elem_id = None, space_id = None))
                }

        }) ++ (conv_spaces.map { m =>
                states.filter(pred => pred.space_id == Some(m._1)).map { el => 
                 el.id.get -> BPStateDAO.pull_object(el.reflect(process, space_id = Some(m._2), space_elem_id = None, front_elem_id = None))
                }
        }) ++ (conv_sp_elems.map { m =>

            states.filter(pred => pred.space_elem_id == Some(m._1)).map { el => 
                 el.id.get -> BPStateDAO.pull_object(el.reflect(process, space_elem_id = Some(m._2), space_id = None, front_elem_id = None))
                }
        })).flatten.toMap

        val switcherIdToRefId:Map[Int, Int] = stateIdToRefId.map(m =>
          switcher.filter(pred => pred.state_ref == m._1).map(sw =>
          sw.id.get -> SwitcherDAO.pull_object(sw.reflect(process, m._2, session = None)))).flatten.toMap 

       val topos = ReflectElemTopologDAO.findByRef(k)  
       val topoElem = idToRefId.map(idd =>
                          topos.find(t => t.front_elem_id == Some(idd._1)).get.id.get -> makeTopolog(process, space_elem_id = Some(idd._2), front_elem_id=None))
       val topoSpaceElem = conv_sp_elems.map(idd =>
                          topos.find(t => t.space_elem_id == Some(idd._1)).get.id.get -> makeTopolog(process, space_elem_id = Some(idd._2), front_elem_id=None))
       // TOPOLOGY MAKING  
        val reactionsIdToRefId:Map[Int, Int] = (topoElem.map (m =>
                reactions.filter(pred => pred.element == m._1).map (react => 
             react.id.get -> ReactionDAO.pull_object(react.reflect(process, m._2, from_state = None)) // TODO: Make that work from state
            )
            ).flatten ++
            topoSpaceElem.map (m =>
                reactions.filter(pred => pred.element == m._1).map (react => 
              react.id.get -> ReactionDAO.pull_object(react.reflect(process, m._2, from_state = None)) // TODO: Make that work from state
              )
            ).flatten
         ).toMap 


        val reaction_state_outIdToRefId:Map[Int, Int] = reactionsIdToRefId.map { m =>
                reaction_state_out.filter(pred => pred.state_ref == m._1).map { out => 
        out.id.get -> ReactionStateOutDAO.pull_object(out.reflect(state_ref = stateIdToRefId.find(s => s._1 == out.state_ref).get._2, reaction = m._2))
            }
         }.flatten.toMap // PROBLEM

      
        Some(RefResulted(
proc_elems = idToRefId.values.toList,
space_elems = conv_sp_elems.values.toList,
spaces = conv_spaces.values.toList,
states = stateIdToRefId.values.toList,
switches = switcherIdToRefId.values.toList,
reactions = reactionsIdToRefId.values.toList,
reaction_state_outs = reaction_state_outIdToRefId.values.toList
          )) 

     }
  
      
      case _ => None
    }
  }

  def update(id: Int, ref: Ref) = database withSession { implicit session ⇒
    val refToUpdate: Ref = ref.copy(Option(id))
    refs.filter(_.id === id).update(refToUpdate)
  }
  def delete(id: Int) = database withSession { implicit session ⇒
    refs.filter(_.id === id).delete
  }
  def count: Int = database withSession { implicit session ⇒
    Query(refs.length).first
  }

  def ddl_create = {
    database withSession {
      implicit session =>
      refs.ddl.create
    }
  }
  def ddl_drop = {
    database withSession {
      implicit session =>
       refs.ddl.drop
    }
  }

  def getAll = database withSession {
    implicit session ⇒
      val q3 = for { s ← refs } yield s
      q3.list.sortBy(_.id)
  }
}