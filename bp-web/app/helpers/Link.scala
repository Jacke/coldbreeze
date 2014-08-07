import play.api._
import play.api.mvc._

package views.html.helper {
object linkWithSubdomain {
  def apply(path: play.api.mvc.Call, ssl: Boolean = false)(implicit subdomain: String, request: RequestHeader): String = {
    linkToSubdomain(subdomain = subdomain, path = path, ssl = ssl)
  }
}

object linkToSubdomain {
  def apply(path: play.api.mvc.Call, subdomain: String, ssl: Boolean = false)(implicit request: RequestHeader): String = {
    val schema = if (ssl) "https" else "http"

    if (request.host.split("\\.").head == subdomain)
      "%s://%s%s" format(schema, request.host, path.toString)
    else
      "%s://%s.%s%s" format(schema, subdomain, request.host, path.toString)
  }
}
}