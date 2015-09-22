package service

import models.DAO._
import main.scala.utils._
import main.scala.bprocesses._
import main.scala.resources.scopes._
import com.github.nscala_time.time.Imports._


import main.scala.bprocesses._
import main.scala.simple_parts.process.{CompositeValues, Brick, ProcElems, ContainerBrick}
import main.scala.simple_parts.process.control._
import main.scala.simple_parts.process.data._
import main.scala.utils._
import main.scala.resources.scopes._
import builders._

import main.scala.bprocesses.links._
import main.scala.utils.Space
import main.scala.utils.{InputParamProc, ReactionActivator}
import models.DAO.conversion.Implicits.fetch_cv
import models.DAO.sessions._
import main.scala.bprocesses._
import main.scala.simple_parts.process.Units._

object ExperimentalSessionBuilder {
	// session elements
	// session spaces
	// session space elements
	// session elements topology
	// session states to that
	// session reactions
	// session reactions outs	





	// session elements
	def fromOriginEl(el: UndefElement, session: Int):SessionUndefElement = {
      val obj = SessionUndefElement(
      					el.id,
                        el.title,
                        el.desc,
                        el.business,
                        el.bprocess,
                        session,
                        el.b_type,
                        el.type_title,
                        el.space_own,
                        el.order,
                        el.created_at,
                        el.updated_at

      )
	  obj.copy(id = Some(SessionProcElementDAO.pull_object(obj)))
    }
	// session spaces
	def fromOriginSp(p: BPSpaceDTO, session: Int):SessionSpaceDTO = {
      val obj = SessionSpaceDTO(
					  p.id, 
                      p.bprocess,    
                      session,   
                      p.index,   
                      p.container,   
                      p.subbrick,   
                      p.brick_front,
                      p.brick_nested, 
                      p.nestingLevel,
                      p.created_at,
                      p.updated_at      	
      	)
	  obj.copy(id = Some(SessionSpaceDAO.pull_object(obj)))
    }
	// session space elements
	def fromOriginSpElem(p: SpaceElementDTO, session: Int):SessionSpaceElementDTO = {
      val obj = SessionSpaceElementDTO(
						p.id,
                        p.title,
                        p.desc,
                        p.business,
                        p.bprocess,
                        session,
                        p.b_type,
                        p.type_title,
                        p.space_own,
                        p.space_owned,
                        p.space_role,
                        p.order,
                        p.created_at,
                        p.updated_at  	
      	)
	  obj.copy(id = Some(SessionSpaceElemDAO.pull_object(obj)))
    }
	// session elements topology
	def fromOriginTopo(p: ElemTopology, session: Int,
		elemMap: scala.collection.mutable.Map[Int, Int],
		spaceMap: scala.collection.mutable.Map[Int, Int],
		spaceElsMap: scala.collection.mutable.Map[Int, Int]
	 ): SessionElemTopology = {
      val obj = SessionElemTopology(
						p.id,
						p.process,
						session,
						elemMap.get(p.front_elem_id.getOrElse(-1)),
						spaceElsMap.get(p.space_elem_id.getOrElse(-1)),
						p.hash,
						p.created_at,
						p.updated_at,
						spaceMap.get(p.space_id.getOrElse(-1)) 		
      	)
	  obj.copy(id = Some(SessionElemTopologDAO.pull_object(obj)))
    }
	// session states to that
	//def fromOriginSp(p: BPSpaces) {
    //  val obj = BPSessionState()
	//  obj.copy(id = BPSessionStateDAO.pull_object(obj))
    //}
    def fromOriginState(p: BPState, session:Int,
    	elementMap: scala.collection.mutable.Map[Int, Int],
		spaceMap: scala.collection.mutable.Map[Int, Int],
		spaceElementMap: scala.collection.mutable.Map[Int, Int]):SessionInitialState = {
    	      val obj = SessionInitialState(
						None, 
					  p.process,
					  session,
					  p.title, 
					  p.neutral,
					  p.process_state,
					  p.on,
					  p.on_rate,
					  elementMap.get(p.front_elem_id.getOrElse(-1)),
					  spaceElementMap.get(p.space_elem_id.getOrElse(-1)),
					  spaceMap.get(p.space_id.getOrElse(-1)),
					  p.created_at, 
					  p.updated_at, 
					  p.lang,
					  p.middle,
					  p.middleable,
					  p.oposite,
					  p.opositable 		
      	)
	  obj.copy(id = Some(SessionInitialStateDAO.pull_object(obj)))
    }
    // switchers
	def fromOriginSwitcher(p: UnitSwitcher, session: Int, initialState: scala.collection.mutable.Map[Int, Int]): SessionUnitSwitcher = {
      val obj = SessionUnitSwitcher(
      							p.id,
						p.bprocess,
						session,
						p.switch_type, 
						p.priority,                            
						initialState.get(p.state_ref).getOrElse(0),
						p.session_state_ref,                            
						p.fn,
						p.target,
						p.override_group,
						p.created_at,
						p.updated_at	
      	)
	  obj.copy(id = Some(SessionSwitcherDAO.pull_object(obj)))
    }
	// session reactions
	def fromOriginReaction(p: UnitReaction, session: Int, 
		elementMap: scala.collection.mutable.Map[Int, Int],
		initialState: scala.collection.mutable.Map[Int, Int]): SessionUnitReaction = {
      val obj = SessionUnitReaction(
			p.id,
			p.bprocess,
			session,
			p.autostart,
			elementMap.get(p.element).getOrElse(0),
			initialState.get(p.from_state.getOrElse(0)),
			p.title,              
			p.created_at,
			p.updated_at	
				  	
      	)
	  obj.copy(id = Some(SessionReactionDAO.pull_object(obj)))
    }
	// session reactions outs	
	def fromOriginReactionStateOut(p: UnitReactionStateOut, session: Int, 
		ReactionsMap:scala.collection.mutable.Map[Int,Int],
		initialState: scala.collection.mutable.Map[Int, Int]): SessionUnitReactionStateOut = {
      val obj = SessionUnitReactionStateOut(
					p.id,
					initialState.get(p.state_ref).getOrElse(-1),
					ReactionsMap.get(p.reaction).getOrElse(-1),
					p.on,
					p.on_rate,
					p.created_at,
					p.updated_at
      	)
	  obj.copy(id = Some(SessionReactionStateOutDAO.pull_object(obj)))
    }









