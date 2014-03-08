package main.scala.utils

import scala.util.parsing.combinator.RegexParsers
import scala.util.parsing.combinator.PackratParsers

object Calculator extends RegexParsers with PackratParsers {

  val NUMBER = """\d+""".r

  lazy val int: PackratParser[NumberNode] = NUMBER ^^ {
    case elt ⇒ NumberNode(elt.toInt)
  }

  lazy val parens: PackratParser[Node] = "(" ~ expr ~ ")" ^^ {
    _._1._2
  }

  lazy val multiplication: PackratParser[Node] = term ~ "*" ~ factor ^^ {
    x ⇒ OpNode("*", x._1._1, x._2)
  }

  lazy val addsub: PackratParser[Node] = add | sub

  lazy val add: PackratParser[Node] = expr ~ "+" ~ term ^^ {
    x ⇒ OpNode("+", x._1._1, x._2)
  }

  lazy val sub: PackratParser[Node] = expr ~ "-" ~ term ^^ {
    x ⇒ OpNode("-", x._1._1, x._2)
  }

  lazy val division: PackratParser[Node] = term ~ "/" ~ factor ^^ {
    x ⇒ OpNode("/", x._1._1, x._2)
  }

  lazy val term: PackratParser[Node] = multiplication | division | factor

  lazy val factor: PackratParser[Node] = parens | int

  lazy val expr: PackratParser[Node] = addsub | term

  lazy val eval: PackratParser[Int] = expr ^^ {
    _.eval
  }

  def apply(input: String): Number = parseAll(eval, input) match {
    case Success(result, _) ⇒ result
    case failure: NoSuccess ⇒ scala.sys.error(failure.msg)
  }
}

trait Node {
  def eval: Int = this match {
    case NumberNode(contents)     ⇒ contents
    case OpNode("*", left, right) ⇒ left.eval * right.eval
    case OpNode("+", left, right) ⇒ left.eval + right.eval
    case OpNode("-", left, right) ⇒ left.eval - right.eval
    case OpNode("/", left, right) ⇒ left.eval / right.eval
  }
}

case class NumberNode(contents: Int) extends Node

case class OpNode(contents: String, left: Node, right: Node) extends Node