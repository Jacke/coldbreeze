package statemachine
 
import scalaz.{State, Scalaz}, Scalaz._
 
object FSM {
  def apply[I, S](f: PartialFunction[(I, S), S]): FSM[I, S] =
    new FSM((i, s) => f.applyOrElse((i, s), (_: (I, S)) => s))
 
  private def states[S, O](xs: List[State[S, O]]): State[S, List[O]] =
    xs.sequence[({type λ[α]=State[S, α]})#λ, O]
 
  private def modify[I, S](f: (I, S) => S): I => State[S, Unit] =
    i => State.modify[S](s => f(i, s))
}
 
final class FSM[I, S] private (f: (I, S) => S) {
  def apply(is: List[I]): State[S, S] =
    FSM.states(is.map(FSM.modify(f))).flatMap(_ => State.get[S])
 
  def run(is: List[I]): State[S, S] =
    apply(is)
}

/**
 * Finite state energy machine
 * ![Implementation](/fsem.png)
 */
trait FSEM {
  
}
/**
 * A candy vending machine FSM // SUCH A SHITTY REALIZATION BUT WHATHEVER
 *
 * The Machine has two types of input
 *  - you can insert a coin
 *  - you can turn the knob
 *
 * The Machine can be in one of two states
 *  - locked
 *  - unlocked
 *
 * It also tracks how many candies are left and how many coins it contains
 *
 * The rules are as follows:
 *
 * - Inserting a coin into a locked machine will cause it to unlock if there's any candy left.
 * - Turning the knob on an unlocked machine will cause it to dispense candy and become locked.
 * - Turning the knob on a locked machine or inserting a coin into an unlocked machine does nothing.
 * - A machine that’s out of candy ignores all inputs.
 *
 * This is taken from [Functional Programming in Scala](http://www.manning.com/bjarnason/)
 */
object SimpleCandyDispenser {
 
  sealed trait Input
  case object Coin extends Input
  case object Turn extends Input
 
  sealed trait Machine {
    def candies: Int
    def coins: Int
  }
  object Machine {
    def apply(candies: Int, coins: Int): Machine = LockedMachine(candies, coins)
  }
  // States
  case class LockedMachine(candies: Int, coins: Int) extends Machine
  case class UnlockedMachine(candies: Int, coins: Int) extends Machine
 
  val fsm =
    FSM[Input, Machine] {
      case (Coin, LockedMachine(candies, coins)) if candies > 0 =>
        UnlockedMachine(candies, coins + 1)
 
      case (Turn, UnlockedMachine(candies, coins)) if candies > 0 =>
        LockedMachine(candies - 1, coins)
    }
}