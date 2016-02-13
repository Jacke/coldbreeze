package security

import models.User
import service.DemoUser
import securesocial.core._
import models.DAO.BProcessDTO
import models.DAO.BPDAO
import models.DAO._
import models.DAO.resources._
import models.DAO.CompositeValues
import play.api.Play.current

import main.scala.bprocesses._
import main.scala.simple_parts.process.Units._
import models.DAO.reflect._
import models.DAO.conversion._
import ProcHistoryDAO._
import helpers._
import decorators._
import builders._
  import scala.concurrent.ExecutionContext.Implicits.global

  import scala.concurrent.duration.Duration
  import scala.concurrent.{ExecutionContext, Awaitable, Await, Future}
  import scala.util.Try

/* Base */
object BRes {
    // CONSTANTS
    // Processes
    // * CRUD
    
    // Front elements, space, space elements
    // * CRUD
def procIsOwnedByBiz(business: Int, process_id: Int):Boolean = {
    BPDAO.get(process_id) match {
      case Some(bprocess) => { 
        println(s"procIsOwnedByBiz ${business}:${process_id}")
        if (bprocess.business == business) {
          true 
        }
        else {
          false
        }
      }
      case _ => false
    }
}
def processesIsOwnedByBiz(business: Int, processes_ids: List[Int]):Future[Boolean] = {
    BPDAOF.gets(processes_ids).map { processes =>
      processes.map(proc => proc.business == business).reduce(_&&_)
    }
}
def processesIdsIsOwnedByBiz(business: Int, processes_ids: List[Int]):Future[List[Int]] = {
    BPDAOF.gets(processes_ids).map { processes =>
      val realProcessIds = processes.map(p => p.id.getOrElse(0)).toList
      processes_ids.filter(id => realProcessIds.contains(id))
    }
}
def launchIsOwnedByBiz(business: Int, launch_id: Int):Boolean = {
    val launch = BPSessionDAO.get(launch_id).get
    BPDAO.get(launch.process) match {
      case Some(bprocess) => { 
        if (bprocess.business == business) {
          true 
        }
        else {
          false
        }
      }
      case _ => false
    }
}
def stationSecured(station_id: Int, email: String, business_id: Int):Boolean = {
  BPStationDAO.findById(station_id) match {
    case Some(station) => {
      procIsOwnedByBiz(station.process, business_id)
    }
    case _ => false
  }
}
def sessionSecured(session_id: Int, email: String, business_id: Int): Boolean = {
  BPSessionDAO.get(session_id) match {
    case Some(session) => {
      procIsOwnedByBiz(process_id = session.process, business = business_id)
    }
    case _ => false
  }
}

}

object ACLResources {
	// view
	// edit
	// interact
	// all
}