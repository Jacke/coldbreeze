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

import main.scala.bprocesses.links._
import main.scala.utils.Space
import main.scala.utils.InputParamProc
import models.DAO.conversion.Implicits.fetch_cv

import main.scala.bprocesses._
import main.scala.simple_parts.process.Units._



object TestRunning extends App {
  RunnerWrapper2.run(22)
}
  
object RunnerWrapper2 {
  
  
  def saveSession(bprocess: BProcess, bprocess_dto: BProcessDTO, lang: Option[String] = Some("en")) = {
    val session = BPSession(
  None, 
  bprocess_dto.id.get,
  Some(org.joda.time.DateTime.now()),
  Some(org.joda.time.DateTime.now())
  )
      BPSessionDAO.pull_object(session)
  }
  def saveSessionStates(bprocess: BProcess, bprocess_dto: BProcessDTO, session_id: Int) = {
    val origin_states = BPStateDAO.findByBP(bprocess_dto.id.get)
      origin_states.map(state => 
        BPSessionState(
          None, 
          bprocess_dto.id.get,
          session_id,
          state.title, 
          state.opposite,
          state.process_state,
          state.on,
          state.on_rate,
          state.front_elem_id,
          state.space_elem_id,
          space_id = state.space_id,
          origin_state = state.id,
          Some(org.joda.time.DateTime.now()),
          Some(org.joda.time.DateTime.now()), 
          lang = state.lang)
                ).map(session_state => BPSessionStateDAO.pull_object(session_state))
  }
  
  def saveState(bprocess: BProcess, bprocess_dto: BProcessDTO, session_id: Int, lang: Option[String] = Some("en")) = {
    val station = BPStationDAO.from_origin_station(bprocess.station, bprocess_dto, session_id = session_id)
    val station_id = BPStationDAO.pull_object(station, lang)
    station_id
  }
  def saveLogsInit(bprocess: BProcess, bprocess_dto: BProcessDTO, station_id: Int, spacesDTO: List[BPSpaceDTO]) = {
    val dblogger = BPLoggerDAO.from_origin_lgr(bprocess.logger, bprocess_dto, station_id, spacesDTO)
    println(dblogger)
    dblogger.foreach(log => BPLoggerDAO.pull_object(log))
  }
  def saveStationLog(process_id: Int, station_id: Int, bprocess: BProcess) = {
    val station_loggers = bprocess.station.station_logger.logs.map(s => BPStationLoggeDAO.from_origin_station(process_id, station_id, s))
    station_loggers.foreach(s => BPStationLoggeDAO.pull_object(s))
  }





















  //def run(bpID: Int, lang: Option[String] = Some("en")):Option[Int] = { Some(1) }
  //def runFrom(station_id:Int, bpID:Int, params: List[InputParamProc]):Option[Int] = { Some(1) }
  
  def run(bpID: Int, lang: Option[String] = Some("en") ):Option[BProcess] = {
    //presenceValidate
    val bpDTO = BPDAO.get(bpID).get
    val processRunned1 = initiate(bpID, false, bpDTO)
    //val processRunned2 = initiate2(bpID, false, processRunned1, bpDTO, session_id)
   
    Some(processRunned1) match {
      case Some(process) => process.allElements.foreach { element =>
          println()
          println("Title " + element.title + " " + element.id)
          println("states: " + element.states.length)
          println("session_states: " + element.session_states.length)
          println("reactions: " + element.reactions.length)
          println()
      }
    }
    Some(processRunned1)
  }
 





