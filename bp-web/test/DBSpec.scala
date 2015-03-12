package tests

import play.api.test._
import scala.concurrent.duration.FiniteDuration
import play.api.Logger
import objects._
import scala.concurrent.ExecutionContext.Implicits.global
import models.DAO.conversion._

/**
 * @author alari (name.alari@gmail.com)
 * @since 18.10.13 16:46
 */
class DBSpec extends PlaySpecification {

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


  }
}
