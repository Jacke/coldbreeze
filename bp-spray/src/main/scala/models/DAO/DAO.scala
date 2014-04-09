package models.DAO

/**
 * Case classes for casting
 */
import main.scala.utils.Keepr


/**
  * Composite plugin
  * BPLink
  * Foreignkey ondelete
  * Joda datetime
  * Auth
  **/


/**
 * DAO Config
 */

object FirstExample {
  import scala.slick.driver.PostgresDriver.simple._
  val database = Database.forURL("jdbc:postgresql://localhost/minority", driver = "org.postgresql.Driver", user = "postgres", password = "12344321")

}

object BPSerial {
  import main.scala.bprocesses.BProcess
  import main.scala.utils._
  import main.scala.bprocesses._
  import main.scala.resources.scopes._
  // caster
  def BPRun(id: Int) {
// find
    val process_dto = BPDTO.get(id)
// find elems
    val target = ProcElemCRUD.findByBPId(id)
   println(target)
//****** find spaces
//****** find space elems

// instanciate
 val process = instance(process_dto, target)

// invoke
    InvokeTracer.run_proc(process)
// save
    save(process, process_dto)


  
}

// TODO: Clean stuff below

  def BPRunFrom(id: Int) {
    // find
    // find elems
    // find spaces
    // find space elems

    // find station
    // find logger

  }
  def instance(bpdto: BProcessDTO, els: List[UndefElement]):BProcess = {

    val process = new BProcess(new Managment)

   val arrays = els.map(c => c.cast(process)).flatten.toArray
   println(arrays)
   process.push {
    arrays
   }   
    /**
     * push space
     * add to space
     */
  process
  }

  def dirt_instance() = {
// loggerdb -> logger(bp)
/*
  val process1 = new BProcess(new Managment)
  process1.variety = process.variety
  println(process.logger.logs)
  println("process1.variety" + process1.variety.length)

  println("ssss"+process1.findObjectByOrder(1))
  println(process1.findObjectByOrder(3).get)
  println(process1.variety.map(elem => elem.order).last)
  println(process1.variety.find(elem => elem.order == 3))

  println(dblogger.get.map(log => println(log.order)))
  val logger_results = dblogger.get.map(log => BPLoggerResult(process1.findObjectByOrder(log.order).get, log.order, None, //log.space
     process1.station, log.invoked, log.expanded, log.container, new java.util.Date(log.date.getTime()))
) 
  println(logger_results)
  

  // stationdb -> station(bp)
  val dbstation = BPStationDTO.from_origin_station(process.station, process_dto)
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
    // invoke runfrom
    // save
*/
  }

  def save(process: BProcess, process_dto: BProcessDTO):Boolean = {
  // station -> stationdb
  val dbstation = BPStationDTO.from_origin_station(process.station, process_dto)
  println(dbstation)
  
  val station_id = BPStationDTO.pull_object(dbstation)
  println("station id" + station_id)

  // logger -> loggerdb
  val dblogger = BPLoggerDTO.from_origin_lgr(process.logger, process_dto, station_id)//, station:Int = 1)
  println(dblogger)
  dblogger.foreach(log => BPLoggerDTO.pull_object(log))
    true
  }
}