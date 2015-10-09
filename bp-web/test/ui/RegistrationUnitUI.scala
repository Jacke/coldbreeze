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
import org.specs2.mutable._
import play.api.test._
import play.api.test.Helpers._
import org.fluentlenium.core.filter.FilterConstructor._
import org.openqa.selenium.htmlunit
import play.api.mvc.Action._
import play.api.mvc.Result._
import controllers.CustomRoutesService
//import scala.concurrent.ExecutionContext.Implicits._
import play.api.GlobalSettings
import play.api.test.{FakeRequest, WithApplication, FakeApplication, PlaySpecification}
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
import play.test.Helpers.FIREFOX
import play.test.Helpers.inMemoryDatabase
import play.test.Helpers.fakeApplication
import play.test.Helpers.testServer
import play.test.Helpers.running
import org.fest.assertions.Assertions.assertThat
/*
 test-only us.ority.min.tests.RegistrationUnitUISpec
*/ 
class RegistrationUnitUISpec extends PlaySpecification with Firefox {

val fakeApplicationWithBrowser = FakeApplication( withGlobal=Some(global(env1)))

  "Application" should {
    "work from within a browser" in {
		"provide a web driver" in {
		    go to (s"https://min.ority.us")
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
	      open("https://min.ority.us/")
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