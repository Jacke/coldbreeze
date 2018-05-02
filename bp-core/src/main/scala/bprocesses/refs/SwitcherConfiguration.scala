package main.scala.bprocesses.refs

import main.scala.bprocesses._
import main.scala.utils._
import com.github.nscala_time.time.Imports._

import main.scala.simple_parts.process._

 object SwitcherConfiguration {
  val switcher_options: List[String] = List("n",
                                            "play",
                                            "p",
                                            "stp",
                                            "in",
                                            "out")
  val switcher_cmd: List[String] = List("inc", "dec", "reset")
  val switcher_target: List[String] = List("step", "container_step", "space", "marker", "process")

  val switcher_desc: Map[String, String] = Map("n" -> "move on",
                                            "play" -> "resume process",
                                            "p" -> "pause process",
                                            "stp" -> "stop process",
                                            "inn" -> "move inside and continue",
                                            "outn" -> "move outside and continue")
}
