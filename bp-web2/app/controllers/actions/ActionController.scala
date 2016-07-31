package controllers
import utils.auth.DefaultEnv

import models.DAO.resources.{BusinessDAO, BusinessDTO}
import models.DAO._

import play.api._
import play.api.mvc._
import play.twirl.api.Html

//{Action, Controller}
import play.api.http.MimeTypes
import play.api.libs.json._
import play.api.cache._
import play.api.data._
import play.api.data.Forms._
import play.api.data.format.Formats
import play.api.data.format.Formatter
import play.api.data.FormError
import play.api.Logger

import views._
import models.User

import com.mohiva.play.silhouette.api.{ Environment, LogoutEvent, Silhouette }
import com.mohiva.play.silhouette.impl.authenticators.CookieAuthenticator
import com.mohiva.play.silhouette.impl.providers.SocialProviderRegistry
import forms._
import models.User2
import play.api.i18n.{ I18nSupport, MessagesApi }
import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits.global
import models.DAO.BProcessDTO
import models.DAO.BPDAO
import models.DAO._
import models.DAO.resources._
import models.DAO.CompositeValues
import play.api.Play.current

import main.scala.bprocesses._
import main.scala.simple_parts.process._
import models.DAO.reflect._
import models.DAO.conversion._
import ProcHistoryDAO._
import helpers._
import decorators._
import builders._
import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits.global

import javax.inject.Inject

import com.mohiva.play.silhouette.api.{ Environment, LogoutEvent, Silhouette }
import com.mohiva.play.silhouette.impl.authenticators.CookieAuthenticator
import com.mohiva.play.silhouette.impl.providers.SocialProviderRegistry
import forms._
import models.User2
import play.api.i18n.{ I18nSupport, MessagesApi }
import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits.global
import com.mohiva.play.silhouette.impl.authenticators.JWTAuthenticator
import us.ority.min.actions._


import models.DAO.reflect._
import main.scala.bprocesses.refs._
import main.scala.bprocesses.refs.{BPStateRef}
import models.DAO.conversion._

import play.api.mvc.{ Action, RequestHeader }

case class ActionActContainer(
  act: ActionAct,
  statuses: Seq[ActionStatus],
  results: Seq[ActionResult]
)


case class TestActionPayload(
  middleware: Middleware,
  strategy: Option[Strategy],
  strategy_bases: Seq[StrategyBaseUnit],
  strategy_inputs: Seq[StrategyInputUnit],
  strategy_outputs: Seq[StrategyOutputUnit]
)

