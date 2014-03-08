package main.scala.bprocesses

import main.scala.simple_parts.process._
import main.scala.simple_parts.process.control._
import main.scala.simple_parts.process.data._
import main.scala.bprocesses.links._
import main.scala.utils.links.BPLinkContainer
import main.scala.utils.Space
import main.scala.resources._

class BProcess(scope: Scope, resources: Option[Array[Resource]], groups: Option[Array[Group]]) extends BPLinkContainer[BPLink] 
   with OwnershipContainer
   with BPFlow 
{

/**
 *  Field of process
 */

  var variety: Array[ProcElems] = Array.empty[ProcElems]
  var spaces: Array[Space] = Array.empty[Space]
  links = Array.empty[BPLink]
  val logger = new BPLogger
  val station = new BPStation(this)
  val marker =  new BPMarker(this)
  val errors = new BPErrorCatcher(this)

/**
 *  Process collection methods
 */

  def blk = variety.collect { case block: Block ⇒ block }
  def rsl = variety.collect { case brick: Result ⇒ brick }
  def chk = variety.collect { case brick: Brick ⇒ brick }
  def cns = variety.collect { case const: Constant[_] ⇒ const }
  def inputs = variety.collect { case inputs: InputPlaceholder ⇒ inputs }
  def isContain(el: ProcElems) = variety contains el
  
  def fetchObjectById(id: Int) = {
    val frontelem = variety.find(elem => elem.id == id)
    val space_result = spaces.map(space => space.searchObjById(id))

    if (space_result.length == 1) {
      space_result.head // Искомый объект
    } else if (frontelem != None) {
      frontelem
    } else {
      None
    }
  }

  def getElemsLength = variety.length - variety.collect { case space: Space => space }.length
  def getSpaceByIndex(index: Int) = spaces(index-1)
  def getSpaceQuantity = spaces.length

  def updateElem(el: ProcElems, newone: ProcElems, inspace: Boolean) = {
    if (!inspace) {
    variety.update(variety.indexOf(old), newone)
    }
    if (inspace) { 
    val space = getSpaceById(el.space_id)
    space.updateElem(el, newone)
    }
    update_link[ProcElems](old, newone)
  }
/**
 *  Owners
 */
   def owners(b: ResAct)     = ownerships.collect { case link: T ⇒ link.from == old }
   def res_acts(r: Resource) = ownerships.collect { case link: T ⇒ link.to   == old }

/**
 * Input
 */
  def fill(inputs: Array[ProcElems]) = {
    val z = variety.collect { case placeholder: InputPlaceholder ⇒ placeholder }
    for (x ← z; y ← inputs) yield (x.push(y))
    // in space
  }
  def pointed_fill(ids: Array[Int], inputs: Array[ProcElems]) = {
    // inspace
    val placeholders: Array[ProcElems] = ids.map(id => fetchElemById(id))
    for {
         placeholder <- placeholders
         input <- inputs
        } yield (updateElem(placeholder, input))
  }

/**
 * Push elements to process
 */
  def pushit(target: Array[ProcElems]) = {
    variety = variety ++ target
  }

  def push(f: ⇒ Array[ProcElems]) = {
    pushit(f)
  }



/**
 * Process initialization
 */

  def elements_init = {
    println("init elements")
    variety.map(el => el.init)
  } 

/**
 * Process returning
 */

  //def returning = {
  // find return block
  // execute return block
  // push complete result 
  //}

}
