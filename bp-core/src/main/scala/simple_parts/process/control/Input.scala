package main.scala.simple_parts.process.control
import main.scala.simple_parts.process.ProcElems

class Input[T >: ProcElems](val id: Int, block: T) extends ProcElems {

  def invoke {
    println(s"inputed $block")
  }
}

class InputPlaceholder(val id: Int) extends ProcElems {

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