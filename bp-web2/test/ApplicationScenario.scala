import java.lang.reflect.Constructor

import controllers.CustomRoutesService
import play.api.GlobalSettings
import play.api.test.{FakeRequest, WithApplication, FakeApplication, PlaySpecification}
import securesocial.core.RuntimeEnvironment
import securesocial.testkit.AlwaysValidIdentityProvider
import service.{DemoUser, MyEventListener, InMemoryUserService}
import play.libs.Json._
import play.libs._
import models.DAO.conversion._

class ApplicationScenario  extends PlaySpecification {

  //DatabaseCred.switchTo("test")

  def app = FakeApplication( withGlobal=Some(global(env1)))

  var userEmail:Option[String] = None 
  var userBusiness:Option[Int] = None

  //val fakedApp = new WithApplication(app)
  

  "A logged in user can view the index and fetch generated business" in {
    running(app) {
    //Given
    val creds1 = cookies(route(FakeRequest(POST, "/auth/authenticate/naive").withTextBody("user")).get)
    //When
    val Some(generated_business)=route(FakeRequest(GET, "/").withCookies(creds1.get("id").get))

    //status(generated_business) must equalTo(OK)
    val Some(response)=route(FakeRequest(POST, "/whoami").withCookies(creds1.get("id").get))


    //Then
    status(response) must equalTo(OK)

    contentAsString(response) != ""
    contentAsString(response) must contain("Test")

    val whoami = play.api.libs.json.Json.parse(contentAsString(response))

    println("Response")
    println(contentAsString(response))

    val email = whoami \ "email"

    val business = whoami \ "business"

    userBusiness = Some(business.as[Int])
    userBusiness != Some(0)
    userEmail = Some(email.as[String])

    true
    //models.AccountsDAO.deleteUser(email.as[String])
    }
  }
  "Delete user" in {
    running(app) {
      models.AccountsDAO.deleteUser(userEmail.getOrElse(""))
      userEmail.isDefined
    }
  }



  /** This is application specific and can not be put into test-kit **/
  var env1=new AlwaysValidIdentityProvider.RuntimeEnvironment[DemoUser] {
    override lazy val routes = new CustomRoutesService()
    override lazy val userService: InMemoryUserService = new InMemoryUserService()
    override lazy val eventListeners = List(new MyEventListener())
  }

  private def global[A](env:RuntimeEnvironment[A]): GlobalSettings =
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
