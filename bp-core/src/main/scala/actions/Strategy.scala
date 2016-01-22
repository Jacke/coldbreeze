package us.ority.min.actions

class Strategy {
	
}

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