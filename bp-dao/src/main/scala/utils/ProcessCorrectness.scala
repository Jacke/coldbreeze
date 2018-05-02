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


object ProcessCorrectness {
  def checkForEmpty(processId: Int):Boolean = {
  	val bpDTO = BPDAO.get(processId) 
  	bpDTO match {
  		case Some(process) => {
  			true
  		}
  		case _ => false
  	}
  }
  def collisionFixes(processId: Int):Boolean = {
  	val bpDTO = BPDAO.get(processId) 
  	bpDTO match {
  		case Some(process) => {
  			true
  		}
  		case _ => false
  	}
  }
}