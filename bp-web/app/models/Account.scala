package models


import models.DAO.resources.{EmployeesBusinessDAO, AccountPlanDAO}
import models.DAO.resources.BusinessDTO._
import models.DAO.conversion.DatabaseCred

import securesocial.core.providers._
import securesocial.core._
import securesocial.core.services.{UserService, SaveMode}

//import models.DAO.driver.MyPostgresDriver.simple._
import com.github.nscala_time.time.Imports._
//import com.github.tminglei.slickpg.date.PgDateJdbcTypes
import slick.model.ForeignKeyAction

import slick.driver.PostgresDriver.simple._
import com.github.tototoshi.slick.PostgresJodaSupport._
import service.DemoUser

object AccImplicits {
  implicit def tuple2OAuth1Info(tuple: (Option[String], Option[String])): Option[OAuth1Info] = tuple match {
    case (Some(token), Some(secret)) => Some(OAuth1Info(token, secret))
    case _ => None
  }

  implicit def tuple2OAuth2Info(tuple: (Option[String], Option[String], Option[Int], Option[String])): Option[OAuth2Info] = tuple match {
    case (Some(token), tokenType, expiresIn, refreshToken) => Some(OAuth2Info(token, tokenType, expiresIn, refreshToken))
    case _ => None
  }
  implicit def typlePassInfo(tuple: (String, String, Option[String])):Option[PasswordInfo] = { tuple match {
    case (hasher, password, Some(salt)) => Some(PasswordInfo(hasher, password, Some(salt)))
    case (hasher, password, None) => Some(PasswordInfo(hasher, password, None))
    case _ =>  None
  }}


  implicit def ob2OAuth1Info(a: Option[String], b: Option[String]): Option[OAuth1Info] = {
    tuple2OAuth1Info(tuple = (a, b))
  }

  implicit def ob2OAuth2Info(a: Option[String], b: Option[String], c: Option[Int], d: Option[String]): Option[OAuth2Info] = {
    tuple2OAuth2Info(tuple = (a, b, c, d))
  }

  implicit def obPassInfo(a: String, b: String, c: Option[String]):Option[PasswordInfo] = {
    typlePassInfo(tuple = (a, b, c))
  }
}

/**
 * BProcess Scheme
 */
class Accounts(tag: Tag) extends Table[AccountDAO](tag, "accounts") {
  implicit def string2AuthenticationMethod = MappedColumnType.base[AuthenticationMethod, String](
    authenticationMethod => authenticationMethod.method,
    string => AuthenticationMethod(string))

  import AccImplicits._


  def uid = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def providerId = column[String]("providerId")
  def userId = column[String]("userId", O.PrimaryKey)
  def firstName = column[Option[String]]("firstName")
  def lastName = column[Option[String]]("lastName")
  def fullName = column[Option[String]]("fullName")
  def email = column[Option[String]]("email")
  def avatarUrl = column[Option[String]]("avatarUrl")
  def authMethod = column[String]("authMethod")
  // oAuth 1
  def token = column[Option[String]]("token")
  def secret = column[Option[String]]("secret")

  // oAuth 2
  def accessToken = column[Option[String]]("accessToken")
  def tokenType = column[Option[String]]("tokenType")
  def expiresIn = column[Option[Int]]("expiresIn")
  def refreshToken = column[Option[String]]("refreshToken")

  // password info
  def hasher = column[String]("hasher")
  def password = column[String]("password")
  def salt = column[Option[String]]("salt")


  def lang = column[String]("lang")
  def nickname = column[Option[String]]("nickname")

  def country = column[Option[String]]("country")
  def phone = column[Option[String]]("phone")

  def * = (providerId,
           userId,
           firstName,
           lastName,
           fullName,
           email,
           avatarUrl,
           authMethod,
    token, secret,
    accessToken, tokenType, expiresIn, refreshToken,
    hasher, password, salt,
    lang, country, phone, nickname) <> (AccountDAO.tupled, AccountDAO.unapply)
}

