package helpers
  
import models.DAO._
import main.scala.utils.InputParamProc

case class AroundAttr(id: Int, title: String = "")
case class ElemAround(prev: Option[AroundAttr] = None, now: Option[AroundAttr] = None, next: Option[AroundAttr] = None )  
case class ListAround(id: Int, around: ElemAround)
object ElemAround {
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
      pre = Option(AroundAttr(proc.variety(st.step-2).id, "prev"))
    } 
    
    if (proc.variety.length > st.step && st.step != proc.variety) {
      nex = Option(AroundAttr(proc.variety(st.step).id, "next"))
    } 
    var now = Option(AroundAttr(proc.variety(st.step-1).id, "now"))
    
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