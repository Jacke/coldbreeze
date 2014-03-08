package main.scala.bprocesses

import main.scala.simple_parts.process._
import main.scala.bprocesses.links._


/* BEFORE
on elements param link_check:Boolean
get all for true
call method and if objects present proc are good
////////////
    AFTER
    proc.errors.reg(...)
*/

object InvokeChecker {
  /*
   * Argument & Parameters Validation
   */
  import scala.util.Try
  def isValid(b: ProcElems): Boolean = {
    val t = Try(b.getClass.getMethod("arguments")).isSuccess
    val u = Try(b.getClass.getMethod("params")).isSuccess
    //if (t) {
    //  argValid(b)
    //} else if (u) {
    //  paramValid(b)
    //} else {
      true
    //}
  }

  def isInputed(bp: BProcess) = {
    val teta = (bp.inputs).map(i ⇒ i.isFilled)
    teta.foldLeft(true)(_ && _)
  }
/**
  def argValid(b: ProcElems): Boolean = {
    val x = ArgLinkDispatch.from(b)
    val y = x match {
      case None ⇒ None
      case _    ⇒ true
    }
    y != None
  }

  def paramValid(b: ProcElems): Boolean = {
    val x = PLinkDispatch.from(b)
    val y = x match {
      case None ⇒ None
      case _    ⇒ true
    }
    y != None
  }
  
  */
  /**
   * Dimension
   */
  //def isFront(b: ProcElems): Boolean = {
  //  val x = ArgLinkDispatch.from(b)
  //  val y = x match {
  //    case None ⇒ None
  //    case _    ⇒ x.get.getClass.getSimpleName
  //  }
  //  y != "Dimension"
  //}

}