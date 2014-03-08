package main.scala.utils.links
import main.scala.bprocesses._
import main.scala.bprocesses.links._

trait LinkContainer {
  // BP Links
  // Ctx Links
}

trait BPLinkContainer[T] extends LinkContainer { self =>
  
  var links: Array[T] = _

  def add_link(x: T) = links :+ x

  def update_link[Elem](old: Elem, new: Elem) = {
    //val t1 = links.find (link => link.from == old)
    //val t2 = links.find (link => link.to == old)
    val t1 = links.collect { case link: T ⇒ link.from == old }
    val t2 = links.collect { case link: T ⇒ link.to   == old }
    if (t1.length > 0) {
      t1.foreach(link => links.update(link, new T(new, link.from)))
      //links.update(t1, new Link(new, t1.to))
    }
    else if (t2.length > 0)
    {
      t2.foreach(link => links.update(link, new T(link.from, new)))
      //links.update(t2, new Link(t2.from, new))
    }

  }
  //def showLinks = links.map(s ⇒ s.from.toString
  //  + Console.RED + " -> " + Console.WHITE +
  //  s.to.toString)

}


trait FrameLinkContainer[T] extends LinkContainer { self =>
  
  var links: Array[T] = _

  def add_link(x: T) = links :+ x

  //def showLinks = links.map(s ⇒ s.from.toString
  //  + Console.RED + " -> " + Console.WHITE +
  //  s.to.toString)
}