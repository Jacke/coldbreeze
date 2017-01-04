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

case class RootElements(procElements:List[UndefElement],
                        test_space:List[BPSpaceDTO],
                        space_elems:List[SpaceElementDTO])
case class GeneratedLaunchComponents(
    runFrom:Boolean = false,
    session_id:Int = 0,
    sessionEls:List[SessionUndefElement] = List(),
    sessionSpaces:List[SessionSpaceDTO] = List(),
    sessionSpaceEls:List[SessionSpaceElementDTO] = List(),
    elemMap:scala.collection.mutable.Map[Int, Int] = scala.collection.mutable.Map().empty,
    spaceMap:scala.collection.mutable.Map[Int, Int] = scala.collection.mutable.Map().empty,
    spaceElsMap:scala.collection.mutable.Map[Int, Int] = scala.collection.mutable.Map().empty,
    burnElemMap:scala.collection.mutable.Map[Int, Int] = scala.collection.mutable.Map().empty,
    burnSpaceMap:scala.collection.mutable.Map[Int, Int] = scala.collection.mutable.Map().empty,
    burnSpaceElMap:scala.collection.mutable.Map[Int, Int] = scala.collection.mutable.Map().empty
)

case class GeneratedLaunchComponentStates(
  states:           List[BPState]                     = List(),
  session_states:   List[BPSessionState]              = List(),
  initialStates:    List[SessionInitialState]         = List(),
  sessionTopologs:  List[SessionElemTopology]         = List(),
  sessionSwitchers: List[SessionUnitSwitcher]         = List(),
  sessionReactions: List[SessionUnitReaction]         = List(),
  sessionReactOuts: List[SessionUnitReactionStateOut] = List(),

  initialStateMap:scala.collection.mutable.Map[Int, Int]    = scala.collection.mutable.Map().empty,
  TopologsMap:scala.collection.mutable.Map[Int, Int]        = scala.collection.mutable.Map().empty,
  SwitchersMap:scala.collection.mutable.Map[Int, Int]       = scala.collection.mutable.Map().empty,
  ReactionsMap:scala.collection.mutable.Map[Int,Int]        = scala.collection.mutable.Map().empty,
  ReactOutsMap:scala.collection.mutable.Map[Int,Int]        = scala.collection.mutable.Map().empty,

  sessionMiddlewares:List[LaunchMiddleware] = List(),
  sessionStrategies:List[LaunchStrategy] = List(),
  sessionStBases:List[LaunchStrategyBaseUnit] = List(),
  sessionStInputs:List[LaunchStrategyInputUnit] = List(),
  sessionStOuts:List[LaunchStrategyOutputUnit] = List(),

  MiddlewaresMap:scala.collection.mutable.Map[Long,Long]        = scala.collection.mutable.Map().empty,
  StrategiesMap:scala.collection.mutable.Map[Long,Long]        = scala.collection.mutable.Map().empty,
  StBasesMap:scala.collection.mutable.Map[Long,Long]        = scala.collection.mutable.Map().empty,
  StInputsMap:scala.collection.mutable.Map[Long,Long]        = scala.collection.mutable.Map().empty,
  StOutsMap:scala.collection.mutable.Map[Long,Long]        = scala.collection.mutable.Map().empty
)

/**
 * Definitions:
 * clear: run from as new launch 
 * existed: run from existed launch
 */

object BuildingFetchers {
  def fetchRootElements(bpID: Int):Future[RootElements] = {
    val procElementsF: Future[Seq[UndefElement]] = ProcElemDAOF.findByBPId(bpID)
    val test_spaceF:Future[Seq[BPSpaceDTO]] = BPSpaceDAOF.findByBPId(bpID)
    val space_elemsF:Future[Seq[SpaceElementDTO]] = SpaceElemDAOF.findByBPId(bpID)
    procElementsF.flatMap { procElementsObj =>
      test_spaceF.flatMap { test_spaceObj =>
        space_elemsF.map { space_elemsObj =>
        val procElements = procElementsObj.toList
        val test_space = test_spaceObj.toList
        val space_elems = space_elemsObj.toList
          RootElements(procElements, test_space, space_elems)
        }
      }
    }
  }
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  def generateExistedLaunch(processRunned:BProcess, bpDTO:BProcessDTO, lang: Option[String] = Some("en"), session_val:Int):GeneratedLaunchComponents = {
    val runFrom = true
    val session_id = session_val
    //val sessionElsF:Future[Seq[SessionUndefElement]]         = SessionProcElementDAOF.findBySession(session_id)
    //val sessionSpacesF:Future[Seq[SessionSpaceDTO]]          = SessionSpaceDAOF.findBySession(session_id)
    //val sessionSpaceElsF:Future[Seq[SessionSpaceElementDTO]] = SessionSpaceElemDAOF.findBySession(session_id)
    //sessionElsF     .map { sessionElsObj =>
    //sessionSpacesF  .map { sessionSpacesObj =>
    //sessionSpaceElsF.map { sessionSpaceElsObj =>
    val sessionEls      = SessionProcElementDAO.findBySession(session_id)//sessionElsObj.toList
    val sessionSpaces   = SessionSpaceDAO.findBySession(session_id)//sessionSpacesObj.toList
    val sessionSpaceEls = SessionSpaceElemDAO.findBySession(session_id)//sessionSpaceElsObj.toList
    //}
    //}
    //}
    BuilderRunnerUtils.getStationToProcess(processRunned, session_id)
    GeneratedLaunchComponents(runFrom = runFrom, session_id = session_id, sessionEls = sessionEls,
      sessionSpaces = sessionSpaces,
      sessionSpaceEls = sessionSpaceEls) 
  }

