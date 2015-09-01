package utilities

import play.api._
import play.api.mvc._
import play.api.data._
import play.api.data.Forms._
import models.DAO.resources._
import models.DAO._
import models._
import views._
import models._

object NewUserRoutine {

	def initiate_env(email: String) = {

        val cond = isMasterAccAndEmpty(email)
        val isEmpty = cond._2
        val isMaster = cond._1
        def isArleadyDefined = EmployeeDAO.getByEmployeeUID(email).isDefined
        if (isEmpty && !isArleadyDefined) {
      		val emp_id = EmployeeDAO.pull_object(EmployeeDTO(None, email, email, None, true))
          val biz_id = BusinessDAO.pull_object(BusinessDTO(None, "Your Company", country = "", city = "", 
              												 address = None, walkthrough = true))
          EmployeesBusinessDAO.pull(emp_id, biz_id)
          /**
           * Create default analytics group
           * By default analytics(editor of processes) == managers
           */
           defaultAnalyticsGroup(email, biz_id)
           assignToTrial(email, Some(biz_id))
        }
        
        //request.user.renewPermissions() // Update var's of user
        //var (isEmployee, isManager) = (request.user.isEmployee, request.user.isManager)
        
	}
  /****
   * Master account is account that paid for app
   * If master account add employees, their emails added to employee.master_acc
   * So we check, if it had master_acc == uid equality
   * true for employee are had master account, or entity not existed
   * false employee had different master account, so we dont need create another entity with that.
   */
    private def isMasterAccAndEmpty(email: String):(Boolean, Boolean) = {
      EmployeeDAO.getByEmployeeUID(email) match {
        case Some(employee) => (employee.uid == employee.master_acc, false)
        case _ => (false, true)
      }
    }

    private def defaultAnalyticsGroup(uid: String, biz_id: Int) = {
      val acc_groups = AccountGroupDAO.getByAccount(uid).distinct.map(_.id.get)
      val someNow = Some(org.joda.time.DateTime.now())
      val isAnalyticGroupDefined = GroupsDAO.gets(acc_groups).find(_.title == "Analytics").isDefined // TODO: Translation      
      if (!isAnalyticGroupDefined) {
        val group_id = GroupsDAO.pull_object(GroupDTO(None,
                  title = "Analytics",
                  business = biz_id,
                  created_at = someNow,
                  updated_at = someNow))

        group_id match {
            case -1 => { }
            case id => {
                    AccoutGroupDTO(
                        None,
                        account_id = uid, 
                        group_id = id, 
                        created_at = someNow,
                        updated_at = someNow)
            }
        }

      }
    }


  def defaultPermsForAnalytics(process_id: Int, business: Int) = {
      val analyticGroup = GroupsDAO.getsByBusiness(business).find(_.title == "Analytics") 
      if (analyticGroup.isDefined) {
          ActPermissionDAO.pull_object(ActPermission(None, 
                         uid = None, 
                         group = analyticGroup.get.id, 
                         process = process_id,
                         front_elem_id = None, 
                         space_elem_id = None,
                         reaction = None,
                         role = "all"))
      }
  }

	private def assignToTrial(master_acc: String, bid:Option[Int] = None) = {
      AccountPlanDAO.pull_object(AccountPlanDTO(None, bid, master_acc, 1))
    }
}