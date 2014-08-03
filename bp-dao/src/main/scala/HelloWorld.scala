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
import main.scala.simple_parts.process.{Brick, ProcElems, ContainerBrick}
import main.scala.simple_parts.process.control._
import main.scala.simple_parts.process.data._
import main.scala.utils._
import main.scala.resources.scopes._

import main.scala.bprocesses.links._
import main.scala.utils.Space

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
  InvokeTracer.run_proc(process)
  // save log & station
  println(process.station.represent)
  println(process.logger.logs.map(log => println(log.element.id)))
  //println(ElementTracer.findByInfo(target.head.b_type, target.head.type_title))

  // station -> stationdb
  val dbstation = BPStationDAO.from_origin_station(process.station, process_dto)
  println(dbstation)

  //val station_id = BPStationDAO.pull_object(dbstation)
  //println("station id" + station_id)


  // logger -> loggerdb
  //val dblogger = BPLoggerDAO.from_origin_lgr(process.logger, process_dto, station_id)//, station:Int = 1)
  //println(dblogger)
  //dblogger.foreach(log => BPLoggerDAO.pull_object(log))


/*
  // Pull front spaces
  val front_bricks = process.findFrontBrick()
  println(front_bricks.length)
  // FILTER NESTED SPACES

  println(process.review())
  println("")
  println("")
  println("")
  println("")
  val nested_spaces_ids = space_elems.flatMap(space_elem => space_elem.space_own)

  val front_space_space_elems = space_elems.filter(space_elem => !nested_spaces_ids.contains(space_elem.space_owned))
  val nested_space_space_elems = space_elems.filter(space_elem => nested_spaces_ids.contains(space_elem.space_owned))

  val front_space_space_elems_ids = front_space_space_elems.map(space_elem => space_elem.space_owned)
  val nested_space_space_elems_ids = nested_space_space_elems.map(space_elem => space_elem.space_owned)

  val front_spaces = test_space.filter(space => front_space_space_elems_ids.contains(space.id.get))
  val nested_spaces = test_space.filter(space => !front_space_space_elems_ids.contains(space.id.get))
  val converted_space = front_spaces.map(space => space.cast(process, front_space_space_elems)).flatten.toArray    
  converted_space.foreach(sp => println(sp.index + " " + sp.id + " " + sp.brick_owner))

  println(process.review())
  println("")
  println("NESTED SPACE" + nested_spaces.length)
  println("")
  println("")
    converted_space.foreach { fspace =>
      space_elems.foreach { space_elem => 
        println(space_elem.space_owned + " " + fspace.id)
       if (space_elem.space_owned == fspace.id.get) {
          
          fspace.addToSpace(space_elem.castToSpace(process, fspace).get, space_elem.space_role.get)
          //fspace.addToSpace(,space_id = Option(fspace), "container")
        }
      }
      process.spaces = process.spaces :+ fspace
    }
      println(process.review())
  println("")
  println("")
  println("")
  println("")

// Loop
  val converted_space_nested_space = nested_spaces.map(space => space.cast_nested(process, nested_space_space_elems)).flatten.toArray    
  
  def fetch_space(converted_space: Array[Space], space_elems: List[SpaceElementDTO]) = { 
    converted_space.foreach { fspace =>
      space_elems.foreach { space_elem => 
        println(space_elem.space_owned + " " + fspace.id)
       if (space_elem.space_owned == fspace.id.get) {
          
          fspace.addToSpace(space_elem.castToSpace(process, fspace).get, space_elem.space_role.get)
          //fspace.addToSpace(,space_id = Option(fspace), "container")
        }
      }
      process.spaces = process.spaces :+ fspace
    }
  }
  fetch_space(converted_space_nested_space, nested_space_space_elems)
  println(process.review())
  println("")
  println("")
  println("")
  println("")
    println(process.spaces.find(_.id == Some(4)).get.container.length)
  println(process.spaces.find(_.id == Some(4)).get.container.head.id)
  println(process.spaces.length)

  def fetch_space_elems = {

  }
 */








///////////
/*
   InvokeTracer.run_proc(process)
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
  val dblogger = BPLoggerDAO.from_origin_lgr(process.logger, process_dto, station_id)//, station:Int = 1)
  println(dblogger)
  dblogger.foreach(log => BPLoggerDAO.pull_object(log))

 /////////////
 ///////////
  // loggerdb -> logger(bp)
  val process1 = new BProcess(new Managment)
  process1.variety = process.variety
  println(process.logger.logs)
  println("process1.variety" + process1.variety.length)

  println("ssss"+process1.findObjectByOrder(1))
  println(process1.findObjectByOrder(3).get)
  println(process1.variety.map(elem => elem.order).last)
  println(process1.variety.find(elem => elem.order == 3))

  println(dblogger.get.map(log => println(log.order)))
  val logger_results = dblogger.get.map(log =>
    BPLoggerResult(
      process1.findObjectByOrder(log.order).get,
      composite=None,
      order = log.order,
      space = None,
      station = process1.station,
      invoked = log.invoked,
      expanded = log.expanded,
      container = log.container,
      date = log.date))
  //log.space /|\

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
*/
}

