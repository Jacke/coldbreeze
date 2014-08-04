package main.scala

import _root_.bprocesses.Parallel
import main.scala.bprocesses._
import main.scala.simple_parts.process._
import main.scala.simple_parts.process.control._
import main.scala.simple_parts.process.data._
import main.scala.utils._
import main.scala.resources.scopes._

import main.scala.bprocesses.links._
import main.scala.utils.Space




object Finalize extends App {
  /****************************************************************************
   * Block run
   *******************************************************************************************/
  def first() = {
    val proc1 = new BProcess(new Managment)
    proc1.push {
      Array[ProcElems](
        new Constant[Boolean](1, false, proc1, 1),
        new Constant[Boolean](2, false, proc1, 2)
      )
    }
    proc1.elements_init
    InvokeTracer.run_proc(proc1)
  }

  /********************************************************************************
   * Block run from
   *********************************************************************************************/
  def second() = {
    val proc2 = new BProcess(new Managment)
    proc2.push {
      Array[ProcElems](
        new Constant[Boolean](1, false, proc2, 1),
        new Constant[Boolean](2, false, proc2, 2),
        new Constant[Boolean](3, false, proc2, 3)
      )
    }
    proc2.elements_init
    proc2.station.update_started(true)
    proc2.station.update_step(2)
    println("****started******")
    InvokeTracer.run_proc(proc2)
  }
  /********************************************************************************************
   * Brick container run
   *********************************************************************************************/
  def third() = {
    val proc123 = new BProcess(new Managment)
    proc123.push {
      Array[ProcElems](
        new Constant[Boolean](1, true, proc123, 1),
        new ContainerBrick(4, "container brick", "", Option(CompositeValues()), proc123, "brick", "containerbrick", 4))//,
      //new ExpandBrick(5, "expand brick", "", Option(CompositeValues()), proc123, "brick", "expandbrick", 5))//,
    }
    proc123.elements_init

    // Add element to expand
    val space_ptr = proc123.spaces.last
    space_ptr.addToSpace(new Constant[Boolean](1, true, proc123, 1, space_id = Option(space_ptr)), "container")
    space_ptr.addToSpace(new Constant[Boolean](1, false, proc123, 1, space_id = Option(space_ptr)), "container")



    println(proc123.spaces.length)
    InvokeTracer.run_proc(proc123)
   }



  /**************************************************************
   * Brick container run from
   *********************************************************************/
  def fourth() =
  {
    val proc123 = new BProcess(new Managment)
    proc123.push {
      Array[ProcElems](
        new Constant[Boolean](1, true, proc123, 1),
        new ContainerBrick(4, "container brick", "", Option(CompositeValues()), proc123, "brick", "containerbrick", 4))//,
      //new ExpandBrick(5, "expand brick", "", Option(CompositeValues()), proc123, "brick", "expandbrick", 5))//,
    }
    proc123.elements_init

    // Add element to expand
    val space_ptr = proc123.spaces.last
    space_ptr.addToSpace(new Constant[Boolean](1, true, proc123, 1, space_id = Option(space_ptr)), "container")
    space_ptr.addToSpace(new Constant[Boolean](1, false, proc123, 1, space_id = Option(space_ptr)), "container")



    println(proc123.spaces.length)
    proc123.station.update_started(true)
    proc123.station.step = 1
    proc123.station.inspace = true
    proc123.station.space = 1
    proc123.station.container_step = Array(1)
    InvokeTracer.run_proc(proc123)
  }

