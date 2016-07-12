package util
import models._
import models.administration._
import models.DAO._
import models.DAO.resources._
import models.DAO.reflect._
import models.DAO.sessions._
import scala.concurrent.ExecutionContext.Implicits.global


object DLL_Initiator {
  def initiate:Boolean = {


    models.DAO.resources.web.BusinessDAO.ddl_create
    BusinessServiceDAO.ddl_create
    BPDAO.ddl_create
//    BPSessionDAOF.ddl_create
    BPStationDAO.ddl_create
    BPSpaceDAOF.ddl_create
    ProcElemDAO.ddl_create
    SpaceElemDAO.ddl_create
    ElemTopologDAO.ddl_create

//    BPStateDAO.ddl_create
    // Session elements
    SessionProcElementDAO.ddl_create
    SessionSpaceDAO.ddl_create
    SessionSpaceElemDAO.ddl_create
    SessionInitialStateDAO.ddl_create
//    BPSessionStateDAO.ddl_create
    SessionElemTopologDAO.ddl_create
    SessionSwitcherDAO.ddl_create
    SessionReactionDAO.ddl_create
    SessionReactionStateOutDAO.ddl_create


//    BPLoggerDAO.ddl_create
//    BPStationLoggeDAO.ddl_create
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
    AccountsDAO.infos_ddl

    EmployeeDAO.ddl_create
    EmployeesBusinessDAO.ddl_create
    InputLoggerDAO.ddl_create


    PlanDAO.ddl_create

    AdminAccountsDAO.ddl_create
    AccountPlanDAO.ddl_create

    AccountLoggerDAO.ddl_create

    // Default business

    models.DAO.resources.web.BusinessDAO.pull_object( models.DAO.resources.web.BusinessDTO(
        None, "default business", country = "", city = "", address = None, organization = true))



    BillDAO.ddl_create
    ProcHistoryDAO.ddl_create
    //ProcCommitDAO.ddl_create

    ObserverDAO.ddl_create
    ClientObserversDAO.ddl_create

    RedemCodesDAO.ddl_create
    BillingInfosDAO.ddl_create
    BillingInfoCardsDAO.ddl_create

    WalksDAO.ddl_create
    GroupsDAO.ddl_create
    ActPermissionDAO.ddl_create

    AccountGroupDAO.ddl_create
    BusinessWalksDAO.ddl_create

    AnnotationDAO.ddl_create
    UserAnnotationDAO.ddl_create
    AnnotationRangeDAO.ddl_create


//    SessionProcElementDAO.ddl_create
//    SessionSpaceDAO.ddl_create
//    SessionSpaceElemDAO.ddl_create

    ResourceDAO.ddl_create
    ElementResourceDAO.ddl_create
    SessionElementResourceDAO.ddl_create


    models.DAO.ActionActsDAOF.await(models.DAO.ActionActsDAOF.ddl_create)
    models.DAO.ActionActResultsDAOF.ddl_create
    models.DAO.ActionStatusesDAOF.ddl_create
    ReflectElementMappingsDAO.ddl_create

    true
  }
  def drop:Boolean = {
    models.DAO.resources.web.BusinessDAO.ddl_drop
    BusinessServiceDAO.ddl_drop
    BPDAO.ddl_drop
//    BPSessionDAOF.ddl_drop
    BPStationDAO.ddl_drop
    BPSpaceDAOF.ddl_drop
    ProcElemDAO.ddl_drop
    SpaceElemDAO.ddl_drop
    ElemTopologDAO.ddl_drop
//    BPStateDAO.ddl_drop


    SessionReactionStateOutDAO.ddl_drop
    SessionReactionDAO.ddl_drop
    SessionSwitcherDAO.ddl_drop
    SessionElemTopologDAO.ddl_drop

    SessionProcElementDAO.ddl_drop
    SessionSpaceDAO.ddl_drop
    SessionSpaceElemDAO.ddl_drop
//    BPLoggerDAO.ddl_drop

    SessionInitialStateDAO.ddl_drop
//    BPSessionStateDAO.ddl_drop
//    BPStationLoggeDAO.ddl_drop
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

    EmployeeDAO.ddl_drop
    EmployeesBusinessDAO.ddl_drop
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
    BillingInfoCardsDAO.ddl_create


    WalksDAO.ddl_drop
    GroupsDAO.ddl_drop
    AccountGroupDAO.ddl_drop
    BusinessWalksDAO.ddl_drop
    ActPermissionDAO.ddl_drop

    AnnotationDAO.ddl_drop
    UserAnnotationDAO.ddl_drop
    AnnotationRangeDAO.ddl_drop

    SessionProcElementDAO.ddl_drop
    SessionSpaceDAO.ddl_drop
    SessionSpaceElemDAO.ddl_drop

    ElementResourceDAO.ddl_drop
    SessionElementResourceDAO.ddl_drop
    ResourceDAO.ddl_drop

    true
  }
}
