package util
import models._
import models.administration._
import models.DAO._
import models.DAO.resources._
import models.DAO.reflect._

object DLL_Initiator {
  def initiate:Boolean = {


    models.DAO.resources.web.BusinessDAO.ddl_create
    BusinessServiceDAO.ddl_create
    BPDAO.ddl_create
    CVDAO.createShit
    BPSessionDAO.ddl_create
    BPStationDAO.ddl_create
    BPSpaceDAO.ddl_create
    ProcElemDAO.ddl_create
    SpaceElemDAO.ddl_create
    ElemTopologDAO.ddl_create

    BPLoggerDAO.ddl_create
    BPStateDAO.ddl_create
    BPSessionStateDAO.ddl_create
    BPStationLoggeDAO.ddl_create
    SwitcherDAO.ddl_create
      
    // 23.03.15  
    RefDAO.ddl_create
ProcElemReflectionDAO.ddl_create
SpaceReflectionDAO.ddl_create
SpaceElementReflectionDAO.ddl_create      
BPStateRefDAO.ddl_create
SwitcherRefDAO.ddl_create
ReflectElemTopologDAO.ddl_create
ReactionRefDAO.ddl_create
ReactionStateOutRefDAO.ddl_create
ReactionDAO.ddl_create
ReactionStateOutDAO.ddl_create

SessionStateLogDAO.ddl_create

    // Resources
    TokensDAO.ddl_create
    AccountsDAO.ddl_create

    EmployeeDAO.ddl_create
    EmployeesBusinessDAO.ddl_create
    ActPermissionDAO.ddl_create
    InputLoggerDAO.ddl_create


    PlanDAO.ddl_create

    AdminAccountsDAO.ddl_create
    AccountPlanDAO.ddl_create

    AccountLoggerDAO.ddl_create

    // Default business

    models.DAO.resources.web.BusinessDAO.pull_object( models.DAO.resources.web.BusinessDTO(None, "default business", country = "", city = "", address = None))



    BillDAO.ddl_create
    ProcHistoryDAO.ddl_create
    //ProcCommitDAO.ddl_create

    ObserverDAO.ddl_create
    ClientObserversDAO.ddl_create

    RedemCodesDAO.ddl_create
    BillingInfosDAO.ddl_create
      
    WalksDAO.ddl_create
    GroupsDAO.ddl_create
    AccountGroupDAO.ddl_create
    BusinessWalksDAO.ddl_create

    AnnotationDAO.ddl_create
    UserAnnotationDAO.ddl_create
    AnnotationRangeDAO.ddl_create



    true
  }
  def drop:Boolean = {
    models.DAO.resources.web.BusinessDAO.ddl_drop
    BusinessServiceDAO.ddl_drop
    BPDAO.ddl_drop
    CVDAO.dropShit
    BPSessionDAO.ddl_drop
    BPStationDAO.ddl_drop
    BPSpaceDAO.ddl_drop
    ProcElemDAO.ddl_drop
    SpaceElemDAO.ddl_drop
    ElemTopologDAO.ddl_drop
    BPLoggerDAO.ddl_drop
    BPStateDAO.ddl_drop
    BPSessionStateDAO.ddl_drop
    BPStationLoggeDAO.ddl_drop
    SwitcherDAO.ddl_drop
    
    // 23.03.15  
    ProcElemReflectionDAO.ddl_drop  
    SpaceReflectionDAO.ddl_drop
SpaceElementReflectionDAO.ddl_drop  
BPStateRefDAO.ddl_drop
SwitcherRefDAO.ddl_drop      
ReflectElemTopologDAO.ddl_drop
    RefDAO.ddl_drop        
ReactionRefDAO.ddl_drop
ReactionStateOutRefDAO.ddl_drop
ReactionDAO.ddl_drop
ReactionStateOutDAO.ddl_drop

SessionStateLogDAO.ddl_drop

    // Resources
    TokensDAO.ddl_drop
    AccountsDAO.ddl_drop
    EmployeeDAO.ddl_drop
    EmployeesBusinessDAO.ddl_drop
    ActPermissionDAO.ddl_drop
    InputLoggerDAO.ddl_drop
    PlanDAO.ddl_drop
    AdminAccountsDAO.ddl_drop
    AccountPlanDAO.ddl_drop
    AccountLoggerDAO.ddl_drop
    BillDAO.ddl_drop
    //ProcCommitDAO.ddl_drop
    ProcHistoryDAO.ddl_drop
    ObserverDAO.ddl_drop
    ClientObserversDAO.ddl_drop
    RedemCodesDAO.ddl_drop
    BillingInfosDAO.ddl_drop
      
    WalksDAO.ddl_drop
    GroupsDAO.ddl_drop
    AccountGroupDAO.ddl_drop
    BusinessWalksDAO.ddl_drop

    AnnotationDAO.ddl_drop
    UserAnnotationDAO.ddl_drop
    AnnotationRangeDAO.ddl_drop

    true
  }
}
