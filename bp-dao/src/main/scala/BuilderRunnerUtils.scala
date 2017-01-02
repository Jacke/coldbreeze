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

/**
 * Collection of independent utilities for process building
 */
object BuilderRunnerUtils {
 protected lazy val appLogger: Logger = Logger(LoggerFactory.getLogger("build"))
  def toApplogger(msg: Any, log_type: String = "info")(implicit line: sourcecode.Line, file: sourcecode.File) = {
      log_type match {
        //case "debug" => appLogger.info(msg.toString)
        case _ => {
          //Future { println(s"${file.value}:${line.value} ${msg.toString}") }
          //Future { appLogger.info(msg.toString) }
          println(s"${file.value}:${line.value} ${msg.toString}")
          //appLogger.info(msg.toString)
        }
        //case "error" => appLogger.info(msg.toString)
      }
  }
  
  // Resume hoook for launchStack
  def resumeProcess(bpID:Int, session_id: Int, reaction_id: Int):Future[BProcess] = {
    println("resume process hook called")
    val activator = ReactionActivator(reaction_id, Some("delay") )
    newRunFrom(bpID, session_id, invoke = true, params = List(activator))
  } 
  // Add to launchStack
  def addToLaunchStack(process: BProcess):Unit = {
    LaunchStackFactory.addE(LaunchStackElement(
      process,
      resumeProcess
    ))
  }





  def saveSession(bprocess: BProcess, bprocess_dto: BProcessDTO, lang: Option[String] = Some("en")) = {
    val session = BPSession(
                            None,
                            bprocess_dto.id.get,
                            created_at = Some(org.joda.time.DateTime.now() ),
                            updated_at = Some(org.joda.time.DateTime.now() )
                        )
    BPSessionDAOF.pull(session)
  }

  def saveSessionStates(bprocess: BProcess,
                        bprocess_dto: BProcessDTO,
                        session_id: Int,
                        pulling: Boolean = false,
                        elemMap: scala.collection.mutable.Map[Int,Int]     = scala.collection.mutable.Map().empty,
                        spaceMap: scala.collection.mutable.Map[Int,Int]    = scala.collection.mutable.Map().empty,
                        spaceElsMap: scala.collection.mutable.Map[Int,Int] = scala.collection.mutable.Map().empty,
                        initialStateMap: scala.collection.mutable.Map[Int,Int] = scala.collection.mutable.Map().empty) = {
    val origin_states = BPStateDAOF.findByBP(bprocess_dto.id.get)
    play.api.Logger.debug("saveSessionStates")
        play.api.Logger.debug("elemMap")
    elemMap.foreach { el => play.api.Logger.debug(s"${el._1}, ${el._2}") }
        play.api.Logger.debug("spaceMap")
    spaceMap.foreach { el => play.api.Logger.debug(s"${el._1}, ${el._2}") }
        play.api.Logger.debug("spaceElsMap")
    spaceElsMap.foreach { el => play.api.Logger.debug(s"${el._1}, ${el._2}") }

      val session_states = origin_states.map(state =>
        BPSessionState(
          None,
          bprocess_dto.id.get,
          session_id,
          state.title,
          state.neutral,
          state.process_state,
          state.on,
          state.on_rate,
          elemMap.get(state.front_elem_id.getOrElse(0)),
          spaceElsMap.get(state.space_elem_id.getOrElse(0)),
          spaceMap.get(state.space_id.getOrElse(0)),
          origin_state = initialStateMap.get(state.id.getOrElse(0)),
          created_at = Some(org.joda.time.DateTime.now()),
          updated_at = Some(org.joda.time.DateTime.now()),
          lang = state.lang,
          middle = state.middle,
          middleable = state.middleable,
          oposite = state.oposite,
          opositable = state.opositable,
          session_elements = Some(SessionElements(elemMap.get(state.front_elem_id.getOrElse(0)),
                                                              spaceMap.get(state.space_id.getOrElse(0)),
                                                              spaceElsMap.get(state.space_elem_id.getOrElse(0))))))

    var ids:List[Int] = List()
    if (pulling) {
        var ids:List[Int] = session_states.map(session_state => BPSessionStateDAOF.pull_new_object(session_state)).filter(id => id != -1)
    }
    SessionStatesContainer(session_states, ids)
}
def saveOrUpdateSessionStates(bprocess: BProcess, bprocess_dto: BProcessDTO, session_id: Int, pulling: Boolean = false) = {
    val origin_states = BPStateDAOF.findByBP(bprocess_dto.id.get)
    val session_states_initial = SessionInitialStateDAO.findBySession(session_id).map(in => ExperimentalSessionBuilder.fromInitialState(in))
    //BPSessionStateDAO.findByOriginIds(origin_states.map(_.id.get))
    val session_states:List[BPSessionState] = (bprocess.allElements.map(_.session_states.toList)).flatten ++ bprocess.session_states.toList

    toApplogger("session states FOR UPDATE: ")
    session_states.foreach { state =>
        toApplogger(s"session state ${state.id} ${state.title} ${state.on} :: ${state.on_rate} ")
    }
    val deltas = session_states.filter { state =>
      session_states_initial.find(initialState => initialState.id == state.origin_state &&
      (initialState.on_rate != state.on_rate || initialState.on != state.on)).isDefined // TODO: 4-Dimension checking
    }
    var ids:List[Int] = List()
    if (pulling) {
      var ids:List[Int] = deltas.map(session_state => BPSessionStateDAOF.updateB(session_state.id.get, session_state))
    }

      SessionStatesContainer(session_states, ids)
  }

