package us.ority.min.actions
import main.scala.bprocesses._
import main.scala.utils._
import com.github.nscala_time.time.Imports._
import scala.collection.mutable._
import main.scala.simple_parts.process._

case class StrategyResult(
  resultedStrategy: String,
  executed: Boolean = false,
  exec_time:org.joda.time.DateTime = org.joda.time.DateTime.now
)