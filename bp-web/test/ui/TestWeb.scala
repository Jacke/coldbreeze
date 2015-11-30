package us.ority.min.tests
import org.junit.Test
import play.test.TestBrowser
import play.libs.F.Callback
import play.test.Helpers.FIREFOX
import play.test.Helpers.inMemoryDatabase
import play.test.Helpers.fakeApplication
import play.test.Helpers.testServer
import play.test.Helpers.running
import org.fest.assertions.Assertions.assertThat


import org.scalatest.junit.JUnitSuite
import org.scalatest.junit.ShouldMatchersForJUnit
import org.scalatest.selenium.Chrome
import scala.collection.mutable.ListBuffer
import org.junit.Test
import org.junit.Before
import org.openqa.selenium.WebDriver
import org.openqa.selenium.chrome.ChromeDriver


class TestWeb extends JUnitSuite with ShouldMatchersForJUnit {
  lazy val CHROME = new ChromeDriver

  @Test
  def test() {
    running(testServer(9000, fakeApplication(inMemoryDatabase())), FIREFOX,
        new Callback[TestBrowser]() {
          def invoke(browser: TestBrowser) {
            browser.goTo("http://localhost:9000")
            val email = "himanshu@knoldus.com"
            val password = "123456"
            val confirm_password = "123456"
            browser.$("#email").text(email)
            browser.$("#password").text(password)
            //browser.$("#confirm_password").text(confirm_password)
            //browser.$("#submit").click()
            assertThat(browser.title()).contains("Minority — Login")
            //assertThat(browser.pageSource()).contains("email")
          }
        });
  }
}