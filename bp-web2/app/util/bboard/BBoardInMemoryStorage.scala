package bboard
import scala.collection.mutable._
import minority.utils._
import play.api.Play.current
import play.api.libs.ws._
import play.api.libs.ws.ning.NingAsyncHttpClientConfigBuilder
import scala.concurrent.Future
import java.util.UUID
import scala.concurrent._
import scala.concurrent.duration._
import org.jboss.netty.buffer._
import org.joda.time.DateTime
import play.api.data._
import play.api.data.Forms._
import play.api.data.format.Formats._
import play.api.data.validation.Constraints._
import play.api.data.format._
import play.api.libs.concurrent.Execution.Implicits.defaultContext
import play.api.libs.json._
import play.api.Play.current
import scala.util.{Success, Failure}
import scala.util.Try
import models.DAO._
import models._
import models.DAO.resources._
import akka.actor._
import akka.actor._
import akka.pattern.ask
import akka.util.Timeout

case class DelayedRequest(request: WSRequestHolder)
object BBoardInMemoryStorage {
	var boards:ListBuffer[Board] = ListBuffer.empty
	var entities:ListBuffer[Entity] = ListBuffer.empty
	var slats:ListBuffer[Slat] = ListBuffer.empty
	var requests:ListBuffer[Unit => Promise[String]] = ListBuffer.empty


}
