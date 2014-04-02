package main.scala.simple_parts.process

import main.scala.utils.Space
import scala.util.{Try, Success, Failure}
/**
 * @author Sobolev
 *
 */
trait ProcElems {
  val id: Int
  val space_id: Option[Space] = None
  val temp = false
  val refresh = false
  var order: Int
  val values: Option[CompositeValues]

  def invoke()
  def init() = {
    println(this)
  }
  
}

case class CompositeValues(
  var a_string: String = "", 
  var b_string: String = "", 
  var a_int: Int = 0, 
  var b_int: Int = 0, 
  var a_bool: Boolean = false, 
  var b_bool: Boolean = false
  ) 
{
  def update(
      n_a_string: String, 
      n_b_string: String, 
      n_a_int: Int, 
      n_b_int: Int, 
      n_a_bool: Boolean, 
      n_b_bool: Boolean
      ) {
      a_string = n_a_string
      b_string = n_b_string
      a_int    = n_a_int
      b_int    = n_b_int
      a_bool   = n_a_bool
      b_bool   = n_b_bool
      }
}