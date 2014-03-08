package examples

 import org.specs2.mutable._

import main.scala.bprocesses._
import main.scala.simple_parts.process._
import main.scala.simple_parts.process.control._
import main.scala.simple_parts.process.data._
import main.scala.utils._
import main.scala.maps.contexts._
import main.scala.bprocesses.links._
  import main.scala.maps._
  import scala.collection.mutable._
      import main.scala.simple_parts.context._

  class HelloWorldSpec extends Specification {
  
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
    Test.apply

    "Process" should {
      "start" in {
        Test.proc.state must_== true 
        
      }
    }
  }
  object Test {
    val proc = new BProcess(List("Stan", "Will"))
        proc.push {
        ListBuffer[ProcElems](
          //new Note("Test note"),
          //new Constant[Int](1001),
          //new Constant[Int](1001),
          new Constant[Boolean](true),
          //new Input(input),,
          //new Checker,
          new Result, // must be true
          new Constant[Boolean](false))
          //new InputPlaceholder,
          //new Space)
        }
        val frame = new Frame("Ramka")
        frame.init

        val xx = new ProcInvoker
        frame.container += xx
        frame.container += proc

        // Input
        // Input null -> Process doest start

        new PrLink(Option(xx), Option(proc))
        frame.link_push(
        new PrLink(Option(frame.container(0).asInstanceOf[ProcInvoker]),
          Option(frame.container(1).asInstanceOf[BProcess])))

        println("frame links")
        println(frame.links)
        println(frame.container)
        // lazy val proc: BProcess = arguments.productIterator.toList.head.asInstanceOf[BProcess]
        // InvokeTracer.run_proc(proc)
        val inblock: ListBuffer[ProcElems] = ListBuffer(new Constant[Boolean](false))

        //frame.container(1).asInstanceOf[BProcess].fill(inblock)
        println(new ProcInvoker)
        println("request")
        def apply = {
        println(frame.request(new Request(frame.container(0).asInstanceOf[ProcInvoker])))//, inblock)))
      }
  }