  /******************************************************************
   * Brick nested container
   ***********************************************************************/
  def fifth() = {
  val proc123 = new BProcess(new Managment)
    proc123.push {
      Array[ProcElems](
      new Constant[Boolean](1, true, proc123, 1),
      new ContainerBrick(4, "container brick", "", Option(CompositeValues()), proc123, "brick", "containerbrick", 4))//,
      //new ExpandBrick(5, "expand brick", "", Option(CompositeValues()), proc123, "brick", "expandbrick", 5))//,
  }
    proc123.elements_init

    // Add element to expand
  val space_ptr = proc123.spaces.last
    space_ptr.addToSpace(new Constant[Boolean](1, true, proc123, 1, space_id = Option(space_ptr)), "container")
    space_ptr.addToSpace(new Constant[Boolean](1, false, proc123, 1, space_id = Option(space_ptr)), "container")

    space_ptr.addToSpace(
    new ContainerBrick
    (4, "container brick", "", Option(CompositeValues()), proc123, "brick", "containerbrick", 4), "container")

    space_ptr.addToSpace(
    new PrintValue[Boolean](2, true, proc123, 2,
      values = Option(CompositeValues(a_string = Option("********"))), space_id = Option(space_ptr)), "container")

    // add space to co container
    proc123.spaces.last.container.last.init
    proc123.spaces = proc123.spaces :+ Space.apply(2, proc123.spaces.last.container(2).asInstanceOf[Brick], is_subbricks = false, is_container = true)
    // add element to cocobrick
    proc123.spaces.last.addToSpace(new PrintValue[Boolean](1, true, proc123, 1,
      values = Option(CompositeValues(a_string = Option("x1"))), space_id = Option(proc123.spaces.last)), "container")
    proc123.spaces.last.addToSpace(new PrintValue[Boolean](2, true, proc123, 2,
      values = Option(CompositeValues(a_string = Option("x2"))), space_id = Option(proc123.spaces.last)), "container")


    println(proc123.spaces.length)
    InvokeTracer.run_proc(proc123)
    println(proc123.review())
  }

  /*************************************************************
   * Brick nested container run from
   *************************************************************/
  def sixth() = {
    val proc123 = new BProcess(new Managment)
    proc123.push {
      Array[ProcElems](
        new Constant[Boolean](1, true, proc123, 1),
        new ContainerBrick(2, "container brick", "", Option(CompositeValues()), proc123, "brick", "containerbrick", 2))//,
      //new ExpandBrick(5, "expand brick", "", Option(CompositeValues()), proc123, "brick", "expandbrick", 5))//,
    }
    proc123.elements_init

    // Add element to expand
    val space_ptr = proc123.spaces.last
    space_ptr.addToSpace(new Constant[Boolean](1, true, proc123, 1, space_id = Option(space_ptr)), "container")
    space_ptr.addToSpace(new Constant[Boolean](2, false, proc123, 2, space_id = Option(space_ptr)), "container")

    space_ptr.addToSpace(
      new ContainerBrick
      (3, "container brick", "", Option(CompositeValues()), proc123, "brick", "containerbrick", 3), "container")

    space_ptr.addToSpace(
      new PrintValue[Boolean](4, true, proc123, 4,
        values = Option(CompositeValues(a_string = Option("********"))), space_id = Option(space_ptr)), "container")

    // add space to co container
    proc123.spaces.last.container.last.init
    proc123.spaces = proc123.spaces :+ Space.apply(2, proc123.spaces.last.container(2).asInstanceOf[Brick], is_subbricks = false, is_container = true)
    // add element to cocobrick
    proc123.spaces.last.addToSpace(new PrintValue[Boolean](1, true, proc123, 1,
      values = Option(CompositeValues(a_string = Option("x1"))), space_id = Option(proc123.spaces.last)), "container")
    proc123.spaces.last.addToSpace(new PrintValue[Boolean](2, true, proc123, 2,
      values = Option(CompositeValues(a_string = Option("x2"))), space_id = Option(proc123.spaces.last)), "container")


    println(proc123.spaces.length)
    proc123.station.update_started(true)
    proc123.station.step = 1
    proc123.station.inspace = true
    proc123.station.space = 2
    proc123.station.container_step = Array(2, 1)
    InvokeTracer.run_proc(proc123)
  }