  /** ***
    * Core launch
    * @param bpID
    * @return BProcess original instance
    */
def initiate(bpID: Int, run_proc: Boolean = true, bpDTO: BProcessDTO, lang: Option[String] = Some("en") ):BProcess = {
    ElementRegistrator.apply
    // caster
    //val process_dto = BPDAO.get(bpID).get
    val target = ProcElemDAO.findByBPId(bpID)

    val process = new BProcess(new Managment)
    val arrays = target.map(c => c.cast(process)).flatten.toArray
    process.push {
      arrays.sortWith(_.order < _.order)
    }
    //process_dto
        val session_id = 1 // REMOVE THIS!!

    //initiate2(bpID, false, process, bpDTO,target, session_id)
    process
  }
def initiate2(bpID: Int, run_proc: Boolean = true, processRunned: BProcess, bpDTO: BProcessDTO, target: List[UndefElement],session_id: Int, lang: Option[String] = Some("en") ):BProcess = {
    val test_space = BPSpaceDAO.findByBPId(bpID)
    val space_elems = SpaceElemDAO.findByBPId(bpID)
    val process = processRunned
    val front_bricks = process.findFrontBrick()

    val session_id = saveSession(processRunned, bpDTO, lang)
    val station_id = saveState(processRunned, bpDTO, session_id, lang)
    val session_states_ids = saveSessionStates(processRunned, bpDTO, session_id)
    saveLogsInit(processRunned, bpDTO, station_id, BPSpaceDAO.findByBPId(bpID))
    saveStationLog(bpID, station_id, processRunned)


    /*
      Presence validation
     */
    if (front_bricks.length > 0 && test_space.length > 0) {
      makeFrontSpaces(process, test_space, front_bricks, space_elems)
      if (test_space.reduceLeft(getLatestNest).nestingLevel > 1) {
        makeNestedSpaces(process, test_space, process.findNestedBricks(), space_elems)
      }
    }

    val states:List[BPState] = BPStateDAO.findByBP(bpID)
    val session_states:List[BPSessionState] = BPSessionStateDAO.findByBPAndSession(bpID, session_id)
    val switches:List[UnitSwitcher] = SwitcherDAO.findByBPId(bpID)
    val reactions:List[UnitReaction] = ReactionDAO.findByBP(bpID)
    val reaction_state_out:List[UnitReactionStateOut] = ReactionStateOutDAO.findByReactions(reactions.map(react => react.id.get))
    val topologs = ElemTopologDAO.findByBP(bpID)

    reactions.foreach { react => react.reaction_state_outs ++= reaction_state_out.filter(sout => sout.reaction == react.id.get) }
    states.foreach { state => state.switchers ++= switches.filter(sw => sw.state_ref == state.id.get) }
    session_states.foreach { session_state => session_state.switchers ++= switches.filter(sw => Some(sw.state_ref) == session_state.origin_state)  }
  

    process.variety.foreach { element =>
      element.states ++= states.filter(state => state.front_elem_id == Some(element.id)) 
      element.session_states ++=  session_states.filter(state => state.front_elem_id == Some(element.id)) 
      element.reactions ++= reactions.filter(react => Some(react.element) == topologs.find(topo => topo.front_elem_id == Some(element.id)).get.front_elem_id ) 
    }
    process.spacesElements.foreach { element => 
      element.states ++=  states.filter(state => state.space_elem_id == Some(element.id)) 
      element.session_states ++=  session_states.filter(state => state.space_elem_id == Some(element.id)) 
      element.reactions ++= reactions.filter(react => Some(react.element) == topologs.find(topo => topo.space_elem_id == Some(element.id)).get.space_elem_id ) 
    }
    process.spaces.foreach { space => 
      space.states ++=  states.filter(state => state.space_id == space.id) 
      space.session_states ++=  session_states.filter(state => state.space_id == space.id) 
    }


    if (validateElements(target, test_space, space_elems) && run_proc)
      InvokeTracer.run_proc(process)
    else
      println("Error")
    process
}  
  
def runFrom(station_id:Int, bpID:Int, params: List[InputParamProc], session_id: Int):Option[Int]  = {

    val process_dto = BPDAO.get(bpID).get
    val target = ProcElemDAO.findByBPId(bpID)
    val process = new BProcess(new Managment)
    val arrays = target.map(c => c.cast(process)).flatten.toArray
  process.push {
    arrays.sortWith(_.order < _.order)
  }
  val logger_db = BPLoggerDAO.findByStation(station_id)
  val db_station = BPStationDAO.findById(station_id).get

    val test_space = BPSpaceDAO.findByBPId(bpID)
    val space_elems = SpaceElemDAO.findByBPId(bpID)
    val front_bricks = process.findFrontBrick()

    /*
      Presence validation
     */
    if (front_bricks.length > 0 && test_space.length > 0) {
      makeFrontSpaces(process, test_space, front_bricks, space_elems)
      if (test_space.reduceLeft(getLatestNest).nestingLevel > 1) {
        makeNestedSpaces(process, test_space, process.findNestedBricks(), space_elems)
      }
    }
    validateElements(target, test_space, space_elems)



    val states:List[BPState] = BPStateDAO.findByBP(bpID)
    val session_states:List[BPSessionState] = BPSessionStateDAO.findByBPAndSession(bpID, session_id)
    val switches:List[UnitSwitcher] = SwitcherDAO.findByBPId(bpID)
    val reactions:List[UnitReaction] = ReactionDAO.findByBP(bpID)
    val reaction_state_out:List[UnitReactionStateOut] = ReactionStateOutDAO.findByReactions(reactions.map(react => react.id.get))
    val topologs = ElemTopologDAO.findByBP(bpID)

    reactions.foreach { react => react.reaction_state_outs ++= reaction_state_out.filter(sout => sout.reaction == react.id.get) }
    states.foreach { state => state.switchers ++= switches.filter(sw => sw.state_ref == state.id.get) }
    session_states.foreach { session_state => session_state.switchers ++= switches.filter(sw => Some(sw.state_ref) == session_state.origin_state)  }
    

    process.variety.foreach { element =>
      element.states ++= states.filter(state => state.front_elem_id == Some(element.id)) 
      element.session_states ++=  session_states.filter(state => state.front_elem_id == Some(element.id)) 
      element.reactions ++= reactions.filter(react => Some(react.element) == topologs.find(topo => topo.front_elem_id == Some(element.id)).get.front_elem_id ) 
    }
    process.spacesElements.foreach { element => 
      element.states ++=  states.filter(state => state.space_elem_id == Some(element.id)) 
      element.session_states ++=  session_states.filter(state => state.space_elem_id == Some(element.id)) 
      element.reactions ++= reactions.filter(react => Some(react.element) == topologs.find(topo => topo.space_elem_id == Some(element.id)).get.space_elem_id ) 
    }
    process.spaces.foreach { space => 
      space.states ++=  states.filter(state => state.space_id == space.id) 
      space.session_states ++=  session_states.filter(state => state.space_id == space.id) 
    }



  val logger_results = logger_db.map(log =>
    BPLoggerResult(
      process.findObjectById(log.element, log.space_elem).get,
      composite=fetch_cv(log.comps),
      order = log.order,
      space = log.space,
      station = process.station,
      invoked = log.invoked,
      expanded = log.expanded,
      container = log.container,
      date = log.date))

  logger_results
  process.logger.logs = logger_results.toArray

  process.station.update_variables(
    db_station.state,
    db_station.step,
    db_station.space,
    db_station.container_step.toArray,
    db_station.expand_step.toArray,
    db_station.spaces_ids.toArray,
    db_station.started,
    db_station.finished,
    db_station.inspace,
    db_station.incontainer,
    db_station.inexpands,
    db_station.paused
  )
    /* State sync */
    process.restoreCVOfElems
    println(process)

    process.inputPmsApply(params)
    /*
      *
      
    InvokeTracer.run_proc(process)
      *
    */
    process
    val station_updated = BPStationDAO.from_origin_station(process.station, process_dto)
    BPStationDAO.update(station_id, station_updated)


    /* LOGS UPDATE */
    logger_results
    val logger_db_after = BPLoggerDAO.from_origin_lgr(process.logger, process_dto, station_id, test_space)
    println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")

    logger_db_after.foreach(log => BPLoggerDAO.pull_object_from(station_id, log))

    //saveStationLog(bpID, station_id, process)

    Some(station_id)
  }
  
  
  
  
  
  
  
  
  
