package main.scala.utils.resources
import main.scala.bprocesses._
import main.scala.bprocesses.resources._
import main.scala.bprocesses.Ownership

trait OwnershipContainer {
   var ownerships: Array[Ownership] = Array.empty
   def new_own(r: Resource, b: ResAct) = ownerships :+ new Ownership(r, b)
}


}
