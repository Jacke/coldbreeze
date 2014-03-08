package main.scala.utils.links
import main.scala.simple_parts.process._
import main.scala.bprocesses.links._
import scala.util.Try

/**
 *  Link 
 */
trait LinkSearcher[LinkType] { self ⇒


 // def links = PLinkDispatch.from(this)
 //def isLinksExist = self.links.isDefined



  /***
  *  Multiple handling
  ***/

  //def isMultiple = Try(arguments.getClass.getMethod("head")).isSuccess
  val isLinkList = false



  ////////////def to(target: Any) = {
  ////////////  val x = nested.links.toList.filter(_.from == Some(target))
  ////////////  x match {
  ////////////    //case None => None
  ////////////    case _ ⇒ x.map(_.to)
  ////////////  }
  ////////////}
  ////////////def from(target: Any) = {
  ////////////  println(nested)
  ////////////  println(target)
  ////////////  println("target finded")
  ////////////
  ////////////}

  /** Search methods
  // isMultiple (multiple: true)
  def proc = InvokeTracer.runner.get
  def apply(target: Any) = println(target.getClass)
  def to(target: Any) = {
    val x = proc.arguments.toList.filter(_.from == Some(target))
    x match {
      //case None => None
      case _ ⇒ x.map(_.to)
    }
  }
  def from(target: Any) = {
    InvokeTracer.runner.get.logger.log("dispatch invoked")
    isMultiple(target)
  }
  **/
}