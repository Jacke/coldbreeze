package us.ority.min.actions
import main.scala.bprocesses._
import main.scala.utils._
import com.github.nscala_time.time.Imports._
import scala.collection.mutable._
import main.scala.simple_parts.process._


case class StrategyArguments(c: Seq[StrategyArgument] = Seq()) {
  def takeArg(key: String, default: StrategyArgument = StrategyArgument() ):StrategyArgument = {
    c.find(c => c.argKey == key) match {
      case Some(arg) => arg
      case _ => default
    }
  }
  def takeArgs(key: String):Seq[StrategyArgument] = 
    c.filter(c => c.argKey == key)
    
}

case class StrategyArgument(
  argInt: Int = 0, 
  argLong:Long = 0L, 
  argString: String = "", 
  argKey: String="")

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
