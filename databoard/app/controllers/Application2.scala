package controllers

import actors.DocEventActor
import actors.DocEventActor.DocEventResult
import akka.actor.{ActorSystem, Props}
import play.api.mvc._
import play.api.libs.json.Json
import scala.util.Random
import models._
import scala.collection.mutable.ListBuffer

import play.api.mvc.{Action, RequestHeader}
import scala.collection.mutable.ListBuffer


class Application extends Controller {
  def index = Action { implicit request =>
    val l: ListBuffer[DocElems] = ListBuffer()
    Ok(views.html.index1(l))
  }

}

/*
object Application extends Controller {

  def index = Action {
    Ok(views.html.index(MindFields.apply))
  }

  val colors = IndexedSeq("red", "green", "purple", "black", "yellow", "blue", "pink")

  def moveUp(idx: String) = Action {
    MindFields.moveUp(MindFields.test.elements, idx.toInt)
    println("buffer", controllers.DocController.buffer.length)

    val system = ActorSystem("mySystem")
    val props = controllers.DocController.buffer.map(a => system.actorOf(Props(classOf[DocEventActor], a)))
    props.foreach(_ ! "12")


    controllers.DocController.buffer.foreach(_ ! DocEventResult(event = "init", objects = MindFields.test.elements.map(el => el.getClass.getSimpleName).toList))
    Ok(Json.toJson(Json.obj(
    "number" -> Random.nextInt(colors.size)
  )))
  }
  def moveDown(idx: String) = Action {
    MindFields.moveDown(MindFields.test.elements, idx.toInt)
    Ok(Json.toJson(Json.obj(
    "number" -> Random.nextInt(colors.size)
  )))
  }

  def number = Action(Ok(Json.toJson(Json.obj(
    "number" -> Random.nextInt(colors.size)
  ))))

  def color(i: Int) = Action {
    colors.lift(i).map { c =>
      Ok(Json.toJson(Json.obj(
        "color" -> c
      )))
    }.getOrElse(NotFound)
  }

}
*/
object MindFields {
  import models._
  val test = new Document(ListBuffer(
      new Header("Something"),
      new DataBlock,
      new Card("Something")))
  val test0 = test.elements.foreach(elem => elem.order = test.last_order + 1)
  def apply:ListBuffer[models.DocElems] = {
    test0
    
    //test.elements.foreach(elem => elem.order = test.last_order + 1)
    test.elements
  }
 
   def moveUp[DocElems](list: ListBuffer[DocElems], idx:Int) {
      if (idx < list.length && idx > 0) {
        list(idx) match {
          case a:DocElems => { val target = list(idx-1) 
                        list.update(idx-1, a)
                        list.update(idx, target)
                       }
        }
      }
      else println("bam")
    }
    def moveDown[DocElems](list: ListBuffer[DocElems], idx:Int) {
      if (idx < list.length && idx > 0) {
        list(idx) match {
          case a:DocElems => { val target = list(idx+1) 
                        list.update(idx+1, a)
                        list.update(idx, target)
                       }
        }
      }
      else println("bam")
    }

}