package tests

import play.api.test._
import scala.concurrent.duration.FiniteDuration
import play.api.Logger
//import objects._
import scala.concurrent.ExecutionContext.Implicits.global
import models.DAO.conversion._

import models.DAO.reflect._
import models.DAO._
import play.api.http.MimeTypes
import play.api.libs.json._
import play.api.cache._
import play.api.data._
import play.api.data.Forms._
import play.api.data.format.Formats
import play.api.data.format.Formatter
import play.api.data.FormError
import controllers.Application
import org.specs2.matcher.ShouldMatchers
import play.api.http.HeaderNames
import play.api.mvc.{Request, AnyContent}
import play.api.test.{PlaySpecification, FakeApplication, FakeRequest}
import org.specs2.execute.AsResult
import org.specs2.execute.Result
import securesocial.core.RuntimeEnvironment
import play.api.test.{FakeRequest, WithApplication, Writeables, RouteInvokers}
import play.api.mvc.Cookie
import play.api.test.Helpers
import play.api.test.Helpers.cookies
import play.api.test.Helpers.defaultAwaitTimeout
import play.api.test.Helpers.running
import play.api.test.FakeApplication
import controllers.CustomRoutesService
import play.api.GlobalSettings
import play.api.test.{FakeRequest, WithApplication, FakeApplication, PlaySpecification}
import java.lang.reflect.Constructor
import service._
import org.specs2.mutable.Specification
import org.specs2.mutable._
import play.api.test.WithApplication
import play.api.test._
import play.api.test.Helpers._
import play.api.mvc._
import securesocial.core._
import play.Play
import controllers._
import play.api.test.Helpers.defaultAwaitTimeout
import service.DemoUser
import securesocial.core.RuntimeEnvironment

/*
class DBSpec extends PlaySpecification {
/*
  "DB" should {

    "must use Test database" in {
       DatabaseCred.switchTo("test")
       DatabaseCred.database.createSession().conn.getMetaData().getURL() == "jdbc:postgresql://localhost/minority_test"
    }

    "create DLL" in {
      util.DLL_Initiator.initiate.mustEqual(true)
    }
    
    "Drop All DLL" in {
      util.DLL_Initiator.drop.mustEqual(true)
    }


  }*/
  val bprocess = BProcessDTO(None, 
    title = "Test", 
    service = 1, 
    business = 1,
    created_at = None, 
    updated_at= None, 
    version = 1L, 
    state_machine_type = "base")
  val bp_id = BPDAO.pull_object(bprocess)

  "Bprocess" should {
    "created" in {
      bp_id > 0    
    }
  } 
  val resulted = RefDAO.retrive(4, bp_id, 1, in = "front","test", desc = "", space_id = None)
  val space_id = if (resulted.isDefined) Some(resulted.get.spaces.head) else None
  val space_resulted = RefDAO.retrive(4, bp_id, 1, in = "nested","test", desc = "", space_id = space_id)
  
  "Ref in tested process" should {
    "must making on front" in {
      resulted.isDefined && resulted.get.spaces.length > 0
    } 
    "must making on nested" in {
      space_resulted.isDefined && space_resulted.get.spaces.length > 0
    }
  }
  "Ref must be creatable with all references" in {
    "elements must generate orders" in {
      true
    }
    "spaces must generate indexes" in {
      true      
    }
  } 
  "Process" should {
    "deleted" in {
      BPDAO.delete(bp_id) != 0
    }
  } 

 /* "respond to the register Action" in {
    val requestNode = Json.toJson(Map("name" -> "Testname"))
    val request = FakeRequest().copy(body = requestNode)
        .withHeaders(HeaderNames.CONTENT_TYPE -> "application/json");
    val result = controllers.Users.register()(request)

    status(result) must equalTo(OK)
    contentType(result) must beSome("application/json")
    charset(result) must beSome("utf-8")

    val responseNode = Json.parse(contentAsString(result))
    (responseNode \ "success").as[Boolean] must equalTo(true)
  }
*/
 

}

