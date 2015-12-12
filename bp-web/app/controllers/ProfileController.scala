package controllers

import play.api._
import play.api.mvc._
import play.twirl.api.Html

//{Action, Controller}
import play.api.http.MimeTypes
import play.api.libs.json._
import play.api.cache._

import views._
import models.{AccountsDAO, User, Page}
import service.DemoUser
import securesocial.core._
import controllers.users._
import models.DAO.resources._
import models.DAO._
import decorators._
import scala.concurrent._
import scala.concurrent.duration._
import scala.util.Success
import scala.util.Failure

case class employeeParams(perms: List[ActPermission], bps: List[BProcessDTO], elems_titles:Map[Int, String], res_acts: List[ResAct])
case class managerParams(business: BusinessDTO)
case class DashboardTopBar(newSession: Int = 0, interaction: Int = 0, completedSession: Int = 0, process: Int = 0)
case class planInfo(title: String, expire_at: org.joda.time.DateTime)

class ProfileController(override implicit val env: RuntimeEnvironment[DemoUser]) extends Controller with securesocial.core.SecureSocial[DemoUser] {

  val Home = Redirect(routes.ProfileController.dashboard())
  val DashScreen = Redirect(routes.ProfileController.dashboardScreen())
  //val Login = Redirect(routes.securesocial.controllers.LoginPage.login)
  /************
   * Root entry point
   ************/
  def dashboard = Action { implicit request =>
    implicit val req: RequestHeader = request
      val user:Future[Option[service.DemoUser]] = env.authenticatorService.fromRequest.map {
         case Some(authenticator) if authenticator.isValid => { 
           Some(authenticator.user)
       }
      case _ => { 
        None
      }       
    }
      var cred:Option[service.DemoUser] = Await.result(user, Duration(5000, MILLISECONDS))
      cred match {
          case Some(u) => DashScreen
          case _ => Redirect("/auth/login") 
          //Login.flashing("success" -> s"Entity  has been created")
      }
  }

  def dashboardScreen = SecuredAction { implicit request =>
      val business = request.user.businessFirst
      if (business < 1) {
        Redirect(controllers.routes.SettingController.workbench())
      } else {
      // TODO: service.getByBusiness that manager participated
      val services = BusinessServiceDAO.getAllByBusiness(request.user.businessFirst)
      val businesses = List(BusinessDAO.get(business).get)
      val primaryBusiness:BusinessDTO = businesses.head

      val email = request.user.main.email.get

      var (isManager, isEmployee, lang) = AccountsDAO.getRolesAndLang(email).get

      if (!isEmployee) {// && !arePlanExist(email)) {
                                                              // Initiate env for new user
        utilities.NewUserRoutine.initiate_env(email)          // run routine
        //request.user.renewPermissions()                     // renew permission
        var (isManager, isEmployee, lang) = AccountsDAO.getRolesAndLang(email).get
        println("redirect")
        Home                                                // redirect to dashboard
      } else {
        val plan = planFetch(email, isManager)
        val managerParams = makeManagerParams(email, isManager, primaryBusiness)
        val walkthrought:Boolean = managerParams match {
            case  Some(param) => param.business.walkthrough
            case _ => false
        }   
        val sessions:List[SessionContainer] = BPSessionDAO.findListedByBusiness(business)//BPSessionDAO.findByBusiness(business_id).map(ses => SessionDecorator(ses._1, ses._2)).toList
        val currentReactions:List[CurrentSessionReactionContainer] = sessions.map(cn => cn.sessions.map(session_status => 
            SessionReactionDAO.findCurrentUnappliedContainer(cn.process.id.get, session_status.session.id.get)).flatten
          ).flatten
        val dashboardTopBar: DashboardTopBar = countDashboardTopBar(email, business)

        Ok(views.html.profiles.dashboard(request.user, 
          managerParams, 
          makeEmployeeParams(email, isEmployee, primaryBusiness), 
          plan, 
          walkthrought, 
          sessions,
          dashboardTopBar, currentReactions ) (
            Page(services, 1, 1, services.length), 1, "%", businesses))
      }
    }
  }



  def profile(profile_id: String) = SecuredAction { implicit request =>
    val optAccount = AccountsDAO.findByNickname(profile_id)
    val optBusiness = models.DAO.resources.BusinessDAO.findByNickname(profile_id)

    optAccount match {
      case Some(account) => {
        Ok(views.html.profiles.profile(account = Some(account), business = None)(request.user))
      }
      case _ => {
        optBusiness match {
          case Some(business) => Ok(views.html.profiles.profile(account = None, business = Some(business))(request.user))
          case _ => NotFound(views.html.custom.msg404("", request))
        }
      }
    }

  }


/*
 Private operations
*/
private def planFetch(email: String, isManager: Boolean):Option[planInfo] = {
    if (isManager) {
      val plan = AccountPlanDAO.getPlanByMasterAcc(email)
      Some(planInfo(plan._2.title, plan._1))
    } else {
        None
    }
}

private def profilePerms(uid: String) = {
  ActPermissionDAO.getByUID(uid)
}
private def dashActs(uid: String) = {
  ActPermissionDAO.getByUID(uid)
}
private def countDashboardTopBar(uid: String, business: Int = -1): DashboardTopBar = {


// find businesses
 business match {
  case -1 => {
      DashboardTopBar(
                       newSession = 0,
                       interaction = 0, 
                       completedSession = 0, 
                       process = 0)
  }
  case _ => { 
    // find processes for each businesses
    val processes = BPDAO.findByBusiness(business)
    // find stations for processes
    val stations = BPStationDAO.findByBPIds(processes.map(_.id.get))
    // find completed stations
    val competed = stations.filter(_.finished)
    // find not completed but not canceled stations
    val newSession = stations.filter(s => s.started && !s.finished)
    // find inputlogger for new stations and their coun
    val interaction = stations.filter(s => s.started && s.paused)
      DashboardTopBar(
                       newSession = newSession.length,
                       interaction = interaction.length, 
                       completedSession = competed.length, 
                       process = processes.length)
  }
}

}

private def makeManagerParams(email: String, isManager: Boolean, business: BusinessDTO): Option[managerParams] = {
  isManager match {
    case true => {
      Some(managerParams(business))      
    }
    case _ => None
  }
}
private def makeEmployeeParams(email: String, isEmployee: Boolean, business: BusinessDTO): Option[employeeParams] = {
    if (isEmployee) {
        val bps_ids = ActPermissionDAO.getByUIDprocIDS(email)
        val bps = BPDAO.getAll.filter(bp => bps_ids.contains(bp.id.get))
        val perms = profilePerms(email)

        val elems_titles = ActPermissionDAO.getByUIDelemTitles(email)
        val acts = ActPermissionDAO.getActsByUID(email)

        Some(employeeParams(perms, bps, elems_titles, acts))
    }
    else None
}
private def arePlanExist(email: String): Boolean = {
  AccountPlanDAO.getByMasterAcc(email).isDefined
}

}