package util
import com.typesafe.jse._
import com.typesafe.jse.Engine.JsExecutionResult
import java.io.File
import scala.collection.immutable
import akka.pattern.ask
import akka.util.Timeout
import akka.actor.{ActorRef, ActorSystem}
import scala.concurrent.Await
import java.util.concurrent.TimeUnit
//import scala.scalajs.js.JSApp
//import scala.scalajs.js.annotation._

/*

object jsRouter extends JSApp {
  def main(): Unit = {
    println("Hello world!")
  }
}


@ScalaJSDefined
class Foo extends js.Object {
  val x: Int = 4
  def bar(x: Int): Int = x + 1
}
*/