  /*
  * Helpers
  */
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









  
  
  
  
  
  
  
  
  def initFrom(station_id:Int, bpID:Int, params: List[InputParamProc]):BProcess  = {

    val process_dto = BPDAO.get(bpID).get
    val target = ProcElemDAO.findByBPId(bpID)
    val process = new BProcess(new Managment)
    val arrays = target.map(c => c.cast(process)).flatten.toArray
  process.push {
    arrays.sortWith(_.order < _.order)
  }
  val logger_db = BPLoggerDAO.findByStation(station_id)
  val db_station = BPStationDAO.findById(station_id).get

    val test_space = BPSpaceDAO.findByBPId(bpID)
    val space_elems = SpaceElemDAO.findByBPId(bpID)
    val front_bricks = process.findFrontBrick()



    /*
      Presence validation
     */
    if (front_bricks.length > 0 && test_space.length > 0) {
      makeFrontSpaces(process, test_space, front_bricks, space_elems)
      if (test_space.reduceLeft(getLatestNest).nestingLevel > 1) {
        makeNestedSpaces(process, test_space, process.findNestedBricks(), space_elems)
      }
    }
    validateElements(target, test_space, space_elems)











  val logger_results = logger_db.map(log =>
    BPLoggerResult(
      process.findObjectById(log.element, log.space_elem).get,
      composite=fetch_cv(log.comps),
      order = log.order,
      space = log.space,
      station = process.station,
      invoked = log.invoked,
      expanded = log.expanded,
      container = log.container,
      date = log.date))

  logger_results
  process.logger.logs = logger_results.toArray

  process.station.update_variables(
    db_station.state,
    db_station.step,
    db_station.space,
    db_station.container_step.toArray,
    db_station.expand_step.toArray,
    db_station.spaces_ids.toArray,
    db_station.started,
    db_station.finished,
    db_station.inspace,
    db_station.incontainer,
    db_station.inexpands,
    db_station.paused
  )
    /* State sync */
    process.restoreCVOfElems

      process  
  }
  
  
}


























  
 object RunnerWrapper {

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

  /** ***
    * Core launch
    * @param bpID
    * @return BProcess original instance
    */
  def initiate(bpID: Int, run_proc: Boolean = true):BProcess = {
    ElementRegistrator.apply
    // caster
    val process_dto = BPDAO.get(bpID).get
    val target = ProcElemDAO.findByBPId(bpID)

    val process = new BProcess(new Managment)
    val arrays = target.map(c => c.cast(process)).flatten.toArray
    process.push {
      arrays.sortWith(_.order < _.order)
    }
    val test_space = BPSpaceDAO.findByBPId(bpID)
    val space_elems = SpaceElemDAO.findByBPId(bpID)
    val front_bricks = process.findFrontBrick()

    /*
      Presence validation
     */
    if (front_bricks.length > 0 && test_space.length > 0) {
      makeFrontSpaces(process, test_space, front_bricks, space_elems)
      if (test_space.reduceLeft(getLatestNest).nestingLevel > 1) {
        makeNestedSpaces(process, test_space, process.findNestedBricks(), space_elems)
      }
    }

    if (validateElements(target, test_space, space_elems) && run_proc)
      InvokeTracer.run_proc(process)
    else
      println("Error")
    process
  }









  def run(bpID: Int, lang: Option[String] = Some("en") ):Option[Int] = {
    //presenceValidate
    val processRunned = initiate(bpID)
    val bpDTO = BPDAO.get(bpID).get

    val station_id = saveState(processRunned, bpDTO, lang)
    saveLogsInit(processRunned, bpDTO, station_id, BPSpaceDAO.findByBPId(bpID))
    saveStationLog(bpID, station_id, processRunned)
    Some(station_id)
  }

  def saveState(bprocess: BProcess, bprocess_dto: BProcessDTO, lang: Option[String] = Some("en")) = {
    val station = BPStationDAO.from_origin_station(bprocess.station, bprocess_dto)
    val station_id = BPStationDAO.pull_object(station, lang)
    station_id
  }
  def saveLogsInit(bprocess: BProcess, bprocess_dto: BProcessDTO, station_id: Int, spacesDTO: List[BPSpaceDTO]) = {
    val dblogger = BPLoggerDAO.from_origin_lgr(bprocess.logger, bprocess_dto, station_id, spacesDTO)
    println(dblogger)
    dblogger.foreach(log => BPLoggerDAO.pull_object(log))
  }
  def saveStationLog(process_id: Int, station_id: Int, bprocess: BProcess) = {
    //val station_loggers = bprocess.station.station_logger.logs.map(s => BPStationLoggeDAO.from_origin_station(process_id, station_id, s))
    //station_loggers.foreach(s => BPStationLoggeDAO.pull_object(s))
  }

  /****************************************
  *****************************************
  *****************************************
  *****************************************
  *****************************************
  *****************************************
  *****************************************
  *****************************************
  ******************************************/
  def runFrom(station_id:Int, bpID:Int, params: List[InputParamProc]):Option[Int]  = {

    val process_dto = BPDAO.get(bpID).get
    val target = ProcElemDAO.findByBPId(bpID)
    val process = new BProcess(new Managment)
    val arrays = target.map(c => c.cast(process)).flatten.toArray
  process.push {
    arrays.sortWith(_.order < _.order)
  }
  val logger_db = BPLoggerDAO.findByStation(station_id)
  val db_station = BPStationDAO.findById(station_id).get

    val test_space = BPSpaceDAO.findByBPId(bpID)
    val space_elems = SpaceElemDAO.findByBPId(bpID)
    val front_bricks = process.findFrontBrick()



    /*
      Presence validation
     */
    if (front_bricks.length > 0 && test_space.length > 0) {
      makeFrontSpaces(process, test_space, front_bricks, space_elems)
      if (test_space.reduceLeft(getLatestNest).nestingLevel > 1) {
        makeNestedSpaces(process, test_space, process.findNestedBricks(), space_elems)
      }
    }
    validateElements(target, test_space, space_elems)











  val logger_results = logger_db.map(log =>
    BPLoggerResult(
      process.findObjectById(log.element, log.space_elem).get,
      composite=fetch_cv(log.comps),
      order = log.order,
      space = log.space,
      station = process.station,
      invoked = log.invoked,
      expanded = log.expanded,
      container = log.container,
      date = log.date))

  logger_results
  process.logger.logs = logger_results.toArray

  process.station.update_variables(
    db_station.state,
    db_station.step,
    db_station.space,
    db_station.container_step.toArray,
    db_station.expand_step.toArray,
    db_station.spaces_ids.toArray,
    db_station.started,
    db_station.finished,
    db_station.inspace,
    db_station.incontainer,
    db_station.inexpands,
    db_station.paused
  )
    /* State sync */
    process.restoreCVOfElems
    println(process)

    process.inputPmsApply(params)
    
    InvokeTracer.run_proc(process)

    process
    val station_updated = BPStationDAO.from_origin_station(process.station, process_dto)
    BPStationDAO.update(station_id, station_updated)


    /* LOGS UPDATE */
    logger_results
    val logger_db_after = BPLoggerDAO.from_origin_lgr(process.logger, process_dto, station_id, test_space)
    println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")

    logger_db_after.foreach(log => BPLoggerDAO.pull_object_from(station_id, log))

    //saveStationLog(bpID, station_id, process)


    /*            */
    Some(station_id)
  }
  
  
  
  
  
  
  
  def initFrom(station_id:Int, bpID:Int, params: List[InputParamProc]):BProcess  = {

    val process_dto = BPDAO.get(bpID).get
    val target = ProcElemDAO.findByBPId(bpID)
    val process = new BProcess(new Managment)
    val arrays = target.map(c => c.cast(process)).flatten.toArray
  process.push {
    arrays.sortWith(_.order < _.order)
  }
  val logger_db = BPLoggerDAO.findByStation(station_id)
  val db_station = BPStationDAO.findById(station_id).get

    val test_space = BPSpaceDAO.findByBPId(bpID)
    val space_elems = SpaceElemDAO.findByBPId(bpID)
    val front_bricks = process.findFrontBrick()



    /*
      Presence validation
     */
    if (front_bricks.length > 0 && test_space.length > 0) {
      makeFrontSpaces(process, test_space, front_bricks, space_elems)
      if (test_space.reduceLeft(getLatestNest).nestingLevel > 1) {
        makeNestedSpaces(process, test_space, process.findNestedBricks(), space_elems)
      }
    }
    validateElements(target, test_space, space_elems)











  val logger_results = logger_db.map(log =>
    BPLoggerResult(
      process.findObjectById(log.element, log.space_elem).get,
      composite=fetch_cv(log.comps),
      order = log.order,
      space = log.space,
      station = process.station,
      invoked = log.invoked,
      expanded = log.expanded,
      container = log.container,
      date = log.date))

  logger_results
  process.logger.logs = logger_results.toArray

  process.station.update_variables(
    db_station.state,
    db_station.step,
    db_station.space,
    db_station.container_step.toArray,
    db_station.expand_step.toArray,
    db_station.spaces_ids.toArray,
    db_station.started,
    db_station.finished,
    db_station.inspace,
    db_station.incontainer,
    db_station.inexpands,
    db_station.paused
  )
    /* State sync */
    process.restoreCVOfElems

      process  
  }
  
  
} 
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  

