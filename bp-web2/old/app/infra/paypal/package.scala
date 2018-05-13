package infra

import play.api.libs.json.{JsString, Writes}

package object paypal {
  def decToStr(b: BigDecimal): String = {
    val str = b.toString()
    if (str.contains('.')) {
      val parts = str.split('.')

      val int: String = parts(0)
      val dec: String = parts(1)

      val ndec = if (dec.length > 2) dec.substring(0, 2)
      else if (dec.length == 1) dec + '0'
      else dec

      s"$int.$ndec"
    } else str
  }

  def decToDec(b: BigDecimal) = BigDecimal(decToStr(b))

  val writesBigDecimal = new Writes[BigDecimal] {

    def writes(b: BigDecimal) = JsString(decToStr(b))
  }

  object Implicits {
    implicit val writesBigDecimal = paypal.writesBigDecimal
  }
}
