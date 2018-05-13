package modules

import java.util.UUID
import com.mohiva.play.silhouette.api.LoginInfo
import models.User2
import scala.concurrent.Future

import java.util.UUID
import com.mohiva.play.silhouette.api.LoginInfo
import models.User2
import play.api.libs.concurrent.Execution.Implicits.defaultContext
import slick.dbio.DBIOAction
import javax.inject.Inject
import play.api.db.slick.DatabaseConfigProvider
import scala.concurrent.Future
/**
 * Give access to the user object.
 */
trait MotivationElement {
  	var elemName:String

}


class MotivationElementImpl extends MotivationElement {
  	var elemName:String = "Lil Elem"


  	def sendMessageToElement() = {

  	}
}