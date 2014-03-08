package main.scala.utils

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
  }
  def register[Type](element_type:String, element_name:String, description:String) = add_reg(Keepr[Type](element_type, element_name, description))
// def register_value(element_type, element_name, allowed_value)

// value types
}
case class Keepr[T](eltype:String, elname:String, desc:String) 
