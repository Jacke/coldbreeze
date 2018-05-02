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

/*****
 * By default all elements of process transformint as   RUN:     model's -> init launch's (switch ids)-> model's OR
 *                                                      RUNFROM: launch's (switch ids)-> model's
 * where plain = model
 */

object BuildF {
  /**
  * Initial launch
  * @bpID id of process
  * @lang optional language
  **/
  def run(bpID: Int, lang: Option[String] = Some("en"), invoke: Boolean,
          pipes: List[LaunchMapPipe => ExecutedLaunchCVPipes]=List.empty ):BuildingPhases = {
    //presenceValidate
    val bpDTO = BPDAO.get(bpID).get
    val processRunned1F:BuildingPhases = initiate(bpID, invoke, bpDTO, session_id = None, pipes = pipes)
    BuilderRunnerUtils.generateConsoleOutput(processRunned1F.finished)
    processRunned1F
  }
  /**
   * Run from launch
   * @bpID bpID of process
   * @session_id id of session
   * @params params for reaction
   **/
  def newRunFrom(bpID:Int,
                 session_id: Int,
                 params: List[ReactionActivator] = List(),
                 invoke:Boolean = true,
                 process_dto:Option[BProcessDTO]=None,
                 station_dto:Option[BPStationDTO]=None,
                 minimal: Boolean = false):BuildingPhases = {
    println("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<")
    println(s"NEW RUN FROM (pid: ${bpID}, session_id: ${session_id} ${params} invoke:${invoke})")
    println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
      val bpDTO = process_dto match {
        case Some(dto) => dto
        case _ => BPDAO.get(bpID).get
      }
      initiate(bpID, invoke, bpDTO, session_id = Some(session_id), params = params, minimal = minimal)
  }