  def saveOrUpdateState(bprocess: BProcess, bprocess_dto: BProcessDTO, session_id: Int, lang: Option[String] = Some("en"), run_proc: Boolean = true) = {
    val station = BPStationDAO.from_origin_station(bprocess.station, bprocess_dto, session_id = session_id)
    val station_id = BPStationDAO.saveOrUpdate(station, lang, run_proc)
    station_id
  }
  def saveLogsInit(bprocess: BProcess, bprocess_dto: BProcessDTO, station_id: Int, spacesDTO: List[BPSpaceDTO]) = {
    val dblogger = BPLoggerDAOF.from_origin_lgr(bprocess.logger, bprocess_dto, station_id, spacesDTO)
    dblogger.foreach(log => BPLoggerDAOF.pull_object(log))
  }
  def saveSessionStateLogs(bprocess: BProcess, bprocess_dto: BProcessDTO) = {
    bprocess.station.station_logger.session_state_logs.foreach(obj => SessionStateLogDAO.pull_object(obj))
  }
  def saveStationLog(process_id: Int, station_id: Int, bprocess: BProcess) = {
    val station_loggers = bprocess.station.station_logger.logs.map(s => BPStationLoggeDAOF.from_origin_station(process_id, station_id, s))
    station_loggers.foreach(s => BPStationLoggeDAOF.pull_object(s))
  }

  def saveLaunchAct(bprocess: BProcess, bprocess_dto: BProcessDTO) = {
    bprocess.acts.foreach { act => 
      val actIdF = ActionActsDAOF.pull(act)
      val actId = ActionActsDAOF.await(actIdF)
      act.statuses.map { mStatus =>
        ActionStatusesDAOF.pull(mStatus.copy(act = actId) )
      }
      act.results.map { ar =>
        ActionActResultsDAOF.pull(ar.copy(act = actId) )
      }
    }
  }


def generateConsoleOutput(processRunned1F: Future[BProcess]):Future[BProcess] = {
  processRunned1F.map { processRunned1 =>
   processRunned1.allElements.foreach { element =>
        //println()
        toApplogger("Title " + element.title + " " + element.id)
        toApplogger("states: " + element.states.length + ". switchers: " +element.states.map(st => st.switchers.length).length)
        //println()
        toApplogger("session_states: " + element.session_states.length)
        element.session_states.foreach {
          state =>
          //println()
          toApplogger("Title :   " + state.title)
          toApplogger("Status:   " + state.on)
        }
        toApplogger("reactions: " + element.reactions.length)
        println("middlewares: " + element.reactions.head.middlewares.length)
        //println()
   }
    toApplogger("Process #" + processRunned1.id + " session states: ")
    processRunned1.session_states.foreach {
      state =>
      //println()
      toApplogger("Title :   " + state.title)
      toApplogger("Status:   " + state.on)
    }
    toApplogger("Title :   " + "Paused")
    toApplogger("Status:   " + processRunned1.station.paused)        
    toApplogger("elements length" + processRunned1.allElements.length)
    toApplogger("************************************************")
    toApplogger("************************************************")
    println("------------------------------------------------------")

    processRunned1
}
}


/**
 * Activate reaction by params
 **/
  def activateParameters(process: BProcess, params: List[ReactionActivator] = List()):Unit = {
    params.foreach { param =>
      println(s"param detected ${param.toString}")
      val reaction = process.allElements.map(el => el.reactions).flatten
        reaction.find(reaction => reaction.id == Some(param.reaction_id)) match {
        case Some(target_reaction) => {
          if (param.target.isDefined && param.target == Some( "delay") ) {
            val el = bprocesses.ActionExecutor.retriveElementByAction(process, target_reaction)
            el.get.session_states.find(s => s.title == "delayed") match {
              case Some(s) => { 
                println("finded delayed action")
                s.on = true
                s.on_rate = 100
              }
              case _ =>
            }
          } else { // TODO: Refactor this
            target_reaction.execute(process)
          }
        }
        case _ =>
      }
    }
    println("params are executed")


  }





