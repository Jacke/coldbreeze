package models
import models.DAO.resources.{EmployeesBusinessDAO, AccountPlanDAO}
import models.DAO.resources.BusinessDTO._
//import models.DAO.conversion.DatabaseCred
import securesocial.core.providers._
import securesocial.core._
import securesocial.core.services.{UserService, SaveMode}
//import models.DAO.driver.MyPostgresDriver.simple._
import com.github.nscala_time.time.Imports._
//import com.github.tminglei.slickpg.date.PgDateJdbcTypes
import slick.model.ForeignKeyAction
//import slick.driver.PostgresDriver.simple._
import com.github.tototoshi.slick.PostgresJodaSupport._
import service.DemoUser
import models.DAO.resources._

object AccountInfosDAOF {
  import scala.util.Try
import akka.actor.ActorSystem
import akka.stream.ActorFlowMaterializer
import akka.stream.scaladsl.Source
import slick.backend.{StaticDatabaseConfig, DatabaseConfig}
//import slick.driver.JdbcProfile
import slick.driver.PostgresDriver.api._
import slick.jdbc.meta.MTable
import scala.concurrent.ExecutionContext.Implicits.global
import com.github.tototoshi.slick.JdbcJodaSupport._
import scala.concurrent.duration.Duration
import scala.concurrent.{ExecutionContext, Awaitable, Await, Future}
import scala.util.Try
import models.DAO.conversion.DatabaseFuture._
    //import dbConfig.driver.api._ //
  def await[T](a: Awaitable[T])(implicit ec: ExecutionContext) = Await.result(a, Duration.Inf)
  def awaitAndPrint[T](a: Awaitable[T])(implicit ec: ExecutionContext) = println(await(a))

  val account_infos = AccountsDAO.account_infos


  private def filterQuery(id: Int): Query[AccountInfos, AccountInfo, Seq] =
    account_infos.filter(_.id === id)
  private def filterQueryByUID(uid: String): Query[AccountInfos, AccountInfo, Seq] =
    account_infos.filter(_.uid === uid)
  private def getAll(): Query[AccountInfos, AccountInfo, Seq] =
    account_infos

  def getByInfoById(id: Int):Future[Seq[AccountInfo]] = { 
    db.run(filterQuery(id).result)
    
  }
  def getByInfoByUID(uid: String):Future[Option[AccountInfo]] = { 
    db.run(filterQueryByUID(uid).result.headOption)
    
  }
// models.AccountInfosDAOF.updateCurrentWorkbenchForAllEmployees
// models.AccountInfosDAOF.getByInfoByUID
  def updateCurrentWorkbenchForAllEmployees() = {
    val emps:Future[Seq[EmployeeDTO]] = EmployeeDAOF.getAll()
    emps.map { empSeq =>
      println(empSeq.length)
      empSeq.foreach { emp =>
      println(emp.master_acc)
      
      getByInfoByUID(emp.uid).map { infoF =>
        infoF.map { info =>
        println(info)
        updateF(info.id.get, info.copy(currentWorkbench = Some(emp.workbench)))          
          
        }
        }
      }
    }
  }

  def updateCurrentWorkbench(uid: String, workbench: Option[Int]):Future[Int] = {
    val empOpt:Future[Option[EmployeeDTO]] = EmployeeDAOF.getByEmpByUID(uid)
    empOpt.flatMap { empReal =>
      empReal match { 
      case Some(emp) => {   
      val infoF = getByInfoByUID(emp.uid)
      val no:Int = -1
      infoF.flatMap { infoOpt =>
            infoOpt.map { info =>
                  updateF(info.id.get, info.copy(currentWorkbench = workbench))
                } getOrElse Future.successful(no)
            }
      } 
      case _ => Future(-1)
      }
    }
  }

  def updateF(id: Int, info: AccountInfo): Future[Int] =
    db.run(filterQuery(id).update(info))


  def makeCurrentBusiness() = {

  }
}

object AccountsDAO {
  import scala.util.Try
  import slick.driver.PostgresDriver.simple._
  import models.DAO.conversion.DatabaseCred._


  val accounts = TableQuery[Accounts]
  val account_infos = TableQuery[AccountInfos]

  def ddl {
    database withSession {
      implicit session ⇒
        (accounts.ddl ++ TokensDAO.tokens.ddl).create
    }
  }
  def infos_ddl {
    database withSession {
       implicit session ⇒
       account_infos.ddl.create
    }
  }
  def subscribeToPro(account_id: String):Boolean = { database withSession {
     implicit session =>
      getAccountInfo(account_id) match {
        case Some(acc_info) => {
            val accInfoToUpdate: AccountInfo = acc_info.copy(pro = true)
            account_infos.filter(_.id === acc_info.id.get).update(accInfoToUpdate)
            true
        }
        case _ => false
      }
    } 
  }
  def subscribeToEA(account_id: String):Boolean  = { database withSession {
     implicit session =>
      getAccountInfo(account_id) match {
        case Some(acc_info) => {
            val accInfoToUpdate: AccountInfo = acc_info.copy(ea = true)
            account_infos.filter(_.id === acc_info.id.get).update(accInfoToUpdate)
            true
        }
        case _ => false
      }
    } 
  }
  def getAllInfos: List[AccountInfo] = { database withSession {
    implicit session =>
      val q3 = for { s ← account_infos } yield s
      q3.list.sortBy(_.id)
    }
  }
  def updateEmail(email: String, newEmail: String): Boolean = database withSession {
    implicit session =>
    val q3 = for { a ← accounts if a.userId === email } yield a
      q3.list.headOption match {
        case Some(account) => {
          accounts.filter(_.email === email).update(account.copy(userId = newEmail, email = Some(newEmail))) match {
                case -1 => false
                case _ => true
          }
        } 
        case _ => false
      }
  }
  def updateProfilePassword(user: BasicProfile, entry: Option[securesocial.core.BasicProfile]) = {
	database withSession {
    implicit session =>
    val q3 = for { a ← accounts if a.userId === user.userId } yield a
      q3.list.headOption match {
        case Some(account) => {
          val newPassword = user.passwordInfo match { case Some(info) => info.password; case _ => "" }

          accounts.filter(_.email === user.email.getOrElse("")).update(account.copy(password = newPassword)) match {
                case -1 => false
                case _ => true
          }
        }
        case _ => false
      }
  }


  }
  def getRolesAndLang(email: String): Option[Tuple3[Boolean, Boolean, String]] ={
    val manager = AccountPlanDAO.getByMasterAcc(email).isDefined
    val employee = models.DAO.resources.EmployeeDAO.getByEmployeeUID(email) match {
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
  def getAccounts(emails: List[String]):List[AccountDAO] = database withSession {
    implicit session ⇒
      val q3 = for { a ← accounts if a.userId inSetBind emails } yield a
      q3.list
  }  
  def getAccountInfo(email: String): Option[AccountInfo] = database withSession {
    implicit session =>
    val q3 = for { a ← account_infos if a.uid === email } yield a
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
      account_infos += AccountInfo(None, acc.toDTO.userId, org.joda.time.DateTime.now())
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
