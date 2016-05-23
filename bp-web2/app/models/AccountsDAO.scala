package models
import models.DAO.resources.{EmployeesBusinessDAO, AccountPlanDAO}
import models.DAO.resources.BusinessDTO._
//import models.DAO.conversion.DatabaseCred
import securesocial.core.providers._
import securesocial.core._
import securesocial.core.services.{UserService, SaveMode}
//import slick.driver.PostgresDriver.api._
import com.github.nscala_time.time.Imports._
//import com.github.tminglei.slickpg.date.PgDateJdbcTypes
import slick.model.ForeignKeyAction
//import slick.driver.PostgresDriver.api._
import com.github.tototoshi.slick.PostgresJodaSupport._
import service.DemoUser
import models.DAO.resources._

object AccountInfosDAOF {
  import scala.util.Try
import akka.actor.ActorSystem


import slick.driver.PostgresDriver.api._
import com.github.nscala_time.time.Imports._
import com.github.tototoshi.slick.PostgresJodaSupport._


import slick.backend.{StaticDatabaseConfig, DatabaseConfig}
//import slick.driver.JdbcProfile
import slick.driver.PostgresDriver.api._
import slick.jdbc.meta.MTable
import scala.concurrent.ExecutionContext.Implicits.global
import com.github.tototoshi.slick.PostgresJodaSupport._
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
      empSeq.foreach { emp =>

      getByInfoByUID(emp.uid).map { infoF =>
        infoF.map { info =>
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
                } getOrElse Future.successful(AccountsDAO.createInfo(AccountInfo(None,
                                                          uid = emp.uid,
                                                          created_at = org.joda.time.DateTime.now(),
                                                          ea = false,
                                                          pro = false,
                                                          currentWorkbench = workbench)))
            }
      }
      case _ => Future(-1)
      }
    }
  }

  def updateCurrentWorkbenchForHead(uid: String):Future[Int] = {
    EmployeeDAOF.getByEmpByUID(uid).flatMap { empOpt =>
      val no:Int = -1
      empOpt.map { emp =>
         updateCurrentWorkbench(uid = emp.uid, workbench = Some( emp.workbench) ).flatMap { result =>
            Future.successful(result)
        }
      } getOrElse Future.successful(no)
    }
  }

  def updateF(id: Int, info: AccountInfo): Future[Int] =
    db.run(filterQuery(id).update(info))


  def makeCurrentBusiness() = {

  }
}









object AccountsDAOF {
  import scala.util.Try
import akka.actor.ActorSystem


import slick.backend.{StaticDatabaseConfig, DatabaseConfig}
//import slick.driver.JdbcProfile
import slick.driver.PostgresDriver.api._
import slick.jdbc.meta.MTable
import scala.concurrent.ExecutionContext.Implicits.global
import com.github.tototoshi.slick.PostgresJodaSupport._
import scala.concurrent.duration.Duration
import scala.concurrent.{ExecutionContext, Awaitable, Await, Future}
import scala.util.Try
import models.DAO.conversion.DatabaseFuture._
    //import dbConfig.driver.api._ //
  def await[T](a: Awaitable[T])(implicit ec: ExecutionContext) = Await.result(a, Duration.Inf)
  def awaitAndPrint[T](a: Awaitable[T])(implicit ec: ExecutionContext) = println(await(a))

  val accounts = AccountsDAO.accounts
  val account_infos = AccountInfosDAOF.account_infos

  private def filterQueryByUID(email: String): Query[Accounts, AccountDAO, Seq] =
    accounts.filter(_.userId === email)
  private def filterQueryByProviderUserId(providerId: String, userId:String): Query[Accounts, AccountDAO, Seq] =
    for { a ← accounts if a.providerId === providerId && a.userId === userId } yield a
  private def filterQueryByProvidereEmail(providerId: String, email:String): Query[Accounts, AccountDAO, Seq] =
    for { a ← accounts if a.providerId === providerId && a.email === email } yield a

    private def filterInfoQueryByUID(email: String): Query[AccountInfos, AccountInfo, Seq] =
      account_infos.filter(_.uid === email)


