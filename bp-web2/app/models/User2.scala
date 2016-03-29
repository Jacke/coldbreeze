package models

import java.util.UUID

import com.mohiva.play.silhouette.api.{ Identity, LoginInfo }
import play.api.Logger
import play.api.i18n.Lang
import securesocial.core._
import securesocial.core.providers.{UsernamePasswordProvider, MailToken}
import scala.concurrent.Future
import securesocial.core.services.{UserService, SaveMode}
import scala.concurrent.ExecutionContext.Implicits.global
import models.AccountsDAO
import models.TokensDAO
import models._
import play.api.cache._
import play.api.Play.current
import scala.concurrent.duration._
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
case class User2(
  userID: UUID,
  loginInfo: LoginInfo,
  firstName: Option[String],
  lastName: Option[String],
  fullName: Option[String],
  email: Option[String],
  avatarURL: Option[String]) extends Identity {

    var permissions: Option[Tuple3[Boolean, Boolean, String]] = None
    var lang: Option[Lang] = None
    var created_at: Option[org.joda.time.DateTime] = None

    val emailFilled = email.getOrElse("")

    permissions = AccountsDAO.getRolesAndLang(emailFilled, businessFirst)
    val acc_info:AccountInfo = AccountsDAO.getAccountInfo(emailFilled).get

    AccountsDAO.getAccountInfo(emailFilled) match {
      case Some(acc_info) => created_at = Some(acc_info.created_at)
      case _ => created_at = Some(org.joda.time.DateTime.now())
    }

    lang = Some(country(acc_info.lang.getOrElse("en") ))

    def country(lang: String):Lang = {
      lang match {
        case "ru" => Lang("ru", "RU")
        case "en" => Lang("en", "US")
        case _ => Lang("en", "US")
      }
    }

    def renewLang() = {
        lang = Some(country(AccountsDAO.getRolesAndLang(emailFilled, businessFirst).get._3))
    }
    def renewPermissions() = {
        permissions = AccountsDAO.getRolesAndLang(emailFilled, businessFirst)
    }
    def isManager:Boolean = {
      if (permissions.isDefined)
        permissions.get._1
      else
        AccountsDAO.getRolesAndLang(emailFilled, businessFirst).get._1
        // false
  }

    //lazy val
    def firstBusinessId = {
        Cache.getOrElse[Option[AccountInfo]](s"employee.business.${emailFilled}") {
        val acc_info:Option[AccountInfo] = AccountInfosDAOF.await(AccountInfosDAOF.getByInfoByUID(emailFilled))
        Cache.set(s"employee.business.${emailFilled}", acc_info, 1.minutes)
        acc_info
      }
    }
    lazy val businessObj = firstBusinessId

    def masterFirstId = models.DAO.resources.EmployeeDAO.getByEmployeeUID(emailFilled)

    def businessFirst: Int = {
       val firstBusinessDetected = firstBusinessId match {
          case Some(info) => info.currentWorkbench.getOrElse(-1)
          case _ => -1
       }
       //play.Logger.debug("First business for "+ main.userId + " are: " + firstBusinessId)
       firstBusinessDetected
    }

    def masterFirst: String = {
      val masterFirstDetected = masterFirstId match {
          case Some(tup) => tup.master_acc
          case _ => ""
       }
       //play.Logger.debug("First master acc for "+ main.userId + " are: " + masterFirstId)
       masterFirstDetected
    }
    def isEmployee:Boolean = {
      if (permissions.isDefined)
        permissions.get._2
      else
        false
    }





  }
