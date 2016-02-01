package us.ority.min.actions
import main.scala.bprocesses._
import main.scala.utils._
import com.github.nscala_time.time.Imports._
import scala.collection.mutable._  

case class Strategy(val id: Option[Long],
				ident: String,
				middleware: Int = -1, 
				created_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now),
			    updated_at:Option[org.joda.time.DateTime] = Some(org.joda.time.DateTime.now)) {

}

case class StrategyArgument(argInt: Int = 0, argLong:Long = 0L, argString: String = "")

case class StrategyResult(
	resultedStrategy: String,
	executed: Boolean = false,
	exec_time:org.joda.time.DateTime = org.joda.time.DateTime.now

)

case class StrategyIn()

case class StrategyOut(completed: Boolean = false) {
	val status = new StrategyStatus()
}
case class StrategyStatus() {
	def makeStatus():Boolean = true
	def getStatus():String = 
		if (makeStatus())
		 "Good"
		else 
		 "Error"
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