  first()
  println(
    """
      |
      |
      | Block run from
      |
      |
    """.
      stripMargin)
  second()
  println(
    """
      |
      |
      |   Brick container run
      |
      |
    """.
      stripMargin)
  third()
  println(
    """
      |
      |
      |   Brick container run from
      |
      |
    """.
      stripMargin)
  fourth()
println(
    """
      |
      |
      | Brick nested container
      |
      |
    """.
      stripMargin)
  fifth()
  println(
    """
      |
      |
      | Brick nested container run from
      |
      |
    """.
      stripMargin)
  sixth()



  println(
    """
      |Thread
    """.stripMargin)
  Parallel.apply
}



object Main extends App {


 println("""

      |1)
      |Block
      |BrICK -> Space
      |         Block
      |         Block
      |Block <-
    """.stripMargin)
  val proc12 = new BProcess(new Managment)
  proc12.push {
    Array[ProcElems](
      new Constant[Boolean](1, false, proc12, 1),
      new ContainerBrick(2, "container brick", "", Option(CompositeValues()), proc12, "brick", "containerbrick", 2),
      new Constant[Boolean](3, false, proc12, 3)
      )//new ExpandBrick(5, "expand brick", "", Option(CompositeValues()), proc12, "brick", "expandbrick", 5))//,
  }
  def getSpace(brick: Brick):Option[Space] = {
    proc12.spaces.find(space => (space.brick_owner == brick))
  }
  proc12.elements_init
  // Add element for expanding
  proc12.spaces.last.addToSpace(new PrintValue[Boolean](1, true, proc12, 1,
    values = Option(CompositeValues(a_string = Option("x1")))), "container")

  proc12.spaces.last.addToSpace(new PrintValue[Boolean](1, true, proc12, 1,
    values = Option(CompositeValues(a_string = Option("x2")))), "container")

  // Run process
  //////////InvokeTracer.run_proc(proc12)
  // Run from
  // ******************************************************************************************
  //TODO
  // ******************************************************************************************





 println(
    """
      |2)
      |Block
      |Brick -> Space
      |         Brick -> Space
      |                  Block
      |                  Block
      |         Block <-
      |Block <-
    """.stripMargin)

  val proc123 = new BProcess(new Managment)
  proc123.push {
    Array[ProcElems](
      new Constant[Boolean](1, true, proc123, 1),
      new ContainerBrick(4, "container brick", "", Option(CompositeValues()), proc123, "brick", "containerbrick", 4))//,
      //new ExpandBrick(5, "expand brick", "", Option(CompositeValues()), proc123, "brick", "expandbrick", 5))//,
  }
  proc123.elements_init

  // Add element to expand
  val space_ptr = proc123.spaces.last
  space_ptr.addToSpace(new Constant[Boolean](1, true, proc123, 1, space_id = Option(space_ptr)), "container")
  space_ptr.addToSpace(new Constant[Boolean](1, false, proc123, 1, space_id = Option(space_ptr)), "container")

  space_ptr.addToSpace(
    new ContainerBrick
      (4, "container brick", "", Option(CompositeValues()), proc123, "brick", "containerbrick", 4), "container")

  space_ptr.addToSpace(
    new PrintValue[Boolean](2, true, proc123, 2,
      values = Option(CompositeValues(a_string = Option("********"))), space_id = Option(space_ptr)), "container")

  // add space to co container
  proc123.spaces.last.container.last.init
  proc123.spaces = proc123.spaces :+ Space.apply(2, proc123.spaces.last.container(2).asInstanceOf[Brick], is_subbricks = false, is_container = true)
  // add element to cocobrick
 proc123.spaces.last.addToSpace(new PrintValue[Boolean](1, true, proc123, 1,
    values = Option(CompositeValues(a_string = Option("x1"))), space_id = Option(proc123.spaces.last)), "container")
proc123.spaces.last.addToSpace(new PrintValue[Boolean](2, true, proc123, 2,
    values = Option(CompositeValues(a_string = Option("x2"))), space_id = Option(proc123.spaces.last)), "container")


  println(proc123.spaces.length)
  InvokeTracer.run_proc(proc123)
  println(proc123.review())
  //println(proc123.station.represent)






