package service

import akka.actor.Actor
import spray.routing._


/**
 * Actor for HttpServices.
 *
 * Extend this actor with Spray HttpService traits to add http services.
 * - adroute from SprayService
 * - staticRoute to static files under web directory
 */
class ServiceActor
    extends Actor
    with SprayService {

  def actorRefFactory = context

  //-**********def receive = runRoute(adRoute ~ staticRoute)
  //type Completer = Seq[Message] ⇒ Unit

  def staticRoute: Route =
    path("")(getFromResource("web/index.html")) ~ getFromResourceDirectory("web")

  //var messages: List[Message] = Nil

  //var storedCompleter: Option[Completer] = None

  def receive: Receive = {
    runRoute(adRoute ~ staticRoute)

  }
}