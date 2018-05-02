package forms

import com.mohiva.play.silhouette.api.util.Credentials
import play.api.libs.json.Json
import play.api.data.Form
import play.api.data.Forms._
/**
 * The form which handles the submission of the credentials.
 */
object SignInForm {
 val form = Form(
    mapping(
      "identifier" -> email,
      "password" -> nonEmptyText
    )(Credentials.apply)(Credentials.unapply)
  )
  case class Data(
    email: String,
    password: String)

  /**
   * The companion object.
   */
  object Data {

    /**
     * Converts the [Date] object to Json and vice versa.
     */
    implicit val jsonFormat = Json.format[Data]
  }


}