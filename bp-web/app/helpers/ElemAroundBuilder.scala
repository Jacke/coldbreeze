package helpers
  
import models.DAO._
import main.scala.utils.InputParamProc

object ElemAroundBuilder {
  def detect(process_id: Int, station_id: Int):ElemAround = {
   val station = BPStationDAO.findActiveByBPIds(List(process_id)).headOption
     
     station match {
    case None => ElemAround()
    case Some(st) => buildTree(st, process_id)
   }
  }
  
  def buildTree(st: BPStationDTO, process_id:Int):ElemAround = {
    val proc = service.RunnerWrapper.initFrom(st.id.get, process_id, List.empty[InputParamProc])
      
    var pre:Option[AroundAttr] = None
    var nex:Option[AroundAttr] = None
    
    if (proc.variety.length >= st.step && st.step != 1) {
      val elem_pre = proc.variety(st.step-2)
      pre = Option(AroundAttr(elem_pre.id, elem_pre.title))
    } 
    
    if (proc.variety.length > st.step && st.step != proc.variety.length) {
      val elem_next = proc.variety(st.step)
      nex = Option(AroundAttr(elem_next.id, elem_next.title))
    } 
    val elem_now = proc.variety(st.step-1)
    var now = Option(AroundAttr(elem_now.id, elem_now.title))
    
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