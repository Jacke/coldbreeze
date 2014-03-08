package main.scala.simple_parts.process.data
import main.scala.simple_parts.process.ProcElems

class Note(note: String) extends ProcElems {
  def invoke {
    println(s"boom $note")
  }
  override def toString = s"'$note'"
}

