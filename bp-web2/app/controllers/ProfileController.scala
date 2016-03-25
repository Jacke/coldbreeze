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
import models._
case class employeeParams(perms: List[ActPermission], bps: List[BProcessDTO], elems_titles:Map[Int, String], res_acts: List[ResAct])
case class managerParams(business: BusinessDTO)
case class DashboardTopBar(newSession: Int = 0, interaction: Int = 0, completedSession: Int = 0, process: Int = 0)
case class planInfo(title: String, expire_at: org.joda.time.DateTime)


import javax.inject.Inject

import securesocial.core._
import service.{ MyEnvironment, MyEventListener, DemoUser }
import play.api.mvc.{ Action, RequestHeader }
class ProfileController @Inject() (override implicit val env: MyEnvironment) extends securesocial.core.SecureSocial {

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

  def dashboardScreen = SecuredAction.async { implicit request =>
      val business = request.user.businessFirst
      if (business < 1) {
        Future(Redirect(controllers.routes.SettingController.workbench()))
      } else {
      // TODO: service.getByBusiness that manager participated
      val servicesF:Future[Seq[BusinessServiceDTO]] = BusinessServiceDAOF.getAllByBusiness(request.user.businessFirst)
      val businessF:Future[Option[BusinessDTO]] = models.DAO.resources.BusinessDAOF.get(business)

      val email = request.user.main.email.get
      val acc_tupleF = AccountsDAOF.getRolesAndLang(email, business)
      //var (isManager, isEmployee, lang) = AccountsDAOF.await(AccountsDAOF.getRolesAndLang(email, business)).get

      if (false){ //!isEmployee) {// && !arePlanExist(business)) {
                                                              // Initiate env for new user
        utilities.NewUserRoutine.initiate_env(email)          // run routine
        //request.user.renewPermissions()                     // renew permission
        //val acc_tupleF = AccountsDAOF.getRolesAndLang(email, business)
        var (isManager, isEmployee, lang) = AccountsDAOF.await(AccountsDAOF.getRolesAndLang(email, business)).get
        println("redirect")
        Future(Home)                                                // redirect to dashboard
      } else {
        val isManagerF = acc_tupleF.map { tuple => tuple.get._1 }
        val isEmployeeF = acc_tupleF.map { tuple => tuple.get._2 }
        val dashboardTopBarF: Future[DashboardTopBar] = countDashboardTopBar(email, business)
        val sessionsF:Future[Seq[SessionContainer]] = BPSessionDAOF.findListedByBusiness(business)
        val managerParamsF: Future[Option[managerParams]] = makeManagerParamsF(email, isManagerF, businessF)
        val walkthroughtF:Future[Boolean] = managerParamsF.map { managerParams =>
          managerParams match {
            case  Some(param) => param.business.walkthrough
            case _ => false
          }
        }

        //val currentReactionsF:Future[List[Option[CurrentSessionReactionContainer]]] =
        val currentReactionsF:Future[List[Option[CurrentSessionReactionContainer]]] = sessionsF.flatMap { sessionsCn =>
           //Future.sequence(
           // sessions.toList.map { cn =>
           //   //cn.sessions.toList.map(session_status =>
           //   //    SessionReactionDAOF.findCurrentUnappliedContainer(cn.process.id.get, session_status.session.id.get)
           //   //    )
           // }.flatten )
           val notCompletedSessions = sessionsCn.filter(cn => cn.sessions.filter(status => status.percent < 100).length > 0)
           val proc_ids = notCompletedSessions.toList.map { cn =>
              cn.sessions.toList.map(cn_el => cn.process.id.get)
            }.flatten.distinct
           val ses_ids = notCompletedSessions.toList.map { cn =>
              cn.sessions.toList.map(cn_el => cn_el.session.id.get)
            }.flatten.distinct
           SessionReactionDAOF.findCurrentUnappliedContainerBatch(proc_ids, ses_ids)
        }
        for {
          dashboardTopBar <- dashboardTopBarF
          currentReactions <- currentReactionsF
          services <- servicesF
          managerParams <- managerParamsF
          walkthrought <- walkthroughtF
          sessionsCn <- sessionsF
          primaryBusiness <- businessF
          isEmployee <- isEmployeeF
          isManager <- isManagerF
          } yield Ok(views.html.profiles.dashboard(request.user,
                  managerParams,
                  makeEmployeeParams(email, isEmployee, primaryBusiness.get),
                  walkthrought,
                  sessionsCn.toList.filter(cn => cn.sessions.filter(status => status.percent < 100).length > 0),
                  dashboardTopBar, currentReactions.flatten ) (
                    Page(services.toList, 1, 1, services.length), 1, "%", List(primaryBusiness.get), isManager ))

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
private def planFetch(email: String, isManager: Boolean, business: Int = -1):Future[Option[planInfo]] = {
    if (isManager) {
      val planF = AccountPlanDAOF.getByWorkbenchAcc(workbench_id = business)//AccountPlanDAO.getPlanByMasterAcc(email)
      planF.flatMap { plan =>
        plan match {
          case Some(plan) => {
            PlanDAOF.get(plan.plan).map { planTitle =>
              Some(planInfo(planTitle.get.title, plan.expired_at))
            }
          }
          case _ => Future(None)
        }
      }
    } else {
        Future(None)
    }
}


private def profilePerms(uid: String) = {
  ActPermissionDAO.getByUID(uid)
}
private def dashActs(uid: String) = {
  ActPermissionDAO.getByUID(uid)
}
private def countDashboardTopBar(uid: String, business: Int = -1): Future[DashboardTopBar] = {
// find businesses
 business match {
  case -1 => {
      Future(DashboardTopBar(
                       newSession = 0,
                       interaction = 0,
                       completedSession = 0,
                       process = 0))
  }
  case _ => {
    // find processes for each businesses
    val processesF:Future[Seq[BProcessDTO]] = BPDAOF.findByBusiness(business)
    // find stations for processes
    processesF.flatMap { processes =>
      val stationsF = BPStationDAOF.findByBPIds(processes.map(_.id.get).toList)
      stationsF.map { stations =>
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
private def makeManagerParamsF(email: String, isManager: Future[Boolean],
  business: Future[Option[BusinessDTO]]): Future[Option[managerParams]] = {
  isManager.flatMap { isManager =>
    business.map { business =>
      isManager match {
        case true => {
          Some(managerParams(business.get))
        }
        case _ => None
      }
    }
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
private def arePlanExist(business: Int = -1): Boolean = {
  AccountPlanDAO.getByWorkbenchAcc(workbench_id = business).isDefined
}

}
