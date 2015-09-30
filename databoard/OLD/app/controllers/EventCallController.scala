package controllers
// Copyright 2015 Empia Inc. All rights reserved.
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

import org.joda.time.DateTime
import scala.concurrent.Future

import play.api.Logger
import play.api.Play.current
import play.api.mvc._
import play.api.libs.concurrent.Execution.Implicits.defaultContext
import play.modules.reactivemongo.{ MongoController, ReactiveMongoPlugin }

import javax.inject.Inject

import com.mohiva.play.silhouette.api.{ Environment, LogoutEvent, Silhouette }
import com.mohiva.play.silhouette.impl.authenticators.SessionAuthenticator
import forms._
import models.User

import scala.concurrent.Future
import play.api.i18n.Messages
import play.api.libs.concurrent.Execution.Implicits._
import play.api.libs.json.Json
import play.api.mvc.Action
import com.mohiva.play.silhouette.api.services._
import scala.concurrent.Future
import reactivemongo.api.gridfs.GridFS
import reactivemongo.api.gridfs.Implicits.DefaultReadFileReader
import reactivemongo.api.collections.default.BSONCollection
import reactivemongo.bson._

import models.Board
import models.Board._

class EventCallController @Inject() (implicit val env: Environment[User, SessionAuthenticator])
  extends Silhouette[User, SessionAuthenticator] with MongoController {

/* For future generation

  Two way of call
  * By get, response contain schema of some datatype, or structure
  * By native verbs for operand(some of that arleady implemented)
  * E.G. For show method, it's may show with different structure
  * For example Dropbox file may shown as Just file, with url, or link to harddrive
  * That polymorphism techniques may that stuff really powerful and excited
*/

  def callWithValue =  // (event, value) -> id, event
  	Action.async { implicit request =>
  		Future(Ok(Json.toJson("Ok")))
    }
  def showById(id: String) = // val
  	Action.async { implicit request =>
  		Future(Ok(Json.toJson("Ok")))
  	}

  def showByEventId(event_id: String) = // val
  	Action.async { implicit request =>
  		Future(Ok(Json.toJson("Ok")))
  	}
  def deleteById(id: String) = // (event, id) -> event
  	Action.async { implicit request =>
  		Future(Ok(Json.toJson("Ok")))
  	}
  def deleteByEventId(event_id: String) = //(event, event_id) -> event
  	Action.async { implicit request =>
  		Future(Ok(Json.toJson("Ok")))
  	}

}