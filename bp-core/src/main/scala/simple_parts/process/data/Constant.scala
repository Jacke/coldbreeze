package main.scala.simple_parts.process.data
import main.scala.simple_parts.process.ProcElems
import main.scala.bprocesses.InvokeTracer

abstract class Constant[T](value: T) extends ProcElems {

  override def invoke {
    //InvokeTracer.runner.get.logger.log("invoked const")
    println("invoked const")
  }

  override def toString = s"Constant $value"
}
