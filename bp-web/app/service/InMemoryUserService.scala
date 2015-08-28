/**
 * Copyright 2012 Jorge Aliss (jaliss at gmail dot com) - twitter: @jaliss
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */
package service

import play.api.Logger
import play.api.i18n.Lang
import securesocial.core._
import securesocial.core.providers.{UsernamePasswordProvider, MailToken}
import scala.concurrent.Future
import securesocial.core.services.{UserService, SaveMode}

import models.AccountsDAO
import models.TokensDAO

/**
 * A Sample In Memory user service in Scala
 *
 * IMPORTANT: This is just a sample and not suitable for a production environment since
 * it stores everything in memory.
 */
class MyEnvironment extends RuntimeEnvironment.Default[DemoUser] {
  override val userService: UserService[DemoUser] = new InMemoryUserService()
}

class InMemoryUserService extends UserService[DemoUser] {
  val logger = Logger("application.controllers.InMemoryUserService")

  //
  var users = Map[(String, String), DemoUser]()
  //private var identities = Map[String, BasicProfile]()
  private var tokens = Map[String, MailToken]()

  def find(providerId: String, userId: String): Future[Option[BasicProfile]] = {
    if ( logger.isDebugEnabled ) {
      //logger.debug("users = %s".format(users))
    }
    val result = for (
      user <- users.values ;
      basicProfile <- user.identities.find(su => su.providerId == providerId && su.userId == userId)
    ) yield {
      basicProfile
    }

    logger.debug("users find = %s".format(AccountsDAO.find(providerId, userId)))

    Future.successful(AccountsDAO.find(providerId, userId))
  }

  def findByEmailAndProvider(email: String, providerId: String): Future[Option[BasicProfile]] = {
    if ( logger.isDebugEnabled ) {
      //logger.debug("users = %s".format(users))
    }
    val someEmail = Some(email)
    val result = for (
      user <- users.values ;
      basicProfile <- user.identities.find(su => su.providerId == providerId && su.email == someEmail)
    ) yield {
      basicProfile
    }
    logger.debug("users findByEmailAndProvider = %s".format(AccountsDAO.findByEmailAndProvider(email, providerId)))


    Future.successful(AccountsDAO.findByEmailAndProvider(email, providerId))
  }

  def save(user: BasicProfile, mode: SaveMode): Future[DemoUser] = {
    mode match {
      case SaveMode.SignUp =>
        val newUser = DemoUser(user, List(user))

        AccountsDAO.save(user)
        
        users = users + ((user.providerId, user.userId) -> newUser)
      case SaveMode.LoggedIn =>

    }
    // first see if there is a user with this BasicProfile already.
    val maybeUser = users.find {
      case (key, value) if value.identities.exists(su => su.providerId == user.providerId && su.userId == user.userId ) => true
      case _ => false
    }
    maybeUser match {
      case Some(existingUser) =>
        val identities = existingUser._2.identities
        val updatedList = identities.patch( identities.indexWhere( i => i.providerId == user.providerId && i.userId == user.userId ), Seq(user), 1)
        val updatedUser = existingUser._2.copy(identities = updatedList)
        users = users + (existingUser._1 -> updatedUser)
        Future.successful(updatedUser)

      case None =>
        val newUser = DemoUser(user, List(user))
        users = users + ((user.providerId, user.userId) -> newUser)

        if (!AccountsDAO.find(newUser.main.providerId, newUser.main.userId).isDefined) {
          AccountsDAO.save(newUser.main)
        }
        
        Future.successful(newUser)
    }
  }

  def link(current: DemoUser, to: BasicProfile): Future[DemoUser] = {
    if ( current.identities.exists(i => i.providerId == to.providerId && i.userId == to.userId)) {
      Future.successful(current)
    } else {
      val added = to :: current.identities
      val updatedUser = current.copy(identities = added)
      users = users + ((current.main.providerId, current.main.userId) -> updatedUser)
      Future.successful(updatedUser)
    }
  }

  def saveToken(token: MailToken): Future[MailToken] = {
    Future.successful {
      tokens += (token.uuid -> token)
      token
      TokensDAO.saveToken(token)
    }
  }

  def findToken(token: String): Future[Option[MailToken]] = {
    Future.successful { TokensDAO.findToken(token) } //tokens.get(token) }
  }

  def deleteToken(uuid: String): Future[Option[MailToken]] = {
    TokensDAO.deleteToken(uuid)
    Future.successful {
      TokensDAO.deleteToken(uuid)
      /*tokens.get(uuid) match {
        case Some(token) =>
          tokens -= uuid
          Some(token)
        case None => None
      }*/
    }
  }

//  def deleteTokens(): Future {
//    tokens = Map()
//  }

  def deleteExpiredTokens() {
    tokens = tokens.filter(!_._2.isExpired)
  }

  override def updatePasswordInfo(user: DemoUser, info: PasswordInfo): Future[Option[BasicProfile]] = {
    Future.successful {/*
      for (
        found <- users.values.find(_ == user);
        identityWithPasswordInfo <- found.identities.find(_.providerId == UsernamePasswordProvider.UsernamePassword)
      ) yield {
        val idx = found.identities.indexOf(identityWithPasswordInfo)
        val updated = identityWithPasswordInfo.copy(passwordInfo = Some(info))
        val updatedIdentities = found.identities.patch(idx, Seq(updated), 1)
        found.copy(identities = updatedIdentities)
        updated
      }*/
      AccountsDAO.updatePasswordInfo(user, info)
    }
  }

  override def passwordInfoFor(user: DemoUser): Future[Option[PasswordInfo]] = {
    Future.successful {/*
      for (
        found <- users.values.find(_ == user);
        identityWithPasswordInfo <- found.identities.find(_.providerId == UsernamePasswordProvider.UsernamePassword)
      ) yield {
        identityWithPasswordInfo.passwordInfo.get
      }*/
      AccountsDAO.passwordInfoFor(user)
    }
  }
}

// a simple User class that can have multiple identities
case class DemoUser(main: BasicProfile, 
  identities: List[BasicProfile], 
  var permissions: Option[Tuple3[Boolean, Boolean, String]] = None, 
  var lang: Option[Lang] = None, 
  var created_at: Option[org.joda.time.DateTime] = None) {

  permissions = AccountsDAO.getRolesAndLang(main.userId)

  AccountsDAO.getAccountInfo(main.userId) match {
    case Some(acc_info) => created_at = Some(acc_info.created_at)
    case _ => created_at = Some(org.joda.time.DateTime.now())
  }
   
  lang = Some(country(AccountsDAO.getRolesAndLang(main.userId).get._3))

  def country(lang: String):Lang = {
    lang match {
      case "ru" => Lang("ru", "RU")
      case "en" => Lang("en", "US")
      case _ => Lang("en", "US")
    }
  }

  def renewLang() = {
      lang = Some(country(AccountsDAO.getRolesAndLang(main.userId).get._3))
  }
  def renewPermissions() = {
      permissions = AccountsDAO.getRolesAndLang(main.userId)
  }
  def isManager:Boolean = {
    //if (permissions.isDefined)
    //  permissions.get._1
    AccountsDAO.getRolesAndLang(main.userId).get._1
    //else
     // false
  }
  def isEmployee:Boolean = {
    if (permissions.isDefined)
      permissions.get._2
    else
      false
  }
}


