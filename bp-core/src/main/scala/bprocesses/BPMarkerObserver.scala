package bprocesses


import scala.collection.mutable._

class BPMarkerObserver {

}
trait Observable { // Publisher
val observers = new ArrayBuffer [Observer]()

  def notifyObservers() {
    for(observer <- observers)
      observer.notification()
  }

  def addObserver(observer:Observer) {
    observers += observer
  }

  def removeObserver(observer:Observer) {
    observers -= observer
  }
}

trait Observer { // Subscriber
def notification()
}

// Concrete Implementation

class SomeObservable extends Observable

class SomeObserver extends Observer {
  override def notification() {
    println("do something here: SomeObserver")
  }
}

class AnotherObserver extends Observer {
  override def notification() {
    println("do something here: AnotherObserver")
  }
}

// Client

object ObserverClient {
  def apply = {
    var observable = new SomeObservable()
    var observer1 = new SomeObserver()
    var observer2 = new AnotherObserver()
    observable.addObserver(observer1)
    observable.addObserver(observer2)
    observable.notifyObservers()
    observable.removeObserver(observer2)
    observable.notifyObservers()
  }
}