package test.web
import org.scalatest._
import org.scalatestplus.play._

import play.api.test._
import play.api.test.Helpers.{GET => GET_REQUEST, _}
import play.api.inject.guice._
import play.api.cache._
import play.api.mvc._
import play.api.routing._
import play.api.test._
import play.api.test.Helpers._

import org.scalatest._
import play.api.test._
import play.api.test.Helpers._
import org.scalatestplus.play._


import com.codeborne.selenide.Condition._
import com.codeborne.selenide.Selenide._
import com.codeborne.selenide.Selectors._
import com.codeborne.selenide.SelenideElement
import org.scalatest.{FlatSpec, BeforeAndAfter}
import org.openqa.selenium.By
import org.scalatest.Matchers
import com.codeborne.selenide.WebDriverRunner
import java.net.URL;
import org.openqa.selenium.WebDriver;

import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.remote.RemoteWebDriver;


class ExampleSpec extends PlaySpec with OneServerPerSuite with OneBrowserPerSuite with ChromeFactory  {


  val KEY = "81ccae44c24f4849d9b6ab6a523557f3";
  val SECRET = "caa0238e8ef31c6e3da9d966a0708a8c";
  val Url = "http://" + KEY + ":" + SECRET + "@hub.testingbot.com/wd/hub";

  val caps:DesiredCapabilities = new DesiredCapabilities();
caps.setCapability("platform", "CAPITAN");
caps.setCapability("version", "beta");
caps.setCapability("browserName", "chrome")

  val driver:WebDriver = new RemoteWebDriver(new URL(Url), caps);
  driver.get("http://www.google.com/ncr");


  System.setProperty("webdriver.chrome.driver", "/usr/games/chromedriver");
  System.setProperty("selenide.browser", "Chrome");
  
  WebDriverRunner.setWebDriver(driver)

  // Override app if you need a FakeApplication with other than
  // default parameters.
  implicit override lazy val app: FakeApplication =
    FakeApplication(
      additionalConfiguration = Map("ehcacheplugin" -> "disabled")
    )

  "The OneBrowserPerTest trait" must {
    "auth" in {
      go to (s"http://localhost:$port/")
      //pageTitle mustBe "Test Page"
      //click on find(name("b")).value
      //eventually { pageTitle mustBe "scalatest" }

      pageTitle.contains("Sign In") mustBe true
      val email = "iamjacke@gmail.com"
      val password = "12344321"
      val confirm_password = "12344321"
      emailField("name-11").value = email
      pwdField("name-12").value = password
      //browser.$("#confirm_password").text(confirm_password)
      //browser.$("#submit").click()
      click on id("l_submit")
      Thread.sleep(20000)
      //assertThat(pageTitle).contains("Profile")
      pageTitle.contains("Profile") mustBe true
      // Check auth token
      val authToken = executeScript("return localStorage.manager;")



      println(s"token: $authToken")
      val switcherToggles = findAll(className("switcherToggle")).toIndexedSeq
      println(s"switcherToggles ${switcherToggles.length}")
      click on switcherToggles.last

      open (s"http://localhost:$port/")
      val t = $(".minMenuTexts").$(".minMenuItem").getText()
      println(t)
      //Thread.sleep(20000)

      //click on (findAll(className("logoutBtn")).toIndexedSeq.head) //class("logoutBtn")


      //pageTitle.contains("Sign In") mustBe true

    }



  }
}
