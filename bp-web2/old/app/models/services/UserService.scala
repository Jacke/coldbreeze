package models.services

import com.mohiva.play.silhouette.api.services.IdentityService
import com.mohiva.play.silhouette.impl.providers.CommonSocialProfile
import models.User2
import java.util.UUID
import models.daos._
import com.mohiva.play.silhouette.api.LoginInfo

import scala.concurrent.Future

/**
 * Handles actions to users.
 */
trait UserService extends IdentityService[User2] {
  def retrieveById(id: UUID): Future[Option[User2]]
  def findPasswordHash(loginInfo: LoginInfo): Future[Option[DBPasswordInfo]]
  /**
   * Saves a user.
   *
   * @param user The user to save.
   * @return The saved user.
   */
  def save(user: User2): Future[User2]

  /**
   * Saves the social profile for a user.
   *
   * If a user exists for this profile then update the user, otherwise create a new user with the given profile.
   *
   * @param profile The social profile to save.
   * @return The user for whom the profile was saved.
   */
  def save(profile: CommonSocialProfile): Future[User2]
}