  def generateClearLaunch(processRunned:BProcess, bpDTO:BProcessDTO, lang: Option[String] = Some("en"), rootElms: RootElements):GeneratedLaunchComponents = {
    var elemMap:scala.collection.mutable.Map[Int, Int] = scala.collection.mutable.Map().empty
    var spaceMap:scala.collection.mutable.Map[Int, Int] = scala.collection.mutable.Map().empty
    var spaceElsMap:scala.collection.mutable.Map[Int, Int] = scala.collection.mutable.Map().empty
    var burnElemMap:scala.collection.mutable.Map[Int, Int] = scala.collection.mutable.Map().empty
    var burnSpaceMap:scala.collection.mutable.Map[Int, Int] = scala.collection.mutable.Map().empty
    var burnSpaceElMap:scala.collection.mutable.Map[Int, Int] = scala.collection.mutable.Map().empty

    val session_id = models.DAO.sessions.SessionProcElementDAOF.await(
      BuilderRunnerUtils.saveSession(processRunned, bpDTO, lang) )
    // FRONT ELEM NOT FOR BRICKS
    val sessionEls = rootElms.procElements.map { el =>
        val obj = ExperimentalSessionBuilder.fromOriginEl(el, session_id, burnElemMap)
        elemMap += el.id.get -> obj.id.get
        obj
    }.toList
    val sessionSpaces = rootElms.test_space.map { sp => //.filter(sp => sp.brick_nested.isDefined).map ( sp =>
      val obj = ExperimentalSessionBuilder.fromOriginSp(sp, session_id, elemMap, spaceElsMap)
      spaceMap += sp.id.get -> obj.id.get
      obj
    }
    ExperimentalAfterBurning.makeBurn(spaceMap, burnElemMap)
    val sessionSpaceEls = rootElms.space_elems.map { spel => //.filter(n => n.space_own.isDefined).map ( spel =>
      val obj = ExperimentalSessionBuilder.fromOriginSpElem(spel, session_id, spaceMap)
      spaceElsMap += spel.id.get -> obj.id.get
      obj
    }

    GeneratedLaunchComponents(session_id = session_id, sessionEls = sessionEls,
      sessionSpaces = sessionSpaces,
      sessionSpaceEls = sessionSpaceEls,
      elemMap = elemMap,
      spaceMap = spaceMap,
      spaceElsMap = spaceElsMap,
      burnElemMap = burnElemMap,
      burnSpaceMap = burnSpaceMap,
      burnSpaceElMap = burnSpaceElMap
    ) 
  }


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//         States
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  def generateClearLaunchComponentStates(bpID:Int, 
                                         processRunned:BProcess,
                                         bpDTO:BProcessDTO,
                                         session_id:Int, 
                                         with_pulling:Boolean, 
                                         launchCmps: GeneratedLaunchComponents):GeneratedLaunchComponentStates = {
    var initialStateMap:scala.collection.mutable.Map[Int, Int]    = scala.collection.mutable.Map().empty
    var TopologsMap:scala.collection.mutable.Map[Int, Int]        = scala.collection.mutable.Map().empty
    var SwitchersMap:scala.collection.mutable.Map[Int, Int]       = scala.collection.mutable.Map().empty
    var ReactionsMap:scala.collection.mutable.Map[Int,Int]        = scala.collection.mutable.Map().empty
    var ReactOutsMap:scala.collection.mutable.Map[Int,Int]       = scala.collection.mutable.Map().empty
    var MiddlewaresMap:scala.collection.mutable.Map[Long,Long]   = scala.collection.mutable.Map().empty
    var StrategiesMap:scala.collection.mutable.Map[Long,Long]    = scala.collection.mutable.Map().empty
    var StBasesMap:scala.collection.mutable.Map[Long,Long]       = scala.collection.mutable.Map().empty
    var StInputsMap:scala.collection.mutable.Map[Long,Long]      = scala.collection.mutable.Map().empty
    var StOutsMap:scala.collection.mutable.Map[Long,Long]        = scala.collection.mutable.Map().empty
  
    var initialStatesAccumulator: List[SessionInitialState]      = List()

    val states = BPStateDAOF.findByBP(bpID).map { state =>
        val ogState = ExperimentalSessionBuilder.fromOriginState(state, session_id, launchCmps.elemMap, launchCmps.spaceMap, launchCmps.spaceElsMap)
        initialStateMap += state.id.get -> ogState.id.get
        initialStatesAccumulator = ogState :: initialStatesAccumulator
        ExperimentalSessionBuilder.fromInitialState(ogState)
    }
    val session_states:   List[BPSessionState] = with_pulling match {
      case true => {
        val temp_session_states = Build.saveSessionStates(processRunned, 
          bpDTO, 
          session_id, 
          pulling = true, 
          launchCmps.elemMap, 
          launchCmps.spaceMap, 
          launchCmps.spaceElsMap, 
          initialStateMap).session_states
        val existedSesStates = BPSessionStateDAOF.await( BPSessionStateDAOF.findByBPAndSession(bpID, session_id) ).toList
        SessionStatesContainer(existedSesStates, existedSesStates.map(o => o.id.getOrElse(0))).session_states
      }
      case _ => List()
    }

    //session_states = session_states.map(ss => ss.copy(origin_state = initialStateMap.get(ss.origin_state.getOrElse(0))))
    // Element TOPOLOGY
    val sessionTopologs = ElemTopologDAO.findByBP(bpID).map { el =>
        val obj = ExperimentalSessionBuilder.fromOriginTopo(el, session_id, launchCmps.elemMap,launchCmps.spaceMap,launchCmps.spaceElsMap)
        TopologsMap += el.id.get -> obj.id.get
        obj
    }
    val sessionSwitchers = SwitcherDAO.findByBPId(bpID).map { el =>
      val obj: SessionUnitSwitcher = ExperimentalSessionBuilder.fromOriginSwitcher(el, session_id, initialStateMap)
      SwitchersMap += el.id.get -> obj.id.get
      obj
    }

    val sessionReactions = ReactionDAO.findByBP(bpID).map { el =>
      val obj = ExperimentalSessionBuilder.fromOriginReaction(el, session_id, TopologsMap, initialStateMap)
      ReactionsMap += el.id.get -> obj.id.get
      obj
    }
    val sessionReactOuts = ReactionStateOutDAO.findByReactions(ReactionsMap.keys.toList).map { el =>
      val obj = ExperimentalSessionBuilder.fromOriginReactionStateOut(el, session_id, ReactionsMap, initialStateMap)
      ReactOutsMap += el.id.get -> obj.id.get
      obj
    }

    val sessionMiddlewares = MiddlewaresDAOF.await(MiddlewaresDAOF.findByReactions(ReactionsMap.keys.toList) ).map { el =>
      val obj = ExperimentalSessionBuilder.fromOriginMiddlewares(el, session_id, ReactionsMap)
      MiddlewaresMap += el.id.get -> obj.id.get
      obj
    }.toList
    val sessionStrategies = StrategiesDAOF.await(StrategiesDAOF.findByMiddlewares(MiddlewaresMap.keys.toList)).map { el =>
      val obj = ExperimentalSessionBuilder.fromOriginStrategies(el, session_id, MiddlewaresMap)
      StrategiesMap += el.id.get -> obj.id.get
      obj
    }.toList
    val sessionStBases = StrategyBasesDAOF.await( StrategyBasesDAOF.getByStrategies(StrategiesMap.keys.toList) ).map  { el =>
      val obj = ExperimentalSessionBuilder.fromOriginStBases(el, StrategiesMap)
      StBasesMap += el.id.get -> obj.id.get
      obj
    }.toList
    val sessionStInputs = StrategyInputsDAOF.await( StrategyInputsDAOF.getByStrategies(StrategiesMap.keys.toList) ).map { el =>
      val obj = ExperimentalSessionBuilder.fromOriginStInputs(el, StrategiesMap)
      StInputsMap += el.id.get -> obj.id.get
      obj
    }.toList
    val sessionStOuts = StrategyOutputsDAOF.await( StrategyOutputsDAOF.getByStrategies(StrategiesMap.keys.toList) ).map { el =>
      val obj = ExperimentalSessionBuilder.fromOriginStOuts(el, StrategiesMap)
      StOutsMap += el.id.get -> obj.id.get
      obj
    }.toList


    BuilderRunnerUtils.toAppLogger("[RED Initial Run Cast result: RESET]")
    BuilderRunnerUtils.toAppLogger(s"states ${states.length}")
    BuilderRunnerUtils.toAppLogger(s"sessionTopologs ${sessionTopologs.length}")
    BuilderRunnerUtils.toAppLogger(s"sessionSwitchers ${sessionSwitchers.length}")
    BuilderRunnerUtils.toAppLogger(s"sessionReactions ${sessionReactions.length}")
    BuilderRunnerUtils.toAppLogger(s"sessionReactOuts ${sessionReactOuts.length}")
    BuilderRunnerUtils.toAppLogger("REACT OUT FROM PLAIN RUN")
    ReactionsMap.values.toList.foreach { l => BuilderRunnerUtils.toAppLogger(l)}
    BuilderRunnerUtils.toAppLogger(s"${ReactionsMap.values.toList.length}")


    GeneratedLaunchComponentStates(
      states = states,
      session_states = session_states,
      initialStates = initialStatesAccumulator,
      sessionTopologs = sessionTopologs,
      sessionSwitchers = sessionSwitchers,
      sessionReactions = sessionReactions,
      sessionReactOuts = sessionReactOuts,
      initialStateMap = initialStateMap,
      TopologsMap = TopologsMap,
      SwitchersMap = SwitchersMap,
      ReactionsMap = ReactionsMap,
      ReactOutsMap = ReactOutsMap,
      sessionMiddlewares = sessionMiddlewares,
      sessionStrategies = sessionStrategies,
      sessionStBases = sessionStBases,
      sessionStInputs = sessionStInputs,
      sessionStOuts = sessionStOuts,
      MiddlewaresMap = MiddlewaresMap,
      StrategiesMap = StrategiesMap,
      StBasesMap = StBasesMap,
      StInputsMap = StInputsMap,
      StOutsMap = StOutsMap
    )
}  