  println(
    """
      |3) Upadte temp element && expand tests
      |Block
      |Brick -> Space
      |         Expand
      |         Brick -> Space
      |                  Epand
      |                  Expand
      |         Expand <-
      |Block <-
    """.stripMargin
    )

  val proc1234 = new BProcess(new Managment)
  proc1234.push {
    Array[ProcElems](
      new Constant[Boolean](1, true, proc1234, 1),
      new ContainerBrick(4, "container brick", "", Option(CompositeValues()), proc1234, "brick", "containerbrick", 2))//,
      //new ExpandBrick(5, "expand brick", "", Option(CompositeValues()), proc123, "brick", "expandbrick", 5))//,
  }
  proc1234.elements_init
  // Add element to expand
  val space_ptr1234 = proc1234.spaces.last

  space_ptr1234.addToSpace(new Constant[Boolean](1, true, proc1234, 1, space_id = Option(space_ptr1234)), "container")
  space_ptr1234.addToSpace(new Constant[Boolean](1, false, proc1234, 2, space_id = Option(space_ptr1234)), "container")
  space_ptr1234.addToSpace(new ContainerBrick(4, "container brick", "", Option(CompositeValues()), proc1234, "brick", "containerbrick", 3), "container")
  space_ptr1234.addToSpace(new PrintValue[Boolean](2, true, proc1234, 4,
    values = Option(CompositeValues(a_string = Option("********"))), space_id = Option(space_ptr1234)), "container")

  // add space to co container
 space_ptr1234.container.last.init
  proc1234.spaces = proc1234.spaces :+ Space.apply(2, proc1234.spaces.last.container(2).asInstanceOf[Brick], is_subbricks = false, is_container = true)
  // add element to cocobrick
proc1234.spaces.last.addToSpace(new PrintValue[Boolean](1, true, proc1234, 1, space_id = Option(proc1234.spaces.last),
    values = Option(CompositeValues(a_string = Option("x1")))), "container")
proc1234.spaces.last.addToSpace(new PrintValue[Boolean](2, true, proc1234, 2, space_id = Option(proc1234.spaces.last),
    values = Option(CompositeValues(a_string = Option("x2")))), "container")
proc1234.spaces.last.addToSpace(new PrintValue[Boolean](3, true, proc1234, 3, space_id = Option(proc1234.spaces.last),
    values = Option(CompositeValues(a_string = Option("x3")))), "container")

  println(proc1234.spaces.length)
  InvokeTracer.run_proc(proc1234)


  println(
    """
      | Logstep check
    """.stripMargin
    )
    println("\n\n\n\n")
    println(proc123.logger.logs.map(log => log.step).mkString(", "))
    // 1, 2, 1, 2, 3, 1, 2, 4
    println(proc1234.logger.logs.map(log => log.step).mkString(", "))

    println("\n\n\n\n")

    println(proc123.logger.updateExpChecker(proc123.spaces.last.container.head))
    
    /* EXPAND UPDATE */
    //val expand_false_target = proc123.logger.logs.last.element
    //println(proc123.logger.isExpandUpdated(expand_false_target)) // must be false

    println(proc123.spaces.map(_.brick_owner).mkString(", ")) // Many space for one brick


  proc1234.spaces.last.container.find(_.id == 3).get.values.get.a_string = Option("x33111")

  println(
    """
      |Restore CV
    """.stripMargin)

  println(proc1234.spaces.last.container.find(_.id == 3).get.values.get.a_string)
  proc1234.restoreCVOfElems
  println(proc1234.spaces.last.container.find(_.id == 3).get.values.get.a_string)
  println(proc1234.logger.logs_before.length)
  println(proc1234.logger.logs.length)
  println(proc1234.logger.beforeAfter.foreach(k => println(k._1, k._2.length))) // Check all logs output
}








































object Main12 {



