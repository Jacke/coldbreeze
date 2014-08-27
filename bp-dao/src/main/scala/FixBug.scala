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
import models.DAO.conversion.Implicits.fetch_cv


object FixBug3 {//extends App {
  def check = "test"

  println("test")
  ElementRegistrator.apply
  // caster
  val process_dto = BPDAO.get(13).get
  val target = ProcElemDAO.findByBPId(13)

  val process = new BProcess(new Managment)
  val arrays = target.map(c => c.cast(process)).flatten.toArray

  process.push {

    arrays.sortWith(_.order < _.order)
  }
/*
  process.push {
    Array[ProcElems](
      new Note(
        id = 2,
        title = "Some note",
        desc = "Useful note",
        values = None,
        process,
        b_type = "block",
        type_title = "note",
        order = 1,
        space_parent = None,
        space_role = None),

      new Confirm(id = 3,
        title = "Some note",
        desc = "Useful note",
        values = Option(CompositeValues(a_bool = Option(false))),
        process,
        b_type = "block",
        type_title = "note",
        order = 2,
        space_parent = None,
        space_role = None)
    )
  }*/

  InvokeTracer.run_proc(process)
  process

  process.inputPmsApply(Map(30 -> "confirmed"))

  process

  InvokeTracer.run_proc(process)

  process.inputPmsApply(Map(31 -> "confirmed"))

  InvokeTracer.run_proc(process)

  process
}
object FixBug extends App {

  service.RunnerWrapper.runFrom(41, 12, Map(10 -> "confirmed"))
}





object FixBug666 {//extends App {
  val process_dto = BPDAO.get(13).get
  val target = ProcElemDAO.findByBPId(13)
  val station_id = 34

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

  process.inputPmsApply(Map(30 -> "confirmed"))
  process.inputPmsApply(Map(31 -> "confirmed"))

  InvokeTracer.run_proc(process)
  process
  println(process.station.finished)
}

object FixBug1 {


  val proc = service.RunnerWrapper.initiate(12)

  proc.logger.logs.foreach { log =>
    println(log.element.id)
  }
}


