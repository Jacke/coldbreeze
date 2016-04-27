package util
import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits.global

trait FileHandler {

  def upload(fileName: String, workbench: Int, description: String=""):Future[String]
//  def getLinkById(id: String):Future[String]
  def removeFileById(fileName: String, id: String): Future[Boolean]


}
