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

  def generateExistedLaunch(processRunned:BProcess, bpDTO:BProcessDTO, lang: Option[String] = Some("en")):GeneratedLaunchComponents = {
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
    getStationToProcess(processRunned, session_id)
    GeneratedLaunchComponents(runFrom = runFrom, session_id = session_id, sessionEls = sessionEls,
      sessionSpaces = sessionSpaces,
      sessionSpaceEls = sessionSpaceEls) 
  }

  def generateClearLaunch(processRunned:BProcess, bpDTO:BProcessDTO, lang: Option[String] = Some("en")):GeneratedLaunchComponents = {
    val elemMap:scala.collection.mutable.Map[Int, Int] = scala.collection.mutable.Map().empty
    val spaceMap:scala.collection.mutable.Map[Int, Int] = scala.collection.mutable.Map().empty
    val spaceElsMap:scala.collection.mutable.Map[Int, Int] = scala.collection.mutable.Map().empty
    val burnElemMap:scala.collection.mutable.Map[Int, Int] = scala.collection.mutable.Map().empty
    val burnSpaceMap:scala.collection.mutable.Map[Int, Int] = scala.collection.mutable.Map().empty
    val burnSpaceElMap:scala.collection.mutable.Map[Int, Int] = scala.collection.mutable.Map().empty

    val session_id = models.DAO.sessions.SessionProcElementDAOF.await(
      saveSession(processRunned, bpDTO, lang) )
    // FRONT ELEM NOT FOR BRICKS
    val sessionEls = procElements.map { el =>
        val obj = ExperimentalSessionBuilder.fromOriginEl(el, session_id, burnElemMap)
        elemMap += el.id.get -> obj.id.get
        obj
    }.toList
    val sessionSpaces = test_space.map { sp => //.filter(sp => sp.brick_nested.isDefined).map ( sp =>
      val obj = ExperimentalSessionBuilder.fromOriginSp(sp, session_id, elemMap, spaceElsMap)
      spaceMap += sp.id.get -> obj.id.get
      obj
    }
    ExperimentalAfterBurning.makeBurn(spaceMap, burnElemMap)
    val sessionSpaceEls = space_elems.map { spel => //.filter(n => n.space_own.isDefined).map ( spel =>
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


//////////////////////////////////////////////////////////////////////
//         States
////////////////////////////////////////////////////////////////////
  def generateClearLaunchComponentStates(bpID:Int, session_id:Int, with_pulling:Boolean):GeneratedLaunchComponentStates = {
    val states = BPStateDAOF.findByBP(bpID).map { state =>
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


  }  

  def generateExistedLaunchComponentStates():GeneratedLaunchComponentStates = {
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

  }  

}