class ActionController @Inject() (
  val messagesApi: MessagesApi,
  silhouette: Silhouette[DefaultEnv],
  socialProviderRegistry: SocialProviderRegistry)
  extends Controller with I18nSupport {

  implicit val SessionElementsReads = Json.reads[SessionElements]
  implicit val SessionElementsWrites = Json.format[SessionElements]
  implicit val BPSessionStateReads = Json.reads[BPSessionState]
  implicit val BPSessionStateWrites = Json.format[BPSessionState]
  implicit val LaunchStateObjectsReads = Json.reads[LaunchStateObjects]
  implicit val LaunchStateObjectsWrites = Json.format[LaunchStateObjects]
  implicit val InputLoggerReads = Json.reads[InputLogger]
  implicit val InputLoggerWrites = Json.format[InputLogger]
  implicit val SessionStateLogReads  = Json.reads[SessionStateLog]
  implicit val SessionStateLogWrites  = Json.format[SessionStateLog]
  implicit val CompositeVReads = Json.reads[CompositeValues]
  implicit val CompositeVWrites = Json.format[CompositeValues]
  implicit val logReads = Json.reads[BPLoggerDTO]
  implicit val logWrites = Json.format[BPLoggerDTO]
  implicit val ProcessHistoryDTOreads = Json.reads[ProcessHistoryDTO]
  implicit val ProcessHistoryDTOformat = Json.format[ProcessHistoryDTO]
  implicit val stationReads = Json.reads[BPStationDTO]
  implicit val stationWrites = Json.format[BPStationDTO]
  implicit val StationNoteReads = Json.reads[StationNoteMsg]
  implicit val StationNoteWrites = Json.format[StationNoteMsg]
  implicit val LogsContainerreads = Json.reads[LogsContainer]
  implicit val LogsContainerformat = Json.format[LogsContainer]
  implicit val AroundAttrReads = Json.reads[AroundAttr]
  implicit val AroundAttrWrites = Json.format[AroundAttr]
  implicit val ElemAroundReads = Json.reads[ElemAround]
  implicit val ElemAroundWrites = Json.format[ElemAround]
  implicit val ListAroundReads = Json.reads[ListAround]
  implicit val ListAroundWrites = Json.format[ListAround]
  implicit val sessionReads = Json.reads[BPSession]
  implicit val sessionWrites = Json.format[BPSession]
  implicit val BProcessDTOReads = Json.reads[BProcessDTO]
  implicit val BProcessDTOWrites = Json.format[BProcessDTO]
  implicit val SessionPeoplesReads = Json.reads[SessionPeoples]
  implicit val SessionPeoplesFormat = Json.format[SessionPeoples]
  implicit val SessionStatusReads = Json.reads[SessionStatus]
  implicit val SessionStatusWrites = Json.format[SessionStatus]
  implicit val SessionContainerReads = Json.reads[SessionContainer]
  implicit val SessionContainerWrites = Json.format[SessionContainer]
  implicit val ActionActReads = Json.reads[ActionAct]
  implicit val ActionActWrites = Json.format[ActionAct]
  implicit val ActionStatusReads = Json.reads[ActionStatus]
  implicit val ActionStatusWrites = Json.format[ActionStatus]
  implicit val ActionResultReads = Json.reads[ActionResult]
  implicit val ActionResultWrites = Json.format[ActionResult]
  implicit val ActionActContainerReads = Json.reads[ActionActContainer]
  implicit val ActionActContainerWrites = Json.format[ActionActContainer]
  implicit val RefReads = Json.reads[Ref]
  implicit val RefWrites = Json.format[Ref]
  implicit val UnitElementRefReads = Json.reads[UnitElementRef]
  implicit val UnitElementRefWrites = Json.format[UnitElementRef]
  implicit val UnitSpaceRefReads = Json.reads[UnitSpaceRef]
  implicit val UnitSpaceRefWrites = Json.format[UnitSpaceRef]
  implicit val UnitSpaceElementRefReads = Json.reads[UnitSpaceElementRef]
  implicit val UnitSpaceElementRefWrites = Json.format[UnitSpaceElementRef]
  implicit val BPStateRefReads = Json.reads[BPStateRef]
  implicit val BPStateRefWrites = Json.format[BPStateRef]
  implicit val UnitSwitcherRefReads = Json.reads[UnitSwitcherRef]
  implicit val UnitSwitcherRefWrites = Json.format[UnitSwitcherRef]
  implicit val RefElemTopologyReads = Json.reads[RefElemTopology]
  implicit val RefElemTopologyWrites = Json.format[RefElemTopology]
  implicit val UnitReactionRefReads = Json.reads[UnitReactionRef]
  implicit val UnitReactionRefWrites = Json.format[UnitReactionRef]
  implicit val UnitReactionStateOutRefReads = Json.reads[UnitReactionStateOutRef]
  implicit val UnitReactionStateOutRefWrites = Json.format[UnitReactionStateOutRef]
  implicit val MiddlewareRefReads = Json.reads[MiddlewareRef]
  implicit val StrategyRefReads = Json.reads[StrategyRef]
  implicit val StrategyInputRefReads = Json.reads[StrategyInputRef]
  implicit val StrategyBaseRefReads = Json.reads[StrategyBaseRef]
  implicit val StrategyOutputRefReads = Json.reads[StrategyOutputRef]
  implicit val MiddlewareRefWrites = Json.format[MiddlewareRef]
  implicit val StrategyRefWrites = Json.format[StrategyRef]
  implicit val StrategyInputRefWrites = Json.format[StrategyInputRef]
  implicit val StrategyBaseRefWrites = Json.format[StrategyBaseRef]
  implicit val StrategyOutputRefWrites = Json.format[StrategyOutputRef]
  implicit val ReactionContainerReads = Json.reads[ReactionContainer]
  implicit val ReactionContainerWrites = Json.format[ReactionContainer]
  implicit val RefContainerReads = Json.reads[RefContainer]
  implicit val RefContainerWrites = Json.format[RefContainer]
  implicit val UnitReactionReads = Json.reads[UnitReaction]
  implicit val UnitReactionWrites = Json.format[UnitReaction]
  implicit val UnitReactionStateOutReads = Json.reads[UnitReactionStateOut]
  implicit val UnitReactionStateOutWrites = Json.format[UnitReactionStateOut]
  implicit val rMiddlewareReads = Json.reads[Middleware]
  implicit val rStrategyReads = Json.reads[Strategy]
  implicit val rStrategyBaseUnitReads = Json.reads[StrategyBaseUnit]
  implicit val rStrategyInputUnitReads = Json.reads[StrategyInputUnit]
  implicit val rStrategyOutputUnitReads = Json.reads[StrategyOutputUnit]
  implicit val wMiddlewareWrites = Json.format[Middleware]
  implicit val wStrategyWrites = Json.format[Strategy]
  implicit val wStrategyBaseUnitWrites = Json.format[StrategyBaseUnit]
  implicit val wStrategyInputUnitWrites = Json.format[StrategyInputUnit]
  implicit val wStrategyOutputUnitWrites = Json.format[StrategyOutputUnit]
  implicit val ReactionCollectionReads = Json.reads[ReactionCollection]
  implicit val ReactionCollectionWrites = Json.format[ReactionCollection]

  implicit val TestActionPayloadReads = Json.reads[TestActionPayload]
  implicit val TestActionPayloadWrites = Json.format[TestActionPayload]

// GET         /acts
def acts() = silhouette.SecuredAction.async { implicit request =>
  	val email = request.identity.emailFilled
    val launchesCn = BPSessionDAOF.await(
    	BPSessionDAOF.findByBusiness(request.identity.businessFirst)    )
    val launches:Seq[BPSession] = launchesCn.map { l => l.sessions.map(l => l.session) }.flatten
  	val reactions = SessionReactionDAOF.await(
  		SessionReactionDAOF.findBySessions(launches.map(l => l.id.get))  	)
  	val acts = ActionActsDAOF.await(
  		ActionActsDAOF.findByReactions(reactions.toList.map(r => r.id.get))  	)
  	val act_results = ActionActResultsDAOF.await(
  		ActionActResultsDAOF.getsByAct(acts.map(a => a.id.get))  	)
  	val act_statuses = ActionStatusesDAOF.await(
  		ActionStatusesDAOF.getsByAct(acts.map(a => a.id.get))  	)
  	val actContainer = acts.map { act =>
  		ActionActContainer(act, 
						   act_statuses.filter(l => l.act == act.id.get),
						   act_results.filter(l => l.act == act.id.get))
  	}
  	println(Json.toJson( actContainer).toString)
  	
	Future.successful(Ok(Json.toJson( actContainer) ))
}


def launchActs(launchId: Int) = silhouette.SecuredAction.async { implicit request =>
    val email = request.identity.emailFilled
    val launchesCn = BPSessionDAOF.await(
      BPSessionDAOF.findByBusiness(request.identity.businessFirst)    )
    val launchesUn:Seq[BPSession] = launchesCn.map { l => l.sessions.map(l => l.session) }.flatten
    val launches:Seq[BPSession] =  launchesUn.filter( launch =>
        launch.id.get == launchId
    )

    val reactions = SessionReactionDAOF.await(
      SessionReactionDAOF.findBySessions(launches.map(l => l.id.get))   )
    val acts = ActionActsDAOF.await(
      ActionActsDAOF.findByReactions(reactions.toList.map(r => r.id.get))   )
    val act_results = ActionActResultsDAOF.await(
      ActionActResultsDAOF.getsByAct(acts.map(a => a.id.get))   )
    val act_statuses = ActionStatusesDAOF.await(
      ActionStatusesDAOF.getsByAct(acts.map(a => a.id.get))   )
    val actContainer = acts.map { act =>
      ActionActContainer(act, 
               act_statuses.filter(l => l.act == act.id.get),
               act_results.filter(l => l.act == act.id.get))
    }
    println(Json.toJson( actContainer).toString)
    
  Future.successful(Ok(Json.toJson( actContainer) ))
}


// GET /actions/refs
// Action that exist only in refs and not created in processes 
def actionsRefs() = silhouette.SecuredAction.async { implicit request =>
	val refs = RefDAO.getAllVisible
  val refs_collected = refs.map { ref =>
      val reactions = ReactionRefDAO.findByRef(ref.id.get)
      val reaction_outs = ReactionStateOutRefDAO.findByReactionRefs(reactions.map(_.id.get))
      val middlewares = MiddlewareRefsDAOF.await( MiddlewareRefsDAOF.getByRef(ref.id.get) )
      val middlewaresIds = middlewares.map(_.id.get).toList
      val strategies = MiddlewareRefsDAOF.await( StrategyRefsDAOF.getByMWS(middlewaresIds) )
      val strategiesIds = strategies.map(_.id.get).toList
      val bases = StrategyBaseRefsDAOF.await( StrategyBaseRefsDAOF.getByStrategies(strategiesIds) )
      val inputs = StrategyInputRefsDAOF.await( StrategyInputRefsDAOF.getByStrategies(strategiesIds) )
      val ouputs = StrategyInputRefsDAOF.await( StrategyOutputRefsDAOF.getByStrategies(strategiesIds) )


      RefContainer(ref,
        ProcElemReflectionDAO.findByRef(ref.id.get),
        SpaceReflectionDAO.findByRef(ref.id.get),
        SpaceElementReflectionDAO.findByRef(ref.id.get),
        ReflectElemTopologDAO.findByRef(ref.id.get),
        BPStateRefDAO.findByRef(ref.id.get),
        SwitcherRefDAO.findByRef(ref.id.get),
        reactions,
        reaction_outs,
        reactions.map( re => ReactionContainer(re, reaction_outs.filter(out => out.reaction == re.id.get ))),

        middlewares = middlewares,
        strategies = strategies,
        inputs = inputs,
        bases = bases,
        outputs = ouputs
)

  }

  Future.successful(Ok(Json.toJson(refs_collected)) )

}

// GET /actions/processes
// Actions that already created in processes
def actionsProcesses() = silhouette.SecuredAction.async { implicit request =>
    val business = request.identity.businessFirst
    val user_services = BusinessServiceDAO.getAllByBusiness(business).map(_.id.getOrElse(-1))
    val bprocess = BPDAO.getByServices(user_services).map(p => p.id.get).toSeq 


	val rF = ReactionDAOF.findByProcesses(bprocess)

	rF.map { r =>
		Ok(Json.toJson(r.map { react =>

       val act_ids = List(react.id.get) // react.map(c => c.id.get)
       val middlewares = MiddlewaresDAOF.await(MiddlewaresDAOF.findByReactions(act_ids) )
       val mids_ids = middlewares.map(c => c.id.get).toList
       val strategies = StrategiesDAOF.await(StrategiesDAOF.findByMiddlewares(mids_ids))
       val strat_ids = strategies.map(c => c.id.get).toList
       val strategy_bases = StrategyBasesDAOF.await( StrategyBasesDAOF.getByStrategies(strat_ids) )
       val strategy_inputs = StrategyInputsDAOF.await( StrategyInputsDAOF.getByStrategies(strat_ids) )
       val strategy_outputs = StrategyOutputsDAOF.await( StrategyOutputsDAOF.getByStrategies(strat_ids) )


      ReactionCollection(react,
        ReactionStateOutDAO.findByReaction(react.id.get),
        middlewares = middlewares,
        strategies = strategies,
        strategy_bases = strategy_bases,
        strategy_inputs = strategy_inputs,
        strategy_outputs = strategy_outputs)
       }
       ))

	}

//	Future.successful(Ok(Json.toJson(Map("status" -> "good")) ))
}


// POST /action/ref/:reaction/test
def testActionRef(reactionId: Int) = silhouette.SecuredAction.async(BodyParsers.parse.json) { implicit request =>

  val actionOpt = ReactionRefDAOF.await(ReactionRefDAOF.findById(reactionId))
  actionOpt match {
    case Some(actionRef) => {
      val action = actionRef.reflectWithId(-1, -1, None)
      val act_ids = List(action.id.get) 
      applyTestActionPayload(act_ids.head, request) match {
        case Some(payload) => {
          val middlewares = Seq(payload.middleware)
          val strategies = Seq(payload.strategy.get)
          val strategyBases = payload.strategy_bases
          val strategyInputs = payload.strategy_inputs
          val strategyOutputs = payload.strategy_outputs
          val result = us.ority.min.actions.tester.ActionTester(
            action,
            middlewares,
            strategies,
            strategyInputs,
            strategyBases,
            strategyOutputs
          )
          result match {
            case Some(r) => Future.successful(Ok(Json.toJson( ActionActContainer(r, 
                                                                                 r.statuses.toSeq, 
                                                                                 r.results.toSeq) )))
            case _ => Future.successful(Ok(Json.toJson(Map("status" -> "action execution is failed"))))
          }
        }
        case _ => {
          Future.successful(Ok(Json.toJson(Map("status" -> "test action payload was not sended"))))
        }
      }
    }
    case _ => Future.successful(Ok(Json.toJson(Map("status" -> "action not found"))))
  }
}


// POST /action/process/:reaction/test
def testActionProcess(reactionId: Int) = silhouette.SecuredAction.async(BodyParsers.parse.json) { implicit request =>

  val actionOpt = ReactionDAOF.await(ReactionDAOF.findById(reactionId))
  actionOpt match {
    case Some(action) => {
      val act_ids = List(action.id.get) 
      applyTestActionPayload(act_ids.head, request) match {
        case Some(payload) => {

          val middlewares = Seq(payload.middleware)
          val strategies = Seq(payload.strategy.get)
          val strategyBases = payload.strategy_bases
          val strategyInputs = payload.strategy_inputs
          val strategyOutputs = payload.strategy_outputs
          println("middlewares length: "+middlewares.length)
          println("strategies length: "+strategies.length)
          println("strategyInputs length: "+strategyInputs.length)
          println("strategyBases length: "+strategyBases.length)
          println("strategyOutputs length: "+strategyOutputs.length)
          val result = us.ority.min.actions.tester.ActionTester(
            action,
            middlewares,
            strategies,
            strategyInputs,
            strategyBases,
            strategyOutputs
          )
          result match {
            case Some(r) => Future.successful(Ok(Json.toJson( ActionActContainer(r, 
                                                                                 r.statuses.toSeq, 
                                                                                 r.results.toSeq) )))
            case _ => Future.successful(Ok(Json.toJson(Map("status" -> "action execution is failed"))))
          }
        }

        case _ => {
          val middlewares = MiddlewaresDAOF.await(MiddlewaresDAOF.findByReactions(act_ids) )
          val mids_ids = middlewares.map(c => c.id.get).toList
          val strategies = StrategiesDAOF.await(StrategiesDAOF.findByMiddlewares(mids_ids))
          val strat_ids = strategies.map(c => c.id.get).toList
          val strategyBases = StrategyBasesDAOF.await( StrategyBasesDAOF.getByStrategies(strat_ids) )
          val strategyInputs = StrategyInputsDAOF.await( StrategyInputsDAOF.getByStrategies(strat_ids) )
          val strategyOutputs = StrategyOutputsDAOF.await( StrategyOutputsDAOF.getByStrategies(strat_ids) )
          println("middlewares length: "+middlewares.length)
          println("strategies length: "+strategies.length)
          println("strategyInputs length: "+strategyInputs.length)
          println("strategyBases length: "+strategyBases.length)
          println("strategyOutputs length: "+strategyOutputs.length)
          val result = us.ority.min.actions.tester.ActionTester(
            action,
            middlewares,
            strategies,
            strategyInputs,
            strategyBases,
            strategyOutputs
          )
          result match {
            case Some(r) => Future.successful(Ok(Json.toJson( ActionActContainer(r, 
                                                                                 r.statuses.toSeq, 
                                                                                 r.results.toSeq) )))
            case _ => Future.successful(Ok(Json.toJson(Map("status" -> "action execution is failed"))))
          }
          
        }
      }
    }
    case _ => Future.successful(Ok(Json.toJson(Map("status" -> "action not found"))))
  }
}


/** 
  * Construct payload for action test
  * @param actionId
  * @param request with payload 
  * @return payload for action that ready to pass into tester
  */
def applyTestActionPayload(actionId: Int, 
                           request: com.mohiva.play.silhouette.api.actions.SecuredRequest[DefaultEnv, play.api.libs.json.JsValue]):Option[TestActionPayload] = {
  request.body.validate[TestActionPayload].map{
      case payload => { 
        val correctPayload = payload.copy(middleware = payload.middleware.copy(reaction = actionId))
        Some(correctPayload)
      }
    }.recoverTotal{
      e => None
    }
}

}

