package main.scala.simple_parts.process.control
import main.scala.simple_parts.process.ProcElems
import main.scala.utils.links.LinkSearcher
import main.scala.bprocesses.links.BPLink

abstract class Result extends ProcElems with LinkSearcher[BPLink] { // with ArgumentDispatch
  /*
  lazy val obj = arguments
  */
  def invoke() {
    //if (isMultiple) {
    //  multiple(obj.productIterator.toList)
    //} else {
    //  //!!!!!  InvokeTracer.runner.get.logger.log("Result:" + obj)
    //  println("result" + obj.toString)
    //}
  }
  //def plain() = println("result" + obj.toString);
  //def multiple(obj: List[Any]) = {
  //  for (o ← obj) {
  //    // !!! InvokeTracer.runner.get.logger.log("Result:" + o)
  //    println("result" + o.toString)
  //  }
  //}
  //override def toString = s"Result $obj"
}