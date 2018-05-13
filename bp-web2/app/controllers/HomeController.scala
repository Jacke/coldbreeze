package controllers

import javax.inject._
import play.api._
import play.api.mvc._

import _root_.bprocesses.Parallel
import main.scala.bprocesses._
import main.scala.simple_parts.process._
import main.scala.simple_parts.process.control._
import main.scala.simple_parts.process.data._
import main.scala.utils._
import main.scala.resources.scopes._

import main.scala.bprocesses.links._
import main.scala.utils.Space



/**
 * This controller creates an `Action` to handle HTTP requests to the
 * application's home page.
 */
@Singleton
class HomeController @Inject()(cc: ControllerComponents) extends AbstractController(cc) {

  /**
   * Create an Action to render an HTML page.
   *
   * The configuration in the `routes` file means that this method
   * will be called when the application receives a `GET` request with
   * a path of `/`.
   */
  def index() = Action { implicit request: Request[AnyContent] =>

    val proc1 = new BProcess(new Managment)
    proc1.push {
      Array[ProcElems](
        new Constant[Boolean](1, false, proc1, 1),
        new Constant[Boolean](2, false, proc1, 2)
      )
    }
    proc1.elements_init
    InvokeTracer.run_proc(proc1)

    Ok(proc1.variety.map(_.toString).mkString(","))
  }
}
