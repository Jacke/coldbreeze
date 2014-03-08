/*
package main.scala.simple_parts.process.control

import main.scala.simple_parts.process.ProcElems
import main.scala.utils.Space
import main.scala.bprocesses.links.ArgLinkDispatch

class Condition(c: Boolean) extends ProcElems { // with ArgumentDispatch
  lazy val d1 = {
    ArgLinkDispatch.to(this).head.get // FIX THAT!!!!!!!!!!!!!!!!!
    //new Dimension

  }
  lazy val d2 = {
    new Space // FIX THAT!!!!!!!!!!!!!!!!!
  }

  def invoke = {
    if (c) {
      d1.invoke
    } else {
      d2.invoke
    }
  }

}
*/