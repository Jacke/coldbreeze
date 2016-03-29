package controllers

import javax.inject.Inject

import com.mohiva.play.silhouette.api._
import com.mohiva.play.silhouette.api.exceptions.ProviderException
import com.mohiva.play.silhouette.api.repositories.AuthInfoRepository
import com.mohiva.play.silhouette.impl.authenticators.CookieAuthenticator
import com.mohiva.play.silhouette.impl.providers._
import models._
import models.daos._
import models.services.UserService
import play.api.i18n.{ MessagesApi, Messages }
import play.api.libs.concurrent.Execution.Implicits._
import play.api.mvc.Action
import java.util.UUID

import scala.concurrent.Future

/**
 * The social auth controller.
 *
 * @param messagesApi The Play messages API.
 * @param env The Silhouette environment.
 * @param userService The user service implementation.
 * @param authInfoRepository The auth info service implementation.
 * @param socialProviderRegistry The social provider registry.
 */
class LegacyAuthController @Inject() (
  val messagesApi: MessagesApi,
  val env: Environment[User2, CookieAuthenticator],
  userService: UserService,
  authInfoRepository: AuthInfoRepository,
  socialProviderRegistry: SocialProviderRegistry)
  extends Silhouette[User2, CookieAuthenticator] with Logger {

    def migrate() = Action { implicit request =>
      // 1. get all accounts
      val accounts:List[AccountDAO] = AccountsDAO.getAll()

      accounts.map { account =>
        // 2. create user for account
        val userID = UUID.randomUUID().toString
        AccountsDAO.pull_user_object(DBUser (
          userID = userID,
          firstName = account.firstName,
          lastName = account.lastName,
          fullName = account.fullName,
          email = account.email,
          avatarURL = account.avatarUrl
        ))

        // 3. create loginfo for user
        //val loginInfoId = 1L
        val loginInfoId = AccountsDAO.pull_loginInfo_object(

          DBLoginInfo (
          id = None,
          providerID = "credentials",
          providerKey = account.email.get
        ) )

        // 4. create userloginfo for loginfo
        AccountsDAO.pull_userInfo_object(DBUserLoginInfo (
          userID = userID,
          loginInfoId = loginInfoId
        ))

        // 5. create passwordinfo
        AccountsDAO.pull_passwordInfo_object( DBPasswordInfo (
          hasher = "bcrypt",
          password = account.password,
          salt = None,
          loginInfoId = loginInfoId
        ) )
      }


      Ok("test " + request.domain.toString + " " + request.host.toString)
    }

}
