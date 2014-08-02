package service

//import main.scala.process_parts._
//import main.scala.utils._
//import main.scala.MM._
import models.DAO._
import main.scala.utils._
import main.scala.bprocesses._
import main.scala.resources.scopes._
import com.github.nscala_time.time.Imports._


import main.scala.bprocesses._
import main.scala.simple_parts.process.ProcElems
import main.scala.simple_parts.process.ContainerBrick
import main.scala.simple_parts.process.control._
import main.scala.simple_parts.process.data._
import main.scala.utils._
import main.scala.resources.scopes._

import main.scala.bprocesses.links._
import main.scala.utils.Space


object BPServiceApp extends App {
   def check = "test"

   println("test")
   ElementRegistrator.apply
   // caster
   val process_dto = BPDAO.get(3).get
   val target = ProcElemDAO.findByBPId(3)
   println(target)

   
   val process = new BProcess(new Managment)

   val arrays = target.map(c => c.cast(process)).flatten.toArray
   println(arrays)
   process.push {
    arrays
   }   
   //process.push {
   //   Array[ProcElems](
   //     new ContainerBrick(2, "container brick", "", None, process, "brick", "containerbrick", 2))//,
   // }
   println(process.variety)
   println(process.variety.length)

  println(process.findFrontBrick()(0))

  //Space.apply(index: Int, brick: Brick, is_subbricks: Boolean = true, is_container: Boolean = true, is_expander: Boolean = true)   
  val test_space = BPSpaceDAO.findByBPId(3)
  println(test_space)
  println(test_space.length)

  /*
  SpaceElementDTO(id: Option[Int],
                        title:String,
                        desc:String,
                        business:Int,
                        bprocess:Int,
                        b_type:String,
                        type_title:String,
                        space_own:Option[Int],
                        space_owned: Int,
                        space_role:Option[String],
                        order:Int,
                        comps: Option[List[CompositeValues]])
  */
  val space_elems = SpaceElemDAO.findByBPId(3)
  println(space_elems)

  

  // Pull front spaces
  val front_bricks = process.findFrontBrick()
  println(front_bricks.length)
  // FILTER NESTED SPACES

  println(process.review())
  println("")
  println("")
  println("")
  println("")
  val nested_spaces_ids = space_elems.flatMap(space_elem => space_elem.space_own)

  val front_space_space_elems = space_elems.filter(space_elem => !nested_spaces_ids.contains(space_elem.space_owned))
  val nested_space_space_elems = space_elems.filter(space_elem => nested_spaces_ids.contains(space_elem.space_owned))

  val front_space_space_elems_ids = front_space_space_elems.map(space_elem => space_elem.space_owned)
  val nested_space_space_elems_ids = nested_space_space_elems.map(space_elem => space_elem.space_owned)

  val front_spaces = test_space.filter(space => front_space_space_elems_ids.contains(space.id.get))
  val converted_space = front_spaces.map(space => space.cast(process, front_space_space_elems)).flatten.toArray    
  converted_space.foreach(sp => println(sp.index + " " + sp.id + " " + sp.brick_owner))

  println(process.review())
  println("")
  println("")
  println("")
  println("")