object FixBug1488 { //extends App {
    def check = "test"

    println("test")
    ElementRegistrator.apply
    // caster
    val process_dto = BPDAO.get(20).get
    val target = ProcElemDAO.findByBPId(20)

    val process = new BProcess(new Managment)
    val arrays = target.map(c => c.cast(process)).flatten.toArray

    process.push {

      arrays.sortWith(_.order < _.order)
    }



  //InvokeTracer.run_proc(process)

  val station_id = service.RunnerWrapper.run(13)



  //InvokeTracer.run_proc(process)

  //process
  //service.RunnerWrapper.runFrom(station_id.get, 13, Map(30 -> "confirmed"))

  //service.RunnerWrapper.runFrom(station_id.get, 13, Map(31 -> "confirmed"))
}
object FixBug5555 {

  service.RunnerWrapper.run(12)
}


/*


object FixBug //extends App {
  val process_dto = BPDAO.get(9).get
  val target = ProcElemDAO.findByBPId(9)
  val station_id = 5

  val process = new BProcess(new Managment)
  val arrays = target.map(c => c.cast(process)).flatten.toArray

  process.push {

    arrays.sortWith(_.order < _.order)
  }

  val logger_db = BPLoggerDAO.findByStation(station_id)
  val db_station = BPStationDAO.findById(station_id).get

  val logger_results = logger_db.map(log =>
    BPLoggerResult(
      process.findObjectById(log.element, log.space_elem).get,
      composite=fetch_cv(log.comps),
      order = log.order,
      space = log.space,
      station = process.station,
      invoked = log.invoked,
      expanded = log.expanded,
      container = log.container,
      date = log.date))

  logger_results
  process.logger.logs = logger_results.toArray
  process.station.update_variables(
    db_station.state,
    db_station.step,
    db_station.space,
    db_station.container_step.toArray,
    db_station.expand_step.toArray,
    db_station.spaces_ids.toArray,
    db_station.started,
    db_station.finished,
    db_station.inspace,
    db_station.incontainer,
    db_station.inexpands,
    db_station.paused
  )
  println()
  //process.inputPmsApply(Map(33 -> "confirmed"))
  //process.inputPmsApply(Map(112 -> "confirmed"))
  //process.inputPmsApply(Map(113 -> "confirmed"))


  // case class InputParamProc(felem: Option[Int], selem: Option[Int], param: String, args: List[String])
  //service.RunnerWrapper.runFrom(5, 9, Map(33 -> "confirmed", 112 -> "confirmed", 113 -> "confirmed"))
  //InvokeTracer.run_proc(process)
  process
  println(process.station.finished)
}

object FixBug643673463434 {//extends App {


  val proc = service.RunnerWrapper.initiate(9)

  proc.logger.logs.foreach { log =>
    println(log.element.id)
  }
}



*/