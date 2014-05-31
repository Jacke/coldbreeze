package main.scala.simple_parts.process.data

import main.scala.bprocesses.BProcess
import main.scala.simple_parts.process.{ProcElems, CompositeValues, Block}
import main.scala.utils.Space

class Confirm(val id: Int,
            title: String,
            desc: String,
            val values: Option[CompositeValues] = Option(CompositeValues(a_bool = Option(false))),
            val bprocess: BProcess,
            b_type: String = "block",
            type_title: String = "confirm",
            var order: Int,
            val space_parent: Option[Space] = None,
            val space_role: Option[String] = None
             ) extends ProcElems {


  def invoke {
    if (values.get.a_bool.get) {
      println("move on")
    } else {
      println("pause process")
    }
  }

  def confirmed {
    values.get.a_bool = Option(true)
  }
}
