package builders
  
import main.scala.bprocesses.{BProcess, BPLoggerResult}
import main.scala.simple_parts.process.ProcElems
import models.DAO.driver.MyPostgresDriver.simple._
import com.github.nscala_time.time.Imports._
//import com.github.tminglei.slickpg.date.PgDateJdbcTypes
import slick.model.ForeignKeyAction

import models.DAO.ProcElemDAO._
import models.DAO.BPDAO._
import models.DAO._
import models.DAO.BPStationDAO._
import models.DAO.conversion.DatabaseCred
import main.scala.utils.InputParamProc
  
import main.scala.bprocesses.BPSession  
import scala.concurrent.ExecutionContext.Implicits.global
import scala.concurrent.duration.Duration
import scala.concurrent.{ExecutionContext, Awaitable, Await, Future}
import scala.util.Try
/**
* Arround element builder
**/
object AroundProcessElementsBuilder {
  def detect(process_id: Int, station_id: Int):ElemAround = {
   println("AroundProcessElementsBuilder DETECT")
   println(station_id)
   val station = BPStationDAO.findActiveByBPIds(List(process_id)).headOption
     
   station match {
    case None => ElemAround()
    case Some(st) => buildTree(st, process_id, None, station)
   }
  }
  def detectByStation(process_id: Int, station: Option[BPStationDTO], process:Option[BProcessDTO]=None):ElemAround = {
    station match {
    case Some(st) => { 
      if (st.paused == true)
        buildTree(st, process_id, process, station)
      else 
        ElemAround()
    }
    case _ => ElemAround()
   }
  }  
  def detectByStationF(process_id: Int, station: Option[BPStationDTO], process:Option[BProcessDTO]=None):Future[ElemAround] = {
    station match {
    case Some(st) => { 
      if (st.paused == true)
        Future { buildTree(st, process_id, process, station) }
      else 
        Future(ElemAround())
    }
    case _ => Future(ElemAround())
   }
  }    
  
  
  def buildTree(st: BPStationDTO, process_id:Int,
    process:Option[BProcessDTO]=None,
    station_dto:Option[BPStationDTO]=None):ElemAround = {
    val proc = service.RunnerWrapper.initFrom(
                                              station_id = st.id.get, 
                                              bpID = process_id, 
                                              params = List.empty[InputParamProc],
                                              process_dtoObj = process,
                                              station_dto = station_dto
                                              )
      
    var pre:Option[AroundAttr] = None
    var nex:Option[AroundAttr] = None
    var now:Option[AroundAttr] = None
    if (proc.variety.length >= st.step && st.step != 1 && st.step >= 2) {
      pre = Option(AroundAttr(proc.variety(st.step-2).id, proc.variety(st.step-2).title))
    } 
    
    if (proc.variety.length > st.step && st.step != proc.variety.length) {
      nex = Option(AroundAttr(proc.variety(st.step).id, proc.variety(st.step).title))
    } 
    if (st.step > 0) {
      now = Option(AroundAttr(proc.variety(st.step-1).id, proc.variety(st.step-1).title))
    }

    ElemAround(now = now, prev = pre, next = nex)
    // TODO: Nested around
  }
  // Return: Option[Map[Station_id, ElemAround]]
  def detectForProcess(process_id: Int):List[ListAround] = {
   val stations = BPStationDAO.findActiveByBPIds(List(process_id))
      
     if (stations.length > 0) {
        stations.map(station => ListAround(station.id.get, buildTree(station, process_id)))
     } else {
       val list:List[ListAround] = List();list;
     }
  }
}

case class AroundAttr(id: Int, title: String = "")
case class ElemAround(prev: Option[AroundAttr] = None, now: Option[AroundAttr] = None, next: Option[AroundAttr] = None )  
case class ListAround(id: Int, around: ElemAround)
