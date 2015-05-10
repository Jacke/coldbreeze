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
		val emp_id = EmployeeDAO.pull_object(EmployeeDTO(None, email, email, None, true))
        val biz_id = BusinessDAO.pull_object(BusinessDTO(None, "Your Company", country = "", city = "", 
        												 address = None, walkthrough = true))
        
        EmployeesBusinessDAO.pull(emp_id, biz_id)

        assignToTrial(email)
        
        //request.user.renewPermissions() // Update var's of user
        //var (isEmployee, isManager) = (request.user.isEmployee, request.user.isManager)
        
	}


	private def assignToTrial(master_acc: String) = {
      AccountPlanDAO.pull_object(AccountPlanDTO(None, None, master_acc, 1))
    }
}