package us.ority.min.actions
import main.scala.bprocesses._
import main.scala.utils._
import com.github.nscala_time.time.Imports._
import scala.collection.mutable._
import main.scala.simple_parts.process._

case class Strategy(val id: Option[Long],
										ident: String,
										middleware: Long = -1L,
										isNullStrategy: Boolean = false,
										created_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now),
										updated_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now)) {

		// Pipes
		var strategyInputUnit:MutableList[StrategyInputUnit] = MutableList()
		var strategyBaseUnit:MutableList[StrategyBaseUnit] = MutableList()
		var strategyOutputUnit:MutableList[StrategyOutputUnit] = MutableList()


		def pushToStrategyInputUnit(s: StrategyInputUnit) = {
		  strategyInputUnit += s
		}
		def pushToStrategyBaseUnit(s: StrategyBaseUnit) = {
		  strategyBaseUnit += s
		}
		def pushToStrategyOutputUnit(s: StrategyOutputUnit) = {
		  strategyOutputUnit += s
		}

}



/******************************************************************
 * Session Units
 * Used only in CONVERSION BETWEEN PLAIN
 * DO NOT USE IN REGULAR INVOKATION!!!!!! ONLY FOR CONVERSION!!!
 *****************************************************************/
case class LaunchStrategy(val id: Option[Long],
										session: Int,
										ident: String,
										middleware: Long = -1L,
										isNullStrategy: Boolean = false,
										created_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now),
										updated_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now)) {


		// Pipes
		var strategyInputUnit:MutableList[LaunchStrategyInputUnit] = MutableList()
		var strategyBaseUnit:MutableList[LaunchStrategyBaseUnit] = MutableList()
		var strategyOutputUnit:MutableList[LaunchStrategyOutputUnit] = MutableList()

		def pushToStrategyInputUnit(s: LaunchStrategyInputUnit) = {
		  strategyInputUnit += s
		}
		def pushToStrategyBaseUnit(s: LaunchStrategyBaseUnit) = {
		  strategyBaseUnit += s
		}
		def pushToStrategyOutputUnit(s: LaunchStrategyOutputUnit) = {
		  strategyOutputUnit += s
		}
}







/*

object DeathToStrategy extends App {

  def add(a: Int, b: Int) = a + b
  def subtract(a: Int, b: Int) = a - b
  def multiply(a: Int, b: Int) = a * b

  def execute(callback:(Int, Int) => Int, x: Int, y: Int) = callback(x, y)

  println("Add:      " + execute(add, 3, 4))
  println("Subtract: " + execute(subtract, 3, 4))
  println("Multiply: " + execute(multiply, 3, 4))
}

*/
