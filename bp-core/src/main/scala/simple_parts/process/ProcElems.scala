package main.scala.simple_parts.process

import main.scala.utils.Space
import main.scala.bprocesses.BProcess
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
  val bprocess: BProcess

  def invoke()
  def init() = {
    println(this)
  }
  
}

case class CompositeValues(
  var a_string: Option[String] = None,
  var b_string: Option[String] = None,
  var a_int: Option[Int] = None,
  var b_int: Option[Int] = None,
  var a_bool: Option[Boolean] = None,
  var b_bool: Option[Boolean] = None
  ) 
{
  def update(
      n_a_string: Option[String],
      n_b_string: Option[String],
      n_a_int: Option[Int],
      n_b_int: Option[Int],
      n_a_bool: Option[Boolean],
      n_b_bool: Option[Boolean]
      ) {
      a_string = n_a_string
      b_string = n_b_string
      a_int    = n_a_int
      b_int    = n_b_int
      a_bool   = n_a_bool
      b_bool   = n_b_bool
      }
  override def toString() = s"$a_string, $a_string, $a_int, $b_int, $a_bool, $b_bool"
}