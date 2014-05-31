package main.scala.utils
import main.scala.simple_parts.process._
import main.scala.bprocesses.InvokeTracer
import main.scala.bprocesses.links._
import main.scala.simple_parts.process.Brick


class Space(val index: Int, val brick_owner: Brick) {
  

private var state = true
var subbricks = Array.empty[SubBrick]
var container: Array[ProcElems] = Array.empty[ProcElems]
var expands: Array[ProcElems] = Array.empty[ProcElems]

// init
def init { }

// Searcher
def searchObj(look:ProcElems,space_role: String) {
  if (space_role == "subbrick") {
    subbricks.find(obj => obj == look)
  }
  if (space_role == "container") {
    container.find(obj => obj == look)
  }
  if (space_role == "expands") {
    expands.find(obj => obj == look)
  }
}
def levelOfObject(obj: ProcElems):String = {
  if (subbricks.contains(obj)) { // && is_subbricks) {
    "subbrick"
  }
  if (container.contains(obj)) { // && is_container) {
    "container"
  } 
  if (expands.contains(obj)) { // && is_expander) {
    "expands"
  }
  else {
  "None"
  }
}
def getBrick = brick_owner

def spaceOrderNum(c: Array[ProcElems]):Int = c.sortBy(_.order).last.order + 1 // TODO: UNSTABLE!!!!

def getOrderNum(tpe: String):Int = tpe match {
  case "subbrick" => subbricks.length + 1
  case "container" => container.length + 1
  case "expands" => expands.length + 1
  case _ => 0
}
def findByOrder(tpe: String, order: Int):Option[ProcElems] = tpe match {
  case "subbrick" => subbricks.find(el => el.order == order)
  case "container" => container.find(el => el.order == order)
  case "expands" => expands.find(el => el.order == order)
  case _ => None
}
def space_elems(space_type: String) = space_type match {
  case "subbrick" => subbricks
  case "container" => container
  case "expands" => expands
  case _ => expands
}


def allElements:List[ProcElems] = (subbricks ++ container ++ expands).toList

// Element control
def addToSpace(elem: ProcElems, space_role:String) {
  if (space_role == "subbrick") {
    elem.order = getOrderNum(space_role)
    subbricks = subbricks :+ elem.order.asInstanceOf[SubBrick]
  }
  if (space_role == "container") {
    elem.order = getOrderNum(space_role)
    container = container :+ elem
  }
  if (space_role == "expands") {
    elem.order = getOrderNum(space_role)
    expands = expands :+ elem
  }
}
def updateElem(old: ProcElems, newone: ProcElems) {
  levelOfObject(old) match {
    case "subbrick" => subbricks.update(subbricks.indexOf(old), newone.asInstanceOf[SubBrick])
    case "container" => container.update(container.indexOf(old), newone)
    case "expands"   => expands.update(expands.indexOf(old), newone)
    case _           => None
  }
}

}

trait SpaceSBComponent { self: Space =>
  val is_subbricks = true

  def sb_pushit(target: Array[SubBrick]) {
    self.subbricks = self.subbricks ++ target
  }

  def sb_push(f: ⇒ Array[SubBrick]) = sb_pushit(f)  
}

trait SpaceContainerComponent { self: Space =>
  val is_container = true



  def cont_pushin(target: Array[ProcElems]) = self.container = self.container ++ target
  def cont_push(f: ⇒ Array[ProcElems]) = cont_pushin(f)
}

trait SpaceExpandComponent { self: Space =>
  val is_expander = true


  def exp_pushin(target: Array[ProcElems]) {
    self.expands = self.expands ++ target
  }

  def exps_push(f: ⇒ Array[ProcElems]) = exp_pushin(f)

  def doExpandObj(old: ProcElems, obj: ProcElems) {
    self.expands.update(self.expands.indexOf(old), obj)
    // link_update
  }
  def doExpandInd(in: Int, obj: ProcElems) {
    self.expands.update(self.expands.indexOf(in), obj)
    // link_update
  } 
}


object Space {
  def apply(index: Int, brick: Brick, is_subbricks: Boolean = true, is_container: Boolean = true, is_expander: Boolean = true):Space = {
    val target = new Space(index, brick)
    if (is_subbricks && is_container && is_expander) {
      val target = new Space(index, brick) with SpaceSBComponent with SpaceContainerComponent with SpaceExpandComponent
    }
    if (is_subbricks && is_container && !is_expander) {
      val target = new Space(index, brick) with SpaceSBComponent with SpaceContainerComponent
    }
    if (is_subbricks && !is_container && is_expander) {
      val target = new Space(index, brick) with SpaceSBComponent with SpaceExpandComponent
    }
    if (!is_subbricks && is_container && is_expander) {
      val target = new Space(index, brick) with SpaceContainerComponent with SpaceExpandComponent
    }
    if (is_subbricks && !is_container && !is_expander) {
      val target = new Space(index, brick) with SpaceSBComponent
    } 
    if (!is_subbricks && is_container && !is_expander) {
      val target = new Space(index, brick) with SpaceContainerComponent
    }
    if (!is_subbricks && !is_container && is_expander) {
      val target = new Space(index, brick) with SpaceExpandComponent
    }
    target
  }
}

