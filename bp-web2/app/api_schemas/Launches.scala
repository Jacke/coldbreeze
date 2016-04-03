package us.ority.core

object Protocol {
case class BPSession(
  var id: Option[Int],
  process: Int,
  active_listed: Boolean = true)

  case class CardCreated(card: Card)

  case class Card(id: Int, name: String)
}
