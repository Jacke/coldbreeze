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
case class planInfo(title: String, expire_at: org.joda.time.DateTime)

class ProfileController(override implicit val env: RuntimeEnvironment[DemoUser]) extends Controller with securesocial.core.SecureSocial[DemoUser] {

  val Home = Redirect(routes.ProfileController.profile())
  
  def profile = SecuredAction { implicit request =>

      // TODO: service.getByBusiness that manager participated
      val services = BusinessServiceDAO.getByMaster(request.user.main.email.get)
      val businesses = BusinessDAO.getAll
      
      val email = request.user.main.email.get

      var (isManager, isEmployee, lang) = AccountsDAO.getRolesAndLang(email).get

      // Initiate env for new user
      if (!request.user.isEmployee && !arePlanExist(email)) {
        val emp_id = EmployeeDAO.pull_object(EmployeeDTO(None, email, email, None, true))
        val biz_id = BusinessDAO.pull_object(BusinessDTO(None, "Your Company", country = "", city = "", address = None, walkthrough = true))
        
 
        EmployeesBusinessDAO.pull(emp_id, biz_id)

        assignToTrial(email)
        
        //request.user.renewPermissions() // Update var's of user
        //var (isEmployee, isManager) = (request.user.isEmployee, request.user.isManager)
        
        Home
      } else {

        val plan = planFetch(email, isManager)

        val managerParams = makeManagerParams(email, isManager)

        val business_id = EmployeesBusinessDAO.getByUID(email).get._2

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

        Ok(views.html.profiles.profile(request.user, managerParams, makeEmployeeParams(email, isEmployee), plan, walkthrought, sessions ) (
            Page(services, 1, 1, services.length), 1, "%", businesses))
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
private def makeManagerParams(email: String, isManager: Boolean): Option[managerParams] = {
  isManager match {
    case true => {
      val biz = BusinessDAO.get(EmployeesBusinessDAO.getByUID(email).get._2).get
      Some(managerParams(biz))
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
private def assignToTrial(master_acc: String) = {
    AccountPlanDAO.pull_object(AccountPlanDTO(None, None, master_acc, 1))

}
private def arePlanExist(email: String): Boolean = {
  AccountPlanDAO.getByMasterAcc(email).isDefined
}

}

/**
 * Notification handler
 */

import play.api.mvc._
import play.api.Play.current
import scala.concurrent.Future
import akka.actor._
import play.api.libs.json._
import play.api.mvc.WebSocket.FrameFormatter
import SumActor._
import SumActor.Sum._

class NotificationController(override implicit val env: RuntimeEnvironment[DemoUser]) extends Controller with securesocial.core.SecureSocial[DemoUser] {
    implicit val sumFormat = Json.format[SumActor.Sum]
    implicit val sumFrameFormatter = FrameFormatter.jsonFrame[SumActor.Sum]
    implicit val sumResultFormat = Json.format[SumActor.SumResult]
    implicit val sumResultFrameFormatter = FrameFormatter.jsonFrame[SumActor.SumResult]

    def socket = WebSocket.tryAcceptWithActor[SumActor.Sum, SumActor.SumResult] { request =>
    println(request)
    val cred:Option[DemoUser] = SecureSocial.currentUser[DemoUser](request, env, env.executionContext).value.get.get
    cred match {
      case Some(userid) => Future.successful(Right(SumActor.props(_, Some(userid))))
      case None => Future.successful(Left(Forbidden))
    }

  }

}








object SumActor {

  def props(out: ActorRef, user: Option[DemoUser]) = {
    println(user)
    Props(new SumActor(out, user))
  } 

  /**
   * Sum the given values.
   */
  case class Sum(values: Seq[Int])

  object Sum {
    implicit val sumFormat = Json.format[Sum]
    implicit val sumFrameFormatter = FrameFormatter.jsonFrame[Sum]
  }

  /**
   * The result of summing the values
   */
  case class SumResult(sum: Int, color: Int = SumResult.color_rand, user: Option[String])

  object SumResult {
    import scala.util.Random
    def color_rand = {
       Random.nextInt(100)
    }
    implicit val sumResultFormat = Json.format[SumResult]
    implicit val sumResultFrameFormatter = FrameFormatter.jsonFrame[SumResult]
  }
}

/**
 * An actor that sums sequences of numbers
 */
class SumActor(out: ActorRef, user: Option[DemoUser]) extends Actor {

  import SumActor._


  override def postStop() = {
    println("close")
    println(out)
    println
    //out.close()
  }

  def receive = {
    case Sum(values) => {
      out ! SumResult(values.fold(0)(_ + _ + 100), color = SumResult.color_rand, user.get.main.email)
      /*
      for( a <- 1 to 10){
         out ! SumResult(values.fold(0)(_ + _))
      Thread.sleep(100)
      out ! SumResult(values.fold(0)(_ + _))
      Thread.sleep(100)
      out ! SumResult(values.fold(0)(_ + _))
      Thread.sleep(100)
      out ! SumResult(values.fold(0)(_ + _ + 100))
      }*/
      
    }
  }

}