  //Tryin2.argparams
  //Tryin3.frame
  //Tryin3.invoke_block
  //Tryin3.multiple_arg_p
  ///////////Tryin3.inputed
  ///////////Tryin3.invoke_block
  //  println(Calculator("5" + "*" + "10"))
  //  println(Calculator("5 * 10").getClass)
  val proc = new BProcess(new Managment)
  proc.push {
        Array[ProcElems](
        //new Note("Test note"),
        //new Constant[Int](1001),
        //new Constant[Int](1001),
        new Constant[Boolean](1, true,proc, 1),
        new Constant[Boolean](2, true,proc, 1),
        new Constant[Boolean](3, false,proc, 1),
        new Brick(4, "test brick", "", Option(CompositeValues()), proc, "brick", "test_brick", 4))//,
        //new Brick(proc, 3),
        //new Space(3, 1),new Space(3, 2))
        }
  println(proc.variety(0))
  /** 
    Update object/link 
                        
  val link = new BPLink(Option(proc.variety(0)), Option(proc.variety(2)), proc, true)  
  proc.links = proc.links :+ link
  println(proc.links.head.start)


  proc.updateElem(proc.variety(0), new Constant[Boolean](200, false), false)
  println(proc.variety(0))
  println("upddates")
  println(proc.links.head.start)
                                                                  **/
  println(proc.station.represent)
  proc.elements_init

  println("space" + proc.spaces.head.brick_owner)
  InvokeTracer.run_proc(proc)

  ElementRegistrator.apply
  println(ElementTracer.els.head)
  println(proc.restoreProcElems)
  println(proc.station.represent)

  println("logger")
  proc.station.logger.logs.map(log => println(log))
  // * Brick with SpaceControl interface
  // * Add to space
  // * Input check it out


  /**
   * Run from
   */
  val proc1 = new BProcess(new Managment)
  proc1.push {
    Array[ProcElems](
      //new Note("Test note"),
      //new Constant[Int](1001),
      //new Constant[Int](1001),
      new Constant[Boolean](1, true,proc1, 1),
      new Constant[Boolean](2, true,proc1, 2),
      new Constant[Boolean](3, false,proc1, 3),
      new Brick(4, "test brick", "", Option(CompositeValues()), proc, "brick", "test_brick", 4))//,
    //new Brick(proc, 3),
    //new Space(3, 1),new Space(3, 2))
  }
  proc1.station = proc.station
  proc1.station.update_step(2)
  proc1.station.started = true
  proc1.station.finished = false
  println(proc1.station.started)

  proc1.logger = proc.logger
  proc1.marker.station = proc1.station
  println("proc1")
  InvokeTracer.run_proc(proc1)






  println(
    """
      |Expands through Marker
      |Container run through space_move
    """.stripMargin)
  val proc2 = new BProcess(new Managment)
  proc2.push {
    Array[ProcElems](
      //new Note("Test note"),
      //new Constant[Int](1001),
      //new Constant[Int](1001),
      new Constant[Boolean](1, true,proc1, 1),
      new Constant[Boolean](2, true,proc1, 1),
      new Constant[Boolean](3, false,proc1, 1),
      new ContainerBrick(4, "container brick", "", Option(CompositeValues()), proc2, "brick", "containerbrick", 4),
      new ExpandBrick(5, "expand brick", "", Option(CompositeValues()), proc2, "brick", "expandbrick", 5))//,
    //new Brick(proc, 3),
    //new Space(3, 1),new Space(3, 2))
  }

  // init space elems
  proc2.elements_init

  /*
  println(proc2.spaces.length)
  println(proc2.spaces.head)
  proc2.spaces.head.addToSpace(new Constant[Boolean](1, true,1), "container")
  proc2.spaces.head.addToSpace(new Constant[Boolean](2, true,1), "container")
  proc2.spaces.head.addToSpace(new Constant[Boolean](3, true,1), "container")

  println(proc2.spaces.last)
  proc2.spaces.last.addToSpace(new Constant[Boolean](1, true,1), "expands")
  proc2.spaces.last.addToSpace(new Constant[Boolean](1, true,1), "expands")
  proc2.spaces.last.addToSpace(new Constant[Boolean](1, true,1), "expands")
  */
  // TODO: Space shit above and below
  //println("******" + proc2.spaces.last.index)
  //println(proc2.spaces.last.expands.head)
  //InvokeTracer.run_proc(proc2)
  //println(proc2.spaces.last.expands) // must be false

