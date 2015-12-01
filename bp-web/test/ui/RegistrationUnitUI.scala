package us.ority.min.tests
import play.api._
import play.api.mvc._
import play.twirl.api.Html
import play.api.http.MimeTypes
import play.api.libs.json._
import play.api.cache._
import play.api.libs.json._
import play.api.libs.functional.syntax._
import play.api.Logger
//import org.specs2.mutable._
//import play.api.test._
//import play.api.test.Helpers._
import org.fluentlenium.core.filter.FilterConstructor._
import org.openqa.selenium.htmlunit
import play.api.mvc.Action._
import play.api.mvc.Result._
import controllers.CustomRoutesService
//import scala.concurrent.ExecutionContext.Implicits._
import play.api.GlobalSettings
//import play.api.test._
import play.libs._
import controllers.CustomRoutesService
import play.api.GlobalSettings
import securesocial.core.RuntimeEnvironment
import securesocial.testkit.AlwaysValidIdentityProvider
import service.{DemoUser, MyEventListener, InMemoryUserService}
import play.libs.Json._
import play.libs._
import org.specs2.time._
import models.DAO.conversion._
import com.codeborne.selenide.Selenide._
import org.scalatest._
import selenium._
import org.openqa.selenium._
import htmlunit._	
//
import org.junit.Test
import play.test.TestBrowser
import play.libs.F.Callback
//import play.test.Helpers.FIREFOX
import play.test.Helpers._
import play.test.Helpers.inMemoryDatabase
import play.test.Helpers.fakeApplication
import play.test.Helpers.testServer
import play.test.Helpers.running
import org.fest.assertions.Assertions.assertThat
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.scalatest._
import play.api.test._
import play.api.test.Helpers._
import org.scalatestplus.play._

import org.scalatest._
import org.scalatest.concurrent._
import org.scalatestplus.play._

import play.api.mvc._
import play.api.test._
import play.api.test.Helpers._
import play.api.libs.ws._
import play.api._
import org.scalatestplus.play._
import play.api.mvc.Result._

import org.scalatest._
import play.api.test._
import play.api.test.Helpers._
import org.scalatestplus.play._
import org.scalatest.Matchers._
/*
 test-only us.ority.min.tests.RegistrationUnitUISpec
*/ 
class RegistrationUnitUISpec extends PlaySpec with OneServerPerSuite with OneBrowserPerSuite with Eventually with ChromeFactory  {


val testLogger = com.typesafe.scalalogging.Logger(org.slf4j.LoggerFactory.getLogger("test"))

//val fakeApplicationWithBrowser = play.api.test.FakeApplication( withGlobal=Some(global(env1)) )
//val fakeApp = play.api.test.FakeApplication( withGlobal=Some(global(env1)),  )
implicit override lazy val app: FakeApplication =
    FakeApplication(
      //withGlobal= Some(global(env1)),
      withRoutes = {
        //case ("GET", "/") => Action(Results.Ok("ok"))
        case ("GET", "/testing") => {
          Action(
            Results.Ok(
              "<html>" +
                "<head><title>Test Page</title></head>" +
                "<body>" +
                "<input type='button' name='b' value='Click Me' onclick='document.title=\"scalatest\"' />" +
                "</body>" +
                "</html>"
            ).as("text/html")
          )
        }
      }

    )

"test server logic" in {
    val myPublicAddress =  s"localhost:$port"
    val testPaymentGatewayURL = s"http://$myPublicAddress"
    // The test payment gateway requires a callback to this server before it returns a result...
    val callbackURL = s"http://$myPublicAddress/callback"
    // await is from play.api.test.FutureAwaits
    val response = await(WS.url(testPaymentGatewayURL).withQueryString("callbackURL" -> callbackURL).get())

    response.status mustBe (OK)
  }
 "The OneBrowserPerTest trait" must {
    "provide a web driver" in {
      go to (s"http://localhost:$port/testing")
      pageTitle mustBe "Test Page"
      click on find(name("b")).value
      eventually { pageTitle mustBe "scalatest" }
      go to (s"http://localhost:$port/")

      eventually { assertThat(pageTitle).contains("Login") }
      val email = "iamjacke@gmail.com"
      val password = "12344321"
      val confirm_password = "12344321"
      emailField("username").value = email
      pwdField("password").value = password
      //browser.$("#confirm_password").text(confirm_password)
      //browser.$("#submit").click()
      click on id("l_submit")
      Thread.sleep(50000)
      assertThat(pageTitle).contains("Profile")
      // Check auth token
      val authToken = executeScript("return localStorage.token;")
      
      
      testLogger.info(s"token: $authToken") 
      authToken should not be ("")
    }
  }  

