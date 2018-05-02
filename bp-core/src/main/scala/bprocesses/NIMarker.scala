package main.scala.bprocesses

import com.typesafe.scalalogging.Logger
//import com.typesafe.scalalogging.slf4j.Logger
import main.scala.simple_parts.process._
import main.scala.utils.Space
import org.slf4j.LoggerFactory
/***
 *** Grand invoking algorithm
 *** © Stanislav @stanthoughts 2014-2015
 ***/

/**
 * Ivoking process by moving NIMarker
 */

class NIMarker(val bp: BProcess) extends BottomLine
with StateLigher
with NIMoves
with NISygnals
with NIRestrictors
with NIDeterms 
{
  // Push Info
  var station:BPStation = bp.station
  def toStation(bp: BProcess): BPStation = { bp.station }
  def toLogger(bp: BProcess, result: BPLoggerResult) = bp.logger.log(result)
  def step_inc = station.update_step(station.step + 1)


  // exec
  def invokeExpand = {
    bp.getSpaceByIndex(station.space).expands.map(ex => ex.invoke)
  }
  def invokeContainer = {
    bp.getSpaceByIndex(station.space).container.map(ex => ex.invoke)
  }
}