  /****


  // getter for space
  println(proc.variety(3).asInstanceOf[Brick].getSpace)
  println(proc.getSpaceByIndex(1)) // теперь можно спокойно работать с Пространством
  // pusher to space
  var conta = proc.getSpaceByIndex(1).get.container 
  conta = conta :+ new Constant[Boolean](false)
  println(conta.length)
  println(">>>>>>>")

  val sp_link = new BPLink(Option(proc.variety(0)), Option(conta(0)), proc)
  BPLinkSearcher.get_from(sp_link)
  BPLinkSearcher.get_to(sp_link)
  // brick getspaces
  println("getspacebyorder:")
  println(proc.getSpaceByOrder(3))
  println(proc.getSpacesByOrder(3).length)

  // subbrick
  // container
  // expand
  /*
  * * SubBrick 
  * * Refactor old elements with Brick and SubBrick
  */
*/
/*
  // Link Retriver
  // a -> b
  BPLinkSearcher.get_from(link)
  BPLinkSearcher.get_to(link)

  println("Multiple Link:")
  val z1 = new BPLink(Option(proc.variety(0)), Option(proc.variety(3)), proc, true)   
  val z2 = new BPLink(Option(proc.variety(1)), Option(proc.variety(3)), proc, true)   
  val z3 = new BPLink(Option(proc.variety(2)), Option(proc.variety(3)), proc, true)  
  // a -(m)> d
  BPLinkSearcher.get_from(z1)
  // b -(m)> d
  BPLinkSearcher.get_from(z2)
  // c -(m)> d
  BPLinkSearcher.get_from(z3)
  // d > a,b,c
  BPLinkSearcher.getFromObj(proc.variety(3), proc)  
  /*
   Argument
  Parameter
  */
  // Update action
  println(proc.variety(3))
  println(proc.variety.update(3, proc.variety(0)))
  println(proc.variety(3))

  println("Running process")
  InvokeTracer.run_proc(proc)
  print(proc.getElemsLength)
  println(ElementTracer.els)
  ElementTracer.els.map(s => println(s.desc))
  println(proc.logger.logs)

  */
}