 /*
  * Helpers
  */
  // Ovveride station when Run From
  def getStationToProcess(process: BProcess, sessionId: Int) = {
    // find station
    val stationDTOOpt = BPStationDAOF.await(BPStationDAOF.findBySessionF(sessionId))
    // apply station to process station and override it
    stationDTOOpt match {
      case Some(stationDTO) => {
        process.station.step = stationDTO.step
      }
      case _ =>
    }
  }

  def makeFrontSpaces(process: BProcess, spacesDTO:List[BPSpaceDTO], bricks: Array[Brick], spaceElems: List[SpaceElementDTO]) = {
    val frontSpaces:List[BPSpaceDTO] = spacesDTO.filter(spaceDTO => spaceDTO.brick_front.isDefined )
    val frontSpacesElems = spaceElems.filter(spaceElem => frontSpaces.map(_.id.get).contains(spaceElem.space_owned))
    val origSpaces:List[Space] = frontSpaces.map(space => space.castFront(process, frontSpacesElems)).flatten.toList
    fillFrontSpaceElems(process, origSpaces, frontSpacesElems.sortWith(_.order < _.order))
  }
  def fillFrontSpaceElems(process: BProcess, origSpaces: List[Space], FrontSpaceElems: List[SpaceElementDTO]) = {
    origSpaces.foreach { orig =>
      FrontSpaceElems.filter(fs => fs.space_owned == orig.id.get).foreach { spaceElem =>
        orig.addToSpace(spaceElem.castToSpace(process, orig).get, spaceElem.space_role.getOrElse("container")) // Default space role is container
      }
      process.spaces = process.spaces :+ orig
    }
  }
  def makeNestedSpaces(process: BProcess, spacesDTO:List[BPSpaceDTO], bricks: Array[Brick], spaceElems: List[SpaceElementDTO], level: Int = 2) {
    val nestedSpaces:List[BPSpaceDTO] = spacesDTO.filter(spaceDTO => spaceDTO.brick_nested.isDefined && spaceDTO.nestingLevel == level) // NESTING LEVEL
    val nestedSpacesElems = spaceElems.filter(spaceElem => nestedSpaces.map(_.id.get).contains(spaceElem.space_owned))
    val origSpaces:List[Space] = nestedSpaces.map(space => space.cast_nested(process, nestedSpacesElems)).flatten.toList
    fillNestedSpacesElems(process, spacesDTO, spaceElems, origSpaces, nestedSpacesElems.sortWith(_.order < _.order), level)

  }
  def fillNestedSpacesElems(process: BProcess,
                            test_space: List[BPSpaceDTO],
                            space_elems: List[SpaceElementDTO],
                            origSpaces: List[Space],
                            nestedSpacesElems: List[SpaceElementDTO],
                            level: Int) =
  {
    origSpaces.foreach { orig =>
      nestedSpacesElems.filter(fs => fs.space_owned == orig.id.get).sortWith(_.order < _.order).foreach { spaceElem =>
        orig.addToSpace(spaceElem.castToSpace(process, orig).get, spaceElem.space_role.getOrElse("container")) // Default space role is Container
      }
      process.spaces = process.spaces :+ orig
      if (isNestedOpsLeft(process, test_space)) {
        orig.findBrickInCont()
        makeNestedSpaces(process, test_space, orig.findBrickInCont(), space_elems, level + 1)
      }
    }
  }
  /*
  Checkers
  */
  def isNestedOpsLeft(process: BProcess, test_space: List[BPSpaceDTO]): Boolean = {
    val latestNest = test_space.reduceLeft(getLatestNest).nestingLevel
    val nowNest = test_space.find(_.id == process.spaces.last.id).get.nestingLevel
    latestNest != nowNest
  }
  def maxNestedLevel(s1: SpaceElementDTO, s2: SpaceElementDTO) = if (s1.space_owned > s2.space_owned) s1 else s2
  def maxNestedNow(s1: Space, s2: Space) = if (s1.id.get > s2.id.get) s1 else s2
  def getLatestNest(s1: BPSpaceDTO, s2: BPSpaceDTO) = if (s1.nestingLevel > s2.nestingLevel) s1 else s2
  /**
   * Validation for elements that store in spaces
   */
  def validateElements(front_elems:List[UndefElement], test_space: List[BPSpaceDTO], space_elems: List[SpaceElementDTO]): Boolean = {
    val frontsidz = front_elems.map(elem => elem.id)
    val spacidz = space_elems.map(elem => elem.id)
    val z = test_space.filter(space => !(frontsidz.contains(space.brick_front) || spacidz.contains(space.brick_nested))).length < 1
    val d = space_elems.filter(elem => test_space.contains(Some(elem.space_owned))).length < 1
    d && z
  }



}