  def generateExistedLaunchComponentStates(bpID:Int, session_id:Int):GeneratedLaunchComponentStates = {
        val initialStates    = SessionInitialStateDAO.findBySession(session_id)
        val states           = initialStates.map(in => ExperimentalSessionBuilder.fromInitialState(in))
        val sessionTopologs  = SessionElemTopologDAO.findBySession(session_id)
        val sessionSwitchers = SessionSwitcherDAO.findBySession(session_id)
        val sessionReactions = SessionReactionDAO.findBySession(session_id)
        val sessionReactOuts = SessionReactionStateOutDAO.findByReactions(sessionReactions.map(react => react.id.get))

        val sessionMiddlewares = LaunchMiddlewaresDAOF.await(LaunchMiddlewaresDAOF.findByReactions(sessionReactions.map(react => react.id.get)) ).toList
        val sessionStrategies = LaunchStrategiesDAOF.await(LaunchStrategiesDAOF.findByMiddlewares(
          sessionMiddlewares.map(l => l.id.get).toList
        )).toList
        val sessionStBases  = LaunchStrategyBasesDAOF.await( LaunchStrategyBasesDAOF.getByStrategies(sessionStrategies.map(l =>
          l.id.get
        ).toList) ).toList
        val sessionStInputs = LaunchStrategyInputsDAOF.await(LaunchStrategyInputsDAOF.getByStrategies(sessionStrategies.map(l =>
          l.id.get
        ).toList) ).toList
        val sessionStOuts   = LaunchStrategyOutputsDAOF.await(LaunchStrategyOutputsDAOF.getByStrategies(sessionStrategies.map(l =>
          l.id.get
        ).toList) ).toList
        val existedSesStates = BPSessionStateDAOF.await( BPSessionStateDAOF.findByBPAndSession(bpID, session_id) ).toList
        val session_states = SessionStatesContainer(existedSesStates, existedSesStates.map(o => o.id.getOrElse(0))).session_states
        GeneratedLaunchComponentStates(
          states = states,
          session_states = session_states,
          initialStates = initialStates,
          sessionTopologs = sessionTopologs,
          sessionSwitchers = sessionSwitchers,
          sessionReactions = sessionReactions,
          sessionReactOuts = sessionReactOuts,
          sessionMiddlewares = sessionMiddlewares,
          sessionStrategies = sessionStrategies,
          sessionStBases = sessionStBases,
          sessionStInputs = sessionStInputs,
          sessionStOuts = sessionStOuts
        )
  }  

}