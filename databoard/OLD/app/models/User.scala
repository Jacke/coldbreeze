package models

import java.util.UUID

import com.mohiva.play.silhouette.api.{ Identity, LoginInfo }
import play.api.libs.json.Json

/**
 * The user object.
 *
 * @param userID The unique ID of the user.
 * @param loginInfo The linked login info.
 * @param firstName Maybe the first name of the authenticated user.
 * @param lastName Maybe the last name of the authenticated user.
 * @param fullName Maybe the full name of the authenticated user.
 * @param email Maybe the email of the authenticated provider.
 * @param avatarURL Maybe the avatar URL of the authenticated provider.
 */
case class User(
  userID: UUID,
  loginInfo: LoginInfo,
  firstName: Option[String],
  lastName: Option[String],
  fullName: Option[String],
  email: Option[String],
  avatarURL: Option[String]) extends Identity

/**
 * The companion object.
 */
object User {

  /**
   * Converts the [User] object to Json and vice versa.
   */
  implicit val jsonFormat = Json.format[User]


}







import com.mohiva.play.silhouette.api.Identity
import com.mohiva.play.silhouette.api.LoginInfo
import java.util.UUID

import models._

/**
 * A user of this platform
 */
case class User2(
  id: String = UUID.randomUUID.toString,
  loginInfo: LoginInfo,
  //socials: Option[Seq[LoginInfo]] = None,
  email: Option[String],
  username: Option[String] = None,
  avatarUrl: Option[String],
  info: BaseInfo2
  //roles: Set[Role] = Set(SimpleUser)
  ) extends Identity {

}

object User2 {

}