/*
object Tryin3 {
  import main.scala.maps._
  import scala.collection.mutable._

  def invoke_block {
    import main.scala.simple_parts.context._
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
        new Constant[Boolean](false),
        new InputPlaceholder,
        new Space)
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
    println(frame.request(new Request(frame.container(0).asInstanceOf[ProcInvoker], inblock)))
  }

  def multiple_arg_p {
    val context = new StructContext("Accounting")
    context.subjects = List(new Subject("Taxes"))
    // Resource
    type Resource = List[String]
    val resource: Resource = List("Stan", "Will")
    // Process
    val proc = new BProcess(List("Stan", "Will"))
    proc.push {
      ListBuffer[ProcElems](
        //new Note("Test note"),
        //new Constant[Int](1001),
        //new Constant[Int](1001),
        new Constant[Boolean](true),
        //new Input(input),
        //new Checker,
        new Result, // must be true
        new Constant[Boolean](false),
        new InputPlaceholder)
    }

    proc.arg_push(new ArgLink(Option(proc.variety(0)), Option(proc.variety(1))))
    proc.arg_push(new ArgLink(Option(proc.variety(2)), Option(proc.variety(1))))
    println("arrrgs")
    InvokeTracer.run_proc(proc)
  }

  def frame {
    val context = new StructContext("Accounting")
    context.subjects = List(new Subject("Taxes"))
    // Resource
    type Resource = List[String]
    val resource: Resource = List("Stan", "Will")
    // Process
    val proc = new BProcess(List("Stan", "Will"))
    proc.push {
      ListBuffer[ProcElems](
        new Note("Test note"),
        new Result)
    }
    // Заполняем субьект процессом
    context.subjects.head.subj_procs += proc
    println(context.subjects.head.subj_procs)
    // Оборачиваем процесс в рамку
    val frame = new Frame("Ramka")
    println(frame)
    context.subjects.head.frames += frame
    println(context.subjects.head.frames)
    // Рамка готова
    // В рамку можно пихать любые объекты для субьекта
    context.subjects.head.frames.head.container += proc // Добавили процесс
    println(context.subjects.head.frames.head.toString)
  }

  def context {
    // Context
    val context = new StructContext("Accounting")
    context.subjects = List(new Subject("Taxes"))
    // Resource
    type Resource = List[String]
    val resource: Resource = List("Stan", "Will")
    // Process
    val proc = new BProcess(List("Stan", "Will"))
    proc.push {
      ListBuffer[ProcElems](
        new Note("Test note"),
        new Result)
    }
    // Links
    new ArgLink(Option(proc.variety(0)), Option(proc.variety(1)))

    // Push proc to subject
    context.subjects.head.subj_procs = ListBuffer(proc)
    // Run proc
    import main.scala.simple_parts.context._

    //InvokeTracer.run_proc(proc)

    //println(new ProcInvoker)
    /*
    ProcessFlow(proc).status
    return can it run? if not why
    Checker is valid arg params
      is arg set
      optional param args
      inputcheck

    proc.input not found?
    proc.paused
    proc.input_push(block)
    push.invoke
    proc.contin
    */

    println(context.subjects.head.subj_procs)
    println("********")
    println((new Result).isOptionalArg)
  }

  def inputed {
    import main.scala.simple_parts.context._

    val xx = new ProcInvoker
    val proc = new BProcess(List("Stan", "Will"))
    proc.push {
      ListBuffer[ProcElems](
        //new Note("Test note"),
        //new Constant[Int](1001),
        //new Constant[Int](1001),
        new Constant[Boolean](true),
        //new Input(input),
        //new Checker,
        new Result, // must be true
        new Constant[Boolean](false),
        new InputPlaceholder)
    }
    val frame = new Frame("Ramka")
    frame.init

    new PrLink(Option(xx), Option(proc))
    // lazy val proc: BProcess = arguments.productIterator.toList.head.asInstanceOf[BProcess]
    // InvokeTracer.run_proc(proc)
    println(new ProcInvoker)
    println("request")
    println(new Request(xx))
  }
}
*/

/*
object Tryin2 {
  import util.Random
  import scala.collection.mutable._
  import main.scala.simple_parts.process._

  def param {
    val proc = new BProcess(List("Stan", "Will"))
    proc.push {
      ListBuffer[ProcElems](
        new Note("Test note"),
        new Result)
    }
    new ArgLink(Option(proc.variety(0)), Option(proc.variety(1)))
    InvokeTracer.run_proc(proc)
  }
  def argparams {
    val proc = new BProcess(List("Stan", "Will"))
    val input = new Note("Input note")
    proc.push {
      ListBuffer[ProcElems](
        //new Note("Test note"),
        //new Constant[Int](1001),
        //new Constant[Int](1001),
        new Constant[Boolean](true),
        //new Input(input),
        //new Checker,
        new Result, // must be true
        new Constant[Boolean](false),
        new InputPlaceholder)
    }
    //new BLink(Option(proc.variety(3)), Option(proc.variety(6)))
    //new BLink(Option(proc.variety(0)), Option(proc.variety(1)))

    proc.arg_push(new ArgLink(Option(proc.variety(0)), Option(proc.variety(1))))
    proc.arg_push(new ArgLink(Option(proc.variety(2)), Option(proc.variety(1))))
    println("arrrgs")
    println(proc.arguments)

    proc.fill(ListBuffer[ProcElems](input))
    InvokeTracer.run_proc(proc)
  }
}
*/






