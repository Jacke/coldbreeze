package main.scala.simple_parts.process.data

import main.scala.bprocesses.BProcess
import main.scala.simple_parts.process.{ProcElems, CompositeValues, Block}
import main.scala.utils.Space

class Confirm(val id: Int,
            override val title: String,
            desc: String,
            val values: Option[CompositeValues] = Option(CompositeValues(a_bool = Option(false))),
            val bprocess: BProcess,
            b_type: String = "block",
            type_title: String = "confirm",
            var order: Int,
            val space_parent: Option[Space] = None,
            val space_role: Option[String] = None,
            override val space_id: Option[Space] = None
             ) extends ProcElems {


  def invoke {
    println("invoke confirm")
    if (values.get.a_bool.get) {
      println("move on")
    } else {
      println("pause process")
      println("\n\n\n\n\n\n\n\n")
      bprocess.station.update_paused(true)
    }
  }
  // InputCall
  def confirmed {
    values.get.a_bool = Option(true)
  }
  override def calls(param: String) = {
    param match {
      case "confirmed" => confirmed
      case _ =>
    }

  }
}


class Confirmation(val id: Int,
              override val title: String,
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
    println("invoke confirm")
    println("invoke confirm")
    println("invoke confirm")


    println("invoke confirm")
    if (values.get.a_bool.get) {
      println("move on")
    } else {
      println("pause process")
      println("\n\n\n\n\n\n\n\n")
      bprocess.station.update_paused(true)
    }
  }
  // InputCall
  def confirmed {
    values.get.a_bool = Option(true)
  }
  override def calls(param: String) = {
    param match {
      case "confirmed" => confirmed
      case _ =>
    }

  }
}