  /*
  val nested_spaces_ids = space_elems.flatMap(space_elem => space_elem.space_own)
  //
  val front_space_space_elems = space_elems.filter(space_elem => !nested_spaces_ids.contains(space_elem.space_owned))
  val nested_space_space_elems = space_elems.filter(space_elem => nested_spaces_ids.contains(space_elem.space_owned))

  val front_space_space_elems_ids = front_space_space_elems.map(space_elem => space_elem.space_owned)
  val nested_space_space_elems_ids = nested_space_space_elems.map(space_elem => space_elem.space_owned)

  println("nested_space_space_elems_ids")
  nested_space_space_elems_ids.foreach(id => println(id))
  //front_space_space_elems.foreach(id => println(id.space_own))
 
  val front_spaces = test_space.filter(space => front_space_space_elems_ids.contains(space.id.get))
  val front_space_space_elems_index = front_spaces.map(sp => (sp.id.get -> sp.index)).toMap

      println("front_spaces.length " + front_spaces.length)
  //// Convert front_space_elems to initial and
  val list_space_elems:Map[Int, List[SpaceElementDTO]] = { 
    front_space_space_elems_ids.map { id =>
      id -> front_space_space_elems.filter(spelem => spelem.id.get == id) //.toMap
  }.toMap
}
  val list_space_elemsz:List[(Int, List[SpaceElementDTO])] = { 
    front_space_space_elems_ids.map { id =>
      (id, front_space_space_elems.filter(spelem => spelem.id.get == id)) //.toMap
  }
 } 
 println(list_space_elemsz)

  println("finding container brick" )
  front_space_space_elems_ids.foreach(println(_))
  println("list_space_elems: " + list_space_elems.size)
  list_space_elems.foreach { 
    case(id, va) => println("ID: " + id + "value " + va + "length" + va.length)
  }
  println("""
     INDEXXESS



    """)
  front_space_space_elems_index.foreach { 
    case(id, va) => println("ID: " + id + "value " + va)
  }
  front_spaces.foreach(sp => println(sp.index))


  val converted_space = front_spaces.map(space => space.cast(process, front_space_space_elems)).flatten.toArray    
  println("converted_space " + converted_space.length)
  converted_space.foreach(sp => println(sp.index))

  println("""
     w??????????



    """)





  converted_space.foreach { fspace =>
    list_space_elems.foreach { case(id, elems) =>
      println("list_space_elems.foreach ")

      elems.foreach { elem =>
        println("elems.foreach { elem =>")
        println(elems.length)
        println("checking " + fspace.index + " " + front_space_space_elems_index.get(elem.space_owned).get)
        if (front_space_space_elems_index.get(elem.space_owned).get == fspace.index) {
          println(elem.castToSpace(process, fspace).get)
          fspace.addToSpace(elem.castToSpace(process, fspace).get, elem.space_role.get)
          //fspace.addToSpace(,space_id = Option(fspace), "container")
        }
      }
    }
    process.spaces = process.spaces :+ fspace


  }
  process.spaces.foreach(sp => println(sp.index))
  // Check filling

  println("Check filling")
  process.spaces.foreach(space => println(space.container.length))

  ///////////////println("front_space_space_elems.length " + front_space_space_elems.length)
  // Pull nested spaces
  //front_space_space_elems.map()
  //process.spaces.foreach(_.addToSpace(space_id = Option(space_ptr)), "container")) 
  // addToSpace(
  //  new PrintValue[Boolean](2, true, proc123, 2,
  //    values = Option(CompositeValues(a_string = Option("********"))), space_id = Option(space_ptr)), "container")

  // Fill nested space
  */










///////////
/*
   InvokeTracer.run_proc(process)
   // save log & station
   println(process.station.represent)
   println(process.logger.logs.map(log => println(log.element.id)))
   //println(ElementTracer.findByInfo(target.head.b_type, target.head.type_title))

  // station -> stationdb
  val dbstation = BPStationDAO.from_origin_station(process.station, process_dto)
  println(dbstation)
  
  val station_id = BPStationDAO.pull_object(dbstation)
  println("station id" + station_id)


  // logger -> loggerdb
  val dblogger = BPLoggerDAO.from_origin_lgr(process.logger, process_dto, station_id)//, station:Int = 1)
  println(dblogger)
  dblogger.foreach(log => BPLoggerDAO.pull_object(log))

 /////////////
 ///////////
  // loggerdb -> logger(bp)
  val process1 = new BProcess(new Managment)
  process1.variety = process.variety
  println(process.logger.logs)
  println("process1.variety" + process1.variety.length)

  println("ssss"+process1.findObjectByOrder(1))
  println(process1.findObjectByOrder(3).get)
  println(process1.variety.map(elem => elem.order).last)
  println(process1.variety.find(elem => elem.order == 3))

  println(dblogger.get.map(log => println(log.order)))
  val logger_results = dblogger.get.map(log =>
    BPLoggerResult(
      process1.findObjectByOrder(log.order).get,
      composite=None,
      order = log.order,
      space = None,
      station = process1.station,
      invoked = log.invoked,
      expanded = log.expanded,
      container = log.container,
      date = log.date))
  //log.space /|\

  println(logger_results)
  
//////
  // stationdb -> station(bp)
  process1.station.update_variables(
                                dbstation.state,
                                dbstation.step,
                                dbstation.space,
                                dbstation.container_step.toArray,
                                dbstation.expand_step.toArray,
                                dbstation.started,
                                dbstation.finished,
                                dbstation.inspace,
                                dbstation.incontainer,
                                dbstation.inexpands,
                                dbstation.paused
                                )

println("is work?", process1.station.represent)

  // save to space
*/
}