  def getLang(email: String):Future[String] = {
      db.run(filterInfoQueryByUID(email).result.headOption).map { result =>
      result match {
        case Some(account) => account.lang.getOrElse("en")
        case _ => "en"
      }
      }
  }

  def getRolesAndLang(email: String, workbench_id: Int = -1): Future[Option[Tuple3[Boolean, Boolean, String]]] = {
    val employeeF:Future[Option[EmployeeDTO]] = models.DAO.resources.EmployeeDAOF.getByEmployeeUIDAndWorkbench(email,
                                                                                                      workbench_id)
    val isManagerF:Future[Boolean] = employeeF.map { employee =>
      employee match {
        case Some(emp) => emp.manager
        case _ => false
      }//AccountPlanDAO.getByMasterAcc(email).isDefined
    }
    val isEmployeeF:Future[Boolean] = employeeF.map { employee =>
      employee match {
        case Some(emp) => true
        case _ => false
      }
    }
    val langF:Future[String] = getLang(email)
    for {
      isManager <- isManagerF
      isEmployee <- isEmployeeF
      lang <- langF
      } yield Some((isManager, isEmployee, lang))
  }


  def find(providerId: String, userId: String):Future[Option[BasicProfile]] = {
      db.run(filterQueryByProviderUserId(providerId, userId).result).map { result =>
        result.map(s => BasicProfile.tupled(Account.unapply(s.toAccount).get)).headOption
      }
  }
  def findByEmailAndProvider(email: String, providerId: String): Future[Option[BasicProfile]] = {
    db.run(filterQueryByProvidereEmail(providerId, email).result).map { result =>
      result.map(s => BasicProfile.tupled(Account.unapply(s.toAccount).get)).headOption
    }
  }
}

object AccountsDAO {
  import akka.actor.ActorSystem
  import slick.backend.{StaticDatabaseConfig, DatabaseConfig}
  //import slick.driver.JdbcProfile
  import slick.driver.PostgresDriver.api._
  import slick.jdbc.meta.MTable
  import scala.concurrent.ExecutionContext.Implicits.global
  import com.github.tototoshi.slick.PostgresJodaSupport._
  import scala.concurrent.duration.Duration
  import scala.concurrent.{ExecutionContext, Awaitable, Await, Future}
  import scala.util.Try
  import models.DAO.conversion.DatabaseFuture._
  def await[T](a: Awaitable[T])(implicit ec: ExecutionContext) = Await.result(a, Duration.Inf)
  def awaitAndPrint[T](a: Awaitable[T])(implicit ec: ExecutionContext) = println(await(a))


  val accounts = TableQuery[Accounts]
  val account_infos = TableQuery[AccountInfos]
  // New auth

  import models.daos._
  class UsersTable(tag: Tag) extends Table[DBUser](tag, "user") {
    def id = column[String]("userID", O.PrimaryKey)
    def firstName = column[Option[String]]("firstName")
    def lastName = column[Option[String]]("lastName")
    def fullName = column[Option[String]]("fullName")
    def email = column[Option[String]]("email")
    def avatarURL = column[Option[String]]("avatarURL")
    def * = (id, firstName, lastName, fullName, email, avatarURL) <> (DBUser.tupled, DBUser.unapply)
  }
  class LoginInfosTable(tag: Tag) extends Table[DBLoginInfo](tag, "logininfo") {
    def id = column[Long]("id", O.PrimaryKey, O.AutoInc)
    def providerID = column[String]("providerID")
    def providerKey = column[String]("providerKey")
    def * = (id.?, providerID, providerKey) <> (DBLoginInfo.tupled, DBLoginInfo.unapply)
  }



  class UserLoginInfosTable(tag: Tag) extends Table[DBUserLoginInfo](tag, "userlogininfo") {
    def userID = column[String]("userID")
    def loginInfoId = column[Long]("loginInfoId")
    def * = (userID, loginInfoId) <> (DBUserLoginInfo.tupled, DBUserLoginInfo.unapply)
  }



  class PasswordInfosTable(tag: Tag) extends Table[DBPasswordInfo](tag, "passwordinfo") {
    def hasher = column[String]("hasher")
    def password = column[String]("password")
    def salt = column[Option[String]]("salt")
    def loginInfoId = column[Long]("loginInfoId")
    def * = (hasher, password, salt, loginInfoId) <> (DBPasswordInfo.tupled, DBPasswordInfo.unapply)
  }


