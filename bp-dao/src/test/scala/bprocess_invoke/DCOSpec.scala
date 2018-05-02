package bprocess_invoke

import main.scala.resources.Scope
import org.specs2.mutable._
import org.specs2.specification.BeforeExample

import models.DAO._
import main.scala.utils._
import main.scala.bprocesses._
import main.scala.resources.scopes._
import com.github.nscala_time.time.Imports._
import models.DAO.conversion.BPInitiator
/*
trait DCOSample {
  val process_dto = BPDAO.get(1).get
  val target = ProcElemDAO.findByBPId(1)

  val process = BPInitiator.instance(process_dto, target)

  val dbstation = BPStationDAO.from_origin_station(process.station, process_dto)
  val station_id = BPStationDAO.pull_object(dbstation)
  lazy val dblogger = BPLoggerDAO.from_origin_lgr(process.logger, process_dto, station_id)//, station:Int = 1)

}


class DCOSpec extends Specification with ProcessSample {
  val bprocess = new BProcess(new Managment)

  "Station DCO " should {
    "from dto" in {
      true
    }
    "from origin" in {
      new BPStation(bp = bprocess)
      true
    }

  }
  "BProcess DCO" should {
    "from dto" in {
      BProcessDTO(id = Option(1), title = "Some process", business = 1, service = 1)
      true
    }
    "from origin" in {
      bprocess
      true
    }
  }
  "BPSpaces DCO" should {
    "from dto" in {
      process.variety.length > 1
    }
    "from origin" in {
      process.variety.length > 1
    }
    "find space elem by order, type"
    "spaceelemcv update from logger"
    
  }

  "ProcElem" should {
    "from dto" in {
      process.variety.length > 1
    }
    "from origin" in {
      process.variety.length > 1
    }
  }
  "SpaceElem" should {
    "from dto" in {
      process.variety.length > 1
    }
    "from origin" in {
      process.variety.length > 1
    }
  }
  "Logger DCO" should {
    "from dto" in {
      process.variety.length > 1
    }
    "from origin" in {
      process.variety.length > 1
    }
  }


}
*/