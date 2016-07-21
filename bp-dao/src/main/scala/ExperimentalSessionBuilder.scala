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
import main.scala.simple_parts.process._
import us.ority.min.actions._
import scala.concurrent.ExecutionContext.Implicits.global
/******************************************************************************

	Convert launched object to original and original to launched

*******************************************************************************/


object ExperimentalSessionBuilder {
	// session elements
	// session spaces
	// session space elements
	// session elements topology
	// session states to that
	// session reactions
	// session reactions outs





	// session elements
	def fromOriginEl(el: UndefElement, session: Int, burnMap: scala.collection.mutable.Map[Int, Int]):SessionUndefElement = {
      val obj = SessionUndefElement(
				      					None,
                        el.title,
                        el.desc,
                        el.business,
                        el.bprocess,
                        session,
                        el.b_type,
                        el.type_title,
                        None,//el.space_own, // spaceMap.get(el.space_own.getOrElse(0)),
                        el.order,
                        el.created_at,
                        el.updated_at

      )
	  val copied = obj.copy(id = Some(SessionProcElementDAO.pull_object(obj)))
	  ExperimentalAfterBurning.burnElemSpace(obj, el.space_own, burnMap)
	  copied
    }
	// session spaces
	def fromOriginSp(p: BPSpaceDTO, session: Int,
					 elemMap: scala.collection.mutable.Map[Int, Int] = scala.collection.mutable.Map().empty,
					 spaceElsMap: scala.collection.mutable.Map[Int, Int] = scala.collection.mutable.Map().empty):SessionSpaceDTO = {
      val obj = SessionSpaceDTO(
										  None,
                      p.bprocess,
                      session,
                      p.index,
                      p.container,
                      p.subbrick,
                      elemMap.get(p.brick_front.getOrElse(0)),
                      spaceElsMap.get(p.brick_nested.getOrElse(0)),
                      p.nestingLevel,
                      p.created_at,
                      p.updated_at
      	)
	  obj.copy(id = Some(SessionSpaceDAO.pull_object(obj)))
    }
	// session space elements
	def fromOriginSpElem(p: SpaceElementDTO, session: Int,
				spaceMap: scala.collection.mutable.Map[Int, Int]):SessionSpaceElementDTO = {
      val obj = SessionSpaceElementDTO(
						None,
                        p.title,
                        p.desc,
                        p.business,
                        p.bprocess,
                        session,
                        p.b_type,
                        p.type_title,
                        spaceMap.get(p.space_own.getOrElse(0)),
                        spaceMap.get(p.space_owned).getOrElse(0),
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
						None,
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
						None,
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
			None,
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
					None,
					initialState.get(p.state_ref).getOrElse(-1),
					ReactionsMap.get(p.reaction).getOrElse(-1),
					p.on,
					p.on_rate,
					p.is_input,
					p.created_at,
					p.updated_at
      	)
	  obj.copy(id = Some(SessionReactionStateOutDAO.pull_object(obj)))
    }









		def fromOriginMiddlewares(p: Middleware, session_id: Int, reactionsMap:scala.collection.mutable.Map[Int, Int]):LaunchMiddleware = {
			val obj = LaunchMiddleware(
								None,
								session_id,
								p.title,
								p.ident,
		            p.ifaceIdent,
		            reactionsMap.get(p.reaction).getOrElse(-1)
			)
			obj.copy(id = Some( LaunchMiddlewaresDAOF.await(LaunchMiddlewaresDAOF.pull(obj))  ))
		}

		def fromOriginStrategies(p: Strategy, session_id: Int, middlewaresMap:scala.collection.mutable.Map[Long, Long]):LaunchStrategy = {
			val obj = LaunchStrategy(
								None,
								session_id,
								p.ident,
								middlewaresMap.get(p.middleware).getOrElse(-1),
								p.isNullStrategy
			)
			obj.copy(id = Some( LaunchStrategiesDAOF.await(LaunchStrategiesDAOF.pull(obj))  ))
		}

		def fromOriginStBases(p: StrategyBaseUnit, strategiesMap:scala.collection.mutable.Map[Long, Long]):LaunchStrategyBaseUnit = {
			val obj = LaunchStrategyBaseUnit(
								None,
								strategiesMap.get(p.strategy).getOrElse(-1),
		            p.key,
		            p.baseType,
		            p.valueType,
		            p.valueContent,
		            p.validationScheme,
		            p.validationPattern
			)
			obj.copy(id = Some( LaunchStrategyBasesDAOF.await(LaunchStrategyBasesDAOF.pull(obj))  ))
		}

		def fromOriginStInputs(p: StrategyInputUnit, strategiesMap:scala.collection.mutable.Map[Long, Long]):LaunchStrategyInputUnit = {
			val obj = LaunchStrategyInputUnit(
								None,
								strategiesMap.get(p.strategy).getOrElse(-1),
		            p.op,
		            p.title,
		            p.desc,
		            p.ident,
		            p.targetType
			)
			obj.copy(id = Some( LaunchStrategyInputsDAOF.await(LaunchStrategyInputsDAOF.pull(obj))  ))
		}

		def fromOriginStOuts(p: StrategyOutputUnit, strategiesMap:scala.collection.mutable.Map[Long, Long]):LaunchStrategyOutputUnit = {
			val obj = LaunchStrategyOutputUnit(
								None,
								strategiesMap.get(p.strategy).getOrElse(-1),
		            p.op,
		            p.title,
		            p.desc,
		            p.ident,
		            p.targetType
			)
			obj.copy(id = Some( LaunchStrategyOutputsDAOF.await(LaunchStrategyOutputsDAOF.pull(obj))  ))
		}



		def fromSessionMiddlewares(el: LaunchMiddleware):Middleware = {
         Middleware(
					 el.id,
					 el.title,
					 el.ident,
					 el.ifaceIdent,
					 el.reaction
				 )
		}
		def fromSessionStrategies(el: LaunchStrategy):Strategy = {
         Strategy(
					 el.id,
					 el.ident,
					 el.middleware,
					 el.isNullStrategy
				 )
		}
		def fromSessionStBases(el: LaunchStrategyBaseUnit):StrategyBaseUnit = {
         StrategyBaseUnit(
					 el.id,
					 el.strategy,
					 el.key,
					 el.baseType,
					 el.valueType,
					 el.valueContent,
					 el.validationScheme,
					 el.validationPattern
				 )
		}
		def fromSessionStInputs(el: LaunchStrategyInputUnit):StrategyInputUnit = {
         StrategyInputUnit(
					 el.id,
					 el.strategy,
					 el.op,
					 el.title,
					 el.desc,
					 el.ident,
					 el.targetType
				 )
		}
		def fromSessionStOuts(el: LaunchStrategyOutputUnit):StrategyOutputUnit = {
         StrategyOutputUnit(
					 el.id,
					 el.strategy,
					 el.op,
					 el.title,
					 el.desc,
					 el.ident,
					 el.targetType
				 )
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
				p.is_input,
				p.created_at,
				p.updated_at
      	)
    }

}
