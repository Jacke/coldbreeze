/*
package controllers
import sys.process._

import play.api._
import play.api.mvc._
import play.twirl.api.Html
//{Action, Controller}
import play.api.http.MimeTypes
import play.api.libs.json._
import play.api.cache._
import play.api.libs.json._
import play.api.libs.functional.syntax._
import play.api.Logger

import views._
import models.{AccountsDAO, User}
import service.DemoUser
import securesocial.core._
import controllers.users._
import models.DAO.resources._
import play.core._

class ApiSpecs extends Controller {//@Inject() (router: Router, cached: Cached) extends Controller {
  implicit val cl = getClass.getClassLoader

  // The root package of your domain classes, play-swagger will automatically generate definitions when it encounters class references in this package.
  // In our case it would be "com.iheart", play-swagger supports multiple domain package names
  val domainPackage = "controllers"  
  val secondDomainPackage = "us.ority"
  private lazy val generator = SwaggerSpecGenerator(domainPackage, secondDomainPackage)

  def specs = //cached("swaggerDef") {  //it would be beneficial to cache this endpoint as we do here, but it's not required if you don't expect much traffic.   
    Action { _ ⇒
      Ok(generator.generate(router.documentation))
    }
  //}

}
*/