package models.services

import java.util.UUID
import javax.inject.Inject

import com.mohiva.play.silhouette.api.LoginInfo
import com.mohiva.play.silhouette.api.services.AuthInfo
import com.mohiva.play.silhouette.impl.providers.CommonSocialProfile
import models.daos.UserDAO
import play.api.libs.concurrent.Execution.Implicits._
import models._
import scala.concurrent.Future

import java.util.UUID
import play.api.libs.json._
import play.api.libs.concurrent.Execution.Implicits._
import com.mohiva.play.silhouette.api.LoginInfo
import com.mohiva.play.silhouette.api.services.AuthInfo
import com.mohiva.play.silhouette.impl.providers.CommonSocialProfile
import scala.concurrent.Future
import scala.collection.mutable
import com.mohiva.play.silhouette.api.services.{ AuthInfo, IdentityService }

import security.models.SignUp
/**
 * Handles actions to users.
 *
 * @param userDAO The user DAO implementation.
 */
class UserServiceImpl @Inject() (userDAO: UserDAO) extends UserService {

  /**
   * Retrieves a user that matches the specified login info.
   *
   * @param loginInfo The login info to retrieve a user.
   * @return The retrieved user or None if no user could be retrieved for the given login info.
   */
  def retrieve(loginInfo: LoginInfo): Future[Option[User]] = {
    println("retrive UserServiceImpl --------------------------->>>>>>>>>>>>>>>>.")
    println(loginInfo) 
    userDAO.find(loginInfo)
  }

  /**
   * Saves a user.
   *
   * @param user The user to save.
   * @return The saved user.
   */
  def save(user: User) = {
    //println("\n\n*** UserServiceImpl.save ***\n\n")
    userDAO.save(user)
  }

  /**
   * Link a social social profile on a user.
   *
   *
   * @param profile The social profile to save.
   * @return The user for whom the profile was saved.
   */ /*
  def link[A <: AuthInfo](user: User, profile: CommonSocialProfile): Future[User] = {
    play.Logger.debug {
      s"""UserServiceImpl.link ----------
          ------------------ user: ${user}
          ------------------ profile: ${profile}
          ------------------ DB: ${UserServiceImpl.users}"""
    }
    val s = user.socials.getOrElse(Seq())
    val u = user.copy(socials = Some(s :+ profile.loginInfo))
    save(u)
  } */

  /**
   * Saves the social profile for a user.
   *
   * If a user exists for this profile then update the user, otherwise create a new user with the given profile.
   *
   * @param profile The social profile to save.
   * @return The user for whom the profile was saved.
   */
  def save[A <: AuthInfo](profile: CommonSocialProfile) = {
    userDAO.find(profile.loginInfo).flatMap {
      case Some(user) => // Update user with profile
        userDAO.save(user.copy(
          firstName = profile.firstName,
          lastName = profile.lastName,
          fullName = profile.fullName,
          email = profile.email,
          avatarURL = profile.avatarURL
        ))
      case None => // Insert a new user
        userDAO.save(User(
          userID = UUID.randomUUID(),
          loginInfo = profile.loginInfo,
          firstName = profile.firstName,
          lastName = profile.lastName,
          fullName = profile.fullName,
          email = profile.email,
          avatarURL = profile.avatarURL
        ))
    }
  }
}













/**
 * BASIC IMPLEMENTATION
 * Handles actions to users.
 * @param userDAO The user DAO implementation.
 */
class UserServiceInMemory extends IdentityService[User2] { //extends UserService2 {

