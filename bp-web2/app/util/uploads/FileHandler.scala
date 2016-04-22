package util
import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits.global

trait FileHandler {

  def upload():Future[String]
  def getLinkById(id: String):Future[String]
  def removeFileById(id: String): Future[Boolean]


}
