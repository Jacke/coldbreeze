package builder_pipes
import service._
import models.DAO._
import main.scala.utils._
import main.scala.bprocesses._
import main.scala.resources.scopes._
import com.github.nscala_time.time.Imports._
import main.scala.bprocesses._
import main.scala.simple_parts.process.{ CompositeValues, Brick, ProcElems, ContainerBrick }
import main.scala.simple_parts.process.control._
import main.scala.simple_parts.process.data._
import main.scala.utils._
import main.scala.resources.scopes._
import builders._
import main.scala.bprocesses.links._
import main.scala.utils.Space
import main.scala.utils.{ InputParamProc, ReactionActivator }
import models.DAO.conversion.Implicits.fetch_cv
import main.scala.bprocesses._
import main.scala.simple_parts.process._
import models.DAO.sessions._

object ElementResourceBuilderPipe {
  def apply(costs: List[ElementResourceDTO]): LaunchMapPipe => ExecutedLaunchCVPipes = {
    (pipe: LaunchMapPipe) =>
      {
        val launch_costs = costs.map { cost =>
          SessionElementResourceDAOF.pull(SessionElementResourceDTO(
            None,
            pipe.aditElementPipe.TopologsMap.get(cost.element_id).getOrElse(0), //cost.element_id, // resolve session topologs
            cost.process_id,
            session_id = pipe.launchId,
            cost.resource_id,
            cost.entities,
            Some(org.joda.time.DateTime.now),
            Some(org.joda.time.DateTime.now)))
        }
      }
      ExecutedLaunchCVPipes("ElementResource")
  }
}
