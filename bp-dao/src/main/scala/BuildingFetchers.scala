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

}