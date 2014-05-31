package service

import akka.actor.Actor
import spray.routing._
import scala.concurrent.ExecutionContext

/**
 * Actor for HttpServices.
 *
 * Extend this actor with Spray HttpService traits to add http services.
 * - adroute from SprayService
 * - staticRoute to static files under web directory
 */
class ServiceActor
    extends Actor
    with SprayService
    with BPServices {

  def actorRefFactory = context

  //-**********def receive = runRoute(adRoute ~ staticRoute)
  //type Completer = Seq[Message] ⇒ Unit

  def staticRoute: Route =
    path("")(getFromResource("web/index.html")) ~ getFromResourceDirectory("web")

  //var messages: List[Message] = Nil

  //var storedCompleter: Option[Completer] = None

  def receive: Receive = {
    runRoute(adRoute ~ BPServiceRoute ~ staticRoute)

  }
}


import scala.concurrent._
import spray.http._
import spray.routing._
import spray.routing.authentication._
import scala.concurrent.ExecutionContext.Implicits.global
import spray.json._
import spray.json.DefaultJsonProtocol._



sealed trait Role
case object Customer extends Role
case object Admin extends Role

case class Credentials(name: String, pass: String)
case class User(email: String, pass: String, var token: Option[String] = None)

class AuthController {

  def user_add(u: User) = CustomAuthentication.users = CustomAuthentication.users :+ u

  def auth(creds: Credentials): Option[User] = {
    if (findByToken(creds.pass)) CustomAuthentication.users.find(u => u.token == Option(creds.pass))
    else None
  }
  def user_profile(cred: User):String = {
    val origin = findByPassword(cred.email, cred.pass)
    if (origin.isDefined) Map("email" -> origin.get.email, "token" -> origin.get.token.get).asInstanceOf[Map[String, String]].toJson.toString
    else "None"
  }
  def findByToken(t: String): Boolean = {
    val usr = CustomAuthentication.users.find(u => u.token == Option(t))

    if (usr.isDefined) true
    else false
  }

  def findByPassword(e: String, p: String): Option[User] = {
    val usr = CustomAuthentication.users.find(u => u.email == e && u.pass == p)

    if (usr.isDefined) generateToken(usr.get)
    else None
  }
  def generateToken(u: User): Option[User] = {
    val usr = CustomAuthentication.users.find(user => u.email == user.email && u.pass == user.pass).get
    usr.token = Option(java.util.UUID.randomUUID.toString)
    Some(usr)
  }
}

object CustomAuthentication {

  // Change that !!!!!!!!!!!1
  var users: Array[User] = Array(User("pidor", pass = "pidor"))

  val authController = new AuthController

  def authenticate(creds: Credentials)(implicit ec: ExecutionContext): Future[Option[User]] = Future { authController.auth(creds) }

  def getValidators(ctx: RequestContext): Option[Credentials] = {
    val userName = ctx.request.uri.query.get("user")
    val passWord = ctx.request.uri.query.get("pass")
    val name = ctx.request.headers.find(header => header.name == "Access_Name")
    val token = ctx.request.headers.find(header => header.name == "Access_Token")
 
    val nm = if (name.isDefined) name.get.value else ""
    val pass = if (token.isDefined) token.get.value else ""
    //for {
    //  name <- userName
    //  pass <- passWord
    //} yield 
    Option(Credentials(nm, pass))
  }

  import spray.routing.directives.HeaderDirectives
  import spray.routing.AuthenticationFailedRejection.CredentialsRejected
  import spray.routing.AuthenticationFailedRejection.CredentialsMissing
  // ContextAuthenticator[User] == RequestContext ⇒ Future[Authentication[User]]
  def authenticateUser(implicit ec: ExecutionContext): ContextAuthenticator[User] = {
    ctx: RequestContext =>
     
      val credOption = getValidators(ctx)
      if (credOption.isEmpty) Future(Left(AuthenticationFailedRejection(CredentialsMissing, ctx.request.headers))) //Future(Left(ValidationRejection("auths not supplied")))
      else {
        authenticate(credOption.get).map { auth =>
          if (auth.isDefined) Right(auth.get)
          else Left(AuthenticationFailedRejection(CredentialsRejected, ctx.request.headers))
        }
      }
    
  }

}



trait ECProvider {
  implicit val executionContext: ExecutionContext
}