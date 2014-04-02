package main.scala.simple_parts.process.data
import main.scala.simple_parts.process.ProcElems
import main.scala.bprocesses.InvokeTracer
import main.scala.simple_parts.process.CompositeValues

class Constant[T](val id: Int, value: T, var order: Int, val values: Option[CompositeValues] = None) extends ProcElems {

  override def invoke {
    //InvokeTracer.runner.get.logger.log("invoked const")
    println("invoked const")
  }

  override def toString = s"Constant $value"
}
