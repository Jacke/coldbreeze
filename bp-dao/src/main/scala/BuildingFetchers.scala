package service
//import com.typesafe.scalalogging.slf4j.Logger
import models.DAO._
import main.scala.utils._
import main.scala.bprocesses._
import main.scala.resources.scopes._
import com.github.nscala_time.time.Imports._
import main.scala.bprocesses._
import main.scala.simple_parts.process.{CompositeValues, Brick, ProcElems, ContainerBrick}
import main.scala.simple_parts.process.control._
import main.scala.simple_parts.process.data._
import main.scala.utils._
import main.scala.resources.scopes._
import builders._
import main.scala.bprocesses.links._
import main.scala.utils.Space
import main.scala.utils.{InputParamProc, ReactionActivator}
import models.DAO.conversion.Implicits.fetch_cv
import main.scala.bprocesses._
import main.scala.simple_parts.process._
import models.DAO.sessions._
import scala.concurrent.ExecutionContext.Implicits.global
import scala.concurrent.duration.Duration
import scala.concurrent.{ExecutionContext, Awaitable, Await, Future}
import scala.util.Try
import com.typesafe.scalalogging.Logger
import org.slf4j.LoggerFactory
import us.ority.min.actions._
import us.ority.min.jobs._

case class RootElements(procElements:List[UndefElement],
                        test_space:List[BPSpaceDTO],
                        space_elems:List[SpaceElementDTO])
case class GeneratedLaunchComponents(
    runFrom:Boolean = false,
    session_id:Int = 0,
    sessionEls:List[SessionUndefElement] = List(),
    sessionSpaces:List[SessionSpaceDTO] = List(),
    sessionSpaceEls:List[SessionSpaceElementDTO] = List(),
    elemMap:scala.collection.mutable.Map[Int, Int] = scala.collection.mutable.Map().empty,
    spaceMap:scala.collection.mutable.Map[Int, Int] = scala.collection.mutable.Map().empty,
    spaceElsMap:scala.collection.mutable.Map[Int, Int] = scala.collection.mutable.Map().empty,
    burnElemMap:scala.collection.mutable.Map[Int, Int] = scala.collection.mutable.Map().empty,
    burnSpaceMap:scala.collection.mutable.Map[Int, Int] = scala.collection.mutable.Map().empty,
    burnSpaceElMap:scala.collection.mutable.Map[Int, Int] = scala.collection.mutable.Map().empty
)




object BuildingFetchers {
  def fetchRootElements(bpID: Int):Future[RootElements] = {
    val procElementsF: Future[Seq[UndefElement]] = ProcElemDAOF.findByBPId(bpID)
    val test_spaceF:Future[Seq[BPSpaceDTO]] = BPSpaceDAOF.findByBPId(bpID)
    val space_elemsF:Future[Seq[SpaceElementDTO]] = SpaceElemDAOF.findByBPId(bpID)
    procElementsF.flatMap { procElementsObj =>
      test_spaceF.flatMap { test_spaceObj =>
        space_elemsF.map { space_elemsObj =>
        val procElements = procElementsObj.toList
        val test_space = test_spaceObj.toList
        val space_elems = space_elemsObj.toList
          RootElements(procElements, test_space, space_elems)
        }
      }
    }
  }
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  def generateExistedLaunch():GeneratedLaunchComponents = {
    val runFrom = true
    val session_id = session_val
    //val sessionElsF:Future[Seq[SessionUndefElement]]         = SessionProcElementDAOF.findBySession(session_id)
    //val sessionSpacesF:Future[Seq[SessionSpaceDTO]]          = SessionSpaceDAOF.findBySession(session_id)
    //val sessionSpaceElsF:Future[Seq[SessionSpaceElementDTO]] = SessionSpaceElemDAOF.findBySession(session_id)
    //sessionElsF     .map { sessionElsObj =>
    //sessionSpacesF  .map { sessionSpacesObj =>
    //sessionSpaceElsF.map { sessionSpaceElsObj =>
    val sessionEls      = SessionProcElementDAO.findBySession(session_id)//sessionElsObj.toList
    val sessionSpaces   = SessionSpaceDAO.findBySession(session_id)//sessionSpacesObj.toList
    val sessionSpaceEls = SessionSpaceElemDAO.findBySession(session_id)//sessionSpaceElsObj.toList
    //}
    //}
    //}
    getStationToProcess(processRunned, session_id)
    GeneratedLaunchComponents(runFrom = runFrom, session_id = session_id, sessionEls = sessionEls,
      sessionSpaces = sessionSpaces,
      sessionSpaceEls = sessionSpaceEls) 
  }

  def generateClearLaunch():GeneratedLaunchComponents = {
    val session_id = models.DAO.sessions.SessionProcElementDAOF.await(
      saveSession(processRunned, bpDTO, lang) )
    // FRONT ELEM NOT FOR BRICKS
    val sessionEls = procElements.map { el =>
        val obj = ExperimentalSessionBuilder.fromOriginEl(el, session_id, burnElemMap)
        elemMap += el.id.get -> obj.id.get
        obj
    }.toList
    val sessionSpaces = test_space.map { sp =>//.filter(sp => sp.brick_nested.isDefined).map ( sp =>
      val obj = ExperimentalSessionBuilder.fromOriginSp(sp, session_id, elemMap, spaceElsMap)
      spaceMap += sp.id.get -> obj.id.get
      obj
    }
    ExperimentalAfterBurning.makeBurn(spaceMap, burnElemMap)
    val sessionSpaceEls = space_elems.map { spel =>//.filter(n => n.space_own.isDefined).map ( spel =>
      val obj = ExperimentalSessionBuilder.fromOriginSpElem(spel, session_id, spaceMap)
      spaceElsMap += spel.id.get -> obj.id.get
      obj
    }
    GeneratedLaunchComponents(session_id = session_id, sessionEls = sessionEls,
      sessionSpaces = sessionSpaces,
      sessionSpaceEls = sessionSpaceEls) 
  }

}