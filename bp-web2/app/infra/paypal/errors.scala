package infra.paypal

import infra.paypal.objects.ErrorObject
import play.api.libs.json.JsError

sealed trait PaypalError extends Throwable{
  def status: Int
}

case class JsonError(status: Int, statusText: String, err: JsError, body: Option[String] = None) extends PaypalError {
  override def toString = s"$status $statusText -> $body -> ${JsError.toJson(err)}"
  override def getMessage = this.toString
}

case class ApiError(status: Int, statusText: String, err: ErrorObject) extends PaypalError {
  override def toString = s"$status $statusText -> $err"
  override def getMessage = this.toString
}

case class FatalError(status: Int, statusText: String, err: Throwable) extends PaypalError {
  override def toString = s"$status $statusText -> $err"
  override def getMessage = this.toString
}