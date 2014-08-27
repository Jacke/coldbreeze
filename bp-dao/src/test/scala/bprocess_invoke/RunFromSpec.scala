package bprocess_invoke

import org.specs2.mutable._
import org.specs2.specification.BeforeExample

import models.DAO._
import main.scala.utils._
import main.scala.bprocesses._
import main.scala.resources.scopes._
import com.github.nscala_time.time.Imports._
import models.DAO.conversion.BPInitiator

trait ProcessSample {
  val process_dto = BPDAO.get(1).get
  val target = ProcElemDAO.findByBPId(1)
   
  val process = BPInitiator.instance(process_dto, target)

  val dbstation = BPStationDAO.from_origin_station(process.station, process_dto)
  val station_id = BPStationDAO.pull_object(dbstation)
  lazy val dblogger = BPLoggerDAO.from_origin_lgr(process.logger, process_dto, station_id)//, station:Int = 1)

}

class RunInitiallySpec extends Specification with ProcessSample {


  "BProcess" should {
    "contain fetched/converted elements" in {
      process.variety.length > 1
    }

    InvokeTracer.run_proc(process)
    "runned" in {
      process.logger.logs.length > 1
      process.station.isRunned must beTrue
    }

    "Proc element have Composite values" in {
      process.findObjectByOrder(Some(1)).get.values.get.a_string.isEmpty must beFalse
    }

    "save process result" in {
      station_id > 1
    }

    "save bp state" in {
      //
      BPStationDAO.findById(station_id).isEmpty must beFalse
    }

    "fetching by order id" in {
      process.findObjectByOrder(Some(2)).isEmpty must beFalse
    }

    "save process logger" in {
      dblogger.isEmpty must beFalse
    }
    dblogger.foreach(log => BPLoggerDAO.pull_object(log))
  }


}

class RunFromSpec extends Specification with ProcessSample {

  val process1 = new BProcess(new Managment)
  process1.variety = process.variety


  "BProcess" should {
    "process station presented" in {
      process1.station.isStarted == false
    }

  // TODO: Change that shit to COMPOSITE 
  println(">>>>")
  println(dblogger)
  //val logger_results = dblogger.get.map(log => BPLoggerResult(process1.findObjectByOrder(log.order).get, composite=None, log.order, None, process1.station, log.invoked, log.expanded, log.container, log.date))
  //"logger results" in {
  //  logger_results.length > 1
  //}
  }
    // this is equivalent to: def e1 = this.apply { ... }
    //def e1 = this { tree.removeNodes(2, 3) must have size(2) }
    //def e2 = this { tree.removeNodes(2, 3, 4) must have size(1) }

}

class ConditionSpec extends Specification with ProcessSample {

}
class OrderSpec extends  Specification with ProcessSample {

}
// Run BP from DB when it paused
// update CV from logger
// check log and log cv for updates
//