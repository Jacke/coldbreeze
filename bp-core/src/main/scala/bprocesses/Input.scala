package main.scala.bprocesses
import main.scala.simple_parts.process._

case class SimpleInput(in: Array[ProcElems])

case class PointedInput(ids: Array[Int], inputs: Array[ProcElems] = Array.empty[ProcElems])