  /**
   * Create a user from login information and signup information
   *
   * @param loginInfo The information about login
   * @param signUp The information about User
   * @param avatarUrl string with url to avatar image
   * @param json all json with signup information
   */
  def create(loginInfo: LoginInfo, signUp: SignUp, avatarUrl: Option[String] = None, json: JsValue = JsNull): Future[User2] = {
    val fullName = signUp.fullName.getOrElse(signUp.firstName.getOrElse("None") + " " + signUp.lastName.getOrElse("None"))
    val info = BaseInfo2(
      firstName = signUp.firstName,
      lastName = signUp.lastName,
      fullName = Some(fullName),
      gender = None)
    val user = User2(
      loginInfo = loginInfo,
      email = Some(signUp.identifier),
      username = None,
      avatarUrl = avatarUrl,
      info = info)
    Future.successful {
      User2(
        loginInfo = loginInfo,
        email = Some(signUp.identifier),
        username = None,
        avatarUrl = avatarUrl,
        info = info)
    }
  }

  /**
   * Retrieves a user that matches the specified login info.
   *
   * @param loginInfo The login info to retrieve a user.
   * @return The retrieved user or None if no user could be retrieved for the given login info.
   */
  def retrieve(loginInfo: LoginInfo): Future[Option[User2]] = {
    println("retrive UserServiceInMemory --------------------------->>>>>>>>>>>>>>>>.")
    println(loginInfo)
    play.Logger.debug {
      s"""UserServiceInMemory.retrieve ----------
          ------------------ loginInfo: ${loginInfo}
          ------------------ DB: ${UserServiceImpl.users}"""
    }
    Future.successful {
      println("retrive length")
      println(UserServiceImpl2.users2.toList.length)
      val z = UserServiceImpl2.users2.find {
        case (id, user) => {
           println(id)
           println(user)
           user.loginInfo == loginInfo //|| user.socials.map(_.find(li => li == loginInfo)).isDefined
        }
      }.map(_._2)
      println("retrived: ")
      println(z)
      z
    }
  }

  /**
   * Saves a user.
   *
   * @param user The user to save.
   * @return The saved user.
   */
  def save(user: User2):Future[User2] = {
    play.Logger.debug {
      s"""UserServiceInMemory.save ----------
          ------------------ user: ${user}"""
    }
    UserServiceImpl2.users2 += (user.loginInfo.toString -> user)
    Future.successful(user)
  }

  /**
   * Saves the social profile for a user.
   *
   * If a user exists for this profile then update the user, otherwise create a new user with the given profile.
   *
   * @param profile The social profile to save.
   * @return The user for whom the profile was saved.
   */
 
 
  def save[A <: AuthInfo](profile: CommonSocialProfile): Future[User2] = {
    //userDAO.find
    retrieve(profile.loginInfo).flatMap {
      case Some(user) => // Update user with profile
        save(user.copy(info = BaseInfo2(
          firstName = profile.firstName,
          lastName = profile.lastName,
          fullName = profile.fullName, gender = None),
          email = profile.email,
          avatarUrl = profile.avatarURL
        ))
      case None => // Insert a new user
        save(User2(
          id = UUID.randomUUID.toString,
          loginInfo = profile.loginInfo,
          info = BaseInfo2(
            firstName = profile.firstName,
            lastName = profile.lastName,
            fullName = profile.fullName, gender = None),
          email = profile.email,
          avatarUrl = profile.avatarURL
        ))
    }
  }
  /**
   * Link a social social profile on a user.
   *
   *
   * @param profile The social profile to save.
   * @return The user for whom the profile was saved.
   *
  def link[A <: AuthInfo](user: User, profile: CommonSocialProfile): Future[User] = {
    play.Logger.debug {
      s"""UserServiceImpl.link ----------
          ------------------ user: ${user}
          ------------------ profile: ${profile}
          ------------------ DB: ${UserServiceImpl.users}"""
    }
    val s = user.socials.getOrElse(Seq())
    val u = user.copy(socials = Some(s :+ profile.loginInfo))
    save(u)
  }*/
}

object UserServiceImpl2 {
  val users2: mutable.HashMap[String, User2] = mutable.HashMap()
}

object UserServiceImpl {
  val users: mutable.HashMap[String, User] = mutable.HashMap()
}
