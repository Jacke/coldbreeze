package service

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
import models.DAO.sessions._
import main.scala.bprocesses._
import main.scala.simple_parts.process.Units._

/**
 * Because process elements linked to each other
 * Front element may contain space
 * Space may content front and nested elements
 * Nested element may contain multiple nested space
 * And Nested space contain too
 * We need make afterburning ids for each of this abstractions
 */
object ExperimentalAfterBurning {
  def burnElemSpace(obj: SessionUndefElement, space_own: Option[Int], burnMap: scala.collection.mutable.Map[Int, Int]):Option[Int] = {
  	space_own match {
  		case Some(space_own_id) => burnMap += obj.id.get -> space_own_id; obj.id
  		case _ => None
  	}
  }
  def makeBurn(spaceMap:scala.collection.mutable.Map[Int, Int], burnMap: scala.collection.mutable.Map[Int, Int]) = {
  	burnMap.foreach { mp => 
  		SessionProcElementDAO.updateSpaceOwn(mp._1, mp._2)
    }
  }
}