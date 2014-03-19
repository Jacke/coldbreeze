package examples

import org.specs2.mutable._
import main.scala.utils.ElementRegistrator
import main.scala.utils.ElementTracer

class ElementTracerSpec extends Specification {

  ElementRegistrator.apply
  "Element registration" should {
    "contain > 1 ProcElements" in {
      ElementTracer.els.length must be_>(0)
    }

  }

}