package service
//import com.typesafe.scalalogging.slf4j.Logger
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
import main.scala.bprocesses._
import main.scala.simple_parts.process._
import models.DAO.sessions._
import scala.concurrent.ExecutionContext.Implicits.global
import scala.concurrent.duration.Duration
import scala.concurrent.{ExecutionContext, Awaitable, Await, Future}
import scala.util.Try
import com.typesafe.scalalogging.Logger
import org.slf4j.LoggerFactory
import us.ority.min.actions._
import us.ority.min.jobs._

object TempBuilder {
  def initiateWithElements(bpID: Int,
             run_proc: Boolean,
             bpDTO: BProcessDTO,
             lang: Option[String] = Some("en"),
             session_id: Option[Int],
             params: List[ReactionActivator] = List(),
             pipes: List[LaunchMapPipe => ExecutedLaunchCVPipes]=List(),
             minimal: Boolean = false ):Future[ProcessExecutionResult] = {

ElementRegistrator.apply
// caster
//val process_dto = BPDAO.get(bpID).get
val procElemsF = ProcElemDAOF.findByBPId(bpID)
val process = new BProcess(new Managment, id = bpDTO.id)
initiateWithElements2F(bpID, run_proc, process, bpDTO, procElemsF, lang, with_pulling = true, session_id_val = session_id,
          params = params, pipes = pipes, minimal = minimal)
}


def initiateWithElements2F(bpID: Int,
              run_proc: Boolean,
              processRunned: BProcess,
              bpDTO: BProcessDTO,
              procElementsF: Future[Seq[UndefElement]],
              lang: Option[String] = Some("en"),
              with_pulling: Boolean = false,
              session_id_val: Option[Int],
              params: List[ReactionActivator] = List(),
              pipes: List[LaunchMapPipe => ExecutedLaunchCVPipes]=List(),
              minimal: Boolean = false ):Future[ProcessExecutionResult] =
{
    val test_spaceF = BPSpaceDAOF.findByBPId(bpID)
    val space_elemsF = SpaceElemDAOF.findByBPId(bpID)
    procElementsF.flatMap { procElementsObj =>
    test_spaceF.flatMap { test_spaceObj =>
    space_elemsF.flatMap { space_elemsObj =>

    val procElements = procElementsObj.toList
    val test_space = test_spaceObj.toList
    val space_elems = space_elemsObj.toList

    val process = processRunned


  //process_dto
  // val session_id = 1 // REMOVE THIS!!

    var session_id: Int = 0
    var runFrom: Boolean = false // RUNFROM BOOLEAN CONSTANT
    var sessionEls:List[SessionUndefElement] = List()
    var sessionSpaces: List[SessionSpaceDTO] = List()
    var sessionSpaceEls: List[SessionSpaceElementDTO] = List()

    // Maps Origin to Session
    var elemMap:scala.collection.mutable.Map[Int, Int]    = scala.collection.mutable.Map().empty
    var spaceMap:scala.collection.mutable.Map[Int, Int]   = scala.collection.mutable.Map().empty
    var spaceElsMap:scala.collection.mutable.Map[Int,Int] = scala.collection.mutable.Map().empty

    var burnElemMap:scala.collection.mutable.Map[Int,Int]    = scala.collection.mutable.Map().empty
    var burnSpaceMap:scala.collection.mutable.Map[Int,Int]   = scala.collection.mutable.Map().empty
    var burnSpaceElMap:scala.collection.mutable.Map[Int,Int] = scala.collection.mutable.Map().empty

    // Generate sessions
    session_id_val match {
      case Some(session_val) => { // Launch from existed session
        runFrom = true
        session_id = session_val
        //val sessionElsF:Future[Seq[SessionUndefElement]]         = SessionProcElementDAOF.findBySession(session_id)
        //val sessionSpacesF:Future[Seq[SessionSpaceDTO]]          = SessionSpaceDAOF.findBySession(session_id)
        //val sessionSpaceElsF:Future[Seq[SessionSpaceElementDTO]] = SessionSpaceElemDAOF.findBySession(session_id)
        //sessionElsF     .map { sessionElsObj =>
        //sessionSpacesF  .map { sessionSpacesObj =>
        //sessionSpaceElsF.map { sessionSpaceElsObj =>
          sessionEls      = SessionProcElementDAO.findBySession(session_id)//sessionElsObj.toList
          sessionSpaces   = SessionSpaceDAO.findBySession(session_id)//sessionSpacesObj.toList
          sessionSpaceEls = SessionSpaceElemDAO.findBySession(session_id)//sessionSpaceElsObj.toList
        //}
        //}
        //}
      }
      case _ => { // launch from empty session
        session_id = models.DAO.sessions.SessionProcElementDAOF.await(
          saveSession(processRunned, bpDTO, lang) )
        // FRONT ELEM NOT FOR BRICKS
        sessionEls = procElements.map { el =>
            val obj = ExperimentalSessionBuilder.fromOriginEl(el, session_id, burnElemMap)
            elemMap += el.id.get -> obj.id.get
            obj
        }.toList
        sessionSpaces = test_space.map { sp =>//.filter(sp => sp.brick_nested.isDefined).map ( sp =>
          val obj = ExperimentalSessionBuilder.fromOriginSp(sp, session_id, elemMap, spaceElsMap)
          spaceMap += sp.id.get -> obj.id.get
          obj
        }
        ExperimentalAfterBurning.makeBurn(spaceMap, burnElemMap)
        sessionSpaceEls = space_elems.map { spel =>//.filter(n => n.space_own.isDefined).map ( spel =>
          val obj = ExperimentalSessionBuilder.fromOriginSpElem(spel, session_id, spaceMap)
          spaceElsMap += spel.id.get -> obj.id.get
          obj
        }
      }
    }

    // Update session for process
    processRunned.session_id = session_id
    val station_id = saveOrUpdateState(processRunned, bpDTO, session_id, lang, run_proc)
    // session state linked with session elements
    //val session_states_ids = saveSessionStates(processRunned, bpDTO, session_id)


    saveLogsInit(processRunned, bpDTO, station_id, BPSpaceDAOF.findByBPIdB(bpID))
    saveStationLog(bpID, station_id, processRunned)


  /****** Physical element casting  */
  val target2 = sessionEls.map(el => ExperimentalSessionBuilder.fromSessionEl(el))
  val arrays = target2.map(c => c.cast(process)).flatten.toArray
  process.push {
    arrays.sortWith(_.order < _.order)
  }
  toApplogger("elements " + process.allElements.length + " " + procElements.length)

  /* Presence validation  */
  val front_bricks = process.findFrontBrick()
  val test_space2 = sessionSpaces.map(sp => ExperimentalSessionBuilder.fromSessionSp(sp))
  val space_elems2 = sessionSpaceEls.map(el => ExperimentalSessionBuilder.fromSessionSpEl(el))
  if (front_bricks.length > 0 && test_space2.length > 0) {
    makeFrontSpaces(process, test_space2, front_bricks, space_elems2)
    if (test_space2.reduceLeft(getLatestNest).nestingLevel > 1) {
      makeNestedSpaces(process, test_space2, process.findNestedBricks(), space_elems2)
    }
  }

/*************************************************************************************************************************/
/*************************************************************************************************************************/
/*************************************************************************************************************************/
/*************************************************************************************************************************/
/*************************************************************************************************************************/
    var states:List[BPState] = List()
    if (!minimal) {
    states = BPStateDAOF.findByBP(bpID)
    }
    /**
     * Session state
     * Retriving
     * with_pulling: Boolean - use db for save session and retrive ids
     **/
    var session_states:   List[BPSessionState]              = List()
    var initialStates:    List[SessionInitialState]         = List()
    var sessionTopologs:  List[SessionElemTopology]         = List()
    var sessionSwitchers: List[SessionUnitSwitcher]         = List()
    var sessionReactions: List[SessionUnitReaction]         = List()
    var sessionReactOuts: List[SessionUnitReactionStateOut] = List()

    var sessionMiddlewares:List[LaunchMiddleware] = List()
    var sessionStrategies:List[LaunchStrategy] = List()
    var sessionStBases:List[LaunchStrategyBaseUnit] = List()
    var sessionStInputs:List[LaunchStrategyInputUnit] = List()
    var sessionStOuts:List[LaunchStrategyOutputUnit] = List()

    // Maps Origin to Session
    var initialStateMap:scala.collection.mutable.Map[Int, Int]    = scala.collection.mutable.Map().empty
    var TopologsMap:scala.collection.mutable.Map[Int, Int]        = scala.collection.mutable.Map().empty
    var SwitchersMap:scala.collection.mutable.Map[Int, Int]       = scala.collection.mutable.Map().empty
    var ReactionsMap:scala.collection.mutable.Map[Int,Int]        = scala.collection.mutable.Map().empty
    var ReactOutsMap:scala.collection.mutable.Map[Int,Int]        = scala.collection.mutable.Map().empty

    var MiddlewaresMap:scala.collection.mutable.Map[Long,Long]        = scala.collection.mutable.Map().empty
    var StrategiesMap:scala.collection.mutable.Map[Long,Long]        = scala.collection.mutable.Map().empty
    var StBasesMap:scala.collection.mutable.Map[Long,Long]        = scala.collection.mutable.Map().empty
    var StInputsMap:scala.collection.mutable.Map[Long,Long]        = scala.collection.mutable.Map().empty
    var StOutsMap:scala.collection.mutable.Map[Long,Long]        = scala.collection.mutable.Map().empty

    if (runFrom && !minimal) { // Run from session
        initialStates    = SessionInitialStateDAO.findBySession(session_id)
        states           = initialStates.map(in => ExperimentalSessionBuilder.fromInitialState(in))
        sessionTopologs  = SessionElemTopologDAO.findBySession(session_id)
        sessionSwitchers = SessionSwitcherDAO.findBySession(session_id)
        sessionReactions = SessionReactionDAO.findBySession(session_id)
        sessionReactOuts = SessionReactionStateOutDAO.findByReactions(sessionReactions.map(react => react.id.get))

        sessionMiddlewares = LaunchMiddlewaresDAOF.await(LaunchMiddlewaresDAOF.findByReactions(sessionReactions.map(react => react.id.get)) ).toList
        sessionStrategies = LaunchStrategiesDAOF.await(LaunchStrategiesDAOF.findByMiddlewares(
          sessionMiddlewares.map(l => l.id.get).toList
        )).toList
        sessionStBases  = LaunchStrategyBasesDAOF.await( LaunchStrategyBasesDAOF.getByStrategies(sessionStrategies.map(l =>
          l.id.get
        ).toList) ).toList
        sessionStInputs = LaunchStrategyInputsDAOF.await(LaunchStrategyInputsDAOF.getByStrategies(sessionStrategies.map(l =>
          l.id.get
        ).toList) ).toList
        sessionStOuts   = LaunchStrategyOutputsDAOF.await(LaunchStrategyOutputsDAOF.getByStrategies(sessionStrategies.map(l =>
          l.id.get
        ).toList) ).toList

        val existedSesStates = BPSessionStateDAOF.await( BPSessionStateDAOF.findByBPAndSession(bpID, session_id) ).toList
        session_states = SessionStatesContainer(existedSesStates, existedSesStates.map(o => o.id.getOrElse(0))).session_states
    } else if( !minimal ) { // Run from plain


        states = states.map { state =>
            val ogState = ExperimentalSessionBuilder.fromOriginState(state, session_id, elemMap,spaceMap,spaceElsMap)
            initialStateMap += state.id.get -> ogState.id.get
            initialStates = ogState :: initialStates
            ExperimentalSessionBuilder.fromInitialState(ogState)
        }
        if (with_pulling) {
        //} else {
          session_states = Build.saveSessionStates(processRunned, bpDTO, session_id, pulling = true, elemMap, spaceMap, spaceElsMap, initialStateMap).session_states
          val existedSesStates = BPSessionStateDAOF.await( BPSessionStateDAOF.findByBPAndSession(bpID, session_id) ).toList
          session_states = SessionStatesContainer(existedSesStates, existedSesStates.map(o => o.id.getOrElse(0))).session_states
        }

        //session_states = session_states.map(ss => ss.copy(origin_state = initialStateMap.get(ss.origin_state.getOrElse(0))))
        // Element TOPOLOGY
        sessionTopologs = ElemTopologDAO.findByBP(bpID).map { el =>
            val obj = ExperimentalSessionBuilder.fromOriginTopo(el, session_id, elemMap,spaceMap,spaceElsMap)
            TopologsMap += el.id.get -> obj.id.get
            obj
        }
        sessionSwitchers = SwitcherDAO.findByBPId(bpID).map { el =>
          val obj: SessionUnitSwitcher = ExperimentalSessionBuilder.fromOriginSwitcher(el, session_id, initialStateMap)
          SwitchersMap += el.id.get -> obj.id.get
          obj
        }

        sessionReactions = ReactionDAO.findByBP(bpID).map { el =>
          val obj = ExperimentalSessionBuilder.fromOriginReaction(el, session_id, TopologsMap, initialStateMap)
          ReactionsMap += el.id.get -> obj.id.get
          obj
        }
        sessionReactOuts = ReactionStateOutDAO.findByReactions(ReactionsMap.keys.toList).map { el =>
          val obj = ExperimentalSessionBuilder.fromOriginReactionStateOut(el, session_id, ReactionsMap, initialStateMap)
          ReactOutsMap += el.id.get -> obj.id.get
          obj
        }
        sessionMiddlewares = MiddlewaresDAOF.await(MiddlewaresDAOF.findByReactions(ReactionsMap.keys.toList) ).map { el =>
          val obj = ExperimentalSessionBuilder.fromOriginMiddlewares(el, session_id, ReactionsMap)
          MiddlewaresMap += el.id.get -> obj.id.get
          obj
        }.toList
        sessionStrategies = StrategiesDAOF.await(StrategiesDAOF.findByMiddlewares(MiddlewaresMap.keys.toList)).map { el =>
          val obj = ExperimentalSessionBuilder.fromOriginStrategies(el, session_id, MiddlewaresMap)
          StrategiesMap += el.id.get -> obj.id.get
          obj
        }.toList
        sessionStBases = StrategyBasesDAOF.await( StrategyBasesDAOF.getByStrategies(StrategiesMap.keys.toList) ).map  { el =>
          val obj = ExperimentalSessionBuilder.fromOriginStBases(el, StrategiesMap)
          StBasesMap += el.id.get -> obj.id.get
          obj
        }.toList
        sessionStInputs = StrategyInputsDAOF.await( StrategyInputsDAOF.getByStrategies(StrategiesMap.keys.toList) ).map { el =>
          val obj = ExperimentalSessionBuilder.fromOriginStInputs(el, StrategiesMap)
          StInputsMap += el.id.get -> obj.id.get
          obj
        }.toList
        sessionStOuts = StrategyOutputsDAOF.await( StrategyOutputsDAOF.getByStrategies(StrategiesMap.keys.toList) ).map { el =>
          val obj = ExperimentalSessionBuilder.fromOriginStOuts(el, StrategiesMap)
          StOutsMap += el.id.get -> obj.id.get
          obj
        }.toList



        toApplogger("[RED Initial Run Cast result: RESET]")
        toApplogger(s"states ${states.length}")
        toApplogger(s"sessionTopologs ${sessionTopologs.length}")
        toApplogger(s"sessionSwitchers ${sessionSwitchers.length}")
        toApplogger(s"sessionReactions ${sessionReactions.length}")
        toApplogger(s"sessionReactOuts ${sessionReactOuts.length}")
        toApplogger("REACT OUT FROM PLAIN RUN")
        ReactionsMap.values.toList.foreach { l => toApplogger(l)}
        toApplogger(s"${ReactionsMap.values.toList.length}")
    }




  val topologs                                      = sessionTopologs.map(el =>
              ExperimentalSessionBuilder.fromSessionTopo(el))
  val switches:List[UnitSwitcher]                   = sessionSwitchers.map(el =>
              ExperimentalSessionBuilder.fromSessionSwitcher(el))
  val reactions:List[UnitReaction]                  = sessionReactions.map(el =>
              ExperimentalSessionBuilder.fromSessionReaction(el))
  val reaction_state_out:List[UnitReactionStateOut] = sessionReactOuts.map(el =>
              ExperimentalSessionBuilder.fromSessionReactionStateOut(el))
// Actions
val middlewares:List[Middleware] = sessionMiddlewares.map(el => ExperimentalSessionBuilder.fromSessionMiddlewares(el))
val strategies:List[Strategy] = sessionStrategies.map(el => ExperimentalSessionBuilder.fromSessionStrategies(el))
val strategiy_bases:List[StrategyBaseUnit] = sessionStBases.map(el => ExperimentalSessionBuilder.fromSessionStBases(el))
val strategiy_inputs:List[StrategyInputUnit] = sessionStInputs.map(el => ExperimentalSessionBuilder.fromSessionStInputs(el))
val strategiy_outputs:List[StrategyOutputUnit] = sessionStOuts.map(el =>   ExperimentalSessionBuilder.fromSessionStOuts(el))


//val topologs = ElemTopologDAO.findByBP(bpID)
//val switches:List[UnitSwitcher] = SwitcherDAO.findByBPId(bpID)
//val reactions:List[UnitReaction] = ReactionDAO.findByBP(bpID)
//val reaction_state_out:List[UnitReactionStateOut] = ReactionStateOutDAO.findByReactions(reactions.map(react => react.id.get))
    process.topology = topologs

    toApplogger("states found: " + states.length)
    toApplogger("session_states found: " + session_states.length)
    states.foreach { state =>
      // toApplogger(state.front_elem_id.toString)
    }
    session_states.foreach { state =>
      // toApplogger(state.front_elem_id.toString)
    }
    reactions.foreach { react => react.reaction_state_outs ++= reaction_state_out.filter(sout => sout.reaction == react.id.get) }
    states.foreach { state => state.switchers ++= switches.filter(sw => sw.state_ref == state.id.get) }
    session_states.foreach { session_state => session_state.switchers ++= switches.filter(sw => Some(sw.state_ref) == session_state.origin_state)  }

    println("middlewares length are "+middlewares.length)
    // Fill pipes and middlewares
    reactions.foreach { reaction =>
      val reaction_middlewares = middlewares.filter(mw => mw.reaction == reaction.id.get)

      strategies.foreach { strategy =>
        //strategy.strategiy_bases
        //strategy.strategiy_inputs
        //strategy.strategiy_outputs
        strategiy_inputs.filter(l => l.strategy == strategy.id.get).foreach { a => strategy.pushToStrategyInputUnit(a) }
        strategiy_bases.filter(l => l.strategy == strategy.id.get).foreach { a => strategy.pushToStrategyBaseUnit(a) }
        strategiy_outputs.filter(l => l.strategy == strategy.id.get).foreach { a => strategy.pushToStrategyOutputUnit(a) }

        middlewares.foreach { middleware =>
          if (strategy.middleware == middleware.id.get) {
            middleware.pushToStrategies(strategy)
          }
        }
      }
      reaction_middlewares.foreach { reaction_middleware =>   reaction.middlewares += reaction_middleware }

    }

    process.states ++= states.filter(state => state.process_state == true)
    process.session_states ++= session_states.filter(state => state.process_state == true)


    def topoIdFetch(topo: Option[ElemTopology]):Option[Int] = {
      topo match {
       case Some(topo) => topo.id
       case _ => None
      }
    }


    process.variety.foreach { element =>
      element.states ++= states.filter(state => state.front_elem_id == Some(element.id))
      element.session_states ++=  session_states.filter(state => state.front_elem_id == Some(element.id))
      element.reactions ++= reactions.filter { react =>
        val pred_elem = topologs.find(topo => topo.front_elem_id == Some(element.id))
        Some(react.element) == topoIdFetch(pred_elem)
      }
    }
    process.spacesElements.foreach { element =>
      element.states ++=  states.filter(state => state.space_elem_id == Some(element.id))
      element.session_states ++=  session_states.filter(state => state.space_elem_id == Some(element.id))
      element.reactions ++= reactions.filter(react => Some(react.element) == topologs.find(topo => topo.space_elem_id == Some(element.id)).get.id )
    }
    process.spaces.foreach { space =>
      space.states ++=  states.filter(state => state.space_id == space.id)
      space.session_states ++=  session_states.filter(state => state.space_id == space.id)
    }

    addToLaunchStack(process)

    BuilderRunnerUtils.activateParameters(process, params)


  /************************************************************************************************/
  /*************************** BEFORE LAUNCH ******************************************************/
    val launchPipe = LaunchMapPipe(
    launchId = session_id,
    elementPipe =     ElementPipe(
                                  elemMap,
                                  spaceMap,
                                  spaceElsMap),
    burnElementPipe =     BurnElementPipe(
                                   burnElemMap,
                                   burnSpaceMap,
                                   burnSpaceElMap),
    aditElementPipe =     AditElementPipe(
                                    initialStateMap,
                                    TopologsMap,
                                    SwitchersMap,
                                    ReactionsMap,
                                    ReactOutsMap)
    )
    val executedPipes:List[ExecutedLaunchCVPipes] = pipes.map(pipe => pipe(launchPipe))

    // TO STACK

/************************************************************************************************/
/************************************************************************************************/
/************************************************************************************************/
/************************************************************************************************/
/************************************************************************************************/
/************************************************************************************************/
/************************************************************************************************/
    println("start invoking process with NInvoker")
    if (validateElements(procElements.toList, test_space, space_elems) && run_proc)
      NInvoker.run_proc(process)
    else
      toApplogger("Process launch flag is off")
/************************************************************************************************/
/************************************************************************************************/
/************************************************************************************************/
/************************************************************************************************/
/*************************** AFTER LAUNCH *******************************************************/
/************************************************************************************************/
/************************************************************************************************/
/**
    *  Save state and logs only if process was runned
    **/
    if (run_proc && !minimal) {
      saveLogsInit(process, bpDTO, station_id, test_space)
      saveOrUpdateSessionStates(process, bpDTO, session_id, pulling = true)
      saveSessionStateLogs(process, bpDTO)
      saveOrUpdateState(process, bpDTO, session_id, lang)
      saveStationLog(bpID, station_id, process)
      saveLaunchAct(process, bpDTO)
    }

    Future( ProcessExecutionResult( 
              process, 
              procElementsObj.toList,
              test_spaceObj.toList,
              space_elemsObj.toList ) )
    }
    }
  }
}

}