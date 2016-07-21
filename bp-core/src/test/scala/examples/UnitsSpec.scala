package examples

import org.specs2.mutable._

import main.scala.bprocesses._
import main.scala.simple_parts.process._
import main.scala.simple_parts.process.control._
import main.scala.simple_parts.process.data._
import main.scala.utils._
import main.scala.resources.scopes._
import main.scala.simple_parts.process._
import main.scala.bprocesses.links._

 class UnitsSpec extends Specification {
  val proc2 = new BProcess(new Managment)
    "Units" should {
      "evaluation" in {
        val a = UnitElement(Some(1),
                        "test",
                        "test",
                        1,
                        1,
                        "unit",
                        "unit",
                        None,
                        1)
          a.title == "test"
    }
  
  }
}