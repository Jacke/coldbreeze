package main.scala.simple_parts.process.data
import main.scala.simple_parts.process.ProcElems
import main.scala.simple_parts.process.CompositeValues

abstract class Note(note: String, val values: Option[CompositeValues] = None) extends ProcElems {
  def invoke {
    println(s"boom $note")
  }
  override def toString = s"'$note'"
}