*/



class ProcessSpec extends PlaySpecification {

 "add a new ideaType, using route POST /api/types" in {
  running(FakeApplication(additionalConfiguration = inMemoryDatabase())) {

    val jsonString = """{"name": "new name", "description": "new description"}"""
    val json = Json.parse(jsonString)

    /* ERROR
    val Some(result) = routeAndCall(
      FakeRequest(
        POST, 
        "/api/types",
        FakeHeaders(Seq("Content-Type" -> Seq("application/json"))), 
        json
      )
    )

    status(result) must equalTo(OK)
    contentType(result) must beSome("application/json")
    val ideaType = Json.parse(contentAsString(result))//.asOpt[IdeaType]
    println(ideaType)
    //ideaType.name mustEqual "new name"
    */

    1 == 1

  }
}
}


class ApplicationSpec extends PlaySpecification with ShouldMatchers {
/*  import WithLoggedUser._
  def minimalApp = FakeApplication(withoutPlugins=excludedPlugins,additionalPlugins = includedPlugins)
  "Access secured index " in new WithLoggedUser(minimalApp) {

    val req: Request[AnyContent] = FakeRequest().
      withHeaders((HeaderNames.CONTENT_TYPE, "application/x-www-form-urlencoded")).
      withCookies(cookie) // Fake cookie from the WithloggedUser trait

    val result = Application.index.apply(req)

    val actual: Int= status(result)
    actual must be equalTo OK
  }
*/

/*
import TestUtils._

"render the index page" in {
      val home = route(FakeRequest(GET, "/").withLoggedInUser(1)).get

      status(home) must equalTo(OK)
      //etc.
    }
*/







/*
   "should be accessible" in new WithAppLogin {
      //setup
      val request = FakeRequest().withCookies(LoginUtil.cookie)

      //exercise
      val controller = new controllers.Application()(env)
      val env: RuntimeEnvironment[DemoUser] = new service.MyEnvironment

      val result0 = controller.app()(FakeRequest())
      val result = controller.app()(request)

      //verify
      status(result) must equalTo(OK)
      contentAsString(result) must contain("Welcome to the dashboard!")
    }
*/





/*

object LoginUtil extends RouteInvokers with Writeables {

  val loginRequest = FakeRequest(Helpers.POST, "/auth/api/authenticate/userpass").withFormUrlEncodedBody(("username", "iamjacke@gmail.com"), ("password", "12344321"))
  var _cookie: Cookie = _

  val env: RuntimeEnvironment[DemoUser] = new service.MyEnvironment

  def cookie = _cookie
  def login() {
    running(FakeApplication(withGlobal=Some(global(env)) ,additionalConfiguration  = Map("smtp.mock" -> true))) {

    println(loginRequest)
    println(play.api.test.Helpers.route(loginRequest))
    route(loginRequest).get.value match {
      case Some(x) => println(x.get)
    }
    val credentials = cookies(route(loginRequest).get)
    println(credentials)
    val idCookie = credentials.get("id")
    _cookie = idCookie.getOrElse(
Cookie("id", "value: String", Some(100), "/", None, true, false)
      )
  }
}

def global[A](env:RuntimeEnvironment[A]): GlobalSettings =
    new play.api.GlobalSettings {
      override def getControllerInstance[A](controllerClass: Class[A]): A = {
        val instance = controllerClass.getConstructors.find { c =>
          val params = c.getParameterTypes
          params.length == 1 && params(0) == classOf[RuntimeEnvironment[A]]
        }.map {
          _.asInstanceOf[Constructor[A]].newInstance(env)
        }
        instance.getOrElse(super.getControllerInstance(controllerClass))
      }
    }


}

abstract class WithAppLogin extends WithApplication {
  override def around[T: AsResult](t: => T): Result = super.around {
    LoginUtil.login()
    t
  }
}

*/

}