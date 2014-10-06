package util
import models._
import models.DAO._
import models.DAO.resources._

object DLL_Initiator {
  def initiate {


    BusinessDAO.ddl_create
    BusinessServiceDAO.ddl_create
    BPDAO.ddl_create
    CVDAO.createShit
    BPStationDAO.ddl_create
    BPSpaceDAO.ddl_create
    ProcElemDAO.ddl_create
    SpaceElemDAO.ddl_create
    BPLoggerDAO.ddl_create
    BPStationLoggeDAO.ddl_create
    // Resources
    TokensDAO.ddl_create
    AccountsDAO.ddl_create

    EmployeeDAO.ddl_create
    EmployeesBusinessDAO.ddl_create
    ActPermissionDAO.ddl_create
    InputLoggerDAO.ddl_create


    PlanDAO.ddl_create
    // Default plan
    PlanDAO.pull_object(PlanDTO(None, "Basic"))
    AccountPlanDAO.ddl_create

    AccountLoggerDAO.ddl_create
    // Default business

    BusinessDAO.pull_object( models.DAO.resources.BusinessDTO(None, "default business"))
  }
}
