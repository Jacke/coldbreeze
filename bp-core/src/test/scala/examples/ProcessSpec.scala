package examples

import org.specs2.mutable._

/*import main.scala.bprocesses._
import main.scala.simple_parts.process._
import main.scala.simple_parts.process.control._
import main.scala.simple_parts.process.data._
import main.scala.utils._
import main.scala.maps.contexts._
import main.scala.bprocesses.links._
  import main.scala.maps._
  import scala.collection.mutable._
      import main.scala.simple_parts.context._*/

 class ProcessSpec extends Specification {

    "The 'Hello world' string" should {
      "contain 11 characters" in {
        "Hello world" must have size(11)
      }
      "start with 'Hello'" in {
        "Hello world" must startWith("Hello")
      }
      "end with 'world'" in {
        "Hello world" must endWith("world")
      }
    }

  }
