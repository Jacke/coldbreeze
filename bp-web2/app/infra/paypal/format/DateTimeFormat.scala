package infra.paypal.format

import play.api.data.validation.ValidationError
import play.api.libs.json._

object DateTimeFormat {
  implicit val ZDateTimeReads: Format[org.joda.time.DateTime] = new Format[org.joda.time.DateTime] {

    import org.joda.time.DateTime

    val pattern = "yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'"

    val df = org.joda.time.format.DateTimeFormat.forPattern(pattern)

    def writes(datetime: DateTime): JsValue = JsString(datetime.toString(df))

    def reads(json: JsValue): JsResult[DateTime] = json match {
      case JsNumber(d) => JsSuccess(new DateTime(d.toLong))
      case JsString(s) => parseDate(s) match {
        case Some(d) => JsSuccess(d)
        case None => JsError(Seq(JsPath() -> Seq(ValidationError("validate.error.expected.jodadate.format", pattern))))
      }
      case _ => JsError(Seq(JsPath() -> Seq(ValidationError("validate.error.expected.date"))))
    }

    private def parseDate(input: String): Option[DateTime] =
      scala.util.control.Exception.allCatch[DateTime] opt DateTime.parse(input, df)

  }
}
