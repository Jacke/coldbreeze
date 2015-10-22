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
import main.scala.simple_parts.process.Units._
import models.DAO.sessions._

case class ElementPipe(
    var elemMap:scala.collection.mutable.Map[Int, Int]    = scala.collection.mutable.Map().empty,
    var spaceMap:scala.collection.mutable.Map[Int, Int]   = scala.collection.mutable.Map().empty,
    var spaceElsMap:scala.collection.mutable.Map[Int,Int] = scala.collection.mutable.Map().empty
)
case class BurnElementPipe(
    var burnElemMap:scala.collection.mutable.Map[Int,Int]    = scala.collection.mutable.Map().empty,
    var burnSpaceMap:scala.collection.mutable.Map[Int,Int]   = scala.collection.mutable.Map().empty,
    var burnSpaceElMap:scala.collection.mutable.Map[Int,Int] = scala.collection.mutable.Map().empty
)
case class AditElementPipe(
    var initialStateMap:scala.collection.mutable.Map[Int, Int]    = scala.collection.mutable.Map().empty,
    var TopologsMap:scala.collection.mutable.Map[Int, Int]    = scala.collection.mutable.Map().empty,
    var SwitchersMap:scala.collection.mutable.Map[Int, Int]   = scala.collection.mutable.Map().empty,
    var ReactionsMap:scala.collection.mutable.Map[Int,Int]    = scala.collection.mutable.Map().empty,
    var ReactOutsMap:scala.collection.mutable.Map[Int,Int]    = scala.collection.mutable.Map().empty
)
/****
 * Original -> Launch id maping
 **/
case class LaunchMapPipe(
	launchId: Int = 0,
    elementPipe: ElementPipe = ElementPipe(),
    burnElementPipe: BurnElementPipe = BurnElementPipe(), 
    aditElementPipe: AditElementPipe = AditElementPipe()
)
case class ExecutedLaunchCVPipes(target:String, result: scala.collection.mutable.Map[Int,Int] = scala.collection.mutable.Map().empty)

class BuilderPipe(primaryPipe: LaunchMapPipe) {
	/*********************************************************************************************************/
    // launchConversionPipes FUNCTIONS
    // Take LaunchMapPipe that are filled with arguments
    // And execute function after that left same fields with results by ExecutedLaunchCVPipes
    // On the end we have collection with results of this operation
    var launchConversionPipes:List[(LaunchMapPipe => ExecutedLaunchCVPipes)] = List.empty
    def executeLaunchCVPipes():List[ExecutedLaunchCVPipes] = {
    	launchConversionPipes.map(fn =>
    		fn(primaryPipe)
    	)
    }
	/*********************************************************************************************************/    
}
object BuilderPipe {
  def apply(primaryPipe: LaunchMapPipe) = {
  	new BuilderPipe(primaryPipe)
  }
}