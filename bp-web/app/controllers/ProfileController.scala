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

case class employeeParams(perms: List[ActPermission], bps: List[BProcessDTO], elems_titles:Map[Int, String], res_acts: List[ResAct])
case class managerParams(business: BusinessDTO)
case class DashboardTopBar(newSession: Int = 0, interaction: Int = 0, completedSession: Int = 0, process: Int = 0)
case class planInfo(title: String, expire_at: org.joda.time.DateTime)

class ProfileController(override implicit val env: RuntimeEnvironment[DemoUser]) extends Controller with securesocial.core.SecureSocial[DemoUser] {

  val Home = Redirect(routes.ProfileController.dashboard())
  
  def dashboard = SecuredAction { implicit request =>

      // TODO: service.getByBusiness that manager participated
      val services = BusinessServiceDAO.getByMaster(request.user.main.email.get)
      val businesses = BusinessDAO.getAll
      
      val email = request.user.main.email.get

      var (isManager, isEmployee, lang) = AccountsDAO.getRolesAndLang(email).get

      // Initiate env for new user
      if (!request.user.isEmployee && !arePlanExist(email)) {

        utilities.NewUserRoutine.initiate_env(email)
        Home
        
      } else {

        val plan = planFetch(email, isManager)

        val managerParams = makeManagerParams(email, isManager)


        val walkthrought:Boolean = managerParams match {
            case  Some(param) => param.business.walkthrough
            case _ => false
        }

        val business_request:Option[Tuple2[Int, Int]] = models.DAO.resources.EmployeesBusinessDAO.getByUID(email) 
        val business = business_request match {
          case Some(biz) => biz._2
          case _ => -1
        }        

        val sessions:List[SessionContainer] = BPSessionDAO.findListedByBusiness(business)//BPSessionDAO.findByBusiness(business_id).map(ses => SessionDecorator(ses._1, ses._2)).toList

        val currentReactions:List[CurrentReactionContainer] = sessions.map(cn => cn.sessions.map(session_status => 
            ReactionDAO.findCurrentUnappliedContainer(cn.process.id.get, session_status.session.id.get)).flatten
          ).flatten
        println(s""""
          Test

 

           ${currentReactions.head}
          """)
        val dashboardTopBar: DashboardTopBar = countDashboardTopBar(email)

        Ok(views.html.profiles.dashboard(request.user, 
          managerParams, 
          makeEmployeeParams(email, isEmployee), 
          plan, 
          walkthrought, 
          sessions,
          dashboardTopBar, currentReactions ) (
            Page(services, 1, 1, services.length), 1, "%", businesses))
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
private def countDashboardTopBar(uid: String): DashboardTopBar = {


// find businesses
 EmployeesBusinessDAO.getByUID(uid) match {
  case Some(embiz) => { 
   val biz_id = embiz._2
    // find processes for each businesses
    val processes = BPDAO.findByBusiness(biz_id)
    // find sessions for processes
    val sessions = BPStationDAO.findByIds(processes.map(_.id.get))
    // find completed sessions
    val competed = sessions.filter(_.finished)
    // find not completed but not canceled sessions
    val newSession = sessions.filter(s => s.started && !s.finished)
    // find inputlogger for new sessions and their coun
    val interaction = sessions.filter(s => s.started && s.paused)
      DashboardTopBar(
                       newSession = newSession.length,
                       interaction = interaction.length, 
                       completedSession = competed.length, 
                       process = processes.length)
  }
  case _ => {
      DashboardTopBar(
                       newSession = 0,
                       interaction = 0, 
                       completedSession = 0, 
                       process = 0)
  }
}

}

private def makeManagerParams(email: String, isManager: Boolean): Option[managerParams] = {
  isManager match {
    case true => {
      EmployeesBusinessDAO.getBusinessByUID(email) match {
        case Some(business) => Some(managerParams(business))
        case _ => None
      }
      
    }
    case _ => None
  }
}
private def makeEmployeeParams(email: String, isEmployee: Boolean): Option[employeeParams] = {
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