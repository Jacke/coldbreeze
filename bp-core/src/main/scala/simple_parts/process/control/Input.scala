package main.scala.simple_parts.process.control
import main.scala.simple_parts.process.ProcElems
import main.scala.simple_parts.process.CompositeValues
import main.scala.bprocesses.BProcess

class Input[T >: ProcElems](val id: Int, block: T, val bprocess: BProcess, var order: Int, val values: Option[CompositeValues] = None) extends ProcElems {

  def invoke {
    println(s"inputed $block")
  }
}

class InputPlaceholder(val id: Int, val bprocess: BProcess, var order: Int, val values: Option[CompositeValues] = None) extends ProcElems {

  import main.scala.simple_parts.process._
  var container: Option[ProcElems] = None
  def push(b: ProcElems) {
    container = Option(b)
  }
  def isFilled =
    { container != None }

  def invoke {
    if (isFilled) {
      println(container.get.invoke)

      // get.invoke
    }
  }
}