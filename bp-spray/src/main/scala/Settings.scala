package main.scala

package object bp_core {

  type Traversable[+A] = scala.collection.immutable.Traversable[A]

  type Iterable[+A] = scala.collection.immutable.Iterable[A]

  type Seq[+A] = scala.collection.immutable.Seq[A]

  type IndexedSeq[+A] = scala.collection.immutable.IndexedSeq[A]
}

import akka.actor.{ ExtendedActorSystem, Extension, ExtensionKey }
import scala.concurrent.duration.{ Duration, FiniteDuration, MILLISECONDS }

object Settings extends ExtensionKey[Settings]

class Settings(system: ExtendedActorSystem) extends Extension {

  val hostname: String =
    system.settings.config getString "spray_service.hostname"

  val port: Int =
    system.settings.config getInt "spray_service.port"

  val timeout: FiniteDuration =
    Duration(system.settings.config getMilliseconds "spray_service.timeout", MILLISECONDS)
}

import scala.concurrent.{ Future, Promise }
import spray.routing.authentication.{ BasicUserContext, UserPass, UserPassAuthenticator }

object UsernameEqualsPasswordAuthenticator extends UserPassAuthenticator[BasicUserContext] {

  override def apply(userPass: Option[UserPass]): Future[Option[BasicUserContext]] = {
    val basicUserContext =
      userPass flatMap {
        case UserPass(username, password) if username == password ⇒ Some(BasicUserContext(username))
        case _ ⇒ None
      }
    Promise.successful(basicUserContext).future
  }
}
