package service

//import main.scala.process_parts._
//import main.scala.utils._
//import main.scala.MM._
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

import scala.annotation.tailrec


object BPServiceApp extends App {
   def check = "test"

   println("test")
   ElementRegistrator.apply
   // caster
   val process_dto = BPDAO.get(3).get
   val target = ProcElemDAO.findByBPId(3)

   val process = new BProcess(new Managment)
   val arrays = target.map(c => c.cast(process)).flatten.toArray


   println(arrays)
  process.push { Array[ProcElems](
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
  ) }
  process.push {

    arrays
   }

  val test_space = BPSpaceDAO.findByBPId(3)
  val space_elems = SpaceElemDAO.findByBPId(3)

  val front_bricks = process.findFrontBrick()


  def makeFrontSpaces(spacesDTO:List[BPSpaceDTO], bricks: Array[Brick], spaceElems: List[SpaceElementDTO]) = {
    val frontSpaces:List[BPSpaceDTO] = spacesDTO.filter(spaceDTO => spaceDTO.brick_front.isDefined )
    val frontSpacesElems = spaceElems.filter(spaceElem => frontSpaces.map(_.id.get).contains(spaceElem.space_owned))
    val origSpaces:List[Space] = frontSpaces.map(space => space.cast(process, frontSpacesElems)).flatten.toList
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
   // TODO: 2 ITERATORS
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

  if (validateElements(process))
    InvokeTracer.run_proc(process)
  else
    println("Error")


  // save log & station
  println(process.station.represent)
  println(process.logger.logs.map(log => println(log.element.id)))
  //println(ElementTracer.findByInfo(target.head.b_type, target.head.type_title))

  // station -> stationdb
  val dbstation = BPStationDAO.from_origin_station(process.station, process_dto)
  println(dbstation)

  val station_id = BPStationDAO.pull_object(dbstation)
  println("station id" + station_id)


  // logger -> loggerdb
  val dblogger = BPLoggerDAO.from_origin_lgr(process.logger, process_dto, station_id, test_space)//, station:Int = 1)
  //println(dblogger)
  dblogger.foreach(log => BPLoggerDAO.pull_object(log))


 /////////////
 ///////////
  // loggerdb -> logger(bp)
  val process1 = new BProcess(new Managment)
  process1.variety = process.variety
  process1.spaces = process.spaces
  println(process.logger.logs)
  println("process1.variety" + process1.variety.length)

//  println("ssss"+process1.findObjectByOrder(1))
//  println(process1.findObjectByOrder(3).get)
 // println(process1.variety.map(elem => elem.order).last)
//  println(process1.variety.find(elem => elem.order == 3))

  println(dblogger.get.map(log => println(log.order)))
  val logger_results = dblogger.get.map(log =>
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
  //log.space /|\
  process1.logger.logs = logger_results.toArray
  println(logger_results)
  
//////
  // stationdb -> station(bp)
  process1.station.update_variables(
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

println("is work?", process1.station.represent)

  // save to space

}