    /***
     * To origin
     */
	// session elements
	def fromSessionEl(el: SessionUndefElement):UndefElement = {
      UndefElement(
						el.id,
                        el.title,
                        el.desc,
                        el.business,
                        el.bprocess,
                        el.b_type,
                        el.type_title,
                        el.space_own,
                        el.order,
                        el.created_at,
                        el.updated_at
      )
    }
	// session spaces
	def fromSessionSp(p: SessionSpaceDTO):BPSpaceDTO = {
      BPSpaceDTO(
      				p.id,
					p.bprocess,
					p.index,
					p.container,
					p.subbrick,
					p.brick_front,
					p.brick_nested,
					p.nestingLevel,
					p.created_at,
					p.updated_at 
      	)
    }
	// session space elements
	def fromSessionSpEl(p: SessionSpaceElementDTO):SpaceElementDTO = {
      SpaceElementDTO(
					p.id,
					p.title,
					p.desc,
					p.business,
					p.bprocess,
					p.b_type,
					p.type_title,
					p.space_own,
					p.space_owned,
					p.space_role,
					p.order,
					p.created_at,
					p.updated_at
     		
      	)
    }
	// session elements topology
	def fromSessionTopo(p: SessionElemTopology):ElemTopology = {
      ElemTopology(
					p.id,
					p.process,
					p.front_elem_id,
					p.space_elem_id,
					p.hash,
					p.created_at,
					p.updated_at,
					p.space_id
      	)
    }

    def fromInitialState(p: SessionInitialState):BPState = {
    	       BPState(  p.id, 
  p.process,
  p.title, 
  p.neutral,
  p.process_state,
  p.on,
  p.on_rate,
  p.front_elem_id,
  p.space_elem_id,
  p.space_id,
  p.created_at, 
  p.updated_at, 
  p.lang ,
  p.middle,
  p.middleable,
  p.oposite,
  p.opositable
  
      	)
    }    
	// session states to that
	//def fromOriginSp(p: BPSpaces) {
    //  val obj = BPSessionState()
	//  obj.copy(id = BPSessionStateDAO.pull_object(obj))
    //}
	def fromSessionSwitcher(p: SessionUnitSwitcher):UnitSwitcher = {
 		   UnitSwitcher(p.id,
						p.bprocess,
						p.switch_type, 
						p.priority,                            
						p.state_ref,
						p.session_state_ref,                            
						p.fn,
						p.target,
						p.override_group,
						p.created_at,
						p.updated_at	
      	)
    }    
	// session reactions
	def fromSessionReaction(p: SessionUnitReaction):UnitReaction = {
      UnitReaction(
				p.id,
				p.bprocess,
				p.autostart,
				p.element,
				p.from_state,
				p.title,
				p.created_at,
				p.updated_at
      	)
    }
	// session reactions outs	
	def fromSessionReactionStateOut(p: SessionUnitReactionStateOut):UnitReactionStateOut = {
      UnitReactionStateOut(
				p.id,
				p.state_ref,
				p.reaction,
				p.on,
				p.on_rate,
				p.created_at,
				p.updated_at     	
      	)
    }

}