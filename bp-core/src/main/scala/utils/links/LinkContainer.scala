package main.scala.utils.links
import main.scala.bprocesses._
import main.scala.bprocesses.links._
import main.scala.simple_parts.process.ProcElems
trait LinkContainer {
  // BP Links
  // Ctx Links
}

trait BPLinkContainer[T] extends LinkContainer { self =>
  
  var links: Array[BPLink] = _

  def add_link(x: T) = links :+ x

  def update_link(old: ProcElems, newone: ProcElems) = {

    val t1 = links.filter { case link: BPLink ⇒ link.start == Some(old) }
    val t2 = links.filter { case link: BPLink ⇒ link.end   == Some(old) }
    if (t1.length > 0) {
      t1.foreach(link => links.update(links.indexOf(link), new BPLink(Option(newone), link.start, link.getBP, link.isMultiple) ))
      //links.update(t1, new Link(new, t1.end))
    }
    else if (t2.length > 0)
    {
      t2.foreach(link => links.update(links.indexOf(link), new BPLink(link.start, Option(newone), link.getBP, link.isMultiple) ))
      //links.update(t2, new Link(t2.from, new))
    }
    println("boom")
    println(t2.length, t1.length)
    println(links.head.start)
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