  def newRunFromWithElements(bpID:Int,
                 session_id: Int,
                 params: List[ReactionActivator],
                 invoke:Boolean = true,
                 process_dto:Option[BProcessDTO]=None,
                 station_dto:Option[BPStationDTO]=None,
                 minimal: Boolean = false):Future[ProcessExecutionResult] =
   {
      val bpDTO = process_dto match {
        case Some(dto) => dto
        case _ => BPDAO.get(bpID).get
      }
      TempBuilder.initiateWithElements(bpID, invoke, bpDTO, session_id = Some(session_id), params = params, minimal = minimal)
   }
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  /** ***
    * Core launch
    * @param bpID
    * @return BProcess original instance
    */
def initiate(bpID: Int,
             run_proc: Boolean,
             bpDTO: BProcessDTO,
             lang: Option[String] = Some("en"),
             session_id: Option[Int],
             params: List[ReactionActivator] = List(),
             pipes: List[LaunchMapPipe => ExecutedLaunchCVPipes]=List(),
             minimal: Boolean = false ):BuildingPhases = {
  ElementRegistrator.apply
  val process = new BProcess(new Managment, id = bpDTO.id)
  val preparedProcess:Future[PreparedProcess] = 
      initiate2F(bpID, run_proc, process, bpDTO, lang, with_pulling = true, session_id_val = session_id,
                 params = params, pipes = pipes, minimal = minimal)

  val finishedProcessF: Future[BProcess] = majorLaunchFunction(preparedProcess)
  BuildingPhases(
    preparedProcess, finishedProcessF, finishedProcessF
  )

}


def initiate2F(bpID: Int,
              run_proc: Boolean,
              processRunned: BProcess,
              bpDTO: BProcessDTO,
              lang: Option[String] = Some("en"),
              with_pulling: Boolean = false,
              session_id_val: Option[Int],
              params: List[ReactionActivator] = List(),
              pipes: List[LaunchMapPipe => ExecutedLaunchCVPipes]=List(),
              minimal: Boolean = false ):Future[PreparedProcess] =
{
    val rootElementsF = BuildingFetchers.fetchRootElements(bpID)
    rootElementsF.map { rootElements =>
      val procElements = rootElements.procElements
      val test_space = rootElements.test_space
      val space_elems = rootElements.space_elems
      val process = processRunned



    // Generate sessions
    val generatedLaunch:GeneratedLaunchComponents = session_id_val match {
      case Some(session_val) => { // Launch from existed session
          BuildingFetchers.generateExistedLaunch(processRunned, bpDTO, lang, session_val)
      }
      case _ => { // launch from empty session
          BuildingFetchers.generateClearLaunch(processRunned, bpDTO, lang, rootElements)
      }
    }

    var runFrom: Boolean = generatedLaunch.runFrom // RUNFROM BOOLEAN CONSTANT
    val session_id = generatedLaunch.session_id
    val sessionEls = generatedLaunch.sessionEls
    val sessionSpaces = generatedLaunch.sessionSpaces
    val sessionSpaceEls = generatedLaunch.sessionSpaceEls
    // Maps Origin to Session
    val elemMap = generatedLaunch.elemMap
    val spaceMap = generatedLaunch.spaceMap
    val spaceElsMap = generatedLaunch.spaceElsMap
    val burnElemMap = generatedLaunch.burnElemMap
    val burnSpaceMap = generatedLaunch.burnSpaceMap
    val burnSpaceElMap = generatedLaunch.burnSpaceElMap
    // Update session for process
    processRunned.session_id = session_id
    // Fetch station_id
    val station_id = BuilderRunnerUtils.saveOrUpdateState(processRunned, bpDTO, session_id, lang, run_proc)
    // session state linked with session elements
    //val session_states_ids = saveSessionStates(processRunned, bpDTO, session_id)
    BuilderRunnerUtils.saveLogsInit(processRunned, bpDTO, station_id, BPSpaceDAOF.findByBPIdB(bpID))
    BuilderRunnerUtils.saveStationLog(bpID, station_id, processRunned)




    /********************************************************************************************
     *  Physical element casting
     **/
    val target2 = sessionEls.map(el => ExperimentalSessionBuilder.fromSessionEl(el))
    val arrays = target2.map(c => c.cast(process)).flatten.toArray
    process.push {
      arrays.sortWith(_.order < _.order)
    }
    BuilderRunnerUtils.toAppLogger("elements " + process.allElements.length + " " + procElements.length)

    /* Presence validation  */
    val front_bricks = process.findFrontBrick()
    val test_space2 = sessionSpaces.map(sp => ExperimentalSessionBuilder.fromSessionSp(sp))
    val space_elems2 = sessionSpaceEls.map(el => ExperimentalSessionBuilder.fromSessionSpEl(el))
    if (front_bricks.length > 0 && test_space2.length > 0) {
      BuilderRunnerUtils.makeFrontSpaces(process, test_space2, front_bricks, space_elems2)
      if (test_space2.reduceLeft(BuilderRunnerUtils.getLatestNest).nestingLevel > 1) {
        BuilderRunnerUtils.makeNestedSpaces(process, test_space2, process.findNestedBricks(), space_elems2)
      }
    }
/*************************************************************************************************************************/
/*************************************************************************************************************************/
/*************************************************************************************************************************/
/*************************************************************************************************************************/
/*************************************************************************************************************************/
    val runFromSessionMarker = runFrom && !minimal
    val runFromPlainMarker = !minimal
    val generatedLaunchSessionComponents:GeneratedLaunchComponentStates = runFromSessionMarker match {
      case true => {
        BuildingFetchers.generateExistedLaunchComponentStates(bpID, session_id)
      }
      case _ => {
        runFromPlainMarker match {
          case true => {
            BuildingFetchers.generateClearLaunchComponentStates(bpID, processRunned,bpDTO, session_id, with_pulling, generatedLaunch)
          }
          case _ => GeneratedLaunchComponentStates()
        }
      }
    }

  // map fetched generated component states
  val states = generatedLaunchSessionComponents.states
  val session_states = generatedLaunchSessionComponents.session_states
  val initialStates = generatedLaunchSessionComponents.initialStates
  val sessionTopologs = generatedLaunchSessionComponents.sessionTopologs
  val sessionSwitchers = generatedLaunchSessionComponents.sessionSwitchers
  val sessionReactions = generatedLaunchSessionComponents.sessionReactions
  val sessionReactOuts = generatedLaunchSessionComponents.sessionReactOuts
  val initialStateMap = generatedLaunchSessionComponents.initialStateMap
  val TopologsMap = generatedLaunchSessionComponents.TopologsMap
  val SwitchersMap = generatedLaunchSessionComponents.SwitchersMap
  val ReactionsMap = generatedLaunchSessionComponents.ReactionsMap
  val ReactOutsMap = generatedLaunchSessionComponents.ReactOutsMap
  val sessionMiddlewares = generatedLaunchSessionComponents.sessionMiddlewares
  val sessionStrategies = generatedLaunchSessionComponents.sessionStrategies
  val sessionStBases = generatedLaunchSessionComponents.sessionStBases
  val sessionStInputs = generatedLaunchSessionComponents.sessionStInputs
  val sessionStOuts = generatedLaunchSessionComponents.sessionStOuts
  val MiddlewaresMap = generatedLaunchSessionComponents.MiddlewaresMap
  val StrategiesMap = generatedLaunchSessionComponents.StrategiesMap
  val StBasesMap = generatedLaunchSessionComponents.StBasesMap
  val StInputsMap = generatedLaunchSessionComponents.StInputsMap
  val StOutsMap = generatedLaunchSessionComponents.StOutsMap




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

    BuilderRunnerUtils.toAppLogger("states found: " + states.length)
    BuilderRunnerUtils.toAppLogger("session_states found: " + session_states.length)
    states.foreach { state =>
      // BuilderRunnerUtils.toAppLogger(state.front_elem_id.toString)
    }
    session_states.foreach { state =>
      // BuilderRunnerUtils.toAppLogger(state.front_elem_id.toString)
    }
    reactions.foreach { react => react.reaction_state_outs ++= reaction_state_out.filter(sout => sout.reaction == react.id.get) }
    states.foreach { state => state.switchers ++= switches.filter(sw => sw.state_ref == state.id.get) }
    session_states.foreach { session_state => session_state.switchers ++= switches.filter(sw => Some(sw.state_ref) == session_state.origin_state)  }

    process.states ++= states.filter(state => state.process_state == true)
    process.session_states ++= session_states.filter(state => state.process_state == true)

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


    process.variety.foreach { element =>
      element.states ++= states.filter(state => state.front_elem_id == Some(element.id))
      element.session_states ++=  session_states.filter(state => state.front_elem_id == Some(element.id))
      element.reactions ++= reactions.filter { react =>
        val pred_elem = topologs.find(topo => topo.front_elem_id == Some(element.id))
        Some(react.element) == BuilderRunnerUtils.topoIdFetch(pred_elem)
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
////////////////////////////////////////////////////////////
    BuilderRunnerUtils.addToLaunchStack(process)

    /**
    * Activate reaction by params
    **/
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
    ///////////////////////////////////////////
    PreparedProcess(process, bpDTO, station_id, session_id, procElements, test_space, space_elems, run_proc, minimal, lang)
  }
}




def majorLaunchFunction(prepared_pF: Future[PreparedProcess]):Future[BProcess] = {
  prepared_pF.map { prepared_p => 
  val session_id = prepared_p.session_id
  val process = prepared_p.process
  val bpDTO = prepared_p.bpDTO
  val station_id = prepared_p.station_id  
  val procElements= prepared_p.procElements   
  val test_space= prepared_p.test_space    
  val space_elems= prepared_p.space_elems    
  val run_proc= prepared_p.run_proc     
  val minimal= prepared_p.minimal     
  val lang= prepared_p.lang 
/************************************************************************************************/
/************************************************************************************************/
/************************************************************************************************/
/************************************************************************************************/
/************************************************************************************************/
/************************************************************************************************/
/************************************************************************************************/
    if (BuilderRunnerUtils.validateElements(procElements.toList, test_space, space_elems) && run_proc)
      NInvoker.run_proc(process)
    else
      BuilderRunnerUtils.toAppLogger("Process launch flag is off")
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
      BuilderRunnerUtils.saveLogsInit(process, bpDTO, station_id, test_space)
      BuilderRunnerUtils.saveOrUpdateSessionStates(process, bpDTO, session_id, pulling = true)
      BuilderRunnerUtils.saveSessionStateLogs(process, bpDTO)
      BuilderRunnerUtils.saveOrUpdateState(process, bpDTO, session_id, lang)
      BuilderRunnerUtils.saveStationLog(process.id.get, station_id, process)
      BuilderRunnerUtils.saveLaunchAct(process, bpDTO)
    }
    process
  }
}














/****
 * For what??????????
 */ 
  def initFrom(station_id:Int,
              bpID:Int,
              params: List[InputParamProc],
              process_dto:Option[BProcessDTO]=None,
              station_dto:Option[BPStationDTO]=None
              ):BProcess  = {

    val processObj:Option[BProcessDTO] = process_dto match {
      case Some(process) => Some(process)
      case _ => BPDAO.get(bpID)
    }
    val station:Option[BPStationDTO]= station_dto match {
      case Some(station_dto) => Some(station_dto)
      case _ => BPStationDAO.findById(station_id)
    }

    val target = ProcElemDAO.findByBPId(bpID)
    val process = new BProcess(new Managment, id = Some(bpID))
    val arrays = target.map(c => c.cast(process)).flatten.toArray
    process.push {
      arrays.sortWith(_.order < _.order)
    }
    val logger_db = BPLoggerDAOF.findByStation(station_id)

    val test_space = BPSpaceDAOF.findByBPIdB(bpID)
    val space_elems = SpaceElemDAO.findByBPId(bpID)
    val front_bricks = process.findFrontBrick()



    /*
      Presence validation
     */
    if (front_bricks.length > 0 && test_space.length > 0) {
      BuilderRunnerUtils.makeFrontSpaces(process, test_space, front_bricks, space_elems)
      if (test_space.reduceLeft(BuilderRunnerUtils.getLatestNest).nestingLevel > 1) {
        BuilderRunnerUtils.makeNestedSpaces(process, test_space, process.findNestedBricks(), space_elems)
      }
    }
    BuilderRunnerUtils.validateElements(target, test_space, space_elems)











  val logger_results = logger_db.map(log =>
    BPLoggerResult(
      process.findObjectById(log.element, log.space_elem).get,
      composite=None,
      order = log.order,
      space = log.space,
      station = process.station,
      invoked = log.invoked,
      expanded = log.expanded,
      container = log.container,
      date = log.date))


  process.logger.logs = logger_results.toArray

  process.station.update_variables(
    station.get.state,
    station.get.step,
    station.get.space,
    station.get.container_step.toArray,
    station.get.expand_step.toArray,
    station.get.spaces_ids.toArray,
    station.get.started,
    station.get.finished,
    station.get.inspace,
    station.get.incontainer,
    station.get.inexpands,
    station.get.paused
  )
    /* State sync */
    //process.restoreCVOfElems

  process
  }


}
