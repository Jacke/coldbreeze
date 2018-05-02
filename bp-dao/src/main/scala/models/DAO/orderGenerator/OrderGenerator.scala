package us.ority.min.dao.orders

case class OrderElem(title: String, order: Int)

/****
 * !!!!!!!! WARNING !!!!!!!!
 * Use sort function for your collection
 */

object OrderGenerator {
  var ss = scala.collection.mutable.ListBuffer.empty[OrderElem]
  ss = scala.collection.mutable.ListBuffer(
    OrderElem("title 1",1), 
    OrderElem("title 2",2), 
    OrderElem("title 3",3), 
    OrderElem("title 4",4))

  def addToEnd = {
    val endOrder = ss.maxBy(_.order).order
    ss += OrderElem(s"title ${endOrder + 1}",endOrder + 1)
  }
  def addToBegining = {
    val endOrder = 1
    ss = ss.map { c => 
      c.copy(order = c.order + 1)
    }
    ss += OrderElem(s"title begin ${1}",1)
  }
  def addToPlace(place: Int) = {
    ss = ss.map { c => 
      if (c.order >= place) {
        c.copy(order = c.order + 1)
      } else {
        c
      }
    }
    ss += OrderElem(s"title ${place}", place)  
  }

}