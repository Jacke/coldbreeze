package main.scala.utils
import main.scala.simple_parts.process._
import main.scala.bprocesses.InvokeTracer
import main.scala.bprocesses.links._
import main.scala.simple_parts.process.Brick


class Space(val index: Int, val brick: Brick) {
  

private var state = true
var subbricks = Array.empty[SubBrick]
var container: Array[ProcElems] = Array.empty[ProcElems]
var expands: Array[ProcElems] = Array.empty[ProcElems]

// init
def init { }

// Searcher
///////////////////////def searchObjById(id: Int, space_role: String) {
///////////////////////  if (space_role == "subbrick") {
///////////////////////    subbricks.find(obj => obj.id == id)
///////////////////////  }
///////////////////////  if (space_role == "container") {
///////////////////////    container.find(obj => obj.id == id)
///////////////////////  }
///////////////////////  if (space_role == "expands") {
///////////////////////    expands.find(obj => obj.id == id)
///////////////////////  }
///////////////////////  else { None }
///////////////////////}
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
    "SubBricks"
  }
  if (container.contains(obj)) { // && is_container) {
    "Container"
  } 
  if (expands.contains(obj)) { // && is_expander) {
    "Expands"
  }
  else {
  "None"
  }
}
def getBrick = brick

def allElements:List[ProcElems] = (subbricks ++ container ++ expands).toList

// Element control
def addToSpace(elem: ProcElems, space_role:String) {
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
def updateElem(old: ProcElems, newone: ProcElems) {
  levelOfObject(old) match {
    case "SubBricks" => subbricks.update(subbricks.indexOf(old), newone.asInstanceOf[SubBrick])
    case "Container" => container.update(container.indexOf(old), newone)
    case "Expands"   => expands.update(expands.indexOf(old), newone)
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
  def apply(index: Int, brick: Brick, is_subbricks: Boolean = true, is_container: Boolean = true, is_expander: Boolean = true) {
    if (is_subbricks && is_container && is_expander) {
      new Space(index, brick) with SpaceSBComponent with SpaceContainerComponent with SpaceExpandComponent
    }
    if (is_subbricks && is_container && !is_expander) {
      new Space(index, brick) with SpaceSBComponent with SpaceContainerComponent 
    }
    if (is_subbricks && !is_container && is_expander) {
      new Space(index, brick) with SpaceSBComponent with SpaceExpandComponent
    }
    if (!is_subbricks && is_container && is_expander) {
      new Space(index, brick) with SpaceContainerComponent with SpaceExpandComponent
    }
    if (is_subbricks && !is_container && !is_expander) {
      new Space(index, brick) with SpaceSBComponent 
    } 
    if (!is_subbricks && is_container && !is_expander) {
      new Space(index, brick) with SpaceContainerComponent
    }
    if (!is_subbricks && !is_container && is_expander) {
      new Space(index, brick) with SpaceExpandComponent
    }
  }
}

/**
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

*/
