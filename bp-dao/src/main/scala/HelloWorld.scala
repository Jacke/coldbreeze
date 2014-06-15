package service

//import main.scala.process_parts._
//import main.scala.utils._
//import main.scala.MM._
import models.DAO._
import main.scala.utils._
import main.scala.bprocesses._
import main.scala.resources.scopes._
import com.github.nscala_time.time.Imports._

object BPServiceApp extends App {
   def check = "test"

   println("test")
   ElementRegistrator.apply
   // caster
   val process_dto = BPDAO.get(1).get
   val target = ProcElemDAO.findByBPId(1)
   println(target)
   
   val process = new BProcess(new Managment)

   val arrays = target.map(c => c.cast(process)).flatten.toArray
   println(arrays)
   process.push {
    arrays
   }   
   println(process.variety.length)
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

