package main.scala.utils
import main.scala.simple_parts.process._
import main.scala.bprocesses.InvokeTracer
import main.scala.bprocesses.links._
import main.scala.simple_parts.process.Brick

object Space {
  def apply(val index: Int, val brick: Brick, val is_subbricks: Boolean = true, val is_container: Boolean = true, val is_expander: Boolean = true) {
    if (is_subbricks && is_container && is_expander) {
      new Space(index, brick) extends SpaceSBComponent with SpaceContainerComponent with SpaceExpandComponent
    }
    if (is_subbricks && is_container && !is_expander) {
      new Space(index, brick) extends SpaceSBComponent with SpaceContainerComponent 
    }
    if (is_subbricks && !is_container && is_expander) {
      new Space(index, brick) extends SpaceSBComponent with SpaceExpandComponent
    }
    if (!is_subbricks && is_container && is_expander) {
      new Space(index, brick) extends SpaceContainerComponent with SpaceExpandComponent
    }
    if (is_subbricks && !is_container && !is_expander) {
      new Space(index, brick) extends SpaceSBComponent 
    } 
    if (!is_subbricks && is_container && !is_expander) {
      new Space(index, brick) extends SpaceContainerComponent
    }
    if (!is_subbricks && !is_container && is_expander) {
      new Space(index, brick) extends SpaceExpandComponent
    }
  }
}

class Space(val index: Int, val brick: Brick) {
  
private var state = true

// init
override def init { }

// Searcher
def seachObjById(id: Int, space_role: String) = {
  if (space_role == "subbrick") {
    subbricks.find(obj => obj.id == id)
  }
  if (space_role == "container") {
    container.find(obj => obj.id == id)
  }
  if (space_role == "expands") {
    expands.find(obj => obj.id == id)
  }
  else { None }
}
def levelOfObject(obj: ProcElems) = {
  if (subbricks.contains(obj) && is_subbricks) {
    "SubBricks"
  elseif (container.contains(obj) && is_container) {
    "Container"
  } elseif (expands.contains(obj) && is_expander) {
    "Expands"
  }
  None
  }
}
def getBrick = brick


// Element control
def addToSpace(elem: ProcElems, space_role:String) = {
  if (space_role == "subbrick") {
    subbricks = subbricks :+ elem.asInstanceOf[SubBrick]
  }
  if (space_role == "container") {
    container = container :+ elem
  }
  if (space_role == "expands") {
    expands = expands :+ elem
  }
}
def updateElem(old: ProcElems, newone: ProcElems) = {
  levelOfObject(old) match {
    case "SubBricks" => subbrics.update(subbrics.indexOf(old), newone.asInstanceOf[SubBrick])
    case "Container" => container.update(container.indexOf(old), newone)
    case "Expands"   => expands.update(expands.indexOf(old), newone)
    case _           => None
  }
}

trait SpaceSBComponent {
  val is_subbricks = true
  var subbricks = Array.empty[SubBrick]

  def sb_pushit(target: Array[SubBrick]) {
    container = container ++ target
  }

  def sb_push(f: ⇒ Array[SubBrick]) = {
    sb_pushit(f)
  }  
}

trait SpaceContainerComponent {
  val is_container = true
  var container: Array[ProcElems] = Array.empty

  def cont_pushin(target: Array[ProcElems]) {
    container = container ++ target
  }

  def cont_push(f: ⇒ Array[ProcElems]) = {
    cont_pushin(f)
  }
}

trait SpaceExpandComponent {
  val is_expander = true
  var expands: Array[ProcElems] = Array.empty

  def exp_pushin(target: Array[ProcElems]) {
    expands = expands ++ target
  }

  def exps_push(f: ⇒ Array[ProcElems]) = {
    exp_pushin(f)
  }
  def doExpandObj(old: ProcElems, obj: ProcElems) = {
    expands.update(expands.indexOf(old), obj)
    // link_update
  }
  def doExpandInd(in: Int, obj: ProcElems) = {
    expands.update(expands(in), obj)
    // link_update
  } 
}


// subbricks
if (is_subbricks) {
  var subbricks = Array.empty[SubBrick]

  def sb_pushit(target: Array[SubBrick]) {
    container = container ++ target
  }

  def sb_push(f: ⇒ Array[SubBrick]) = {
    sb_pushit(f)
  }
}

// container
if (is_container) { 
  var container: Array[ProcElems] = Array.empty

  def cont_pushin(target: Array[ProcElems]) {
    container = container ++ target
  }

  def cont_push(f: ⇒ Array[ProcElems]) = {
    cont_pushin(f)
  }
}

// expandings
if (is_expander) {
  var expands: Array[ProcElems] = Array.empty

  def exp_pushin(target: Array[ProcElems]) {
    expands = expands ++ target
  }

  def exps_push(f: ⇒ Array[ProcElems]) = {
    exp_pushin(f)
  }
  def doExpandObj(old: ProcElems, obj: ProcElems) = {
    expands.update(expands.indexOf(old), obj)
    // link_update
  }
  def doExpandInd(in: Int, obj: ProcElems) = {
    expands.update(expands(in), obj)
    // link_update
  } 
}


}