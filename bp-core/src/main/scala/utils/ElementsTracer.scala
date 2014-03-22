package main.scala.utils

import main.scala.simple_parts.process._
import main.scala.bprocesses.BProcess
import scala.reflect.ClassTag

object ElementTracer {
  // block
  // brick
  // subbrick
  // brick(subbricks)

  // Value validation
  // All Value of SubBrick and Brick (Allowed value)
  var els: Array[Keepr[_]] = Array.empty
  def add_reg(new_reg: Keepr[_]) = {
    els = els :+ new_reg
    println("biimn")
    println(els.length)
  }
  def register[Type](element_type:String, element_name:String, description:String) {
    add_reg(Keepr[Type](element_type, element_name, description))
  }
// def register_value(element_type, element_name, allowed_value)
// value types

  /**
   * Search methods
   */
  def findByInfo(eltype:String, elname:String):Option[Keepr[_]] = {
    els.find(keepr => (keepr.eltype == eltype && keepr.elname == elname))
  }

}
object ElementRegistrator {
  def apply {
    /**
     * Elements registration
     */
    ElementTracer.register[Brick]("brick", "test_brick", "")
    ElementTracer.register[Block]("block", "test_block", "")
  }
}

case class Keepr[T](eltype:String, elname:String, desc:String) {
  // cls: Class[_],
  //def classTag = cls
  //def instanciate() = new T
}
