package main.scala.simple_parts.process.control
import main.scala.simple_parts.process.ProcElems
import main.scala.bprocesses.InvokeTracer

abstract class Stoper extends ProcElems {
  override def invoke {
    println("invoked stoper")
    //val proc = InvokeTracer.runner
    //proc.get.stop(this)
  }
}