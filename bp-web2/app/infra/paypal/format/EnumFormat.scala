package infra.paypal.format

import play.api.libs.json._
import play.api.mvc.PathBindable.Parsing

private[paypal] trait EnumFormat {
  self: Enumeration =>

  protected def valueFormat = new Format[this.type#Value] {
    def reads(json: JsValue) = json match {
      case s: JsString =>
        values.find(_.toString == s.value) match {
          case Some(v) => JsSuccess(v, __)
          case None => JsError("Incorrect value")
        }
      case _ =>
        JsError("Incorrect value type")
    }

    def writes(o: Value): JsValue = JsString(o.toString)
  }

  protected def valueBindable = new Parsing[Value](
    v => values.find(_.toString == v.trim).getOrElse(throw new Exception("Unknown "+v)),
    _.toString,
    (key: String, e: Exception) => "Cannot parse parameter %s as enum value: %s".format(key, e.getMessage)
  )
}