case class AccountDAO(providerId: String,
                      userId: String,
                      firstName: Option[String],
                      lastName: Option[String],
                      fullName: Option[String],
                      email: Option[String],
                      avatarUrl: Option[String],
                      authMethod: String,
                      token:Option[String], secret:Option[String],

accessToken:Option[String], tokenType:Option[String], expiresIn:Option[Int], refreshToken:Option[String],

hasher:String, password:String, salt:Option[String],

lang: String = "en",
country: Option[String] = None,
phone: Option[String] = None,
nickname: Option[String] = None

                       ) {
  import AccImplicits._
  def toAccount:Account = {
    Account.apply(providerId,
      userId,
      firstName,
      lastName,
      fullName,
      email,
      avatarUrl,
      AuthenticationMethod(authMethod),
      ob2OAuth1Info(token, secret),
      ob2OAuth2Info(accessToken, tokenType, expiresIn, refreshToken),
      obPassInfo(hasher, password, salt)
    )

  }
}
case class Account(
                    providerId: String,
                    userId: String,
                    firstName: Option[String],
                    lastName: Option[String],
                    fullName: Option[String],
                    email: Option[String],
                    avatarUrl: Option[String],
                    authMethod: AuthenticationMethod,
                    oAuth1Info: Option[OAuth1Info] = None,
                    oAuth2Info: Option[OAuth2Info] = None,
                    passwordInfo: Option[PasswordInfo] = None) {
    def toDTO:AccountDAO = {
      AccountDAO(
        providerId,
        userId,
        firstName,
        lastName,
        fullName,
        email,
        avatarUrl,
        authMethod.method,

        oAuth1("a"), oAuth1("b"),

        oAuth2("a").asInstanceOf[Option[String]], oAuth2("b").asInstanceOf[Option[String]],
        oAuth2("c").asInstanceOf[Option[Int]], oAuth2("d").asInstanceOf[Option[String]],

        passInf("a"), passInf("b"), passSalt

      )
    }
    def oAuth1(par: String):Option[String] = if (oAuth1Info.isDefined) {
      par match {
        case "a" => oAuth1Info match {
         case Some(oAuth1Info) => Some(oAuth1Info.token)
         case  _ => None
        }
        case "b" => oAuth1Info match {
         case Some(oAuth1Info) => Some(oAuth1Info.secret)
         case  _ => None
        }
        case  _ => None
        }

    } else { None }

    def oAuth2(par: String):Option[Any] = if (oAuth2Info.isDefined) {

        par match {
          case "a" => oAuth2Info match {
            case Some(oAuth2Info) => Some(oAuth2Info.accessToken)
            case  _ => None
          }
          case "b" => oAuth2Info match {
            case Some(oAuth2Info) => oAuth2Info.tokenType
            case  _ => None
          }
          case "c" => oAuth2Info match {
            case Some(oAuth2Info) => oAuth2Info.expiresIn
            case  _ => None
          }
          case "d" => oAuth2Info match {
            case Some(oAuth2Info) => oAuth2Info.refreshToken
            case  _ => None
          }
          case _ => None
        }

      } else { None }


  def passInf(par: String):String = if (passwordInfo.isDefined) { par match {
    case "a" => passwordInfo match {
      case Some(passwordInfo) => passwordInfo.hasher.asInstanceOf[String]
      case  _ => ""
    }
    case "b" => passwordInfo match {
      case Some(passwordInfo) => passwordInfo.password.asInstanceOf[String]
      case  _ => ""
    }
  }
  } else { "" }


  def passSalt:Option[String] = if (passwordInfo.isDefined) {
   passwordInfo.get.salt match {
      case a@Some(x) => a
      case _ => None
    }
  } else { None }
}

case class UserAccount(main: Account, identities: List[Account])








class Tokens(tag: Tag) extends Table[MailToken](tag, "tokens") {
  def id = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def uuid = column[String]("uuid")
  def email = column[String]("email")
  def creationTime = column[org.joda.time.DateTime]("creationTime")
  def expirationTime = column[org.joda.time.DateTime]("expirationTime")
  def isSignUp = column[Boolean]("isSignUp")

  def * = (uuid, email, creationTime, expirationTime, isSignUp) <> (MailToken.tupled, MailToken.unapply)

}


object TokensDAO {

  import scala.util.Try
  import slick.driver.PostgresDriver.simple._
  import DatabaseCred.database

  val tokens = TableQuery[Tokens]

  def saveToken(token: MailToken): MailToken = database withSession {
    implicit session ⇒
      tokens += token
      token
  }

  def findToken(token: String): Option[MailToken] = { database withSession {
    implicit session ⇒
      val q3 = for { a ← tokens if a.uuid === token } yield a
      q3.list.headOption
  }

  }
  def deleteToken(uuid: String): Option[MailToken] = database withSession {
    implicit session ⇒
      val tok = findToken(uuid)
      tok match {
        case Some(token) =>
          tokens.filter(_.uuid === token.uuid).delete
          Some(token)
        case None => None
      }
  }
  def ddl_create = {
    database withSession {
      implicit session =>
      tokens.ddl.create
    }
  }
  def ddl_drop = {
    database withSession {
      implicit session =>
        tokens.ddl.drop
    }
  }
}

object AccountsDAO {

  import scala.util.Try
  import slick.driver.PostgresDriver.simple._
  import DatabaseCred.database


  val accounts = TableQuery[Accounts]

  def ddl {
    database withSession {
      implicit session ⇒
        (accounts.ddl ++ TokensDAO.tokens.ddl).create
    }
  }

  def getRolesAndLang(email: String): Option[Tuple3[Boolean, Boolean, String]] ={
    val manager = AccountPlanDAO.getByMasterAcc(email).isDefined
    val employee = models.DAO.resources.EmployeeDAO.getByUID(email) match {
      case Some(emp) => true
      case _ => false
    }
    val lang = getLang(email)
    Some((manager, employee, lang))
  }

