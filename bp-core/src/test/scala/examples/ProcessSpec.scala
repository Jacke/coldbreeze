package examples

import org.specs2.mutable._

import main.scala.bprocesses._
import main.scala.simple_parts.process._
import main.scala.simple_parts.process.control._
import main.scala.simple_parts.process.data._
import main.scala.utils._
import main.scala.resources.scopes._

import main.scala.bprocesses.links._

 class SpaceSpec extends Specification {

    var instance:Option[BProcess] = None

    def prepare_process:BProcess = {
          val proc2 = new BProcess(new Managment)
          proc2.push {
            Array[ProcElems](
              //new Note("Test note"),
              //new Constant[Int](1001),
              //new Constant[Int](1001),
              new Constant[Boolean](1, true,proc2, 1),
              new Constant[Boolean](2, true,proc2, 1),
              new Constant[Boolean](3, false,proc2, 1),
              new ContainerBrick(4, "container brick", "", Option(CompositeValues()), proc2, "brick", "containerbrick", 4),
              new ExpandBrick(5, "expand brick", "", Option(CompositeValues()), proc2, "brick", "expandbrick", 5))//,
            //new Brick(proc, 3),
            //new Space(3, 1),new Space(3, 2))
          }
          
          proc2.elements_init // Important!
          
          proc2
    }
    def add_space_elem_cnt(proc2: BProcess) {
      println(proc2.spaces.head + "sdsdsdsdsds")
      proc2.spaces.head.addToSpace(new Constant[Boolean](1, true,proc2, 1), "container")
      proc2.spaces.head.addToSpace(new Constant[Boolean](2, true,proc2, 1), "container")
      proc2.spaces.head.addToSpace(new Constant[Boolean](3, true,proc2, 1), "container")
    }
    def add_space_elem_exp(proc2: BProcess) {
      proc2.spaces.last.addToSpace(new Constant[Boolean](1, true,proc2, 1), "expands")
      proc2.spaces.last.addToSpace(new Constant[Boolean](1, true,proc2, 1), "expands")
      proc2.spaces.last.addToSpace(new Constant[Boolean](1, true,proc2, 1), "expands")
    }

    "BProcess space" should {
      val proc = prepare_process
      add_space_elem_exp(proc)
      add_space_elem_cnt(proc)

      "contain spaces in container" in {
        proc.spaces.length > 0
      }
      
      "Space elem test" in {
        val proc2 = proc
        println(proc2.spaces.last.expands.length)
        proc2.spaces.last.expands.length > 0
        InvokeTracer.run_proc(proc2)
        println(proc2.spaces.last.expands) // must be false
        proc2.spaces.last.expands.length > 0
      }
      
      "Order test" in {
        proc.spaces.head.findByOrder("container", order = 3).get.order == 3
        proc.spaces.head.getOrderNum("container") === 4
      }





      "Order auto-assign for ProcElems" in {
        "ProcElem" in {
          false
        }
        "SpaceElem" in {
          false
        }
      }
      "Parent test(at brick point)" in {
        proc.spaces.head.getBrick.isInstanceOf[Brick]
        proc.spaces.head.getBrick.order == 4
      }
      "Calling space_elem from brick" in {
        false
        "Many spaces for one brick" in {
          false
        }
        "SubBrick call" in {
          false
        }
      }

      "Space elem record to logger" in {
        false
      }
      "Update CV" in { // Throught update checker, from logs(by logs and station)
        "spaceelem's" in {
          false  
        }
        "front elements" in {
          false
        }
      }
      "Space chain invoking" in {
        false  
      }
      "Sygnal for Station" in {
        false
      }
      
    }
   

  }