 "Base Core Component" must {
    "provide list of business services" in {
      go to (s"http://localhost:$port/")
      eventually { assertThat(pageTitle).contains("Profile") }
      val eles: IndexedSeq[Element] = findAll(className("business-service-entity")).toIndexedSeq
      eles.length should not be 0  
      //for (e <- eles)
       // e should be ('displayed)
      Thread.sleep(500)
      // Create service 
      val showElForm:Element = find(id("showServiceFormBtn")).get
      click on showElForm
      textField(newServiceFormField).value = "Test service"
      click on find(id("addNewServiceFormBtn")).get


    }
  }    

/*
val CHROME = new ChromeDriver

"run in a browser" in new WithBrowser(webDriver = CHROME, app = testApp ) {
  browser.goTo("http://localhost:9000")

  // Check the page
  browser.$("#title").getTexts().get(0) mustEqual "Minority — Login"

  browser.$("a").click()

  browser.url mustEqual "/login"
  browser.$("#title").getTexts().get(0) mustEqual "Hello Coco"
}
*/
/*
  "Application" should {
    "work from within a browser" in {
		"provide a web driver" in {
		    go to (s"http://localhost:9000")
		    pageTitle == "Minority — Login"
		    //click on find(name("b")).value
		    //eventually { pageTitle mustBe "scalatest" }
		}
    	//"run in a browser" in new WithBrowser {
				  //browser.goTo("https://min.ority.us/")
				  // Check the page
				  //browser.$("#title").getTexts().get(0) must equalTo("Hello Guest")
				  //browser.$("a").click()
				  //browser.url must equalTo("/login")
				  //browser.$("#username").text().getTexts().get(0) must equalTo("")
				  //browser.$("#title").getTexts().get(0) must equalTo("Hello Coco")
		//}
		"check selenide" in {
//[error]   (x$1: String,x$2: com.codeborne.selenide.Condition*)com.codeborne.selenide.SelenideElement <and>
//[error]   (x$1: com.codeborne.selenide.Condition*)com.codeborne.selenide.SelenideElement
//[error]  cannot be applied to (RegistrationUnitUISpec.this.MutableSpecText)
//[error]   $("#username").shouldHave(text("Hello, Johny!"));
	      open("http://localhost:9000")
	      println($("#username").text())
   		  $("#username").text() == ""//.shouldHave(text("Hello, Johny!"));
		}
/*
      running(TestServer(3333), HTMLUNIT) { browser =>
        browser.goTo("http://192.168.1.101/")
          browser.$("header h1").first.getText must contain("Play 2.0 sample application — Computer database")
          browser.$("#pagination li.current").first.getText must equalTo("Displaying 1 to 10 of 574")
          browser.$("#pagination li.next a").click()
          browser.$("#pagination li.current").first.getText must equalTo("Displaying 11 to 20 of 574")
          browser.$("#searchbox").text("Apple")
          browser.$("#searchsubmit").click()
      }
*/      
    }
  }
*/


  /** This is application specific and can not be put into test-kit **/
  import java.lang.reflect.Constructor

  val env1=new AlwaysValidIdentityProvider.RuntimeEnvironment[DemoUser] {
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
/*
"run in a browser" in new WithBrowser {
  browser.goTo("/")
  browser.$("#title").getTexts().get(0) must equalTo("Hello Guest")
    
  browser.$("a").click()
    
  browser.url must equalTo("/")
  browser.$("#title").getTexts().get(0) must equalTo("Hello Coco")
}
*/