  def getLang(email: String) = database withSession {
    implicit session ⇒
      val q3 = for { a ← accounts if a.userId === email } yield a
      q3.list.headOption match {
        case Some(account) => account.lang
        case _ => "en"
      }
  }
  def getAccount(email: String):Option[AccountDAO] = database withSession {
    implicit session ⇒
      val q3 = for { a ← accounts if a.userId === email } yield a
      q3.list.headOption
  }
  def findByNickname(nickname: String):Option[AccountDAO] = database withSession {
    implicit session =>
      val q3 = for { a ← accounts if a.nickname === nickname } yield a
      q3.list.headOption
  }
  def updateLang(email: String, lang: String) = database withSession {
    implicit session ⇒
      val q3 = for { a ← accounts if a.userId === email } yield a
      q3.list.headOption match {
        case Some(account) => accounts.filter(_.email === email).update(account.copy(lang = lang)) 
        case _ => "en"
      }
  }
  def findAllByEmails(emails: List[String]) = database withSession {
    implicit session ⇒
      val q3 = for { a ← accounts if a.userId inSetBind emails } yield a
      q3.list
  }

  def find(providerId: String, userId: String):Option[BasicProfile] = database withSession {
    implicit session ⇒
      val q3 = for { a ← accounts if a.providerId === providerId && a.userId === userId } yield a
      val result = q3.list.map(s => BasicProfile.tupled(Account.unapply(s.toAccount).get))
      result.headOption
  }

  def deleteUser(uuid: String) = database withSession {
    implicit session ⇒
      val tok = findAllByEmails(List(uuid)).head
      accounts.filter(_.userId === tok.userId).delete
  }
  def findByEmailAndProvider(email: String, providerId: String): Option[BasicProfile] = database withSession {
    implicit session ⇒
      val q3 = for { a ← accounts if a.providerId === providerId && a.email === email } yield a
      val result = q3.list.map(s => BasicProfile.tupled(Account.unapply(s.toAccount).get))
      result.headOption

  }
import controllers.Credentials
  def updateCredentials(email: String, cred: Credentials) = database withSession {
    implicit session =>
    val q3 = for { a ← accounts if a.email === email } yield a
      val result = q3.list.headOption
      result match {
        case Some(origin) => {
         val toUpdate = origin.copy(firstName = cred.firstName, 
                                    lastName = cred.lastName, 
                                    fullName = cred.fullName, 
                                    lang = cred.lang, 
                                    country = cred.country, 
                                    phone = cred.phone, 
                                    nickname = cred.nickname)
           accounts.filter(_.email === email).update(toUpdate)
           true
        }
        case _ => false
      }

  }
  def fetchCredentials(email: String) = database withSession {
    implicit session =>
    (findByEmailAndProvider(email, "userpass"), getAccount(email)) match {
      case (Some(user), Some(account)) => { 
        Some(Credentials(user.firstName, 
          user.lastName, 
          user.fullName, 
          account.lang, 
          country  = account.country, 
          phone    = account.phone, 
          nickname = account.nickname))
      }
      case _ => None
    }
  }

  def save(user: BasicProfile):DemoUser =  database withSession {
    implicit session ⇒
      val acc = Account.tupled(BasicProfile.unapply(user).get)
      accounts += acc.toDTO
      val accTupled = BasicProfile.tupled(Account.unapply(acc).get)
      DemoUser(accTupled, List(accTupled))
  }
  // TODO: def link(current: UserAccount, to: BasicProfile): UserAccount =  ???
  def updatePasswordInfo(user: DemoUser, info: PasswordInfo): Option[BasicProfile] = database withSession {
    implicit session ⇒
      val q3 = for { a ← accounts  } yield a
      val accs = q3.list.map { s =>
        val acc = BasicProfile.tupled(Account.unapply(s.toAccount).get)
        DemoUser(acc, List(acc))
      }
      for ( found <- accs.find(_ == user);
            identityWithPasswordInfo <- found.identities.find(_.providerId == UsernamePasswordProvider.UsernamePassword)
      ) yield {
        val idx = found.identities.indexOf(identityWithPasswordInfo)
        val updated = identityWithPasswordInfo.copy(passwordInfo = Some(info))
        val updatedIdentities = found.identities.patch(idx, Seq(updated), 1)
        found.copy(identities = updatedIdentities)

        //BasicProfile.tupled(Account.unapply(updated).get)
        updated

      }

  }
  def passwordInfoFor(user: DemoUser): Option[PasswordInfo] = database withSession {
    implicit session ⇒
      val q3 = for { a ← accounts  } yield a
      val accs = q3.list.map { s =>
        val acc = BasicProfile.tupled(Account.unapply(s.toAccount).get)
        DemoUser(acc, List(acc))
      }

      for ( found <- accs.find(_ == user);
            identityWithPasswordInfo <- found.identities.find(_.providerId == UsernamePasswordProvider.UsernamePassword)
      ) yield {
        identityWithPasswordInfo.passwordInfo.get
      }

  }
  def ddl_create = {
    database withSession {
      implicit session =>
      accounts.ddl.create
    }
  }
  def ddl_drop = {
    database withSession {
      implicit session =>
        accounts.ddl.drop
    }
  }
}
