package models
import models.DAO.resources.{EmployeesBusinessDAO, AccountPlanDAO}
import models.DAO.resources.BusinessDTO._
import models.DAO.conversion.DatabaseCred
import securesocial.core.providers._
import securesocial.core._
import securesocial.core.services.{UserService, SaveMode}
//import slick.driver.PostgresDriver.api._
import com.github.nscala_time.time.Imports._
//import com.github.tminglei.slickpg.date.PgDateJdbcTypes
import slick.model.ForeignKeyAction
import models.DAO.conversion.DatabaseCred.dbConfig.driver.api._
import com.github.tototoshi.slick.PostgresJodaSupport._
import service.DemoUser


class Accounts(tag: Tag) extends Table[AccountDAO](tag, "accounts") {
  implicit def string2AuthenticationMethod = MappedColumnType.base[AuthenticationMethod, String](
    authenticationMethod => authenticationMethod.method,
    string => AuthenticationMethod(string))
  import AccImplicits._

  def uid         = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def providerId  = column[String]("providerId")
  def userId      = column[String]("userId", O.PrimaryKey)
  def firstName   = column[Option[String]]("firstName")
  def lastName    = column[Option[String]]("lastName")
  def fullName    = column[Option[String]]("fullName")
  def email       = column[Option[String]]("email")
  def avatarUrl   = column[Option[String]]("avatarUrl")
  def authMethod  = column[String]("authMethod")
  // oAuth 1
  def token       = column[Option[String]]("token")
  def secret      = column[Option[String]]("secret")

  // oAuth 2
  def accessToken = column[Option[String]]("accessToken")
  def tokenType   = column[Option[String]]("tokenType")
  def expiresIn   = column[Option[Int]]("expiresIn")
  def refreshToken= column[Option[String]]("refreshToken")

  // password info
  def hasher      = column[String]("hasher")
  def password    = column[String]("password")
  def salt        = column[Option[String]]("salt")


  def lang        = column[String]("lang")
  def nickname    = column[Option[String]]("nickname")

  def country     = column[Option[String]]("country")
  def phone       = column[Option[String]]("phone")

  //def currentWorkbench = column[Option[Int]]("workbench_id")

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

lang: String            = "en",
country: Option[String] = None,
phone: Option[String]   = None,
nickname: Option[String]= None

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