  val users = TableQuery[UsersTable]
  val logininfo =  TableQuery[LoginInfosTable]
  val userlogininfo =  TableQuery[UserLoginInfosTable]
  val passwordinfo =  TableQuery[PasswordInfosTable]

  def pull_user_object(s: DBUser) = {
      await(db.run( users returning users.map(_.id) += s ))
  }


  def pull_loginInfo_object(s: DBLoginInfo) = {
      await(db.run( logininfo returning logininfo.map(_.id) += s ))
  }
  def pull_userInfo_object(s: DBUserLoginInfo) = {
      await(db.run( userlogininfo returning userlogininfo.map(_.userID) += s ))
  }
  def pull_passwordInfo_object(s: DBPasswordInfo) = {
      await(db.run(  passwordinfo returning passwordinfo.map(_.loginInfoId) += s ))
  }



  val create1: DBIO[Unit] = account_infos.schema.create
  //val drop1: DBIO[Unit] = account_infos.schema.drop

  def infos_ddl = db.run(create1)
  //def infos_ddl = db.run(drop1)
/*
  def ddl {
      {

        (accounts.ddl ++ TokensDAO.tokens.ddl).create
    }
  }
  def infos_ddl {
      {

       account_infos.ddl.create
    }
  }
*/
  def subscribeToPro(account_id: String):Boolean = {   {

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
  def subscribeToEA(account_id: String):Boolean  = {   {

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
  def getAllInfos: List[AccountInfo] = {   {

      val q3 = for { s ← account_infos } yield s
      await(db.run(q3.result)).toList.sortBy(_.id)
    }
  }
  def updateEmail(email: String, newEmail: String): Boolean =   {

    val q3 = for { a ← accounts if a.userId === email } yield a
      await(db.run(q3.result.headOption)) match {
        case Some(account) => {
          await(db.run( accounts.filter(_.email === email).update(account.copy(userId = newEmail, email = Some(newEmail))) )) match {
                case -1 => false
                case _ => true
          }
        }
        case _ => false
      }
  }
  def updateProfilePassword(user: BasicProfile, entry: Option[securesocial.core.BasicProfile]) = {
	  {

    val q3 = for { a ← accounts if a.userId === user.userId } yield a
      await(db.run(q3.result.headOption)) match {
        case Some(account) => {
          val newPassword = user.passwordInfo match { case Some(info) => info.password; case _ => "" }

          await(db.run( accounts.filter(_.email === user.email.getOrElse("")).update(account.copy(password = newPassword)) )) match {
                case -1 => false
                case _ => true
          }
        }
        case _ => false
      }
  }


  }
  def getRolesAndLang(email: String, workbench_id: Int = -1): Option[Tuple3[Boolean, Boolean, String]] ={
    val employee = models.DAO.resources.EmployeeDAO.getByEmployeeUIDAndWorkbench(email, workbench_id)
    val isManager = employee match {
      case Some(emp) => emp.manager
      case _ => false
    }//AccountPlanDAO.getByMasterAcc(email).isDefined
    val isEmployee = employee match {
      case Some(emp) => true
      case _ => false
    }
    val lang = getLang(email)
    Some((isManager, isEmployee, lang))
  }

  def getLang(email: String) =   {

      val q3 = for { a ← accounts if a.userId === email } yield a
      await(db.run(q3.result.headOption)) match {
        case Some(account) => account.lang
        case _ => "en"
      }
  }
  def getAccount(email: String):Option[models.daos.DBUser] =   {

      val q3 = for { a ← users if a.email === email } yield a
      await(db.run(q3.result.headOption))
  }
  def getAccounts(emails: List[String]):List[AccountDAO] =   {

      val q3 = for { a ← accounts if a.userId inSetBind emails } yield a
      await(db.run(q3.result)).toList
  }
  def getAll():List[AccountDAO] =   {

      val q3 = for { a ← accounts } yield a
      await(db.run(q3.result)).toList
  }
  def getAccountInfo(email: String): Option[AccountInfo] =   {

    val q3 = for { a ← account_infos if a.uid === email } yield a
    await(db.run(q3.result.headOption))
  }
  def findByNickname(nickname: String):Option[AccountDAO] =   {

      val q3 = for { a ← accounts if a.nickname === nickname } yield a
      await(db.run(q3.result.headOption))
  }
  def updateLang(email: String, lang: String) =   {

      val q3 = for { a ← accounts if a.userId === email } yield a
      await(db.run(q3.result.headOption)) match {
        case Some(account) => accounts.filter(_.email === email).update(account.copy(lang = lang))
        case _ => "en"
      }
  }



  def findAllByEmails(emails: List[String]) =   {

      val q3 = for { a ← users if a.email inSetBind emails } yield a
      await(db.run(q3.result)).toList
  }

  def find(providerId: String, userId: String):Option[BasicProfile] =   {

      val q3 = for { a ← accounts if a.providerId === providerId && a.userId === userId } yield a
      val result = await(db.run(q3.result)).toList.map(s => BasicProfile.tupled(Account.unapply(s.toAccount).get))
      result.headOption
  }

  def deleteUser(uuid: String) =   {

      val tok = findAllByEmails(List(uuid)).head
      //accounts.filter(_.userId === tok.userId).delete
  }

  def findByEmailAndProvider(email: String, providerId: String): Option[BasicProfile] =   {

      val q3 = for { a ← accounts if a.providerId === providerId && a.email === email } yield a
      val result = await(db.run(q3.result)).toList.map(s => BasicProfile.tupled(Account.unapply(s.toAccount).get))
      result.headOption
  }

  import controllers.Credentials
  def updateCredentials(email: String, cred: Credentials) =   {

    val q3 = for { a ← users if a.email === email } yield a
      val result = await(db.run(q3.result.headOption))
      result match {
        case Some(origin) => {
         val toUpdate = origin.copy(firstName = cred.firstName,
                                    lastName = cred.lastName,
                                    fullName = cred.fullName)
           users.filter(_.email === email).update(toUpdate)
           true
        }
        case _ => false
      }
  }
  def fetchCredentials(email: String) =   {

    val q3 = for { a ← users if a.email === email } yield a
      val result = await(db.run(q3.result.headOption))
      result match {
      case Some(origin) => {
        Some(Credentials(origin.firstName,
          origin.lastName,
          origin.fullName,
          "en",//account.lang,
          country  = None,
          phone    = None,
          nickname = None))
      }
      case _ => None
    }
}

  def save(user: BasicProfile):DemoUser =    {

      val acc = Account.tupled(BasicProfile.unapply(user).get)
      await(db.run(  accounts += acc.toDTO ))
      await(db.run(  account_infos += AccountInfo(None, acc.toDTO.userId, org.joda.time.DateTime.now()) ))
      val accTupled = BasicProfile.tupled(Account.unapply(acc).get)
      DemoUser(accTupled, List(accTupled))
  }
  def createInfo(a: AccountInfo) =   {
    await(db.run(  account_infos += a ))
  }

  // TODO: def link(current: UserAccount, to: BasicProfile): UserAccount =  ???
  def updatePasswordInfo(user: DemoUser, info: PasswordInfo): Option[BasicProfile] =   {

      val q3 = for { a ← accounts  } yield a
      val accs = await(db.run(q3.result)).toList.map { s =>
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
  def passwordInfoFor(user: DemoUser): Option[PasswordInfo] =   {

      val q3 = for { a ← accounts  } yield a
      val accs = await(db.run(q3.result)).toList.map { s =>
        val acc = BasicProfile.tupled(Account.unapply(s.toAccount).get)
        DemoUser(acc, List(acc))
      }

      for ( found <- accs.find(_ == user);
            identityWithPasswordInfo <- found.identities.find(_.providerId == UsernamePasswordProvider.UsernamePassword)
      ) yield {
        identityWithPasswordInfo.passwordInfo.get
      }

  }
  val create: DBIO[Unit] = accounts.schema.create
  val drop: DBIO[Unit] = accounts.schema.drop

  def ddl_create = db.run(create)
  def ddl_drop = db.run(drop)

}