object RunnerWrapper {
  type StationID = Int
  def initiate(bpID: Int):BProcess = {
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

    def makeFrontSpaces(spacesDTO:List[BPSpaceDTO], bricks: Array[Brick], spaceElems: List[SpaceElementDTO]) = {
      val frontSpaces:List[BPSpaceDTO] = spacesDTO.filter(spaceDTO => spaceDTO.brick_front.isDefined )
      val frontSpacesElems = spaceElems.filter(spaceElem => frontSpaces.map(_.id.get).contains(spaceElem.space_owned))
      val origSpaces:List[Space] = frontSpaces.map(space => space.castFront(process, frontSpacesElems)).flatten.toList
      fillFrontSpaceElems(process, origSpaces, frontSpacesElems)
    }
    def fillFrontSpaceElems(process: BProcess, origSpaces: List[Space], FrontSpaceElems: List[SpaceElementDTO]) = {
      origSpaces.foreach { orig =>
        FrontSpaceElems.filter(fs => fs.space_owned == orig.id.get).foreach { spaceElem =>
          orig.addToSpace(spaceElem.castToSpace(process, orig).get, spaceElem.space_role.get)
        }
        process.spaces = process.spaces :+ orig
      }
    }
    def makeNestedSpaces(spacesDTO:List[BPSpaceDTO], bricks: Array[Brick], spaceElems: List[SpaceElementDTO], level: Int = 2) {
      val nestedSpaces:List[BPSpaceDTO] = spacesDTO.filter(spaceDTO => spaceDTO.brick_nested.isDefined && spaceDTO.nestingLevel == level) // NESTING LEVEL
      val nestedSpacesElems = spaceElems.filter(spaceElem => nestedSpaces.map(_.id.get).contains(spaceElem.space_owned))
      val origSpaces:List[Space] = nestedSpaces.map(space => space.cast_nested(process, nestedSpacesElems)).flatten.toList
      fillNestedSpacesElems(process, origSpaces, nestedSpacesElems, level)

    }
    def fillNestedSpacesElems(process: BProcess, origSpaces: List[Space], nestedSpacesElems: List[SpaceElementDTO], level: Int) = {
      origSpaces.foreach { orig =>
        nestedSpacesElems.filter(fs => fs.space_owned == orig.id.get).foreach { spaceElem =>
          orig.addToSpace(spaceElem.castToSpace(process, orig).get, spaceElem.space_role.get)
        }
        process.spaces = process.spaces :+ orig
        if (isNestedOpsLeft(process)) {
          orig.findBrickInCont()
          makeNestedSpaces(test_space, orig.findBrickInCont(), space_elems, level + 1)
        }
      }
    }
    /*
    Checkers
    */
    def isNestedOpsLeft(process: BProcess): Boolean = {
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
    def validateElements(test_space: List[BPSpaceDTO], space_elems: List[SpaceElementDTO]): Boolean = {
      test_space
      space_elems
      true
    }


    /*
      Presence validation
     */
    if (front_bricks.length > 0 && test_space.length > 0) {
      makeFrontSpaces(test_space, front_bricks, space_elems)
      if (test_space.reduceLeft(getLatestNest).nestingLevel > 1) {
        makeNestedSpaces(test_space, process.findNestedBricks(), space_elems)
      }
    }
    println(process.spaces)

    if (validateElements(test_space, space_elems))
      InvokeTracer.run_proc(process)
    else
      println("Error")
    process
  }









  def run(bpID: Int):Option[StationID] = {
    //presenceValidate
    val processRunned = initiate(bpID)
    val bpDTO = BPDAO.get(bpID).get

    val station_id = saveState(processRunned, bpDTO)
    saveLogsInit(processRunned, bpDTO, station_id, BPSpaceDAO.findByBPId(bpID))
    Some(station_id)
  }

  def saveState(bprocess: BProcess, bprocess_dto: BProcessDTO) = {
    val station = BPStationDAO.from_origin_station(bprocess.station, bprocess_dto)
    val station_id = BPStationDAO.pull_object(station)
    station_id
  }
  def saveLogsInit(bprocess: BProcess, bprocess_dto: BProcessDTO, station_id: Int, spacesDTO: List[BPSpaceDTO]) = {
    val dblogger = BPLoggerDAO.from_origin_lgr(bprocess.logger, bprocess_dto, station_id, spacesDTO)
    dblogger.foreach(log => BPLoggerDAO.pull_object(log))
  }































  def runFrom(station_id:Int, bpID:Int, params: Map[Int, String]):Option[StationID]  = {
    println(params)
    params.foreach(println(_))
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

    def makeFrontSpaces(spacesDTO:List[BPSpaceDTO], bricks: Array[Brick], spaceElems: List[SpaceElementDTO]) = {
      val frontSpaces:List[BPSpaceDTO] = spacesDTO.filter(spaceDTO => spaceDTO.brick_front.isDefined )
      val frontSpacesElems = spaceElems.filter(spaceElem => frontSpaces.map(_.id.get).contains(spaceElem.space_owned))
      val origSpaces:List[Space] = frontSpaces.map(space => space.castFront(process, frontSpacesElems)).flatten.toList
      fillFrontSpaceElems(process, origSpaces, frontSpacesElems)
    }
    def fillFrontSpaceElems(process: BProcess, origSpaces: List[Space], FrontSpaceElems: List[SpaceElementDTO]) = {
      origSpaces.foreach { orig =>
        FrontSpaceElems.filter(fs => fs.space_owned == orig.id.get).foreach { spaceElem =>
          orig.addToSpace(spaceElem.castToSpace(process, orig).get, spaceElem.space_role.get)
        }
        process.spaces = process.spaces :+ orig
      }
    }
    def makeNestedSpaces(spacesDTO:List[BPSpaceDTO], bricks: Array[Brick], spaceElems: List[SpaceElementDTO], level: Int = 2) {
      val nestedSpaces:List[BPSpaceDTO] = spacesDTO.filter(spaceDTO => spaceDTO.brick_nested.isDefined && spaceDTO.nestingLevel == level) // NESTING LEVEL
      val nestedSpacesElems = spaceElems.filter(spaceElem => nestedSpaces.map(_.id.get).contains(spaceElem.space_owned))
      val origSpaces:List[Space] = nestedSpaces.map(space => space.cast_nested(process, nestedSpacesElems)).flatten.toList
      fillNestedSpacesElems(process, origSpaces, nestedSpacesElems, level)

    }
    def fillNestedSpacesElems(process: BProcess, origSpaces: List[Space], nestedSpacesElems: List[SpaceElementDTO], level: Int) = {
      origSpaces.foreach { orig =>
        nestedSpacesElems.filter(fs => fs.space_owned == orig.id.get).foreach { spaceElem =>
          orig.addToSpace(spaceElem.castToSpace(process, orig).get, spaceElem.space_role.get)
        }
        process.spaces = process.spaces :+ orig
        if (isNestedOpsLeft(process)) {
          orig.findBrickInCont()
          makeNestedSpaces(test_space, orig.findBrickInCont(), space_elems, level + 1)
        }
      }
    }
    /*
    Checkers
    */
    def isNestedOpsLeft(process: BProcess): Boolean = {
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
    def validateElements(test_space: List[BPSpaceDTO], space_elems: List[SpaceElementDTO]): Boolean = {
      test_space
      space_elems
      true
    }


    /*
      Presence validation
     */
    if (front_bricks.length > 0 && test_space.length > 0) {
      makeFrontSpaces(test_space, front_bricks, space_elems)
      if (test_space.reduceLeft(getLatestNest).nestingLevel > 1) {
        makeNestedSpaces(test_space, process.findNestedBricks(), space_elems)
      }
    }
    validateElements(test_space, space_elems)











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

    process.inputPmsApply(params)
    InvokeTracer.run_proc(process)

    val station_updated = BPStationDAO.from_origin_station(process.station, process_dto)
    BPStationDAO.update(station_id, station_updated)


    Some(station_id)
  }
  /* Run From
  
  def syncLog = {

  }
  syncStates = {

  }

  /* Restore logs and station */
  val logger_db = BPLoggerDAO.findByStation(station_id)
  val db_station = BPStationDAO.findById(station_id)

 val logger_results = logger_db.get.map(log =>
    BPLoggerResult(
      process1.findObjectByOrder(log.order).get,
      composite=fetch_cv(log.comps),
      order = log.order,
      space = log.space,
      station = process1.station,
      invoked = log.invoked,
      expanded = log.expanded,
      container = log.container,
      date = log.date))

process.logger.logs = logger_results.toArray
process.station.update_variables(
                                dbstation.state,
                                dbstation.step,
                                dbstation.space,
                                dbstation.container_step.toArray,
                                dbstation.expand_step.toArray,
                                dbstation.started,
                                dbstation.finished,
                                dbstation.inspace,
                                dbstation.incontainer,
                                dbstation.inexpands,
                                dbstation.paused
                                )


/*
Presence validation
*/
  if (front_bricks.length > 0 && test_space.length > 0) {
    makeFrontSpaces(test_space, front_bricks, space_elems)
    if (test_space.reduceLeft(getLatestNest).nestingLevel > 1) {
      makeNestedSpaces(test_space, process.findNestedBricks(), space_elems)
    }
  }
  /* Restore CV
   */
  process.restoreCVOfElems

  if (BPServiceApp.validateElements(test_space, space_elems))
    InvokeTracer.run_proc(process)
  else
    println("Error")


  val dbstation = BPStationDAO.from_origin_station(process.station, process_dto)
  val station_id = BPStationDAO.update(station_id, dbstation)
  // logger -> loggerdb
  val dblogger = BPLoggerDAO.from_origin_lgr(process.logger, process_dto, station_id, test_space)//, station:Int = 1)
  dblogger.foreach(log => BPLoggerDAO.pull_new_object(log, station_id))
  /***********
  *********** Make validation only for new elements
  **********/
  station_id



  run
  saveState
  saveLogsFrom *//* Save only new logs */
}
