package main.scala.simple_parts.process.data
import main.scala.simple_parts.process.ProcElems
import main.scala.bprocesses.InvokeTracer
import main.scala.bprocesses.BProcess
import main.scala.simple_parts.process.CompositeValues
import main.scala.utils.Space

class Constant[T](val id: Int,
                  value: T,
                  val bprocess: BProcess,
                  var order: Int,
                  val values: Option[CompositeValues] = None,
                  override val space_id: Option[Space] = None) extends ProcElems {

  override def invoke {
    //InvokeTracer.runner.get.logger.log("invoked const")
    println("invoked const")
  }

  override def toString = s"Constant $value"
}
class PrintValue[T](val id: Int, value: T,
                    val bprocess: BProcess,
                    var order: Int,
                    val values: Option[CompositeValues] = Option(CompositeValues(a_string = Option("xx1111212"))),
                    override val space_id: Option[Space] = None) extends ProcElems {

  override def invoke {
    //InvokeTracer.runner.get.logger.log("invoked const")
    if (values.isDefined) {

      val out = values.get.a_string
      Thread.sleep(10L)
      println(s"$out !!!")
    }
    if (values.isDefined && values.get.a_string == Option("x3"))
      values.get.a_string = Option("x3333333333")

  }

  override def toString = s"Constant $value"
}