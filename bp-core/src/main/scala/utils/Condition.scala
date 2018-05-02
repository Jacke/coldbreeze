package main.scala.utils

class Conditional[T](left: ⇒ T) {
  def iff(right: ⇒ Boolean): Option[T] = if (right) Some(left) else None
  def unless(right: ⇒ Boolean): Option[T] = if (!right) Some(left) else None
  implicit def any2Unless[T](left: ⇒ T) = new Conditional(left)
}

