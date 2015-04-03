package main.scala.simple_parts.process.data

import main.scala.bprocesses.BProcess
import main.scala.simple_parts.process.ProcElems
import main.scala.simple_parts.process.CompositeValues
import main.scala.utils.Space

class Note(val id: Int,
            override val title: String,
            desc: String,
            val values: Option[CompositeValues],
            val bprocess: BProcess,
            b_type: String,
            type_title: String,
            var order: Int,
            val space_parent: Option[Space] = None,
            val space_role: Option[String] = None
             ) extends ProcElems {



  override def toString = s"Note: $title"

  override def invoke {
    println("invoked note")
  }
}

